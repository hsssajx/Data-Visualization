require(googleVis)
require(shiny)
#Prepare data to be displayed load "USOP.csv"  
tennis <- read.csv("USOP.csv")
attach(tennis)
#Do a data structure transformation in order to make the data recognized by googleViz 
#Use table() to generate a count table and form a new data frame with “country”,”year”,”count”. 
tab<-table(year,country)
con<-rep(colnames(tab),each=length(rownames(tab)))
yea<-rep(rownames(tab),length(colnames(tab)))
counts<-tab[1:length(tab)]
data<-data.frame(country=con,year=yea,count=counts)

#Reactive part of sever.R
shinyServer(function(input, output) {  
  		myYear <- reactive({ input$Year })
		output$year <- renderText({
  				 paste("The Matches of US Open Played in the Year of", myYear())
  					      })
		output$gvis <- renderGvis({  
    				myData <- subset(data, year==myYear())
				#Visualization with gvisGeochart() from the googleViz package.
    				gvisGeoChart(myData, locationvar="country", colorvar="count",
                			options=list(region="world", width=1000, height=700,
                              			colorAxis="{colors:['white','pink','magenta', 'purple']}"
                       				         ))     
					         })
				           })
