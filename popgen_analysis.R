#  Setup

install.packages("umap")
install.packages("RSpectra")

library(tidyverse)
library(umap)

# Files

pca_output_file <- 'zeather_tg.eigenvec'

# Import data

pcs_100 <- read_tsv(pca_output_file)
