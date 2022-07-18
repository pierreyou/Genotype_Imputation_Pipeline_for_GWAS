#!/bin/bash

###This script is for imputing phased target datasets (the output of step_3_phasing.sh) using phased reference panel via IMPUTE5. Before running this script, edit all file names and regions as required.###  

#--------Location of directories---------
output_dir=path/to/output/directory/		#edit 
target_dir=path/to/target/dataset/directory/	#edit
ref_dir=path/to/reference/dataset/directory/	#edit
map_dir=path/to/maps/directory/			#edit

#--------Location of exec files--------- 	#This section can be commented out if already in $PATH. If so, remember to remove "${}" and use whole name e.g. impute5_static. 
imp5Chunker=path/to/imp5Chunker_static_file	#edit
imp5Converter=path/to/imp5Converter_static_file	#edit
impute5=path/to/impute5_static_file		#edit

#Converting to imp5 format (optional) ~ 25% faster than vcf (mpi index is generated automatically).
#Edit all parameters below
${imp5Converter} --h ${ref_dir}chr#_phased_panel.vcf.gz \
               --r chr# \
               --o ${ref_dir}chr#_phased_panel.imp5 \
	
#Chunking step: Reference and target files must be indexed (imp5 format didn't work here)
#Edit below 
${imp5Chunker} --h ${ref_dir}chr#_phased_panel.vcf.gz \
		--g ${target_dir}chr#_phased_targ.vcf.gz \
		--r chr# \
		--o ${output_dir}chr#_chunk_coordinates.txt \
		--l ${output_dir}chr#_chunker.log

#Extracting imputation regions from coordinates file
cut -f 4 ${output_dir}chr#_chunk_coordinates.txt > ${out_dir}chr#_imputation_regions.txt

#Imputation step
for region in $(cat ${output_dir}chr#_imputation_regions.txt)
do
$(${impute5} --h ${ref_dir}chr#_phased_panel.imp5 \
	--m ${map_dir}chr#.gmap.gz \
	--g ${target_dir}chr#_phased_targ.vcf.gz \
        --r ${region} \
	--b 250 \
	--o ${output_dir}chr_${region}_imputed.vcf.gz \
	--l ${output_dir}chr_${region}_imputed.log) 
done

#Create list of imputed files to be used in ligation step
ls -rt ${output_dir}chr_#*imputed.vcf.gz > ${output_dir}chr#_imputed_chunk_files.txt

#Ligation step
bcftools concat -f ${output_dir}chr#_imputed_chunk_files.txt -Oz -o ${output_dir}chr#_imputed.vcf.gz 
