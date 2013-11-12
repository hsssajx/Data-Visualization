require(shiny)
	shinyUI(pageWithSidebar(
 		 headerPanel("Geo Chart of US Open Matches"),
 		 sidebarPanel(
    		 		sliderInput("Year", "Years of Matches to be Displayed:", 
              			min=2003, max=2011, value=2011,step=1,
                			format="###0",animate=TRUE)
				  ),
 		 mainPanel(  h3(textOutput("year")), 
    				 htmlOutput("gvis")
 			       )
				      )
		)
