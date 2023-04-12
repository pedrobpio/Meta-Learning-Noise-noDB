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
# try(out <- edgeBoostFilter(class~., data = df, percent = 0.05))
# try(out1 <- edgeBoostFilter(class~., data = df, percent = 0.1 ))
# try(out2 <- edgeBoostFilter(class~., data = df, , percent = 0.2))
try(out3 <- edgeBoostFilter(class~., data = df, percent = 0.15 ))


# output_dataset <- paste("NoisyDatasetsAfterFilters/edgeBoostFilter-5/", args[1], sep = "")
# output_dataset1 <- paste("NoisyDatasetsAfterFilters/edgeBoostFilter-10/", args[1], sep = "")
# output_dataset2 <- paste("NoisyDatasetsAfterFilters/edgeBoostFilter-20/", args[1], sep = "")
output_dataset3 <- paste("NoisyDatasetsAfterFilters/edgeBoostFilter-15/", args[1], sep = "")
# write.arff(out$cleanData, file = output_dataset)
# try(write_csv(out$cleanData, file = output_dataset))
# try(write_csv(out1$cleanData, file = output_dataset1))
# try(write_csv(out2$cleanData, file = output_dataset2))
try(write_csv(out3$cleanData, file = output_dataset3))
