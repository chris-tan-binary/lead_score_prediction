# Lead Score Prediction Model

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
v) Zendesk - User activities with help center
vi) CLV - User deposit activities and amount (this will be the dependent variable)  

[Refer Here for Column Details](https://docs.google.com/spreadsheets/d/1skE7A1vsn01p9vKq5YdbWg10Y0B4CmOktqJSrNx23AQ/edit?ts=5ecf2dfd#gid=888794899])

We can do feature engineering on each part separately, and the final dataset will be just the concatenation of these parts.


