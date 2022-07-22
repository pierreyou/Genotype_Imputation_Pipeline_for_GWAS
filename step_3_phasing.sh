#!/bin/bash

#--------Paths to files and directories---------
input_file=/path/to/input/file.vcf.gz	#edit  bcf/vcf format
output_dir=/path/to/output/directory/	#edit
shapeit4=/path/to/shapeit4/exec_file	#edit
map_dir=/path/to/maps/directory/ 	#edit


#Input file need to be indexed before phasing 
tabix -p vcf ${input_file}

#Phasing is done for each chromosome seperately so edit arguments accordingly.    
${shapeit4} \
	--input ${input_file} \
	--map ${map_dir}chr#.gmap.gz \
	--region chr# \
	--output ${output_dir}chr#_phased_file.vcf.gz \
	--log ${output_dir}chr#_phased_file.log \

#Indexing phased files for imputation	
tabix -p vcf ${output_dir}chr#_phased_file.vcf.gz 
