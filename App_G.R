# App G = App F + colour detail + title tweaks

library(shiny)
library(ggplot2)

fair_diamonds <- diamonds[diamonds$cut == "Fair", ]
good_diamonds <- diamonds[diamonds$cut == "Good", ]
verygood_diamonds <- diamonds[diamonds$cut == "Very Good", ]

ui <- fluidPage(
		titlePanel("EDA tool"),
			sidebarLayout(
			sidebarPanel("Menu",
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

			getDataset <- reactive({
				switch(input$cut,
					"Fair" = fair_diamonds,
					"Good" = good_diamonds,
					"Very Good" = verygood_diamonds
					)
				})

			output$scatter <- renderPlot({
				ggplot(getDataset(), aes(price, carat)) + geom_point(aes(colour=color)) + scale_color_brewer(palette="Blues")
				})

			output$bar <- renderPlot({
				ggplot(getDataset(), aes(clarity)) + geom_bar(aes(fill=color)) + scale_fill_brewer(palette="Spectral")
				})
}

shinyApp(ui=ui, server=server)