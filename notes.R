# 
# author: Alexander C. Hungerford
#
# created: 21 November 2018 
# 
# title: Notes for course:
#
#        Datacamp
#        Building Web Applications in R with Shiny
#        Introduction and Shiny Basics


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



########################### UI FUNCTION ######################################

# the setup for user-defined inputs for a plot and info about where
# physcially on the app the plot should appear is defined in the UI


######################## SERVER FUNCTION ######################################

# calculates outputs and any other claculations needed for outputs

# basic task of server function is to define the relationship between
# inputs and outputs

# accesses inputs selected by the user to perform computations and specifies
# how outputs laid out in the UI should be updated

# if your app has a plot, code for it lives in the server function, however,
# the setup for user-defined inputs for the plot and info about where
# physcially on the app the plot should appear is defined in the UI

# server function can actually handle a 3rd arg called "session", but
# we'll ignore it for now

# renderplot()
#   specifies how the output of the plot should be updated
#   the difference in your plot compared to normal ggplot2 code is how the
#   x and y variables are defined. They come from the input list that was
#   built in the UI

# RULES of server function
#   1. Always save objects to display to output$xx (named output lists)
#   2. Always build objects to display with one of the render*() functions
#         renderPlot(), renderTable(), renderWhatever() etc.
#   3. Use input values from the named input list with input$xx


# Outputs
#   renderPlot() was used for rendering our reactive plot
#   then laid out the plot with plotOutput in UI


# Simplified way of understanding UI vs. Server functions
#
# UI      has syntax specfic to shiny-- i.e. shiny-specifc code
#
# server  has R code you're already familiar with, but with some shiny code
#         to aacheive reactivity





########################## CHAPTER 2 NOTES ####################################

# changing the UI input from color/z dropdown into a slider

# A new sliderInput is given with some blanks to fill in
#   This widget will control the transparency of the plotted points.
#   It should have the ID alpha and the user facing label "Alpha:".
#   Its values should range between 0 and 1, with a default value set to 0.5.

# previous z-dropdown input code

# Select variable for color
selectInput(inputId = "z", 
            label = "Color by:",
            choices = c("Title type" = "title_type",
                        "Genre" = "genre",
                        "MPAA rating" = "mpaa_rating",
                        "Critics rating" = "critics_rating",
                        "Audience rating" = "audience_rating"),
            selected = "mpaa_rating")


# new slider code -- you also have to change the output code in server(){}
#                   specifically geom_point(alpha = input$alpha)

# Set alpha level
sliderInput(inputId = "alpha", 
            label = "Alpha:", 
            min = 0, max = 1, 
            value = 0.5)

# Create scatterplot object the plotOutput function is expecting
output$scatterplot <- renderPlot({
  ggplot(data = movies, aes_string(x = input$x, y = input$y)) +
    geom_point(alpha = input$alpha)






















