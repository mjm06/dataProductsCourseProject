##ui.R for courseProject
library(shiny)
library(ggplot2)

shinyUI(pageWithSidebar(
      headerPanel(h4("Sleep Requirements for Different Mammal Species")),
      
      sidebarPanel(
             h5("Getting Started"),
              
             "Click the radio button below for the mammal type (carnivore, omnivore, herbivore, or insectivore) you would like to analyze.",
              
             "Only one mammal type may be analyzed at a time.",
              
             "Notice that, with each selected mammal type, the list of mammalian orders you are analyzing will refresh. In addition, the dynamic scatterplot at right will
            refresh so that only the data for the selected mammal type are included.",
             
             tags$p("Slides describing this app in more detail are available on Github:"), 
             tags$a(href="http://mjm06.github.io/dataProductsCourseProject/projectSlides/index.html", "slidify presentation"),
             br(),
             br(),
             tags$p("The ui.R and server.R files for this app are also available on Github:"),
             tags$a(href="https://github.com/mjm06/dataProductsCourseProject/tree/master", "ui.R and server.R"),
             
            hr(),
            radioButtons("radio", label = h5("Select the mammal type to analyze."), 
                               choices = list("Carnivore", "Herbivore", "Insectivore", "Omnivore"),
                               selected = "Carnivore"),
            hr(),
            verbatimTextOutput("value"),
            br(),
     
            "You are analyzing the sleep needs of mammals of the following orders:",
            br(),
            textOutput("animalOrders"),
            br()
      ),

      mainPanel(
            "For all mammal types, there is a negative linear relationship between body weight (kg)
            and amount of sleep required (hours/day). However, the slope of this relationship and its uncertainty are
            different for different mammal types, as shown by the following reactive plot:",
      
            hr(),
            plotOutput('animalPlot'),
            hr(),
            
            "The following equation describes the linear relationship between body weight (kg) and needed sleep (hours per day) for the selected mammal type:",
            
            h4(textOutput("equation"))
        
      )
      
))