library(shiny)
shinyUI(fluidPage(
  titlePanel("Tabs!"),
  sidebarLayout(
    sidebarPanel(
      textInput("box1", "Enter Tab 1 Text:", value = "Tab 1!"),
      textInput("box2", "Enter Tab 2 Text:", value = "Tab 2!"),
      textInput("box3", "Enter Tab 3 Text:", value = "Tab 3!")
    ),
    mainPanel(
      tabsetPanel(type = "tabs", 
                  tabPanel("Tab 1", br(), textOutput("out1")), 
                  tabPanel("Tab 2", br(), textOutput("out2")), 
                  tabPanel("Tab 2", br(), textOutput("out3"))
      )
    )
  )
))