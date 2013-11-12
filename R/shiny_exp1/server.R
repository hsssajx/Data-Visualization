library(shiny)
library(datasets)
library(foreign)

tennis <-read.csv("USOP.csv")
# Define server logic required to plot various variables against result
shinyServer(function(input, output) {

  # Compute the forumla text in a reactive expression since it is 
  # shared by the output$caption and output$tennisPlot expressions
  formulaText <- reactive({
    paste(input$variable, "~ as.numeric(as.factor(Result))")
  })

  # Return the formula text for printing as a caption
  output$caption <- renderText({
    formulaText()
  })

  # Generate a plot of the requested variable against results and only 
  # include outliers if requested
  output$tennisPlot <- renderPlot({
    boxplot(as.formula(formulaText()), 
            data = tennis,
            outline = input$outliers)
  })
})