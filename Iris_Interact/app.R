#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(datasets)
library(dplyr)

# Define UI
ui <- fluidPage(

    # Application title
    titlePanel("Iris Dataset Interact"),

    
    
    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            selectInput("feature_1",
                        "Feature 1:",
                        choices = names(iris)),
            
            selectInput("feature_2",
                        "Feature 2:",
                        choices = names(iris))
            
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({

        plot(iris %>% select(input$feature_1, input$feature_2),
             bg = c("red", "green3", "blue")[unclass(iris$Species)])
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
