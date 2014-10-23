---
title       : Introducing sleep-app
subtitle    : A shiny app for exploring relationships among sleep needs and trophic level in mammals
author      : 
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : zenburn      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides

---.class #id 
## Introduction to ```sleepy-app```
<font size=4>
The app <a href:"http://www......">sleepy-app</a> allows the user to explore the sleep requirements for four mammalian "feeding groups":  omnivores, carnivores, herbivores, and insectivores). When a feeding group is selected, the app automatically produces a scatterplot showing the relationship between body mass and sleep needs for the selected group, overlays a smoothed linear fit on the plot, and displays the best-fit linear regression model with body weight as the predictor and hours of sleep per day as the outcome.
</font>

<font size=4>
The app makes use of the ```msleep``` dataset available in the ```ggplot2```package. 
The ```msleep``` dataset contains sleep information for 83 mammal species. Omnivore, carnivore, herbivore, and insectivore species are all represented, along with seven mammal species of Order Rodentia, Hyracoidea, Diprodontia, and Erinaceomorpha that are not classified in one of these four feeding groups. A sample of the ```msleep``` data is shown below:
</font>


```
##      name              vore    order       sleep 
## [1,] "Cheetah"         "carni" "Carnivora" "12.1"
## [2,] "Owl monkey"      "omni"  "Primates"  "17"  
## [3,] "Mountain beaver" "herbi" "Rodentia"  "14.4"
```

--- .class #id 
## Exploring the ```msleep``` dataset



<font size=4>
Exploratory analysis of ```msleep``` reveals that, for omnivores, herbivores, carnivores, and insectivores, there seems to be a negative linear correlation between log<sub>10</sub>animal body weight (kg) and the hours of sleep per day the animal needs; that is, the larger the animal, the less sleep it needs. This is illustrated by the following plot:
</font size>


![plot of chunk unnamed-chunk-3](assets/fig/unnamed-chunk-3-1.png) 

<font size=4>
However, because there is so much overlap among the different mammal groups as regards body size, the relationship between body size and sleep requirements would be better visualized using a dynamic plot:  such as ```sleepy-app```.
</font>

--- 
## Using ```sleepy-app```: required input
<font size=3>
First, choose the mammal type (carnivore, omnivore, herbivore, or insectivore) you would like to analyze by selecting a radio button in the upper left. Only one mammal type may be analyzed at a time.
</font>

<font size=3>
After the mammal type is input, the app returns the list of the mammal orders to which the species being analyzed belong (e.g. Carnivora, Primates, Rodentia, and so on).
In addition, for the selected mammal type, the app creates a scatterplot of log<sub>10</sub> body size and sleep needs, overlays a smoothed linear fit on the plot, and displays the best-fit linear regression model for these data (predictor=body weight; outcome=hours of sleep per day). An example is shown below:
</font>

<font size=2>
<center>
<b>Total Daily Sleep (Hours) vs. Log<sub>10</sub> Body Weight (kg) for Mammalian Carnivores</b>
</center>
</font>


<img src="assets/fig/unnamed-chunk-5-1.png" title="plot of chunk unnamed-chunk-5" alt="plot of chunk unnamed-chunk-5" style="display: block; margin: auto;" />


---
## Insights on animal sleep habits from ```sleepy-app```
<font size=4>
While the static plot in Slide 2 shows that, in general, larger mammals of each
feeding type need less sleep than mammals of the same feeding type, this relationship is much easier to see using the dynamic scatterplots in ```sleepy-app```. 
</font>

<font size=4>
Other, fundamental features of the ```msleep``` dataset are much easier to see using ```sleepy-app``` than a static plot. Specifically, the app underscores the fact that carnivores, in general, tend to have smaller body size, and smaller variance in body size, than herbivores do. 
</font>

<font size=4>
Fascinatingly, the dynamic scatterplot in ```sleepy-app``` also makes it easy to detect unexpected features of the data. For example, there is little variation in the sleep requirements for omnivores across body sizes; the regression line fit to the omnivore data is much shallower than the regression line for carnivores, herbivores, or insectivores. 
</font>

