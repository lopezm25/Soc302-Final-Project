# Mariano-Final-Project
##Introduction**
To access and utilize script please open the file titles "Final Project Script Lopez25.R" Which contains the code of my findings. All data used in this file is soursed from the GSS data and can be accessed through the install packages within the file.

## 📊 Data and Methods

### Data

This study uses data from the **General Social Survey (GSS) 2022**, a nationally representative cross-sectional survey conducted by NORC at the University of Chicago. The GSS employs a **multistage stratified sampling** design to collect responses from U.S. adults aged 18 and older.

In 2022, approximately 80% of respondents completed the survey online, while 20% completed it by phone. The full GSS 2022 dataset contains 4,194 responses. This project uses a filtered subset of **1,121 valid cases**, removing respondents with missing data on the dependent or independent variables of interest.

> ⚠️ Note: While the GSS uses a probability sampling design, this analysis is based on a subset of complete cases and therefore treated as a **convenience sample** for analytical purposes.

---

### Operationalization of Variables

#### Dependent Variable

- **`yes_afterlife`**: Belief in life after death (1 = yes, 0 = no)

#### Religion

- **`abrahamic`**: Binary (1 = Christian, Jewish, or Muslim; 0 = other)
- **`often_prays`**: Binary (1 = prays once/day or more)
- **`extremely_religious`, `mildly_religious`**: Dummy variables derived from self-reported religiosity

#### Age

- **`young`** = ages 18–34  
- **`middle`** = ages 35–59 (reference group)  
- **`old`** = age 60 and above

#### Standard of Living

- **`realinc`**: Continuous variable for household income
- **`More_or_less_satisfied`**, **`Pretty_well_satisfied`**: Dummy variables from GSS satisfaction question
- **`Working`**, **`NotWorking`**, **`OtherWork`**: Dummy variables from work status

#### Ethnicity/Race

- **`white`**: Binary race indicator (1 = White)
- **Region-based variables**: Dummy coded based on continent of ethnic background:
  - `NorthAmerica`, `SouthAmerica`, `Europe`, `Asia`, `Australia`

---

### Statistical Methods

#### 1. Chi-Square Test of Independence

Chi-square tests were used to assess associations between each categorical independent variable and belief in an afterlife.  
- Assumptions:
  - Categorical variables
  - Independence of observations
  - Sufficient expected cell counts

> ✅ All chi-square assumptions were met or corrected using continuity adjustments.

#### 2. Correlation Matrix

Pearson’s correlation coefficients were calculated among all numeric and dummy-coded variables to assess multicollinearity.  
> ✅ No variables exceeded r = 0.80, indicating acceptable independence for regression analysis.

#### 3. Logistic Regression

Binary logistic regression was used to test multivariate relationships. Five models were run:

- **Model 1**: Religion variables only  
- **Model 2**: Age group  
- **Model 3**: Standard of living  
- **Model 4**: Ethnic background  
- **Model 5**: Full model with all predictors

All models used `yes_afterlife` as the binary dependent variable.

- Assumptions:
  - Binary outcome
  - Linearity of log odds for continuous predictors
  - No multicollinearity (verified via correlation matrix)
  - Independent observations

> ✅ All assumptions were met for interpretation.

---

### Sample Size and Model Fit

- **Sample size (n)**: 1,121 respondents  
- **Model fit metric**: McFadden’s R²  
  - Model 1 R² = 0.1685  
  - Model 5 (final model) R² = 0.1854

The final model demonstrated the best overall fit and explained ~18.5% of variance in belief in the afterlife.

---

### Output Summary

All regression tables, correlation matrices, and descriptive statistics are available in the `/output/` folder of this repository. Variable coding and logic are detailed in `soc302-lopez.R` under `/code/`.
