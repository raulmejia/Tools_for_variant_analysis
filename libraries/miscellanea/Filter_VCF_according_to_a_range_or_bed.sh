# download your gatk
# Path to your gatk executable

mkdir -p $(dirname $your_output_file)

bedtools intersect -a $your_inputvcf -b $Coordinates_in_a_bedfile > $your_output_file

