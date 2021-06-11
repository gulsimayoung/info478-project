# Final Deliverable UI
library(shiny)
library(plotly)

page_one <- tabPanel(
  "Introduction",
  p("Health insurance in the United States is complicated and not 
    very user-friendly.  With this website, we hope to present 
    information in an accessible way in order to highlight certain 
    trends in U.S. health insurance and how it differs from the 
    system in other countries.  The Health Expenditure tab focuses on
    presenting trends across the globe in how much funding is allocated
    to healthcare.  This provides global context for the U.S. system and 
    numbers.  The Health Coverage tab goes into more depth on the trends 
    that are seen within the United States relating to health insurance. 
    In presenting this information, our goal is to 
    increase understanding of how the U.S. healthcare system works and what
    some of its flaws are. Finally, the Resources tab connects users to
    information and services to help them find new or improved healthcare 
    coverage in the United States.  Being covered by a health insurance
    plan makes navigating the healthcare system more manageable.")
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
  "Health Coverage",
  sidebarLayout(
    sidebarPanel(
      h6("Select States"),
      selectInput(
        inputId = "state_1",
        label = "State 1:",
        choices = c(us_states)
      ),
      selectInput(
        inputId = "state_2",
        label = "State 2:",
        choices = c(us_states)
      ),
      selectInput(
        inputId = "state_3",
        label = "State 3:",
        choices = c(us_states)
      ),
      selectInput(
        inputId = "state_4",
        label = "State 4:",
        choices = c(us_states)
      )
    ),
    mainPanel(
      plotlyOutput("uninsurance"),
      h6("In order to evaluate how effective the U.S. health insurance system
         is, one variable we can look at is the uninsurance rate. The 
         uninsurance rate is the percentage of residents in a certain 
         area who are not covered by health insurance (government or private).
         Here, we have data on uninsurance rate before the Affordable Care
         Act (in 2010), and after the Affordable Care Act went into effect
         (in 2015).  By comparing these years, we can see how uninsurance
         rates changed and determine the role the ACA played in these 
         changes. You can use the drop-down boxes to select which four states
         to compare to the United States average."),
      br(),
      plotlyOutput("medicaid_bar"),
      h6("As part of the Affordable Care Act, the eligibility criteria 
      for Medicaid were expanded to include more people.  Each state 
      could decide whether to expand Medicaid for its residents, with 
      the federal government supplying some to all of the funding for 
      this expansion for a period of a several years.  Ultimately, 
      some states expanded Medicaid, while other states did not."),
      h6("Above, we compare the percentage of residents without 
      health insurance coverage in states that did expand 
      Medicaid and states that did not.  We can see that 
      in states which opted to increase Medicaid eligibility
      criteria, less people ended up being uninsured, possibly
      because they were able to be covered by Medicaid."),
      br(),
     plotlyOutput("map1"), 
     plotlyOutput("map2"),
      h6("Here, we have created maps of the breakdown of uninsurance rate (in 2015)
         and decision to expand Medicaid by state. On the left, each state
         is colored according to the percentage of its residents that were
         uninsured in 2015.  On the right, each state is colored by whether 
         Medicaid was expanded or not. We can see there is some relation 
         between the states with higher uninsurance rates and the states that
         did not expand Medicaid eligibility. You can roll over each state 
         with the cursor to see it's exact uninsurance or Medicaid expansion 
         details."),
    )
  )
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