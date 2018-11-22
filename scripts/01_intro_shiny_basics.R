# 
# author: Alexander C. Hungerford
#
# created: 21 November 2018 
# 
# title: Datacamp
#        Building Web Applications in R with Shiny
#        Introduction and Shiny Basics


library("tidyverse")
library("shiny")
#load("data/movies.Rdata")
# str(movies)

#############
# named vectors:
# "Human readable label" = "variable_name"

load(url("http://s3.amazonaws.com/assets.datacamp.com/production/course_4850/datasets/movies.Rdata"))

# Define UI for application that plots features of movies
ui <- fluidPage(
  
  # Sidebar layout with a input and output definitions
  sidebarLayout(
    
    # Inputs
    sidebarPanel(
      
      # Select variable for y-axis
      selectInput(inputId = "y", 
                  label = "Y-axis:",
                  choices = c("IMDB rating" = "imdb_rating",
                              "IMDB number of votes" = "imdb_num_votes",
                              "Critics score" = "critics_score",
                              "Audience score" = "audience_score",
                              "Runtime" = "runtime"), 
                  selected = "audience_score"),
      
      # Select variable for x-axis
      selectInput(inputId = "x", 
                  label = "X-axis:",
                  choices = c("IMDB rating" = "imdb_rating",
                              "IMDB number of votes" = "imdb_num_votes",
                              "Critics score" = "critics_score",
                              "Audience score" = "audience_score",
                              "Runtime" = "runtime"), 
                  selected = "critics_score"),
      
      # Select variable for color
      selectInput(inputId = "z", 
                  label = "Color by:",
                  choices = c("Title type" = "title_type",
                              "Genre" = "genre",
                              "MPAA rating" = "mpaa_rating",
                              "Critics rating" = "critics_rating",
                              "Audience rating" = "audience_rating"),
                  selected = "mpaa_rating")
    ),
    
    # Outputs
    mainPanel(
      plotOutput(outputId = "scatterplot")
    )
  )
)

# Define server function required to create the scatterplot
server <- function(input, output) {
  
  # Create the scatterplot object the plotOutput function is expecting
  output$scatterplot <- renderPlot({
    ggplot(data = movies, aes_string(x = input$x, y = input$y,
                                     color = input$z)) +
      geom_point()
  })
}

# Create a Shiny app object
shinyApp(ui = ui, server = server)

