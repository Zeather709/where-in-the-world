#  Setup

install.packages("tidyverse")
library(tidyverse)

# Files

tg_meta_file <- '1000g/integrated_call_samples_v3.20130502.ALL.panel'
super_pops_file <- '1000g/20131219.populations.tsv'
tg_vars_file <- '1000g/1kg_phase1_all.bim'
zeather_vars_file <- 'zeather_genome.bim'

# Import files

tg_meta <- read_tsv(tg_meta_file) %>%
  select(-'...5', -'...6')
glimpse(tg_meta)

super_pops <- read_tsv(super_pops_file) %>%
  slice_head(n = 27)
glimpse(super_pops)

# Read files and rename column names to be more descriptive

tg_vars <- read_tsv(tg_vars_file, col_names = FALSE) %>%
  rename(chr = X1,
         rsid = X2,
         position = X4,
         ref = X5, 
         alt = X6) %>%
  select(-X3) %>%
  mutate(id = paste(chr, position, ref, alt, sep = ':'))

zeather_vars <- read_tsv(zeather_vars_file, col_names = FALSE) %>%
  rename(chr = X1,
         rsid = X2,
         position = X4,
         ref = X5, 
         alt = X6) %>%
  select(-X3) %>%
  mutate(id = paste(chr, position, ref, alt, sep = ':'))

# Identify overlapping variants between two .bim files

common_vars <- intersect(zeather_vars$rsid, tg_vars$rsid)
common_vars
# great!  most variants in my 23andMe data have a match in the reference data

snp_list <- tg_vars %>%
  filter(rsid %in% common_vars) %>%
  select(chr, rsid)

write_tsv(snp_list, 'common_snps.txt')
