# Lead Score Prediction Model v1.0

## Problem Statement
We need a prediction model to predict the probability of our users to deposit. We can do so by having lead quality scoring based on the user bahaviours and characteristics

## Definition
i)Lead - Each lead (Unique Binary User ID) represents an individual that signup on our platforms  
ii)Lead Score - We measure the score of our leads by predicting the probability of having first deposit

## Methodolody
For simplicity, we can use `users activity` within 24 hours after signup, to predict if an user will deposit within 14 days after signup. So this will be a binary classification

## Features Engineering  
We will feature engineering into different streams based on the nature of the features.  
To start with, we will have:  
i) Signup Feature - User details by the time they signup  
ii) Clickstream - User activities on the website (eg: hits, sessions etc)  
iii) Demo Trade Activity - User trading activities with demo accounts (BO and MT5)   
vi) CLV - User deposit activities and amount (this will be the dependent variable)    

[Refer Here for Feature Details](https://docs.google.com/spreadsheets/d/1skE7A1vsn01p9vKq5YdbWg10Y0B4CmOktqJSrNx23AQ/edit?ts=5ecf2dfd#gid=888794899])

We can do feature engineering on each part separately, and the final dataset will be just the concatenation of these parts.


## Model Training
In this version, we train data with users joined from `2021-01-01` to `2021-02-15`  
The first model `lead_score_model` is the baseline model which includes every features with `boosted-tree classifier`

We then select the top 20 features from the first model by feature importance, and do training with `DNN classifier`

### Current best score
__PRC AUC__:0.685  
__ROC AUC__:0.857

## Further Improvement

### More Feature Engineering

__Combine Demo Trade Features__  
The features between BO and MT5 Demo trade are similar, and we will have huge amount of null values if we separate them, because most of the users dont do demo trade on the first day of signup, the issue becomes worse when we split them into BO and MT5

__Include Livechat Data__  
User activities with `help center` might be a good feature for predicting deposit posibilities  

### Improve Features ETL Pipeline

__Optimize Train Data Table ETL Process__  
The table is currently updated with scheduled query by weekly (overwrite) which is around 80+ GB per run
We can reduce it by using `append` option  

__Optimize Subset Features ETL Process__  
As we will have more summary and aggregated tables with data warehourse, some features can be obtained more easily  
Eg: Most of the `Signup Features` can get from `User Profile Combined` Table

### Model Interpretability
One of the major drawbacks of machine learning is it's interpretability
I found that there is a technique called `weight of evidence` which can help to explain the predicting power of isolated independent variable 
towards the dependent variable(classification). This can be implemented on the next version.  
[Reference Article](https://sundarstyles89.medium.com/weight-of-evidence-and-information-value-using-python-6f05072e83eb)

## Related Visualization
[Tableau Dashboard](https://10az.online.tableau.com/#/site/binary/views/LeadScoreDashboard/LeadScoreStory)

### Lead Score 2.0 usage proposal (N days)
https://htmtopdf.herokuapp.com/ipynbviewer/temp/33b6f15559ebeb0e9444b351086523be/lead_score_N_days.html?t=1621322306171
