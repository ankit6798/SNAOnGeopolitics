library(shiny)

ui <- fluidPage(
  conditionalPanel(
    condition = "input.password != 'password'",  
    textInput("password", "Password:", value = "Type the password here")
  ), 
  conditionalPanel(
    condition = "input.password == 'password'",  
    fluidRow(
      column(2,
             textInput("Green", "Green:", value = "24716"), 
             textInput("Blue", "Blue:", value = "24700")
      )
    )
  ),  
  plotOutput(outputId = "distPlot")
)

server <- function(input, output, session) {
  output$distPlot <- renderPlot({
    if (input$password!="password") return(0)
    plot(c(1,2,3),c(1,2,3))
  })
}

app=shinyApp(ui, server)