rm(list=ls(all=TRUE))
setwd("/Users/gajindersingh/gp/nfrex/clinical_trials");
library(heatmaply)
library(gplots)
library(ggplot2)

dat <- read.table("mesh_phase_count.txt", header=T, sep="\t", stringsAsFactors = F) #read input file
row_names <- unique(dat[,2])
col_names = unique(dat[,1])

mat_file = matrix(data = 0,  nrow = length(row_names), ncol = length(col_names)) #create empty matrix
rownames(mat_file) <- row_names
colnames(mat_file) <- col_names

for (i in 1:nrow(dat)) { # filll the matrix
  row_index <- match(dat[i,2], row_names)
  col_index <- match(dat[i,1], col_names)
  mat_file[row_index, col_index] <- dat[i,3]
}
heatmaply(mat_file, Rowv = FALSE,Colv=FALSE)
