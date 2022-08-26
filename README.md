# Initial_LoFreq

This pipeline runs variant analysis to analyze influenza virus populations. 

To install the conda environment, type conda env create -f Variant.yml

If you have more questions about conda env, please refer to https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html

Once the environment is set, you need to have your reference fasta file within the same directory as you fastq files. 
Segments should be numbered as 1 for PB2, 2 for PB1, 3 for PA, 4 for HA, 5 for NP, 6 for NA, 7 for M, and 8 for NS. Please, edit the fasta file in a text editor. Save the fasta file as myfastafile.fa

