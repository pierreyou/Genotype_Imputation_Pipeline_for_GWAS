# Genotype Imputation Pipeline
This imputation pipeline utilizes SHAPEIT4.2.2 and Impute5_v1.1.5 for phasing and imputation respectively via bash scripting.

## Summary of Main Steps
1. Convert genome coordinates if target and reference data differ in versions.
2. Check strand, alleles, Ref/Alt assignments and frequency differences between target and reference panel.
3. Haplotype estimation, aka phasing.
4. Genotype imputation.

## Description
Each step has seperate bash script for convenience as users may opt to use part of this pipeline.    
