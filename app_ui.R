# Final Deliverable UI
library(shiny)
library(plotly)

page_one <- tabPanel(
  "Introduction"
)

page_two <- tabPanel(
  "Health Expenditure",
  sidebarLayout(
    sidebarPanel(
      h6("Choose two countries and a year below to compare their CHE%GDP."),
      selectInput(
        inputId = "country_1",
        label = "Country 1:",
        choices = c(unique_countries)
      ),
      selectInput(
        inputId = "country_2",
        label = "Country 2:",
        choices = c(unique_countries)
      ),
      sliderInput(
        inputId = "year",
        label = "Year",
        min = 2000,
        max = 2018,
        value = 2000
      )
    ),
    mainPanel(
      plotlyOutput("chart"),
      br(),
      h6("The CHE%GDP metric stands for Current Health Expenditure (CHE) as percentage 
      of Gross Domestic Product (GDP) (%). This is often referred to as the CHE%GDP. 
      The CHE value explains how much a country is spending on health-related expenditures.
      When we measure this as a percent of a country’s overall GDP, we are able to learn
      how much money the country is actively allocating towards health related funding 
      and costs. Overall, this gives us a sense of how various countries prioritize 
      public health."),
      br()
    )
  ),
    
  # h4("Comparing current health expenditures per capita in USD")
  sidebarLayout(
    sidebarPanel(
      h6("Choose a countries and a start year below to evaluate its health expenditures per capita over time."),
      selectInput(
        inputId = "country_3",
        label = "Country 1:",
        choices = c(unique_countries)
      ),
      sliderInput(
        inputId = "year_2",
        label = "Year:",
        min = 2000,
        max = 2018,
        value = 2000
      )
    ),
    mainPanel(
      plotlyOutput("chart2"),
      br(),
      h6("To evaluate current health expenditures per capita in USD, we used the che_pc_usd value from the Global 
         Health Expenditure Database. This gives us an idea of how much money the selected country theoretically
         has to spend on each individual residing there. Since it is calculated in USD, it makes it easy for us
         to compare the rates for each country, and also to understand each rate in a way that is familiar to us.
         This graph shows how the expenditures per capita in in various countries has shifted over time. We can utilize
         this information in order to ask further questions about the priorities and financial wellbeing of each
         country."),
      br()
    )
  )
)

page_three <- tabPanel(
  "Health Coverage"
)

page_four <- tabPanel(
  "Resource Page"
)

ui <- navbarPage(theme = shinytheme("cyborg"),
                    "Health Insurance Coverage: A Global Analysis",
                    page_one,
                    page_two,
                    page_three,
                    page_four
)