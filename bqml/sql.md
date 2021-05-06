## BQML Commands for Model Evaluation

__Feature_Importance__
```sql 
SELECT
  *
FROM
  ML.FEATURE_IMPORTANCE(MODEL `lead_scoring_model.lead_score_model_top_features`)
 order by 3 desc  
 ```
 
 __Prediction__
 ```sql
SELECT binary_user_id, round(prob,2) as probability
FROM ML.PREDICT(MODEL `lead_scoring_model.lead_score_model_top_features_DNN`,
Table `business-intelligence-240201.lead_scoring_model.train_data_with_email_frequency` )
cross join unnest(predicted_label_probs) 
where label = 1
```

__Evaluation__
```sql
select * from 
ML.EVALUATE(MODEL `lead_scoring_model.lead_score_model_top_features_DNN`,
           (select  (case when clv_d_14 > 0 then 1 else 0 end) as label, * from `business-intelligence-240201.lead_scoring_model.train_data_with_email_frequency`
           where date_joined >= DATE_ADD(CURRENT_DATE(), INTERVAL -4 WEEK)
           and date_joined < DATE_ADD(CURRENT_DATE(), INTERVAL -2 WEEK)
           )
           ,  STRUCT(0.30) )
 ```
 
 __Confusion_Matrix__
 ```sql
select * from 
ML.CONFUSION_MATRIX(MODEL `lead_scoring_model.lead_score_model_top_features_DNN`,
           (select  (case when clv_d_14 > 0 then 1 else 0 end) as label, * from `business-intelligence-240201.lead_scoring_model.train_data_with_email_frequency`
           where date_joined >= DATE_ADD(CURRENT_DATE(), INTERVAL -4 WEEK)
           and date_joined < DATE_ADD(CURRENT_DATE(), INTERVAL -2 WEEK)
           )
           ,  STRUCT(0.30) )
```
           
