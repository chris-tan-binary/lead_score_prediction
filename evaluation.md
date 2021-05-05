There are a lot of metrics to evaluate the model performance:  

In this model, we will consider the 2 most common evaluation metrics   
i) ROC (Receiver Operating Characteristic) AUC (Area of Under Curve)  
ii) PRC (Precision Recall Curve) AUC (Area of Under Curve)  

ROC curve is showing the trade off between True Positive rate and False Positive rate across the threshold range 0 to 1  
Meanwhile PRC is showing the trade off between Precision and Recall.

__False Positive Rate, or Type I Error__  
False predicted positive over total negative  
(FP)/(FP+TN)  

__False Negative Rate, or Type II Error__  
False predicted negative over total positive  
(FN)/(FN+TP)  

__Recall (Sensitivity/TPR)__  
True predicted positive over total positive  
(TP)/(TP+FN)  

__Precision__  
True predicted positive over total predicted positive  
(TP)/(TP+FP)  


As this is imbalanced problem (we have more non-deposited than deposited)  
We will go for `optimising PRC`, as False Positive Rate in ROC AUC is taking advantage from too many negative classes, which shows a fake good result.
