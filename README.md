
# Diabetes Prediction and Analysis Using Machine Learning

## 📌 Project Overview
This project analyzes the **Pima Indians Diabetes Dataset** using multiple machine learning techniques to predict diabetes, group patients into risk clusters, and estimate BMI values. The project demonstrates the application of **classification, clustering, and regression** models in the healthcare domain.

---

## 🎯 Objectives
- Predict whether a patient has diabetes using classification
- Group patients based on medical similarity using clustering
- Predict Body Mass Index (BMI) using regression
- Understand healthcare data through preprocessing and visualization

---

## 📊 Dataset Information
- **Dataset:** Pima Indians Diabetes Dataset
- **Source:** Kaggle / UCI Machine Learning Repository
- **Rows:** 768
- **Columns:** 9

### Columns Description
- Pregnancies
- Glucose
- BloodPressure
- SkinThickness
- Insulin
- BMI
- DiabetesPedigreeFunction
- Age
- Outcome (Target for Classification)

---

## 🛠️ Technologies Used
- **Programming Language:** R
- **Libraries:**
  - tidyverse
  - caret
  - rpart
  - cluster
  - factoextra
  - corrplot

---

## 🔹 Machine Learning Tasks

### 1️⃣ Classification
- **Model:** Decision Tree
- **Target Variable:** Outcome
- **Classes:** Diabetic / Non-Diabetic
- **Evaluation Metric:** Accuracy, Confusion Matrix
- **Accuracy:** ~70–75%

---

### 2️⃣ Clustering
- **Model:** K-Means
- **Number of Clusters:** 3
- **Target Variable:** None (Unsupervised Learning)
- **Evaluation Metric:** Silhouette Score
- **Score:** ~0.33

---

### 3️⃣ Regression
- **Model:** Linear Regression
- **Target Variable:** BMI
- **Evaluation Metrics:** RMSE, MAE, R²
- **R² Score:** ~0.35

---

## ⚙️ Data Preprocessing
- Removed invalid zero values
- Median imputation for missing data
- Feature scaling
- Feature engineering (Age Group, BMI Category)
- Encoding categorical variables

---

## 📈 Exploratory Data Analysis (EDA)
- Histograms
- Boxplots
- Correlation plots
- Pairwise scatter plots

---

## 🚀 How to Run the Project
1. Install R and RStudio
2. Clone this repository
3. Open the `.R` files in RStudio
4. Install required libraries
5. Run scripts in the following order:
   - Classification
   - Clustering
   - Regression

---

## 📌 Project Structure
```

├── F-G03-final-classification.R
├── F-G03-final-clustering.R
├── F-G03-final-regression.R
├── README.md

```

---

## 🎓 Conclusion
This project successfully demonstrates how different machine learning techniques can be applied to healthcare data for prediction and analysis. The models provide meaningful insights into diabetes prediction, patient grouping, and BMI estimation.

---

## 👨‍💻 Author
- **Name::** *MD SIFAT HOSEN*
- **Course:** *DATA SCIENCE*
- **Institute:** *AMERICAN INTERNATIONAL UNIVERSITY OF BANGLADESH*

---

## 📜 License
This project is for academic and educational purposes.




