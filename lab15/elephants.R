## Load the libraries

library(tidyverse)
library(janitor)
library(shiny)
library(shinydashboard)

elephants <- read_csv("data/elephants_data/elephants.csv") %>%
  clean_names()

ui <- dashboardPage(
  
  dashboardHeader(title = "Elephant Age and Height by Sex"),
  
  dashboardSidebar(
    selectInput("x",
                "Select Variable",
                choices = c("age",
                            "height"),
                selected =  "age")
    
    
  ),
  
  dashboardBody(
    
    plotOutput("plot", width = "600px", height = "500px")
    
  )
  
)

server <- function(input, output, session) {
  
  output$plot <- renderPlot({
    
    elephants %>%
      filter(sex != "NA") %>%
      ggplot(aes(x=sex,
                 y=.data[[input$x]],
                 fill = sex)) +
      geom_boxplot(alpha = 0.75) +
      labs(title = "Range by Sex",
           x = "Sex",
           y = input$x) +
      theme_minimal()
  })
}

shinyApp(ui, server)
