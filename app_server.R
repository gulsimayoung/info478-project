# Final deliverable server

unique_countries <- unique(GHED_data$country)

server <- function(input, output) {
  output$chart <- renderPlotly({
    country_data <- GHED_data %>%
      filter(country == input$country_1 | country == input$country_2) %>%
      filter(year == input$year)
    
    GHED_data_che_gdp <- country_data %>%
       summarize(country, year, che_gdp, .groups = "drop")
    
    p <- ggplot(GHED_data_che_gdp) +
      geom_bar(stat='identity', fill = "cornflowerblue",
               mapping = aes(x = country, y = che_gdp)) +
      labs(
        title = "Comparing CHE%GDP Between Countries",
        subtitle = "",
        x = "Country",
        y = "CHE%GDP"
      )
    ggplotly(p)
  })
  
  output$chart2 <- renderPlotly({
    country_data <- GHED_data %>%
      filter(country == input$country_3)
    
    GHED_data_che_gdp <- country_data %>%
      summarize(country, year, che_pc_usd, .groups = "drop")
    
    p <- ggplot(GHED_data_che_gdp) +
      scale_x_continuous(limits = c(input$year_2, 2018)) +
      geom_smooth(mapping = aes(x = year, y = che_pc_usd)) +
      labs(
        title = "Comparing Health Expenditures per Capita",
        x = "Year",
        y = "Rate",
        color = "Country"
      )
    ggplotly(p)
  })
}