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

try(out1 <- AENN(class~., data = df,  k = 3))
# out <- AENN(class~., data = df,  k = 5)
try(out2 <- AENN(class~., data = df,  k = 7))
try(out3 <- AENN(class~., data = df,  k = 9))
try(out4 <- AENN(class~., data = df,  k = 11))


output_dataset1 <- paste("NoisyDatasetsAfterFilters/AENN-3/", args[1], sep = "")
# output_dataset <- paste("NoisyDatasetsAfterFilters/AENN-5/", args[1], sep = "")
output_dataset2 <- paste("NoisyDatasetsAfterFilters/AENN-7/", args[1], sep = "")
output_dataset3 <- paste("NoisyDatasetsAfterFilters/AENN-9/", args[1], sep = "")
output_dataset4 <- paste("NoisyDatasetsAfterFilters/AENN-11/", args[1], sep = "")

# write.arff(out$cleanData, file = output_dataset)
# try(write_csv(out$cleanData, file = output_dataset))
try(write_csv(out1$cleanData, file = output_dataset1))
try(write_csv(out2$cleanData, file = output_dataset2))
try(write_csv(out3$cleanData, file = output_dataset3))
try(write_csv(out4$cleanData, file = output_dataset4))

