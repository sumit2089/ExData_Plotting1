## function to make plot 4
plot4 <- function()
{
    ## reading data 
    d <- read.table("household_power_consumption.txt",header=TRUE,sep=";")
    
    ## converting date and time
    dt <- d$Date;
    dm <- d$Time;
    x <- paste(dt,dm)
    datetime <- strptime(x,"%d/%m/%Y %H:%M:%S")
    d <- cbind(d,datetime)
    d$Date = as.Date(d$Date,"%d/%m/%Y")
    
    ## getting the required subset
    subd1 <- subset(d,d$Date == as.Date("2007-02-01"))
    subd2 <- subset(d,d$Date == as.Date("2007-02-02"))
    subd <- rbind(subd1,subd2)
    
    ## for png file creation
    png(filename = "plot4.png")
    
    ## to get 2 plots in a row
    par(mfrow = c(2,2))
    
    ## plot 4-1
    with(subd,plot(datetime,as.numeric(as.character(Global_active_power)),
                   type="l",
                   ylab="Global Active Power",
                   xlab=""))
    
    ## plot 4-2
    with(subd,plot(datetime,as.numeric(as.character(Voltage)),
                   type="l",
                   ylab="Voltage"))
    
    ## plot 4-3
    plot (x= subd$datetime, 
          y= as.numeric(as.character(subd$Sub_metering_1)),
          type ="l",
          xlab ="",
          ylab = "Energy sub metering")

    lines (x= subd$datetime, 
           y= as.numeric(as.character(subd$Sub_metering_2)), 
           col ="red")
    
    lines (x= subd$datetime, 
           y= as.numeric(as.character(subd$Sub_metering_3)), 
           col ="blue")

    legend("topright" , 
           c("Sub_metering_1 ","Sub_metering_2","Sub_metering_3"), 
           lty=c(1,1,1), 
           bty="n",
           col=c("black", "red","blue")) 

    ## plot 4-4
    with(subd,plot(datetime,as.numeric(as.character(Global_reactive_power)),
                   type="l",
                   ylab="Global_reactive_power"))
    
    dev.off()
}