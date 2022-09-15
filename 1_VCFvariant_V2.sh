#!/bin/bash
##This script will parse iSNVs based on 2% and 400x of coverage from GATK-LoFreq pipeline output. 
#The output can be used to run SNPdat
#This script was made by LMF - 2019

NAME1=$(find . -maxdepth 1 -name "*_coverage.tsv" | xargs -I {} basename {} _coverage.tsv)

Rscript ~/scripts/iSNV/1_Auto_VCFvariant_Regular.R

mv AF.Cov.tsv "$NAME1"_AF.Cov.tsv

##Add name of the sample
awk -F, -v s="$NAME1" '{$8=s; print }' "$NAME1"_AF.Cov.tsv > "$NAME1"_AF.Cov.temp.tsv

mv "$NAME1"_AF.Cov.tsv "$NAME1"_AF.Cov

##Delete header
awk '{if (NR!=1) {print}}' "$NAME1"_AF.Cov.temp.tsv > "$NAME1"_AF.Cov.clean.temp.tsv

rm "$NAME1"_AF.Cov.temp.tsv

mv "$NAME1"_AF.Cov.clean.temp.tsv "$NAME1"_AF.Cov.clean.temp

## remove "-" from Sample's name
tr -d '-' < "$NAME1"_AF.Cov.clean.temp > "$NAME1"_AF.Cov.inter.tsv 
rm "$NAME1"_AF.Cov.clean.temp

mv "$NAME1"_AF.Cov.inter.tsv "$NAME1"_AF.Cov.final.tsv
#rm AF.Cov.clean.temp.tsv
rm *_AF.Cov

#Produce file for SNPdat containing Segment, Position and REF
cat "$NAME1"_AF.Cov.final.tsv | awk 'BEGIN{OFS"\t"} {print $1 "\t" $2 "\t" $6}' > "$NAME1".AF.Cov.ALT.vcf.txt

#rm *_AF.Cov.in*