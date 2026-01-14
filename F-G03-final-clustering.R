
# F-G03-final-clustering.R
# Task: Clustering
# Model: K-Means
# Dataset: Pima Indians Diabetes Dataset


library(tidyverse)
library(cluster)
library(factoextra)

# -------------------------------
# Data Collection
# -------------------------------
url <- "https://raw.githubusercontent.com/plotly/datasets/master/diabetes.csv"
data <- read.csv(url)

# Remove target variable
data <- data %>% select(-Outcome)

# -------------------------------
# Preprocessing
# -------------------------------
data[data == 0] <- NA

data <- data %>%
  mutate_if(is.numeric, ~ifelse(is.na(.), median(., na.rm = TRUE), .))

# Scaling
data_scaled <- scale(data)

# -------------------------------
# EDA
# -------------------------------
pairs(data_scaled[,1:4])

# -------------------------------
# K-Means Clustering
# -------------------------------
set.seed(123)
k_model <- kmeans(data_scaled, centers = 3, nstart = 25)

# Silhouette Score
sil <- silhouette(k_model$cluster, dist(data_scaled))
mean(sil[, 3])

# Visualization
fviz_cluster(k_model, data = data_scaled)



