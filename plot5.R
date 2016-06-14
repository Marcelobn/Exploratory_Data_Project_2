#####Reading the data############

NEI <- readRDS("summarySCC_PM25.rds")

SCC <- readRDS("Source_Classification_Code.rds")

###########Subsetting Baltimore Data########

Baltimore_data <- subset(mydata, fips == "24510")

######Determining the Vehicle Sources#####

veh <- SCC[grepl("Vehicles", SCC$EI.Sector),]
veh_SCC <- veh$SCC
veh_df <- subset(Baltimore_data, SCC %in% veh_SCC)

total_veh_Baltimore <- tapply(veh_df$Emissions, veh_df$year, sum)

#########Generating the Plot##################
png('plot5.png')
barplot(total_veh_Baltimore, main = "Motor Vehicle Emissions, Baltimore 1999-2008", ylab = "Total Motor Vehicle Emissions")
dev.off()
