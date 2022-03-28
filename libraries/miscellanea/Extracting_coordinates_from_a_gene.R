# get gene coordinates
#####################
## Required packages
#####################
if (!require("BiocManager")) {
  install.packages("BiocManager", ask =FALSE)
  library("BiocManager")
}
if (!require("biomaRt")) {
  install.packages("biomaRt", ask =FALSE)
  library("biomaRt")
}
if (!require("httr")) {
  install.packages("httr", ask =FALSE)
  library("httr")
}

#setconfig(config(sslverifypeer = 0L))
set_config(config(ssl_verifypeer = 0L))

#####################
### Data given by the user
#####################


####################
###
#####################
listEnsembl()
#listEnsembl(GRCh=37)

myensembl = useEnsembl(biomart="ensembl", dataset="hsapiens_gene_ensembl",GRCh = "37")

chr1_genes <- getBM(  attributes=c('ensembl_gene_id', 'ensembl_transcript_id','hgnc_symbol',
               'chromosome_name','start_position','end_position'),
  filters ='chromosome_name', values ="1", mart = myensembl)

chr1_genes[grep("PPT1",chr1_genes$hgnc_symbol),]

#?useEnsembl




