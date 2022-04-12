library(shiny)
library(tidyverse)

ui<-fluidPage(
  sliderInput(inputId = "num", # ID name for the input
              label = "Choose a number", # Label above the input
              value = 25, min = 1, max = 100 # values for the slider
  )
) # my user interface

server<-function(input,output){}
output$hist <- renderPlot({
  # allows us to put all our R code in one chunk
  data <- reactive({ # make data matches with plot and summary when slider is moved
    tibble(x = rnorm(input$num))# random normal points
  })
  
  ggplot(data(), aes(x = x)) + # make a histogram
    geom_histogram() +
    labs(title = input$title) # add a title
})
output$stats <- renderPrint({
  summary(data()) # calculate summary stats based on the numbers
})
}

shinyApp(ui = ui, server = server)