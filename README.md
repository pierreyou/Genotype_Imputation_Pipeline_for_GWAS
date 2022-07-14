# Genotype Imputation Pipeline
This imputation pipeline utilizes SHAPEIT4.2.2 and Impute5_v1.1.5 for phasing and genotype imputation respectively via bash scripting.

## Summary of Main Steps
1. (Optional) Convert genome coordinates if target (in plink format) and reference data differ in versions.
2. Check strand, alleles, Ref/Alt assignments and frequency differences between target and reference panel.
3. Haplotype estimation, aka phasing.
4. Genotype imputation.

## Description
First 2 steps can be achieved by following the links, https://github.com/sritchie73/liftOverPlink and  https://www.well.ox.ac.uk/~wrayner/tools/index.html#Checking respectively. However, bash scripts are provided for all 4 steps seperately for convenience and users may opt to use part of this pipeline. In order to use those scripts, users need to install dependencies provided below and edit required variables such as file names, directory paths and binary file locations and change/add optional parameters.

## Dependencies
The pipeline works under Linux distributions.
#### Step one
- [Plink](https://www.cog-genomics.org/plink/)  
- [awk](https://www.tutorialspoint.com/awk/awk_environment.htm)
- [liftOverPlink](https://github.com/sritchie73/liftOverPlink)
