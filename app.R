#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
    
    # Application title
    titlePanel("Old Faithful Geyser Data"),
    
    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput("bins",
                        "Number of bins:",
                        min = 1,
                        max = 50,
                        value = 30)
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
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)
        
        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white',
             xlab = 'Waiting time to next eruption (in mins)',
             main = 'Histogram of waiting times')
    })
}

# Run the application 
shinyApp(ui = ui, server = server)



library(shiny)

# Define UI for application
ui <- fluidPage(
    
    # Application title
    titlePanel("Title goes here"),
    
    sidebarLayout(
        # Sidebar panel
        sidebarPanel(
        ),
        
        # Main panel
        mainPanel(
        )
    )
)

# Define server side logic
server <- function(input, output) {}

# Run the application 
shinyApp(ui = ui, server = server)

library(tidyverse)

print(nrow(europe))
print(ncol(europe))

print(n_distinct(europe$Country))
print(n_distinct(europe$City))
print(range(europe$Year))




##################################

ui <- fluidPage(
    # Application title
    titlePanel("Welcome"),
    "Welcome to MindReset. This is safespace for peoplewhoare tired of life",
    sidebarLayout(
        # Sidebar panel
        sidebarPanel(
            "This is the sidebar panel",
            sliderInput(inputId = "slider1", label = "slider",
                        min = 1,
                        max = 100,
                        value = 60),
            selectInput(inputId = "drop_down_1", label = "occupation:",
                        choices = c("Teacher", "Doctor", "Lawyer")),
            
            textInput(inputId = "text_input", label = "Name:")
        ),
        
        # Main panel
        mainPanel(
            "This is the main panel"
        ) )
)

shinyApp(ui = ui, server = server)







ui <- fluidPage(
    # Application title
    titlePanel("Welcome"),
    "Welcome to MindReset. This is safespace for peoplewhoare tired of life",
    sidebarLayout(
        # Sidebar panel
        sidebarPanel(
            "This is the sidebar panel",
            sliderInput(inputId = "slider1", label = "slider",
                        min = 1,
                        max = 100,
                        value = 60),
            selectInput(inputId = "drop_down_1", label = "occupation:",
                        choices = c("Teacher", "Doctor", "Lawyer")),
            
            textInput(inputId = "text_input", label = "Name:"),
            
            radioButtons(inputId = "radio_1", label = "Radio buttons", choices = list("Choice 1" = 1, "Choice 2" = 2),
                         selected = 1)
            
        ),
        
        
        # Main panel
        mainPanel("this is main panel",
                  textOutput(outputId = "text_output"),
                  tabsetPanel(type = "tabs",
                              tabPanel(title = "Info"),
                              tabPanel(title = "Data"), 
                              tabPanel(title = "Plots")
                  ) 
        )
    )
)


server <- function(input, output)
    
    output$text_output <-  renderText({
        paste("your answer-",input$text_input,input$radio_1,input$drop_down_1, input$slider1 )  
    })

shinyApp(ui = ui, server = server)

