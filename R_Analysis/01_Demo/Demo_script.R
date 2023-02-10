# Import the json lite library
library(jsonlite)
#?from JSON()

#Create  a table from the JSON data set
demo_table2 <- fromJSON(txt='demo.json')

#Filter the table by price
filter_table <- demo_table2[demo_table2$price > 10000,]

#?subset()
#Filter the table again 
filter_table2 <- subset(demo_table2, price > 10000 & drive == "4wd" & "clean" %in% title_status)
#?sample()

#Import and read a CSV file
demo_table <- read.csv(file='demo.csv',check.names=F,stringsAsFactors = F)

#Create a numbered row table
num_rows <- 1:nrow(demo_table)
sample_rows <- sample(num_rows, 3)
demo_table[sample_rows,]
demo_table[sample(1:nrow(demo_table), 3),]

#import the tidyverse
library(tidyverse)
?mutate()

# add columns to original data frame
demo_table <- demo_table %>% mutate(Mileage_per_Year=Total_Miles/(2020-Year),IsActive=TRUE)
#Grouping Data create summary table
summarize_demo <- demo_table2 %>% group_by(condition) %>% summarize(Mean_mileage=mean(odometer), .groups = 'keep') 
# create summary table with multiple columns
summarize_demo <- demo_table2 %>% group_by(condition) %>% summarize(Mean_Mileage=mean(odometer),Maximum_Price=max(price),Num_Vehicles=n(), .groups = 'keep')

?gather()
# Read a new data set
demo_table3 <- read.csv('demo2.csv',check.names = F,stringsAsFactors = F)
#Use gather to reshape the data from long to wide or vice versa
long_table <- gather(demo_table3,key="Metric",value="Score",buying_price:popularity)
#Alternative to gather
#long_table <- demo_table3 %>% gather(key="Metric",value="Score",buying_price:popularity)
?spread()
wide_table <- long_table %>% spread(key="Metric",value="Score")
all.equal(demo_table3,wide_table)
?ggplot()
head(mpg)
#import data set into ggplot2
plt <- ggplot(mpg,aes(x=class))

#plot a bar plot
plt + geom_bar()
?geom_bar()

#Create a summary table
mpg_summary <- mpg %>% group_by(manufacturer) %>% summarize(Vehicle_Count=n(), .groups = 'keep')

#import data set into ggplot2
plt <- ggplot(mpg_summary,aes(x=manufacturer,y=Vehicle_Count))

#plot a bar plot
plt + geom_col()

#rotate the x-axis label 45 degrees
plt + geom_col() + xlab("Manufacturing Company") + ylab("Number of Vehicles in Dataset") +
theme(axis.text.x=element_text(angle=45,hjust=1))

#create summary table
mpg_summary <- subset(mpg,manufacturer=="toyota") %>% group_by(cyl) %>% summarize(Mean_Hwy=mean(hwy), .groups = 'keep') 

# import data set into ggplot2
plt <- ggplot(mpg_summary,aes(x=cyl,y=Mean_Hwy))

#add line plot with labels
plt + geom_line() + scale_x_discrete(limits=c(4,6,8)) + scale_y_continuous(breaks = c(16:30))

#import data set into ggplot2 for SCATTER PLOTS
#import data set into ggplot2
plt <- ggplot(mpg,aes(x=displ,y=cty,color=class)) 

#add scatter plot with labels with multiple aesthetics
plt + geom_point() + labs(x="Engine Size (L)", y="City Fuel-Efficiency (MPG)", color="Vehicle Class", shape="Type of Drive")

#create a box plot and import the data
plt <- ggplot(mpg,aes(y=hwy))
# add box plot
plt + geom_boxplot()

#import data set into ggplot for set of boxplots
plt <- ggplot(mpg,aes(x=manufacturer,y=hwy))
#add boxplot and rotate x-axis labels 45 degrees
plt + geom_boxplot() + theme(axis.text.x=element_text(angle=45,hjust=1))

#create HEAT MAP PLOTS
#create a summary table
mpg_summary <- mpg %>% group_by(class,year) %>% summarize(Mean_Hwy=mean(hwy), .groups = 'keep')
plt <- ggplot(mpg_summary, aes(x=class,y=factor(year),fill=Mean_Hwy))
# Create heat map with labels
plt + geom_tile() + labs(x="Vehicle Class",y="Vehicle Year",fill="Mean Highway (MPG)")

#avg difference in each vehicle model
#create summary table
mpg_summary <- mpg %>% group_by(model,year) %>% summarize(Mean_Hwy=mean(hwy), .groups = 'keep')
#import data set into ggplot2
plt <- ggplot(mpg_summary, aes(x=model,y=factor(year),fill=Mean_Hwy)) 
#rotate x-axis labels 90 degrees
plt + geom_tile() + labs(x="Model",y="Vehicle Year",fill="Mean Highway (MPG)") + theme(axis.text.x = element_text(angle=90,hjust=1,vjust=.5))

#Layering
#import data set into ggplot2
plt <- ggplot(mpg,aes(x=manufacturer,y=hwy)) 
#add box plot
plt + geom_boxplot() +
  theme(axis.text.x=element_text(angle=45,hjust=1)) +
  geom_point()

#mapping arguments
#create summary table
mpg_summary <- mpg %>% group_by(class) %>% summarize(Mean_Engine=mean(displ), .groups = 'keep')
#import data set into ggplot2
plt <- ggplot(mpg_summary,aes(x=class,y=Mean_Engine))
#add scatter plot
plt + geom_point(size=4) + labs(x="Vehicle Class",y="Mean Engine Size")

#add error bars
mpg_summary <- mpg %>% group_by(class) %>% summarize(Mean_Engine=mean(displ),SD_Engine=sd(displ), .groups = 'keep')

#import data set into ggplot2
plt <- ggplot(mpg_summary,aes(x=class,y=Mean_Engine))
#add scatter plot with labels
plt + geom_point(size=4) + labs(x="Vehicle Class",y="Mean Engine Size") +
#overlay with error bars
geom_errorbar(aes(ymin=Mean_Engine-SD_Engine,ymax=Mean_Engine+SD_Engine))

#faceting
#convert to long format
mpg_long <- mpg %>% gather(key="MPG_Type",value="Rating",c(cty,hwy))
head(mpg_long)

#different fuel efficiency by manufacturer
#import data set into ggplot2
plt <- ggplot(mpg_long,aes(x=manufacturer,y=Rating,color=MPG_Type))
plt + geom_boxplot() + theme(axis.text.x=element_text(angle=45,hjust=1))

#facet wrap
#import data set to ggplot2
plt <- ggplot(mpg_long,aes(x=manufacturer,y=Rating,color=MPG_Type))
#create multiple box plots, one for each MPG type. rotate and add labels
plt + geom_boxplot() + facet_wrap(vars(MPG_Type)) +
  theme(axis.text.x=element_text(angle=45,hjust=1),legend.position = "none") +
  xlab("Manufacturer")

