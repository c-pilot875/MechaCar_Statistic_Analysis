#import dplyr
library(dplyr)
#load and read csv file
mecha_mpg_df <- read.csv(file='MechaCar_mpg.csv',check.names = F,stringsAsFactors =  F)
#check columns
head(mecha_mpg_df)
#perform linear regression
#create multiple linear model
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = mecha_mpg_df)

#summarize linear model
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = mecha_mpg_df))

#Suspension Coil Analysis
#read csv file to df
suspencion_coil_df <- read.csv(file='Suspension_Coil.csv', check.names = F, stringsAsFactors = F)
head(suspencion_coil_df)
#create summary df
total_summary <- suspencion_coil_df %>% 
  summarize(Mean= mean(PSI), 
            Median = median(PSI), 
            Variance = var(PSI), 
            SD = sd(PSI))
#create summaries of each lot
lot_sum <- suspencion_coil_df %>% group_by(Manufacturing_Lot) %>% 
  summarize(Mean= mean(PSI),
            Median = median(PSI),
            Variance = var(PSI),
            SD = sd(PSI), .groups = 'keep')

# T Test on suspension coils
t.test(suspencion_coil_df$PSI, mu=1500)

t.test(subset(suspencion_coil_df,Manufacturing_Lot == "Lot1")$PSI, mu=1500)
t.test(subset(suspencion_coil_df,Manufacturing_Lot == "Lot2")$PSI, mu=1500)
t.test(subset(suspencion_coil_df,Manufacturing_Lot == "Lot3")$PSI, mu=1500)
