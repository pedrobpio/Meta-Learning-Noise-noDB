try(renv::activate())
args = commandArgs(trailingOnly=TRUE)
library(RWeka)
library(NoiseFiltersR)
library(kknn)
library(readr)

dataset <- paste("NoisyDatasets/", args[1], sep = "")
# df <- read.arff(dataset)
df <- read_csv(dataset, show_col_types = FALSE)  


# HARF algorithm
# set.seed(1)
df$class <- factor(df$class)
out <- DROP3(class~., data = df)
output_dataset <- paste("NoisyDatasetsAfterFilters/DROP3/", args[1], sep = "")
# write.arff(out$cleanData, file = output_dataset)
write_csv(out$cleanData, file = output_dataset)
