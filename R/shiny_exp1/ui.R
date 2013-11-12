library(shiny)
 
# Define UI for miles per gallon application
shinyUI(pageWithSidebar(

  # Application title
  headerPanel("Differences Between Winners and Losers"),

  # Sidebar with controls to select the variable to plot against result
  # and to specify whether outliers should be included
  sidebarPanel(
    selectInput("variable", "Variable:",
                list("Winner" = "winner1", 
                     "Error" = "error1", 
                     "Ace" = "ace1",
		     "Double Fault"="double1")),

    checkboxInput("outliers", "Show outliers", FALSE)
  ),

  # Show the caption and plot of the requested variable against result
  mainPanel(
    h3(textOutput("caption")),

    plotOutput("tennisPlot")
  )
))