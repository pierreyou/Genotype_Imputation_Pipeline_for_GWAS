#!/bin/bash

## Before executing this script make sure:
# 1)Plink, and liftOver bin files have been added to $PATH. Otherwise remember to provide paths to those files.
# 2)Copy your input files to the same directory where this script is located.  
# 3)Rename all input/output files as required.

 
#--------------------------------Path to files---------------------#
chain_file=/path/to/file.over.chain.gz	
liftOverPlink=/path/to/liftOverPlink.py	


#Convert chr 23 to X as this is how it's coded in chain file and convert to ped
plink --bfile plink_files --output-chr M --recode --out MT_coded_plink_files

#lift the dataset e.g. hg19 to hg38.
python ${liftOverPlink} \
	--map MT_coded_plink_files.map \
	--out MT_coded_lifted2hg38 \
	--chain ${chain_file} \ 
        
#Add unlifted snps to a list 
awk '{if($1!~/#Del*/)print$4}' MT_coded_lifted2hg38.bed.unlifted > unlifted_snps.txt

#Add lifted SNPs with "bad" chromosome names e.g. "22_KI270879v1_alt" to a another list. Note that also Y and M chromosomes will be excluded here but they can be included by editing the awk command below 
awk '{if($1~/_/ || $1=="Y" || $1=="M")print$2}' MT_coded_lifted2hg38.map > bad_lifted_snps.txt

#Concat both list 
cat unlifted_snps.txt bad_lifted_snps.txt > exclude_snps.txt

#Create new .map file with only "good" lifted SNPs.
awk '{if($1<=22 && $1!~/_/ || $1=="X")print$0}' MT_coded_lifted2hg38.map > good_lifted2hg38.map

#Remove bad  and unlifted SNPs from original genome build so the new .ped file has the same variants as in the good lifted .map file
plink --file MT_coded_plink_files --exclude exclude_snps.txt --recode --out uncorresponding_snps_removed

#Create plink bed file for strand check (step 2) 
plink --ped uncorresponding_snps_removed.ped --map good_lifted2hg38.map --make-bed --out good_lifted2hg38
