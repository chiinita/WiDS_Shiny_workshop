# App B = App A + titlePanel + 2 section layout (1 sidebarPanel, 1 mainPanel)





----------------------------------------------------------------------

library(shiny)


ui <- fluidPage(
				titlePanel("<titlePanel-title>"),
				sidebarLayout(
								sidebarPanel("<sidebarPanel-title>"),
								mainPanel("<mainPanel-title>")
							)
				)

server <- function(input, output){}

shinyApp(ui=ui, server=server)


