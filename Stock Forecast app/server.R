# server.R

library(quantmod)
library(forecast)
library(tseries)


shinyServer(function(input, output) {
  
  Price <- reactive({  
    prices<-get.hist.quote(input$symb, quote="Adj",
                   provider = "yahoo", start=input$dates[1],
                   end=input$dates[2], retclass="zoo")
    na.locf(prices)
    
  })
  
  
  output$docMainTitle <- renderText({
        "Stock Forecast App"
  }) 
  output$docMainText <- renderUI({
        HTML("This App allows the user to choose and examine a stock over a selected historical
             & forecast time periods.</p>
            Predicting the stock market is an area that recieves a lot of attention
            - as being able to do so results in huge financial gain. This app demonstrates
            the ease with which a forecast of future movement based (solely) on past movements
            can be made. It is not intended for investment support. 
            ")

  })
  
  
  output$docInputsTitle <- renderText({
        "Inputs"
  }) 
  output$docInputsText <- renderUI({
        HTML(" There are three user inputs all available in the sidebar.
            <ol>
             <li><b>Stock Symbol-</b> Enter the Yahoo stock symbol to investigate (defaults to Nasdaq) </li>
             <li><b>Date Range -</b> Select the start and end dates for investigation. For Time Series
                  Decomposition to be available at least 3 years of data are required. Please note that 
                  availability of data is dependent on Yahoo. </li>
             <li><b>Days to forecast ahead -</b> Enter the number of days into the future you would like to forecast</li>
             </ol>")
  })
  output$docViewsTitle <- renderText({
        "Views"
  }) 
  output$docViewsText <- renderUI({
        HTML(" There are three views available, each on a seperate tab
            <ol>
             <li><b>Historical Plot -</b> The historical prices for the selected stock over the chosen period</li>
             <li><b>Forecast Plot -</b> This veiw shows both the historical prices & the forecast prices</li>
             <li><b>Timeseries Decomposition -</b> This view shows the observed prices, trend seasonal & random components of the price movements</li>
             </ol>")
  })
  
  output$plot <- renderPlot({
    plot(Price())
  })
  
  output$plot2 <- renderPlot({
    fit <- auto.arima(Price())
    plot(forecast(fit, h=input$ahead))
  })
  
  output$plot3 <- renderPlot({
    p_ts <- ts(Price(), frequency=365)
    decomp <- decompose(p_ts)
    plot(decomp)
  })
  
})
