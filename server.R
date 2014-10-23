##server.R for courseProject
library(datasets)
library(ggplot2)

#load the sleep dataset.
data(msleep)
#convert the vore var from factor to character
msleep$vore<-as.character(unlist(msleep$vore))
#get rid of the vore values of NA.
msleep<-msleep[!(msleep$vore %in% NA), ]
#####The preceding lines should be kept OUT of shinyServer function because they
#####only need to be called once, when the app is launched.

shinyServer(
      function(input, output) {
            #display radio buttons for the animal "feeding" types (=vore).
            #We want to ensure that only one feeding type can be chosen at a time.
            output$value<-renderPrint({ input$radio })     
            
            output$animalPlot<-renderPlot({  
                  data<-switch(input$radio,
                               "Carnivore"=(msleep[msleep$vore=="carni", ]),
                               "Herbivore"=(msleep[msleep$vore=="herbi", ]),
                               "Insectivore"=(msleep[msleep$vore=="insecti", ]),
                               "Omnivore"=(msleep[msleep$vore=="omni", ]))
        
                  p<-ggplot(data, aes(log10(bodywt), sleep_total))+
                        geom_point()+
                        stat_smooth(method="lm")+
                        ylab("Total Hours of Sleep Per Day")+
                        xlab("Log10 Body Weight (kg)")+
                        ylim(-5, 30)+
                        xlim(-3, 4)+
                        theme_bw()+
                        theme(text = element_text(size=20))
                  print(p)
                  
                  fit<-lm(sleep_total~log10(bodywt), data)
                 
                  output$equation<-renderText({paste(round(fit$coeff[2],2)," * Log10(BodyWeight) + ", round(fit$coeff[1], 2))})
                  output$animalOrders<-renderText({unique(data$order)})
            })
                         
      } 
)