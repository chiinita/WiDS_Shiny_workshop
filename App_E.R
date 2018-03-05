# App E = App D + 2 static ggplots





----------------------------------------------------------------------

library(shiny)
library(ggplot2)

ui <- fluidPage(
		titlePanel("<titlePanel-title>"),
			sidebarLayout(
			sidebarPanel("<sidebarPanel-title>",
				selectInput(
					inputId = "cut",
					label = "Select cut of diamond",
					choices = c("Fair", "Good", "Very Good"),
					selected = "Good"
				    		)
				    	),
			mainPanel("Visualisations of diamond data",
				tabsetPanel(
				    tabPanel("Price vs Carat", plotOutput(outputId="scatter")),
				    tabPanel("Volume by Clarity class", plotOutput(outputId="bar"))
				            )
    				)
  						)
				)

server <- function(input, output){

			output$scatter <- renderPlot({
				ggplot(diamonds, aes(price, carat)) + geom_point()
				})

			output$bar <- renderPlot({
				ggplot(diamonds, aes(clarity)) + geom_bar()
				})
}

shinyApp(ui=ui, server=server)
