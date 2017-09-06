# Question 6:
# Compare emissions from motor vehicle sources in Baltimore City with emissions
# from motor vehicle sources in Los Angeles County, California (fips == 06037).
# Which city has seen greater changes over time in motor vehicle emissions?

> MV <- subset(NEI, (fips == "24510" | fips == "06037") & type=="ON-ROAD")
> MV <- transform(MV, region = ifelse(fips == "24510", "Baltimore City", "Los Angeles County"))
> MVPM2ByYearAndRegion <- ddply(MV, .(year, region), function(x) sum(x$Emissions))
> colnames(MVPM2ByYearAndRegion)[3] <- "Emissions"
> Balt1999Emissions <- subset(MVPM2ByYearAndRegion, year == 1999 & 
                             region == "Baltimore City")$Emissions
> LAC1999Emissions <- subset(MVPM2ByYearAndRegion, year == 1999 & region == "Los Angeles County")$Emissions
> MVPM25ByYearAbdRegionNorm <- transform(MVPM2ByYearAndRegion, EmissionsNorm = ifelse(region == "Baltimore City", Emissions / Balt1999Emissions, Emissions / LAC1999Emissions))
> qplot(year, EmissionsNorm, data= MVPM25ByYearAbdRegionNorm, geom="line", color=region) + ggtitle(expression("Total" ~ PM[2.5] ~ "Motor Vehicle Emissions Normalized to 1999 Levels")) + xlab("Year") + ylab(expression("Normalized" ~ PM[2.5] ~ "Emissions"))
> dev.copy(png, file = "plot6PM25")
> dev.off()
 