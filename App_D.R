# App D = App C + add tabLayout with 2 tabs to mainPanel section





----------------------------------------------------------------------

library(shiny)

ui <- fluidPage(
				  titlePanel("<titlePanel-title>"),
				  			sidebarLayout(
				    		sidebarPanel("<sidebarPanel-title>",
				                 		selectInput(
								                   inputId = "cut",
								                   label = "Select cut of Diamond",
								                   choices = c("Fair", "Good", "Very Good"),
								                   selected = "Good"
				                 					)
				    					),
				   			mainPanel("<mainPanel-title>",
				              			tabsetPanel(
				                					tabPanel("<tabsetPanel1-title>", plotOutput(outputId="")),
				                					tabPanel("<tabsetPanel2-title>", plotOutput(outputId=""))
				              						)
    								)
  										)
				)

server <- function(input, output){}

shinyApp(ui=ui, server=server)


