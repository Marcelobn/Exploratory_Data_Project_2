#####Reading the data############

NEI <- readRDS("summarySCC_PM25.rds")

SCC <- readRDS("Source_Classification_Code.rds")

########Loading the Libraries########
library(ggplot2)
library(dplyr)

###########Subsetting Baltimore Data########


Baltimore_data <- subset(mydata, fips == "24510")

##Grouping and Summing

Baltimore_Grouped <- Baltimore_data %>% group_by(type, year) %>% summarise(Emissions = sum(Emissions))

######Generating the plot#####
png('plot3.png')
qplot(year, Emissions, data = Baltimore_Grouped, facets = .~type)
dev.off()
