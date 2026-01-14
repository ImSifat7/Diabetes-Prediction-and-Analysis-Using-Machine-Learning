
# F-G03-final-classification.R
# Task: Classification
# Model: Decision Tree
# Dataset: Pima Indians Diabetes Dataset
# Source: Kaggle / UCI
# Domain: Healthcare


library(tidyverse)
library(caret)
library(rpart)
library(rpart.plot)
library(corrplot)

# -------------------------------
# A. Data Collection
# -------------------------------
url <- "https://raw.githubusercontent.com/plotly/datasets/master/diabetes.csv"
data <- read.csv(url)

# -------------------------------
# B. Data Understanding & EDA
# -------------------------------
dim(data)
str(data)
summary(data)

# Outcome is target variable
data$Outcome <- as.factor(data$Outcome)

numerical_vars <- setdiff(names(data), "Outcome")

# Visualizations
hist(data$Glucose, main="Glucose Distribution", col="lightblue")
boxplot(data$BMI, main="BMI Boxplot")

corrplot(cor(data[numerical_vars]), method="color")

# -------------------------------
# C. Data Preprocessing
# -------------------------------

# Treat zero values as missing (medically invalid)
data[numerical_vars] <- lapply(data[numerical_vars], function(x) {
  x[x == 0] <- NA
  x
})

# Median imputation
data[numerical_vars] <- lapply(data[numerical_vars], function(x) {
  ifelse(is.na(x), median(x, na.rm = TRUE), x)
})

# Feature Engineering (Categorical creation)
# Note: Original dataset is numeric; categorical features are created via binning
data$BMI_Category <- cut(data$BMI,
                         breaks = c(0,18.5,25,30,100),
                         labels = c("Underweight","Normal","Overweight","Obese"))

data$Age_Group <- cut(data$Age,
                      breaks = c(20,30,40,50,100),
                      labels = c("Young","Adult","Middle","Senior"))

# Separate predictors and target
X <- data %>% select(-Outcome)
y <- data$Outcome

# Encode categorical predictors only
X <- dummyVars(~ ., data = X) %>%
  predict(newdata = X) %>%
  as.data.frame()

# Scaling
X <- predict(preProcess(X, method = c("center","scale")), X)

final_data <- cbind(X, Outcome = y)

# -------------------------------
# D. Train-Test Split
# -------------------------------
set.seed(123)
index <- createDataPartition(final_data$Outcome, p = 0.7, list = FALSE)
train <- final_data[index, ]
test <- final_data[-index, ]

# -------------------------------
# E. Modeling
# -------------------------------
model <- rpart(Outcome ~ ., data = train, method = "class")
rpart.plot(model)

# -------------------------------
# F. Evaluation
# -------------------------------
pred <- predict(model, test, type = "class")
confusionMatrix(pred, test$Outcome)


