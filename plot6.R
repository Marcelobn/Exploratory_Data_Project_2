#####Reading the data############

NEI <- readRDS("summarySCC_PM25.rds")

SCC <- readRDS("Source_Classification_Code.rds")


########Subsetting According to the City##########
Baltimore_data <- subset(NEI, fips == "24510")
LA_data <- subset(NEI, fips = "06037")

######Determining Vehicle Sources#########
veh <- SCC[grepl("Vehicles", SCC$EI.Sector),]
veh_SCC <- veh$SCC

#########Getting City Totals##########
#Baltimore
Baltimore_veh_df <- subset(Baltimore_data, SCC %in% veh_SCC)
Baltimore_total_veh <- Baltimore_veh_df %>% group_by(year) %>% summarise(Emissions = sum(Emissions))

#LA
LA_veh_df <- subset(LA_data, SCC %in% veh_SCC)
LA_veh_total <- LA_veh_df %>% group_by(year) %>% summarise(Emissions = sum(Emissions)) 

#Normalizing the data. This will make the comparison between the cities easier
Baltimore_total_veh$N_Emissions <- scale(Baltimore_total_veh$Emissions)
LA_veh_total$N_Emissions <- scale(LA_veh_total$Emissions)

##########Generating the Plot###########
png('plot6.png')
par(mfrow = c(2,1))
plot(Baltimore_total_veh$year, Baltimore_total_veh$N_Emissions, ylim = c(-1.5,1.5), main = "Baltimore Total Emissions (Normalized)", ylab = "Normalized Emissions", xlab = "Year")
abline(h = 0, lty = 2)
plot(LA_veh_total$year, LA_veh_total$N_Emissions, ylim = c(-1.5,1.5), main = "LA Total Emissions (Normalized)" , ylab = "Normalized Emissions", xlab = "Year")
abline(h=0, lty =2)
dev.off()
