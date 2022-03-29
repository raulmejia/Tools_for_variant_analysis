#!/bin/bash
##################
### Purpose of this program
##################
# This program filters a vcf according to a bed file (The later could be the coordinates of a gene)
##################
# example of use
##################
### sh /path/Filter_VCF_according_to_coordinates_in_a_bed_file.sh -v /path/input.vcf -b /paht/coordinates.bed -o /path/output_vcf_filtered.txt

##################
# Installing required programs
# apt-get install bcftools
##################
#################
## Arguments given by the user
################# 
while getopts ":v:b:o:h" opt; do
  case $opt in
    h)
      echo "Usage: $(basename $0) [-v /input/vcf] [-b /input/bed_file] [-o /output/file]"
      echo "Explaining acronyms: -v = input vcf -b input bed file -o = output file -h = help"
      ;;
    v)
      echo "-v option was used, with the following input: $OPTARG" >&2   
         your_inputvcf=$OPTARG
      ;;
    b)
      echo "-b option was used, with the following input: $OPTARG" >&2   
         coordinates_in_a_bedfile=$OPTARG
      ;;
    o)
      echo "-o option was used, with the following input: $OPTARG" >&2   
        your_output_file=$OPTARG
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done
######################
## The program starts
######################
# your_inputvcf=
# coordinates_in_a_bedfile=
# your_output_file=

mkdir -p $(dirname $your_output_file)

bedtools intersect -a $your_inputvcf -b $coordinates_in_a_bedfile > $your_output_file

