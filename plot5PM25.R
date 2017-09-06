# Question 5:
# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

> BaltimoreCityMV <- subset(NEI, fips == "24510" & type=="ON-ROAD")
> BaltimoreMVPM25ByYear <- ddply(BaltimoreCityMV, .(year), function(x) sum(x$Emissions))
> colnames(BaltimoreMVPM25ByYear)[2] <- "Emissions"
> qplot(year, Emissions, data=BaltimoreMVPM25ByYear, geom="line") + ggtitle(expression("Baltimore City" ~ PM[2.5] ~ "Motor Vehicle Emissions by Year")) + xlab("Year") + ylab(expression("Total" ~ PM[2.5] ~ "Emissions (tons)"))
> dev.copy(png, file = "plot4PM25.png")

> dev.off()

> 