library(data.table)
library(ggplot2)
library(RColorBrewer)
library(tidyverse)
library(ggiraph)
library(maps)
library(magrittr)
library(rvest)
library(shiny)
library(readxl)

ui <- fluidPage(
  headerPanel("World Happiness Report"), 
  selectInput("var1", "Select Country", choices = (WHR2019$Country.or.region)),
  tableOutput("text"),
  sidebarPanel(
    p("Select the inputs for the Dependent Variable"),
    selectInput(inputId = "DepVar", label = "Dependent Variables", multiple = FALSE, choices = list("Score", "GDP.per.capita", "Social.support", "Healthy.life.expectancy", "Freedom.to.make.life.choices", "Generosity", "Perceptions.of.corruption")),
    p("Select the inputs for the Independent Variable"),
    selectInput(inputId = "IndVar", label = "Independent Variables", multiple = FALSE, choices = list("Score", "GDP.per.capita", "Social.support", "Healthy.life.expectancy", "Freedom.to.make.life.choices", "Generosity", "Perceptions.of.corruption"))
  ),
  mainPanel(
    verbatimTextOutput(outputId = "RegSum"),
    verbatimTextOutput(outputId = "IndPrint"),
    verbatimTextOutput(outputId = "DepPrint"),
    plotOutput("plot")
  )
)

server <- function(input, output) {
  
  lm1 <- reactive({lm(reformulate(input$IndVar, input$DepVar), data = WHR2019)})
  
  output$DepPrint <- renderPrint({input$DepVar})
  output$IndPrint <- renderPrint({input$IndVar})
  output$RegSum <- renderPrint({summary(lm1())})
  output$plot <- renderPlot({
    ggplot(WHR2019, aes(x = .data[[input$IndVar]], y = WHR2019$Score)) +
      geom_point(fill = "red") + 
      labs(title = "Happiness Scores by Independent Variable") +
      ylab(label = "Happiness Score")})
  output$text <- renderTable((
    WHR2019 %>%
      filter(Country.or.region == input$var1)
  ))
  
  
}

shinyApp(ui = ui, server = server)