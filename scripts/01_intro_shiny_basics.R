# 
# author: Alexander C. Hungerford
#
# created: 21 November 2018 
# 
# title: Building Web Applications in R with Shiny
#        Introduction and Shiny Basics
#


############### Anatomy of a Shiny App ##################
#
# load data before ui definition
#
# lay out the user interface; controls layout, appearance
# ui <- fluidPage()

# server function; contains instructions needed to build app
# server <- function(input, output){}

# calling the shiny app function that combines the above components
# shinyApp(ui = ui, server = server)

library("shiny")
load("shinyR/movies.Rdata")
str(movies)







