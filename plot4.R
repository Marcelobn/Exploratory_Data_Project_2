#####Reading the data############

NEI <- readRDS("summarySCC_PM25.rds")

SCC <- readRDS("Source_Classification_Code.rds")

######Determining the Coal Sources######

coals <- SCC[grepl("Coal", SCC$EI.Sector),]

coals_SCC <- coals$SCC

coal_DF <- subset(NEI, SCC %in% coals_SCC)

####Adding Emissions#########
total_coal <- tapply(coal_DF$Emissions, coal_DF$year, sum)

####Generating the Plot
png('plot4.png')
barplot(total_coal3, main = "Coal Combustion Emissions, US 1999-2008" , ylab="Total Coal Combustion Emissions")
dev.off()
