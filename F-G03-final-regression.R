
# F-G03-final-regression.R
# Task: Regression
# Model: Linear Regression
# Dataset: Pima Indians Diabetes Dataset
# Target Variable: BMI


library(tidyverse)
library(caret)

# -------------------------------
# Data Collection
# -------------------------------
url <- "https://raw.githubusercontent.com/plotly/datasets/master/diabetes.csv"
data <- read.csv(url)

# -------------------------------
# EDA
# -------------------------------
summary(data)
pairs(data[, c("BMI","Glucose","Insulin","Age")])

# -------------------------------
# Preprocessing
# -------------------------------
data[data == 0] <- NA

data <- data %>%
  mutate_if(is.numeric, ~ifelse(is.na(.), median(., na.rm = TRUE), .))

# Feature Engineering
data$Age_Group <- cut(data$Age,
                      breaks = c(20,30,40,50,100),
                      labels = c("Young","Adult","Middle","Senior"))

# Separate target
X <- data %>% select(-BMI)
y <- data$BMI

# Encode predictors
X <- dummyVars(~ ., data = X) %>%
  predict(newdata = X) %>%
  as.data.frame()

# Scaling
X <- predict(preProcess(X, method = c("center","scale")), X)

final_data <- cbind(X, BMI = y)

# -------------------------------
# Train-Test Split
# -------------------------------
set.seed(123)
index <- createDataPartition(final_data$BMI, p = 0.7, list = FALSE)
train <- final_data[index, ]
test <- final_data[-index, ]

# -------------------------------
# Modeling
# -------------------------------
model <- lm(BMI ~ ., data = train)
summary(model)

# -------------------------------
# Evaluation
# -------------------------------
pred <- predict(model, test)

RMSE(pred, test$BMI)
MAE(pred, test$BMI)
R2(pred, test$BMI)



