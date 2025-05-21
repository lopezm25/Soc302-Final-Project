
## Project:  Belief in Life After Death
# Located:   The College of New Jersey
# File Name: soc302Lopez.R
# Date:      May 12, 2025
# Who:       Mariano Lopez


####################################################################################
############              Pre-Analysis: settings, packages, and data    ############
####################################################################################

# set wd
setwd("/courses/SOC302/lopezm25")

### Settings + Packages
#install.packages("psych")
#install.packages("dplyr")
#install.packages("openxlsx")

library(psych)
library(dplyr)

### Load data 
GSS <- read.csv("GSS2022.csv")


####################################################################################
############              PHASE 1: CLEAN DATA FOR ANALYSIS              ############
####################################################################################


## Steps of cleaning variables Clear vars
# Step 1: Examine variable and coding schema: Table() / summary() 
# Step 2: Recode (if necessary/warrented): mutate(), ifelse(), etc
# Step 3: Confirm: table() / summary()



############                     DEPENDENT VARIABLE                     ############
############              SUBSTANTIVE VARIABLE NAME HERE                ############

# STEP 1: Examine variable and coding schema 
table(GSS$postlife)
# STEP 2: Recode if necessary or justify if not neccesary
GSS <- mutate(GSS, yes_afterlife = ifelse(postlife == 1, 1, 0)) 
GSS <- mutate(GSS, no_afterlife = ifelse(postlife == 2, 1, 0)) 

# STEP 3: Confirm creation (if necessary)
table(GSS$postlife, GSS$yes_afterlife)
table(GSS$postlife, GSS$no_afterlife)

############                  INDEPENDENT VARIABLE                    ############
############              RELIGION                ############

# STEP 1: Examine variable and coding schema 
table(GSS$relig)

# STEP 2: Recode if necessary or justify if not neccesary
GSS <- mutate(GSS, abrahamic = ifelse(relig == 1 | relig == 2 | relig == 3 | relig == 9 | relig == 10 | relig == 11 | relig == 13, 1, 0)) 
GSS <- mutate(GSS, nonabrahamic = ifelse(relig == 6 | relig == 5| relig == 7 | relig == 8 | relig == 12, 1, 0)) 
GSS <- mutate(GSS, nonreligious = ifelse(relig == 4 , 1, 0)) 

# step 3: confirm
table(GSS$relig, GSS$abrahamic)
table(GSS$relig, GSS$nonabrahamic)
table(GSS$relig, GSS$nonreligious)












------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  ############                  INDEPENDENT VARIABLE                    ############
############              ETHNIC               ############
####### examine variable ###
table(GSS$ethnic)
#### Create dummy variables#####
GSS <- mutate(GSS, european = ifelse(ethnic == 2| ethnic == 6 | ethnic == 7| ethnic == 8| ethnic == 9| ethnic == 10| ethnic == 11| ethnic == 12| ethnic == 13| ethnic == 14| ethnic == 15| ethnic == 18| ethnic == 19| ethnic == 21| ethnic == 24| ethnic == 25| ethnic == 26| ethnic == 27| ethnic == 32| ethnic == 33| ethnic == 34| ethnic == 35| ethnic == 36| ethnic == 39| ethnic == 41| ethnic == 101, 1, 0)) 
GSS <- mutate(GSS, Asia = ifelse(ethnic == 5| ethnic == 16| ethnic == 20| ethnic == 23| ethnic == 31| ethnic == 40| ethnic == 301| ethnic == 302| ethnic == 303| ethnic == 304| ethnic == 305| ethnic == 306| ethnic == 307| ethnic == 401| ethnic == 402| ethnic == 403| ethnic == 404| ethnic == 405| ethnic == 406| ethnic == 408| ethnic == 499, 1, 0))
GSS <- mutate(GSS, NorthAmerica = ifelse(ethnic == 3| ethnic == 4| ethnic == 17| ethnic == 22| ethnic == 28| ethnic == 30| ethnic == 97| ethnic == 601| ethnic == 602| ethnic == 603| ethnic == 604| ethnic == 605| ethnic == 606| ethnic == 607| ethnic == 699| ethnic == 799| ethnic == 801| ethnic == 802| ethnic == 803| ethnic == 804| ethnic == 899, 1,0))
GSS <- mutate(GSS, SouthAmerican = ifelse(ethnic == 501| ethnic == 502| ethnic == 503| ethnic == 504| ethnic == 505| ethnic == 506| ethnic == 507| ethnic == 508| ethnic == 509| ethnic == 510| ethnic == 513| ethnic == 599, 1, 0))
GSS <- mutate(GSS, Australia = ifelse(ethnic == 901| ethnic == 903| ethnic == 904| ethnic == 999, 1, 0))
###confirmation###
table
############                  INDEPENDENT VARIABLE                    ############
############              INCOME               ############

# income
summary(GSS$realinc)

# STEP2:  quantitative so no recoding neccesary

# step 3: na

############                  INDEPENDENT VARIABLE                    ############
############              NEXT               ############

###  R's Status of employment ####

table(GSS$wrkstat)
GSS <- mutate(GSS, Working = ifelse(wrkstat == 1| wrkstat == 2| wrkstat == 3, 1, 0))
GSS <- mutate(GSS, NotWorking = ifelse(wrkstat == 4| wrkstat == 5| wrkstat == 6| wrkstat == 7, 1, 0))
GSS <- mutate(GSS, OtherWork = ifelse(wrkstat == 8, 1, 0))

### How fundumentalist is this person to there religion ###

table(GSS$fund)
GSS <- mutate(GSS, Extremely_Religious = ifelse(fund == 1, 1, 0))
GSS <- mutate(GSS, Medium_Religious = ifelse(fund == 2, 1, 0))
GSS <- mutate(GSS, Not_Religious = ifelse(fund == 3, 1, 0))


### The age demographic R belongs to ####
table(GSS$age)
GSS <- mutate(GSS, young = ifelse(age >= 18 & age <=34, 1, 0))
table(GSS$age, GSS$young)
GSS <- mutate(GSS, middle = ifelse(age >= 35 & age <=59, 1, 0))
table(GSS$age, GSS$middle)
GSS <- mutate(GSS, old = ifelse(age >= 60 & age, 1, 0))
table(GSS$age, GSS$old)

### How ofter R Prays ###
table(GSS$pray)
GSS <- mutate(GSS, often_prays = ifelse(pray >= 1 & pray <=4, 1, 0))
table(GSS$pray,GSS$often_prays)




# RACE: Race of Respondent
GSS$race
GSS <- mutate(GSS, white = ifelse(race == 1 , 1, 0)) 


#satfin
### R's Stisfaction with there income ###
GSS$satfin
GSS <- mutate(GSS, Pretty_well_satisfied = ifelse(satfin== 1,1,0))
GSS <- mutate(GSS, More_or_less_satisfied = ifelse(satfin== 2,1,0))
GSS <- mutate(GSS, Not_satisfied_at_all = ifelse(satfin== 3,1,0))




####################################################################################
############              PHASE 2: CREATE MY DATASET                    ############
####################################################################################

### STEP 1: Create a list of variables to keep
my_varlist <- c(
  "yes_afterlife", "no_afterlife",
  "abrahamic", "nonreligious","often_prays", "Extremely_Religious", "Medium_Religious", "Not_Religious",
  "NorthAmerica", "SouthAmerican", "european", "Asia", "Australia", "white",
  "Working", "NotWorking", "OtherWork","realinc","Pretty_well_satisfied","More_or_less_satisfied","Not_satisfied_at_all", 
  "old","middle","young")


### Not_religious is for the variable "Fund" and the nonreligious is for the variable "relig" ###


### STEP 2: create a new dataset with only your variables and complete case
my_dataset <- GSS %>%
  select(all_of(my_varlist)) %>%
  filter(complete.cases(.))

### STEP 3: Gather Summary Statistics and confirm valid dataset construction



####################################################################################
############              PHASE 3: Descriptive Statistics     ############
####################################################################################
# TABLE 1: DESCRIPTIVE STATISTICS HERE
describe(my_dataset)





####################################################################################
############              PHASE 4: Correlation Matrix                 ############
####################################################################################


# TABLE 2: CONTINGENCY TABLE HERE

cor(my_dataset)




############regression table##########
# Install and load required package
#install.packages("modelsummary")
library(modelsummary)

# Run separate logistic regression models
model_yes <- glm(yes_afterlife ~ . , data = my_dataset, family = binomial)
model_no <- glm(no_afterlife ~ . , data = my_dataset, family = binomial)

# Export side-by-side regression table to Word
modelsummary(
  list("Believe in Afterlife" = model_yes,
       "Do Not Believe in Afterlife" = model_no),
  output = "afterlife_regression_results.docx"
)

# Optional: check where the file saved
getwd()
---------------------------------------------------------------------------------------------------------
  
  
  # Load necessary package
  #install.packages("modelsummary")
  library(modelsummary)

# Model 1: Religion Variables
model1 <- glm(yes_afterlife ~ abrahamic + often_prays + Extremely_Religious + Medium_Religious, data = my_dataset, family = binomial)
summary(model1)

# model 2: age
model2 <- glm(yes_afterlife ~  old + young , data = my_dataset, family = binomial)
summary(model2)


# model 3: SES
model3 <- glm(yes_afterlife ~ More_or_less_satisfied + Pretty_well_satisfied + realinc , data = my_dataset, family = binomial)
summary(model3)

# model 4: region of originl
model4 <- glm(yes_afterlife ~   Asia  + european + NorthAmerica + SouthAmerican , data = my_dataset, family = binomial)
summary(model4)


# model 5: final model
model5 <- glm(yes_afterlife ~ abrahamic + often_prays + Extremely_Religious + Medium_Religious+
                old + young +
                More_or_less_satisfied + Pretty_well_satisfied + realinc +
                Asia  + european + NorthAmerica + SouthAmerican , data = my_dataset, family = binomial)
summary(model5)

