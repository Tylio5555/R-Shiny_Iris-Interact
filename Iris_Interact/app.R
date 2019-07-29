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

    
    
    # Sidebar
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

# Define server logic
server <- function(input, output) {

    output$distPlot <- renderPlot({
        
        colors <- c("#00AFBB", "#E7B800", "#FC4E07")
        colors <- colors[as.numeric(iris$Species)]
        
        # Define shapes
        shapes = c(16, 17, 18)
        shapes <- shapes[as.numeric(iris$Species)]
        
        plot(iris %>% select(input$feature_1, input$feature_2),
             col = colors, pch = shapes)
        
        legend("topright", legend = levels(iris$Species),
               col =  c("#00AFBB", "#E7B800", "#FC4E07"),
               pch = c(16, 17, 18) )
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
