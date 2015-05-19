Stock Forecast miniApp Presentation
========================================================
author: 
date: Tue May 19 20:48:09 2015
transition: rotate


The App!
========================================================

![alt text](appscreenshot.png)

Historical View
========================================================

```
time series starts 2012-01-03
time series ends   2015-05-18
```

![plot of chunk unnamed-chunk-1](Stock Forecast Presentation-figure/unnamed-chunk-1.png) 
***
- The financial information is taken from yahoo. 
- Where missing values existed in the data they have been replaced with the most recent existing price.

Forecast View
========================================================

![plot of chunk unnamed-chunk-2](Stock Forecast Presentation-figure/unnamed-chunk-2.png) 
***
The forecast view is constructed using the `auto.arima()` function which selects the best autoregressive integrated moving average (ARIMA) model to the timeseries

Timeseries Decomposition
========================================================

![plot of chunk unnamed-chunk-3](Stock Forecast Presentation-figure/unnamed-chunk-3.png) 
***
- The time series decomposition shows the data broken down into 3 seperate components: Seasonal, trend and irregular using moving averages.
- The time series decomposition requires at least 3 years worth of data to calculate. 
