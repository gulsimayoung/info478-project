# Final Deliverable UI
library(shiny)
library(plotly)

page_one <- tabPanel(
  "Introduction",
  h6("Health insurance in the United States is complicated and not 
    very user-friendly.  With this website, we hope to present 
    information in an accessible way in order to highlight certain 
    trends in U.S. health insurance and how it differs from the 
    system in other countries."),
  br(),
  h6("The Health Expenditure tab focuses on presenting trends across the
  globe in how much funding is allocated to healthcare. This provides global 
  context for the U.S. system and numbers. The Health Coverage tab goes into 
  more depth on the trends that are seen within the United States relating to
  health insurance. In presenting information about Health Expenditure and Health Coverage, we hope
  to inform those who interact with our project of how the U.S. healthcare and health
  insurance system works and what some of its major flaws are."),
  br(),
  h6("Finally, the Resources tab connects users to information and services to help them 
  find new or improved health insurance in the United States. It informs users of their
  healthcare rights, and helps them to learn more about health expenditure and coverage."),
  br(),
  br(),
  h4("Supplemental Videos"),
  h6("The following videos were helpful to us in understanding United States healthcare
     and health insurance system and flaws. These videos helped us to craft pieces of inquiry
     that allowed us to create visualizations that were informative and relevant to our
     project's purpose. We highly recommend watching these!"),
  tags$iframe(
    width = "560", height = "315", src = "https://www.youtube.com/embed/It4vfw85P8g",
    frameborder = "0", allow = "accelerometer; autoplay; encrypted-media; gyroscope; 
                             picture-in-picture", allowfullscreen = NA
  ),
  br(),
  tags$iframe(
    width = "560", height = "315", src = "https://www.youtube.com/embed/57uCe4AkHsM",
    frameborder = "0", allow = "accelerometer; autoplay; encrypted-media; gyroscope; 
                             picture-in-picture", allowfullscreen = NA
  ),
  br(),
  tags$iframe(
    width = "560", height = "315", src = "https://www.youtube.com/embed/KriEIJ0ubh0",
    frameborder = "0", allow = "accelerometer; autoplay; encrypted-media; gyroscope; 
                             picture-in-picture", allowfullscreen = NA
  ),
  br()
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
      public health. We were particularly surprised at how high the CHE%GDP in the United States was when
         compared to other countries. We found this especially interesting when thinking about our personal
         interactions with attempting to get healthcare coverage in the US."),
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
         In the United States, we noticed that this metric has been on a steady increase throughout time, following a trajectory
         that would suggest that more has been invested in healthcare in the US over time. This is especially outlined by the
         next chart that you will interact with, as the significant amount that the US spends on healthcare should theoretically
         be more than enough to support its citizens. Overall, we can utilize this visualization in order to ask further questions 
         about the priorities, systems of healthcare, and financial wellbeing ofvarious countries."),
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
  "Resource Page",
  br(),
  h6("We felt that it was necessary that as a part of this project, we include a public resource
     page that could help individuals to learn more about health expenditure in the United States,
     find a viable health insurance plan, and understand their US healthcare rights. Feel free to
     click through these if you have more questions, are interested in learning more about the topic,
     or are looking for health insurance coverage!"),
  br(),
  h4("Finding Health Insurance"),
  h6("Find out if you're eligible for free health insurance - King County"),
  h6("https://kingcounty.gov/depts/health/locations/health-insurance/coverage/eligibility.aspx"),
  br(),
  h6("Medicaid & CHIP coverage - HealthCare.gov"),
  h6("https://www.healthcare.gov/medicaid-chip/getting-medicaid-chip/"),
  br(),
  h6("Health coverage options if you’re unemployed - HealthCare.gov"),
  h6("https://www.healthcare.gov/unemployed/coverage/"),
  br(),
  h6("Finding Health Insurance - usa.gov"),
  h6("https://www.usa.gov/finding-health-insurance"),
  br(),
  h6("Washington Health Plan Finder"),
  h6("https://www.wahealthplanfinder.org/"),
  br(),
  h4("Your Healthcare Rights in the United States"),
  h6("Health Care As a Human Right - American Bar Association"),
  h6("https://www.americanbar.org/groups/crsj/publications/human_rights_magazine_home/the-state-of-healthcare-in-the-united-states/health-care-as-a-human-right/#:~:text=In%20the%20United%20States%2C%20we,only%20a%20health%20insurance%20system.&text=The%20right%20to%20health%20care%20has%20long%20been%20recognized%20internationally."),
  br(),
  h6("What are my health care rights and responsibilities? - HHS.gov"),
  h6("https://www.hhs.gov/answers/health-insurance-reform/what-are-my-health-care-rights/index.html"),
  br(),
  h6("Rights and Protections - HealthCare.gov"),
  h6("https://www.healthcare.gov/health-care-law-protections/rights-and-protections/"),
  br(),
  h6("Laws Related to Health Insurance - Small Business Majority"),
  h6("https://healthcoverageguide.org/reference-guide/laws-and-rights/laws-related-to-health-insurance/"),
  br(),
  h4("Health Expenditure in the United States"),
  h6("Health Expenditures - Center for Disease Control and Prevention"),
  h6("https://www.cdc.gov/nchs/fastats/health-expenditures.htm"),
  br(),
  h6("How has U.S. spending on healthcare changed over time? - Peterson-KFF Health System Tracker"),
  h6("https://www.healthsystemtracker.org/chart-collection/u-s-spending-healthcare-changed-time/"),
  br(),
  h6("Trends in healthcare spending - American Medical Association"),
  h6("https://www.ama-assn.org/about/research/trends-health-care-spending"),
  br(),
  h6("A dozen facts about the economics of the US health-care system - Brookings"),
  h6("https://www.brookings.edu/research/a-dozen-facts-about-the-economics-of-the-u-s-health-care-system/"),
  br(),
  h6("U.S. Health Care from a Global Perspective - The Commonwealth Fund"),
  h6("https://www.brookings.edu/research/a-dozen-facts-about-the-economics-of-the-u-s-health-care-system/"),
  br()
)

ui <- navbarPage(
  theme = shinytheme("cyborg"),
  "Health Insurance Coverage: A Global Analysis",
  page_one,
  page_two,
  page_three,
  page_four
)
