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
        value = 2009
      )
    ),
    mainPanel(
      plotlyOutput("chart"),
      br(),
      h6("The CHE%GDP metric stands for Current Health Expenditure (CHE) as percentage 
      of Gross Domestic Product (GDP) (%). This is often referred to as the CHE%GDP. 
      CHE stands for Current Health Expenditure, which explains how much a country is spending
      on health-related expenditures. GDP stands for Gross Domestic Product, which gives us an
      idea of a country's wealth and financial status."),
      br(),
      h6("When we measure the CHE  as a percent of a country’s overall GDP, we are able to learn
      how much money the country is actively allocating towards health related funding 
      and costs. Overall, this gives us a sense of how various countries prioritize 
      public health."),
      br()
    )
  ),
    
  # h4("Comparing current health expenditures per capita in USD")
  sidebarLayout(
    sidebarPanel(
      h6("Choose a country and a start year below to evaluate its health expenditures per capita over time."),
      selectInput(
        inputId = "country_3",
        label = "Country:",
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
      h6("The che_pc_usd value from the Global Health Expenditure Database informs us of the current health-related
      expenditures per capita in USD. Metrics that utilize the per capita measurement tell us how much of a unit there is
      relative to the total number of individuals in a certain group. In this situation for example, the Current Health
      Expenditure per Capita tells us the amount of money that a specific country has allocated towards healthcare when
      split across every individual who resides there. This gives us an idea of how much money the selected country 
      theoretically has to spend on each person. Since it is calculated in USD, it makes it easy for us
         to compare the rates for each country, and also to understand each rate in a way that is familiar to us."),
      br(),
      h6("This graph shows how the expenditures per capita in in various countries has shifted over time. For some countries
         the CHE per capita has skyrocketed over time, while in other countries this metric has seen a steady decrease.
         We can utilize this information in order to ask further questions about the priorities and financial wellbeing 
         of each country."),
      br()
    )
  ),
  
  sidebarLayout(
    sidebarPanel(
      h6("Choose a country and a year below to compare the CHE per capita to the CHE per capita in the United States of America."),
      selectInput(
        inputId = "country_4",
        label = "Country:",
        choices = c(unique_countries)
      ),
      sliderInput(
        inputId = "year_3",
        label = "Year:",
        min = 2000,
        max = 2018,
        value = 2009
      )
    ),
    mainPanel(
      plotlyOutput("chart3"),
      br(),
      h6("The direct comparison of the CHE per capita in USD between the United States of America and other
         countries helps us to understand how the amount of health-related funding that the US has to spend
         on each resident compares to the funding for each individual in other countries."),
      br(),
         h6("When clicking through the various countries, it becomes evident that the CHE per capita in the
         US is much higher than that of most other countries. This communicates to us that the healthcare
         system in our country should be functioning in a way that is able to support every individual.
         However, we know that this is far from the case. Although the United States allocates a substantial
         amount of money to healthcare every year, healthcare remains disproportionately expensive. It costs
         a significant amount of money to go to the Emergency Room, pay for medicine, and go to a yearly
         doctor's appointment, especially without adequate health insurance coverage."),
         br(),
         h6("If you haven't already, choose Canada as the comparison country above. You'll notice that the 
         CHE per capita is quite a bit higher than a lot of other countries, but it is still only have of 
         the United States of America's CHE per capita. This is especially interesting because Canada has 
         implemented a universal health care system, so according to this chart, it seems that the US
         should be able to as well. This relationship supports further inquiry into the true distribution of
         health expenditures in the US, and helps us to further recognize that there are major flaws in the
         healthcare system in our country."),
      br()
    )
  )
)

page_three <- tabPanel(
  "Health Coverage"
)

page_four <- tabPanel(
  "Resource Page",
  br(),
  h6("We felt that it was necessary that as a part of this project, we include a public resource
     page that could help individuals to learn more about health expenditure in the United States,
     find a viable health insurance plan, and understand their US healthcare rights."),
  br(),
  h5("Health Expenditure in the United States"),
  h6(""),
  br(),
  h5("Finding Health Insurance"),
  h6(""),
  br(),
  h5("Your Healthcare Rights in the United States"),
  h6(""),
  br()
)

ui <- navbarPage(theme = shinytheme("cyborg"),
                    "Health Insurance Coverage: A Global Analysis",
                    page_one,
                    page_two,
                    page_three,
                    page_four
)