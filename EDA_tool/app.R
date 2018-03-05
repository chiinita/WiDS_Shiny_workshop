# WiDS Shiny Workshop - complete EDA tool

library(shiny)
library(ggplot2)

fair_diamonds <- diamonds[diamonds$cut == "Fair", ]
good_diamonds <- diamonds[diamonds$cut == "Good", ]
verygood_diamonds <- diamonds[diamonds$cut == "Very Good", ]

# Define UI for application that draws a histogram
ui <- fluidPage(
  titlePanel("WiDS Shiny workshop - EDA tool - full demo"),
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "cut",
        label = "Select cut of Diamond",
        choices = c("Fair", "Good", "Very Good"),
        selected = "Good"
      )
    ),
    mainPanel("Visualisations of Diamond data",
              tabsetPanel(
                tabPanel("Price vs Carat", plotOutput(outputId = "scatter")),
                tabPanel("Volume by Clarity class", plotOutput(outputId = "bar"))
              )
    )
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  getDataset <- reactive({
    switch(input$cut,
           "Fair" = fair_diamonds,
           "Good" = good_diamonds,
           "Very Good" = verygood_diamonds)
  })
  
  output$scatter <- renderPlot({
    ggplot(getDataset(), aes(price, carat)) + geom_point(aes(colour=color)) + scale_color_brewer(palette="Blues")
  })
  
  output$bar <- renderPlot({
    ggplot(getDataset(), aes(clarity)) + geom_bar(aes(fill=color)) + scale_fill_brewer(palette="Spectral")
  })
}

# Run the application 
shinyApp(ui = ui, server = server)