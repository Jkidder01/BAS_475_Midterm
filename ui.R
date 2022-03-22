dashboardPage(
  dashboardHeader(title = "Milk Production"),
  
  dashboardSidebar(
    sidebarMenu(
      menuItem("How to Use", tabName = "tab_1"),
      menuItem("Base Time Series", tabName = "tab_2", icon = icon("dashboard")),
      menuItem("Further Analysis", tabName = "tab_3", icon = icon("th")),
      menuItem("Even Further Analysis", tabName = "tab_4", icon = icon("th")),
      menuItem("Surprise", tabName = "tab_5")
    )
  ),
  
  dashboardBody(
    tabItems(
      tabItem(tabName = "tab_1",
              fluidPage(
                titlePanel("How to Use the Following ShinyApp"),
                mainPanel(
                  h4("The following ShinyApp will allow you to analyze the time-ordered dataset Milk"),
                  h4("- Upon navigating to the 'Base Time Series' tab you will be presented with a time series showing the Average Volume of Milk Produced since Jan1995"),
                  h4("- Upon navigating to the 'Further Analysis' tab you will be asked to choose your desired time-series analysis"),
                  h4("Seasonality will produce a seasonal time series plot"),
                  h4("AutoCorrelation will produce a lag plot of our dataset"),
                  h4("Decomposition will break down our time series into its seasonal, trend, and irregular components")
                )
              )
      ),
      tabItem(tabName = "tab_2",
              fluidRow(
                box(
                  selectInput("Dairy", label = h3("Select box"), 
                              choices = c("Cotagecheese.Prod",
                                             "Icecream.Prod", "Milk.Prod"))
                ),
                
                box(plotOutput('MilkTS'))
)
      ),
      
      tabItem(tabName = "tab_3",
                 fluidRow(
                   
                   box(  selectInput("plot_type", label = h3("Select Desired Analysis"), 
                                     choices = list("Seasonality" = 1, "AutoCorrelation" = 2, "Decomposition" = 3), 
                                     selected = 1)
                         ),
                   
                   box(plotOutput('anaplot')),
                   
                   box(uiOutput('analysis')

                   
      )
)
      ),

tabItem(tabName = "tab_4",
        fluidRow(
          box(plotOutput('Forecast'))
        )
        ),

tabItem(tabName = "tab_5",
        fluidRow(
          box(img(src="Cow.gif", height = 500, width = 600))
        )
        )
                 
)
)
)

