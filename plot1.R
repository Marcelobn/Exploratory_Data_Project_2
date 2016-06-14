#####Reading the data############

NEI <- readRDS("summarySCC_PM25.rds")

SCC <- readRDS("Source_Classification_Code.rds")

####Obtaining the Totals########### 

total_by_year <- tapply(NEI$Emissions, NEI$year, sum  )

######Generating the graph########
png('plot1.png')
barplot(total_by_year, main = expression(paste("Total ", PM[2.5], " Emissions by Year")), ylab="Total Emissions", col = "Grey")
dev.off()
