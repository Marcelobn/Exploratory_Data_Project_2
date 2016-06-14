#####Reading the data############

NEI <- readRDS("summarySCC_PM25.rds")

SCC <- readRDS("Source_Classification_Code.rds")

######Obtaining the Total for Baltimore
total_Baltimore <- subset(NEI, fips == "24510")
total_Baltimore <- tapply(total_Baltimore$Emissions, total_Baltimore$year, sum)


#########Generating the Graph
png('plot2.png')
barplot(total_Baltimore, main = expression(paste("Total Baltimore ", PM[2.5], " Emissions by Year")), ylab="Total Emissions")
dev.off()

