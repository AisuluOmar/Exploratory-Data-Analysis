# Question 4:
# Across the United States, how have emissions from coal combustion-related
# sources changed from 1999-2008?
> CoalCombustionSCC <- subset(SCC, EI.Sector %in% c("Fuel Comb - Comm/Institutional - Coal", "Fuel Comb - Industrial Boilers, ICEs - Coal"))
> CoalCombustionSCC1 <- subset(SCC, grepl("Comb", Short.Name) & grepl("Coal", Short.Name))
> nrow(CoalCombustionSCC)
##[1] 64
> nrow(CoalCombustionSCC1)
##[1] 91
> d3 <- setdiff(CoalCombustionSCC$SCC, CoalCombustionSCC1$SCC)
> d4 <- setdiff(CoalCombustionSCC1$SCC, CoalCombustionSCC$SCC)
> length(d3)
##[1] 6
> length(d4)
##[1] 33
> CoalCombustionSCCCodes <- union(CoalCombustionSCC$SCC, CoalCombustionSCC1$SCC)
> length(CoalCombustionSCCCodes)
##[1] 97
> CoalCombustion <- subset(NEI, SCC %in% CoalCombustionSCCCodes)
> coalCombustionPM25ByYear <- ddply(CoalCombustion, .(year, type), function(x) sum(x$Emissions))
> colnames(coalCombustionPM25ByYear)[3] <- "Emissions"
> qplot(year, Emissions, data = coalCombustionPM25ByYear, color = type, geom = "line") + ggtitle(expression("Coal Combustion" ~ PM[2.5] ~ "Emissions by Source Type and Year")) + xlab("Year") + ylab(expression ("Total" ~ PM[2.5] ~ "Emissions (tons)"))
> dev.copy(png, file = "plot4PM25.png")
> dev.off()
