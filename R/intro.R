#Choose “File”, Click “New script”, you can open a window to edit your script.
> getwd()
#Set the working directory for R in order to analysis your data
> setwd("path of data") #for example, mine is setwd("C:/Users/Tony Tong/Desktop/R_file")
#Install the package called “foreign” in order to read a .csv file.
> install.packages("foreign") # For .jason files, use “rjason” package: # install.packages("rjason")
> library("foreign")
>tennis<-read.csv("USOpen.csv")# try “dim()”
>tennis<-tennis[,9:34] try “tennis[9:34]”, “tennis[9,34]” and “tennis[9:34,]” to see the differences
>fix(tennis)
#Sometimes, we drop cases with missing values by using the following statement:
#tennis_complete<-tennis[complete.cases(tennis),]

>mean(tennis$ace1) # try median()
>sd(tennis$ace1)
>quantile(tennis$ace1,c(0.25,0.75)) #you can put any percentage here!
#get a frequency table
>table(tennis$ace1,tennis$ace2)
#get a summary table for all varibles
>summary(tennis)

#Merge the number of winners and errors separately for all matches
> winner<-c(tennis$winner1, tennis$winner2)
> error<-c(tennis$error1,tennis$error2)
#Use lm() to build a simple linear model
> model1<-lm(winner~error)
> summary(model1)#You should see results with parameters.
#Create a vector of results and merge those three independent variables we are interested in.
> result<-rep(1,1000)
>result<-c(result,rep(0,1000))
>ace<-c(tennis$ace1,tennis$ace2)
>av_Second_serve<-c(tennis$avgSecServe1,tennis$avgSecServe2)
>winner<-c(tennis$winner1,tennis$winner2)
#Use glm to create a logistic model
> model2<-glm(result~ace+av_Second_serve+winner)
> summary(model2)

#Always refer to the following site about color and shape before you start to plot something on R.
#http://www.phaget4.org/R/plot.html
>x = rnorm(100) # rnorm() is used to generate random numbers conforming to a normal distribution
>plot(x)
>x=rnorm(1000)
>hist(x)
#plot() is used to generate a figure, while points() is used to add more.
>plot(winner[1:1000],error[1:1000],pch=20,col="blue")
>points(winner[1001:2000],error[1001:2000],pch=21,col="green")
#Add linear trend lines
>myline.fit1<-lm(winner[1:1000]~error[1:1000])
>abline(myline.fit1)
>myline.fit2<-lm(winner[1001:2000]~error[1001:2000])
>abline(myline.fit2)
#full statement for a plot:
#plot(x,y, xlab="x axis", ylab="y axis", main="my plot", ylim=c(0,20), xlim=c(0,20), pch=15, col="blue")

#Install the “car” package and see more advanced features for simple plots:
>install.packages("car")+library(car)
>scatterplot(winner~error|result)
#We can see whether there is a correlative relationship between each pair of variables
>pairs(~winner+error+c(tennis$ace1,tennis$ace2)+c(tennis$double1, tennis$double2))
>scatterplot.matrix(~winner+error+c(tennis$ace1,tennis$ace2)+c(tennis$double1, tennis$double2)|result)
#Make density plot by installing the package “hexbin”
>install.packages("hexbin")+library(hexbin)
> plot(hexbin(winner,error,xbin=30))
#Install the package called “rgl” and make an interactive three dimensional plot
>install.packages("rgl")+library(rgl)
> plot3d(winner,error,ace)

