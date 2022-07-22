# Genotype Imputation Pipeline
This imputation pipeline utilizes SHAPEIT4.2.2 and Impute5_v1.1.5 for phasing and genotype imputation respectively via bash scripting.

## Summary of Main Steps
1. (Optional) Convert genome coordinates if target (in plink format) and reference data differ in versions.
2. Check strand, alleles, Ref/Alt assignments and frequency differences between target and reference panel.
3. Haplotype estimation, aka phasing.
4. Genotype imputation.

## Description
First two steps can be achieved by following the links, https://github.com/sritchie73/liftOverPlink and  https://www.well.ox.ac.uk/~wrayner/tools/ respectively. However, a script for step 1 has been provided assuming that the starting file is in plink format.

Step 2 (strand check) depends on reference panel used as indicated in Will Rayner's toolbox provided above. No script provided for this step but I might be able to help if you face issues using 1000 Genomes 30x on GRCh38.

The last 2 steps can be achieved by editing required arguments in provided bash scripts such as file names, directory paths and binary file locations and changing/adding optional arguments. 

Each step (1, 3 & 4) is provided in a seperate bash script for convenience as users for example may opt to use different tool for phasing.  

## Dependencies
- The pipeline needs a Linux shell able to run BASH line commands.
- In addition to required dependencies in provided links in Description section above, the tools below are needed. 
1) SHAPEIT4 from https://odelaneau.github.io/shapeit4/  
2) SAMtools and BCFtools from http://www.htslib.org/download/
3) IMPUTE5 from https://www.dropbox.com/sh/mwnceyhir8yze2j/AADbzP6QuAFPrj0Z9_I1RSmla?dl=0

## Usage
Copy and paste the needed script into a plain-text file and then edit arguments as required.

Run the script as follows:
```bash
bash step_1_liftOver.sh
```
