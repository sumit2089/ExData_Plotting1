## function to make plot 2
plot2 <- function() 
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
    
    png(filename = "plot2.png")
    
    with(subd,plot(datetime,
                   as.numeric(as.character(Global_active_power)),
                   type="l",
                   ylab="Global Active Power (kilowatts)",
                   xlab=""))
    
    dev.off()
}