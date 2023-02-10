#qualitative test for normality
#visualize distribution using density plot
ggplot(mtcars,aes(x=wt)) + geom_density()
#?shapiro.test()
shapiro.test(mtcars$wt)

#practice random sampling
#import used car data set
population_table <- read.csv('used_car_data.csv', check.names = F,stringsAsFactors =  F)
# import data set into ggplot2
plt <- ggplot(population_table,aes(x=log10(Miles_Driven)))
#volatilize distribution using density plot
plt + geom_density()

#randomly sample 50 data points
sample_table <- population_table %>% sample_n(50)
#import data set into ggplot2
plt <- ggplot(sample_table,aes(x=log10(Miles_Driven)))
#visualize distribution using density plot
plt + geom_density()


# T test
#compare sample versus population means
t.test(log10(sample_table$Miles_Driven),mu=mean(log10(population_table$Miles_Driven)))


# Two Sample T-Test
#generate 50 randomly sampled data points
sample_table <- population_table %>% sample_n(50)
sample_table2 <- population_table %>% sample_n(50)
#compare means of two samples
t.test(log10(sample_table$Miles_Driven),log10(sample_table2$Miles_Driven))

#Paired t test
#import data set
mpg_data <- read.csv('mpg_modified.csv')
#select only data points where the year is 1999
mpg_1999 <- mpg_data %>% filter(year==1999)
mpg_2008 <- mpg_data %>% filter(year==2008)
#compare the mean difference between two samples
t.test(mpg_1999$hwy,mpg_2008$hwy,paired = T)

#aov
#filter columns form mtcars data set
mtcars_filt <- mtcars[,c("hp","cyl")]
#convert numeric column to factor
mtcars_filt$cyl <- factor(mtcars_filt$cyl)
#compare means across multiple levels using aov
aov(hp ~ cyl,data=mtcars_filt)
summary(aov(hp ~ cyl,data=mtcars_filt))

#cor() function
head(mtcars)

#import data set into ggplot2
plt <- ggplot(mtcars,aes(x=hp,y=qsec))
#create scatter plot
plt + geom_point()
#calculate correlation coefficient
cor(mtcars$hp,mtcars$qsec)

#Example2, read in data set
used_cars <- read.csv('used_car_data.csv',stringsAsFactors = F)
head(used_cars)

#import data into ggplot to see if miles driven and selling price correlate
plt <- ggplot(used_cars,aes(x=Miles_Driven,y=Selling_Price))
#create a scatter plot
plt + geom_point()
#calculate correlation coefficient
cor(used_cars$Miles_Driven,used_cars$Selling_Price)

#convert data frame into numeric matrix
used_matrix <- as.matrix(used_cars[,c("Selling_Price","Present_Price","Miles_Driven")])
cor(used_matrix)

#create linear model
lm(qsec ~ hp,mtcars)

#summarize linear model
summary(lm(qsec~hp,mtcars))

#visualize line plot with linear model
#create linear model
model <- lm(qsec ~ hp,mtcars)
#determine y-axis values from linear model
yvals <- model$coefficients['hp']*mtcars$hp +
  model$coefficients['(Intercept)']
#plot with import data to ggplot
plt <- ggplot(mtcars,aes(x=hp,y=qsec))
#plot scatter and linear model
plt + geom_point() + geom_line(aes(y=yvals), color = "red")

#Multiple linear regression plotting
#generate multiple lr model
lm(qsec ~ mpg + disp + drat + wt + hp,data=mtcars)

#generate summary statistics
summary(lm(qsec ~ mpg + disp + drat + wt + hp,data=mtcars))

#Contingency Table
#generate contingency table
table(mpg$class,mpg$year)

#pass contingency table to chis1.test() function
#generate contingency table
tbl <- table(mpg$class,mpg$year)
#compare categorical distributions
chisq.test(tbl)