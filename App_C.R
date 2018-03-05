# App C = App B + add selectInput widget to sidebarPanel





----------------------------------------------------------------------

library(shiny)


ui <- fluidPage(
				titlePanel("<titlePanel-title>"),
				sidebarLayout(
								sidebarPanel("<sidebarPanel-title>",
											selectInput(
														inputId = "list",
														label = "<selectInput-label>",
														choices = c("Fair", "Good", "Very Good"),
														selected = "Good"
												)
									),
								mainPanel("<mainPanel-title>")
							)
				)

server <- function(input, output){}

shinyApp(ui=ui, server=server)


