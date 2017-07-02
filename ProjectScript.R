# Reading and cleaning the data

getAdultDataSet<-function(){
  data = read.table("http://archive.ics.uci.edu/ml/machine-learning-databases/adult/adult.data",
                    sep=",",header=F,col.names=c("age", "type_employer", "fnlwgt", "education", 
                                                 "education_num","marital", "occupation", "relationship", "race","sex",
                                                 "capital_gain", "capital_loss", "hr_per_week","country", "income"),
                    fill=FALSE,strip.white=T)
  return(data)
}

processData<-function(data){
  
  data[["education_num"]]=NULL
  data[["fnlwgt"]]=NULL
  
  data$type_employer = as.character(data$type_employer)
  data$occupation = as.character(data$occupation)
  data$country = as.character(data$country)
  data$education = as.character(data$education)
  data$race = as.character(data$race)
  data$marital = as.character(data$marital)
  
  data$type_employer = gsub("^Federal-gov","Federal-Govt",data$type_employer)
  data$type_employer = gsub("^Local-gov","Other-Govt",data$type_employer)
  data$type_employer = gsub("^State-gov","Other-Govt",data$type_employer)
  data$type_employer = gsub("^Private","Private",data$type_employer)
  data$type_employer = gsub("^Self-emp-inc","Self-Employed",data$type_employer)
  data$type_employer = gsub("^Self-emp-not-inc","Self-Employed",data$type_employer)
  data$type_employer = gsub("^Without-pay","Not-Working",data$type_employer)
  data$type_employer = gsub("^Never-worked","Not-Working",data$type_employer)
  
  data$occupation = gsub("^Adm-clerical","Admin",data$occupation)
  data$occupation = gsub("^Armed-Forces","Military",data$occupation)
  data$occupation = gsub("^Craft-repair","Blue-Collar",data$occupation)
  data$occupation = gsub("^Exec-managerial","White-Collar",data$occupation)
  data$occupation = gsub("^Farming-fishing","Blue-Collar",data$occupation)
  data$occupation = gsub("^Handlers-cleaners","Blue-Collar",data$occupation)
  data$occupation = gsub("^Machine-op-inspct","Blue-Collar",data$occupation)
  data$occupation = gsub("^Other-service","Service",data$occupation)
  data$occupation = gsub("^Priv-house-serv","Service",data$occupation)
  data$occupation = gsub("^Prof-specialty","Professional",data$occupation)
  data$occupation = gsub("^Protective-serv","Other-Occupations",data$occupation)
  data$occupation = gsub("^Sales","Sales",data$occupation)
  data$occupation = gsub("^Tech-support","Other-Occupations",data$occupation)
  data$occupation = gsub("^Transport-moving","Blue-Collar",data$occupation)
  
  data$country[data$country=="Cambodia"] = "Asia"
  data$country[data$country=="Canada"] = "North-America"    
  data$country[data$country=="China"] = "Asia"     
  data$country[data$country=="Columbia"] = "South-America"    
  data$country[data$country=="Cuba"] = "North-America"      
  data$country[data$country=="Dominican-Republic"] = "North-America"
  data$country[data$country=="Ecuador"] = "South-America"     
  data$country[data$country=="El-Salvador"] = "South-America" 
  data$country[data$country=="England"] ="Europe"
  data$country[data$country=="France"] = "Europe"
  data$country[data$country=="Germany"] = "Europe"
  data$country[data$country=="Greece"] = "Europe"
  data$country[data$country=="Guatemala"] ="North-America"
  data$country[data$country=="Haiti"] = "North-America"
  data$country[data$country=="Holand-Netherlands"] = "Europe"
  data$country[data$country=="Honduras"] = "North-America"
  data$country[data$country=="Hong"] = "Asia"
  data$country[data$country=="Hungary"] = "Europe"
  data$country[data$country=="India"] = "Asia"
  data$country[data$country=="Iran"] = "Asia"
  data$country[data$country=="Ireland"] = "Europe"
  data$country[data$country=="Italy"] = "Europe"
  data$country[data$country=="Jamaica"] = "North-America"
  data$country[data$country=="Japan"] = "Asia"
  data$country[data$country=="Laos"] = "Asia"
  data$country[data$country=="Mexico"] = "North-America"
  data$country[data$country=="Nicaragua"] = "North-America"
  data$country[data$country=="Outlying-US(Guam-USVI-etc)"] = "North-America"
  data$country[data$country=="Peru"] = "South-America"
  data$country[data$country=="Philippines"] = "Asia"
  data$country[data$country=="Poland"] = "Europe"
  data$country[data$country=="Portugal"] = "Europe"
  data$country[data$country=="Puerto-Rico"] = "North-America"
  data$country[data$country=="Scotland"] = "Europe"
  data$country[data$country=="South"] = "Europe"
  data$country[data$country=="Taiwan"] = "Asia"
  data$country[data$country=="Thailand"] = "Asia"
  data$country[data$country=="Trinadad&Tobago"] = "North-America"
  data$country[data$country=="United-States"] ="North-America"
  data$country[data$country=="Vietnam"] = "Asia"
  data$country[data$country=="Yugoslavia"] = "Europe"
  
  data$education = gsub("^10th","Dropout",data$education)
  data$education = gsub("^11th","Dropout",data$education)
  data$education = gsub("^12th","Dropout",data$education)
  data$education = gsub("^1st-4th","Dropout",data$education)
  data$education = gsub("^5th-6th","Dropout",data$education)
  data$education = gsub("^7th-8th","Dropout",data$education)
  data$education = gsub("^9th","Dropout",data$education)
  data$education = gsub("^Assoc-acdm","Associates",data$education)
  data$education = gsub("^Assoc-voc","Associates",data$education)
  data$education = gsub("^Bachelors","Bachelors",data$education)
  data$education = gsub("^Doctorate","Doctorate",data$education)
  data$education = gsub("^HS-Grad","HS-Graduate",data$education)
  data$education = gsub("^Masters","Masters",data$education)
  data$education = gsub("^Preschool","Dropout",data$education)
  data$education = gsub("^Prof-school","Prof-School",data$education)
  data$education = gsub("^Some-college","HS-Graduate",data$education)
  
  data$marital[data$marital=="Married-AF-spouse"] = "Married"
  data$marital[data$marital=="Married-civ-spouse"] = "Married"
  data$marital[data$marital=="Married-spouse-absent"] = "Not-Married"
  data$marital[data$marital=="Separated"] = "Not-Married"
  data$marital[data$marital=="Divorced"] = "Not-Married"

  data$race[data$race=="Amer-Indian-Eskimo"] = "American-Indian"
  data$race[data$race=="Asian-Pac-Islander"] = "Asian"
  
  data[["capital_gain"]] <- ordered(cut(data$capital_gain,c(-Inf, 0, 
                                                            median(data[["capital_gain"]][data[["capital_gain"]] >0]), 
                                                            Inf)),labels = c("None", "Low", "High"))
  data[["capital_loss"]] <- ordered(cut(data$capital_loss,c(-Inf, 0, 
                                                            median(data[["capital_loss"]][data[["capital_loss"]] >0]), 
                                                            Inf)), labels = c("None", "Low", "High"))
  
  is.na(data) = data=='?'
  is.na(data) = data==' ?'
  data = na.omit(data)
  
  data$marital = factor(data$marital)
  data$education = factor(data$education)
  data$country = factor(data$country)
  data$type_employer = factor(data$type_employer)
  data$occupation = factor(data$occupation)
  data$race = factor(data$race)
  data$sex = factor(data$sex)
  data$relationship = factor(data$relationship)
  data$income = as.factor(ifelse(data$income==data$income[1],0,1))

  return(data)
  
}

getCrossValidationSets<-function(all.data, splitRatio=0.3){
  sample = rbinom(dim(all.data)[1],1,splitRatio)
  trainset = all.data[sample==0,]
  valset = all.data[sample==1,]
  return(list(train=trainset,test=valset))
}

logistic.Regression<-function(train.data){
  
  logit.fit<-glm(formula = income ~., family = binomial(logit),data = train.data)
  return(logit.fit)
  
}

neuralNetwork<-function(train.data){
  require(nnet)
  nnet.fit<-nnet(income~., data=train.data,size=20,maxit=10000,decay=.01)
  return(nnet.fit)
}

accuracyAnalysisLR<-function(test.data,fitted.LR.model){
  prediction<-predict(fitted.LR.model, newdata=test.data)
  accuracy<-sum(prediction>0)/table(test.data$income)[2]
  return(accuracy*100)
}


accuracyAnalysisNN<-function(test.data,fitted.model, type="class"){
  prediction<-predict(fitted.model, newdata=test.data, type= type)
  accuracy<-sum(prediction==1)/table(test.data$income)[2]
  return(accuracy*100)
}

ROCAnalysis<-function(model.1,model.2,test.data){
  require(ROCR)
  model1.predict<-predict(model.1,test.data)
  model2.predict<-predict(model.2,test.data)
  
  model1.prediction<-prediction(model1.predict, test.data$income)
  model2.prediction<-prediction(model2.predict, test.data$income)
  
  model1.performance<-performance(model1.prediction,"tpr", "fpr")
  model2.performance<-performance(model2.prediction,"tpr", "fpr")
  
  plot(model1.performance, col=2,lwd=2)
  plot(model2.performance, col=3, lwd=2, add=T)
  abline(a=0,b=1,lwd=2,lty=2,col="gray")
  legend("bottomright",col=c(2:5),lwd=2,legend=c("logit","Neural Net"),bty='n')
  
  
 auc1<-performance(model1.prediction,measure = "auc")
 auc1 <- auc1@y.values[[1]]
 auc2<-performance(model2.prediction,measure = "auc")
 auc2<- auc2@y.values[[1]]
 return(list(model1=auc1, model2=auc2))
}
