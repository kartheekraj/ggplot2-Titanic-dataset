#__________________________ggplot2 (Titanic Tutorial)___________________________________________

#Run the following code and mannualy select the train data set on your drive.
titanic = read.table(file.choose(),header = TRUE,sep = ',',stringsAsFactors = FALSE)

#To view the data set in R:
View(titanic)

#converting as factors:
titanic$pclass <- as.factor(titanic$pclass)
titanic$Survived <- as.factor(titanic$Survived)
titanic$sex <- as.factor(titanic$sex)
titanic$embarked <- as.factor(titanic$embarked)

#==============================================
#What is the survival rate?
#==============================================

#As Survived is a factor (i.e., categorical) variable, a bar chart
#is a great visualization to use.
ggplot(titanic, aes(x = Survived))+geom_bar() #geom_bar is to create a bar graph from the ggplot2 package.

#Percentages of survived and not survived 
prop.table(table(titanic$Survived))

#Theme and customization to the graph
ggplot(titanic, aes(x = Survived))+theme_bw()+geom_bar()+labs(y = "Passenger Count",title = "Titanic Survival Rates")

#==============================================
# What was the survival rate by gender?
#==============================================

#The survival rate by gender can be represented by 
#the following code.
ggplot(titanic, aes(x= sex, fill = Survived)) + theme_bw()+
  geom_bar()+
  labs(y = "Passenger Count",title= "Titanic Survival Rates by Sex")

#The survival rate by class of ticket.
ggplot(titanic, aes(x= pclass, fill = Survived)) + theme_bw()+ geom_bar()+labs(y = "Passenger Count", title = "Titanic Survival Rates by Pclass")

#========================================================
# What was the survival rate by class of ticket and gender
#========================================================
ggplot(titanic, aes(x= sex, fill = Survived)) + theme_bw()+ facet_wrap(~pclass)+ geom_bar()+labs(y = "Passenger Count", title = "Titanic Survival Rates by Pclass and Sex")
# facet_wrap(~Pclass),it divids the graph by Pclass levels which are 1st,2nd and 3rd class.

#==============================================
# What is the distribution of passenger ages?
#==============================================

#First we create a histogram of age distribution on
#board the titanic
ggplot(titanic, aes(x= age))+ theme_bw()+geom_histogram(binwidth = 5)
+labs(y = "Passenger Count",x= "Age(binwidth=5)", title = "Titanic Age Distribution")

#Adding fill (color) to the graph.
ggplot(titanic, aes(x= age, fill = Survived))+ theme_bw()+geom_histogram(binwidth = 5)+labs(y = "Passenger Count",x= "Age(binwidth=5)", title = "Titanic Age Distribution")

#==============================================
# The following can also be visualized by box-and-whishker
# plots
#==============================================
ggplot(titanic, aes(x= Survived,y = age))+ theme_bw()+geom_boxplot()+labs(y = "Age",x= "Survived", title = "Titanic Survival Rates by Age")

#==============================================
# what is the survival rates by age
# when segmented by gender and class of ticket?
#==============================================
ggplot(titanic, aes(x= age, fill = Survived))+ theme_bw()+facet_wrap(sex ~ pclass)+geom_density(aplha = 0.5)+labs(y = "Age",x= "Survived", title = "Titanic Survival Rates by Age, Pclass and Sex")

#===============================================================
# Histogram of survival rate by Age, gender and class of ticket.
#===============================================================
ggplot(titanic, aes(x= age, fill = Survived))+ theme_bw()+facet_wrap(sex ~ pclass)+geom_histogram(binwidth = 5)+labs(y = "Age",x= "Survived", title = "Titanic Survival Rates by Age, Pclass and Sex")
