library(shiny)
shinyServer(function(input, output) {
  output$out1 <- renderText(input$box1)
  output$out2 <- renderText(input$box2)
  output$out3 <- renderText(input$box3)
})