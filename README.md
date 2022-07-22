# Genotype Imputation Pipeline
This imputation pipeline utilizes SHAPEIT4.2.2 and Impute5_v1.1.5 for phasing and genotype imputation respectively via bash scripting.

## Summary of Main Steps
1. (Optional) Convert genome coordinates if target (in plink format) and reference data differ in versions.
2. Check strand, alleles, Ref/Alt assignments and frequency differences between target and reference panel.
3. Haplotype estimation, aka phasing.
4. Genotype imputation.

## Description
First 2 steps can be achieved by following the links, https://github.com/sritchie73/liftOverPlink and  https://www.well.ox.ac.uk/~wrayner/tools/index.html#Checking respectively. However, a script for step 1 has been provided assuming that the starting file is in plink format.

The last 2 steps can be achieved by editing required variables in provided bash scripts such as file names, directory paths and binary file locations and changing/adding optional parameters. 



## Dependencies
The pipeline works under Linux distributions.

- SHAPEIT4 from https://odelaneau.github.io/shapeit4/  
- SAMtools and BCFtools from http://www.htslib.org/download/
- IMPUTE5 from https://www.dropbox.com/sh/mwnceyhir8yze2j/AADbzP6QuAFPrj0Z9_I1RSmla?dl=0

