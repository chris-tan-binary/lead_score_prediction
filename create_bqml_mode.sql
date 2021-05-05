CREATE OR REPLACE MODEL `lead_scoring_model.lead_score_model_add_demo_trade` 
OPTIONS(model_type= 'BOOSTED_TREE_CLASSIFIER') AS
SELECT
  --clv_d_14,
  IF(clv_d_14 > 0, 1, 0) AS label,
  avg_distinct_page_per_session, 
  countd_clientid, 
  countd_page, 
  countd_os,
  activity_count,
  session_count,
  avg_activity_per_session,
  max_session_min,
  avg_session_min, 
  day_diff_contact_join,
  has_mt5, 
  --signup_email_domain,
  number_of_vr_accounts, 
  number_of_real_accounts, 
  real_age_in_decade, 
  real_gender, 
  real_allow_login, 
  real_aml_risk_classification, 
  real_first_time_login, 
  real_account_opening_reason, 
  value_inserted_statuses, 
  number_of_inserted_documents, 
  email_domain_frequency,
  --
  PnL,
  number_of_trades,	
  number_of_financial_trades,	
  win_rate,
  profit_percentage,
  win_rate_financial,
  win_rate_non_financial,
  number_of_traded_markets,
  traded_markets,
  number_of_wins,
  number_of_traded_symbols,
  active_hours,
  major_symbol,
  major_bet_class,
  major_won_symbol,
  mean_profit,
  first_PnL,
  largest_win,
  largest_lose,
  number_of_accounts,
  closed_PnL,
  mean_revenue,
  win_percentage,
  largest_lost,
  first_trade_symbol_type,
  distinct_count_symbol,
  major_symbol_type,
  major_reason,
  avg_hours_between_trades,
  mt5_number_of_wins,
  mt5_number_of_trades,
  mt5_largest_win,
  mt5_first_pnl,
  mt5_active_hours
  --residence, 
  --channel
FROM
  
(with data as(
 select *,
    round(1 * cnt / sum(cnt) OVER (PARTITION BY residence),5) as email_domain_frequency,
FROM 
    (SELECT residence,
        signup_email_domain,
        count(*) as cnt
    FROM `business-intelligence-240201.lead_scoring_model.train_data`
    where date_joined >= '2021-01-01' and date_joined < '2021-02-16'
    group by 1,2) as tmp
),

features as
(select train.*, email_domain_frequency 
FROM `business-intelligence-240201.lead_scoring_model.train_data` as train
left join data
on train.residence = data.residence and train.signup_email_domain = data.signup_email_domain
where date_joined >= '2021-01-01' and date_joined < '2021-02-16'
)
select * from features)
