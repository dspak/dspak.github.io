# Create a super-awesome timeline to visualize education and experience with publication events
# a la http://jason.bryer.org/timeline/
# possibly using gvis, if I can, so it's easily portable to my website (by me, I'm sure there's a way to integrate Shiny with Jekyll)
# Update record
# Thu Mar 31 22:58:07 2016 ------------------------------

setwd("~/Box Sync/website/")
#install.packages("googleVis")
require(googleVis) ## googleVis 0.5.0-3
#install.packages("timeline")
library(timeline)


dat <- data.frame(Room=c("Room 1","Room 2","Room 3"),
                  Language=c("English", "German", "French"),
                  start=as.POSIXct(c("2014-03-14 14:00", 
                                     "2014-03-14 15:00",
                                     "2014-03-14 14:30")),
                  end=as.POSIXct(c("2014-03-14 15:00", 
                                   "2014-03-14 16:00",
                                   "2014-03-14 15:30")))

dat <- read.table("~/Box Sync/website/education.txt", sep = "\t", header = T)

dat <- dat[as.POSIXct(strptime(dat[,4:5], %Y-%m))]
plot(
  gvisTimeline(data=df, 
               rowlabel="Category", barlabel="School", 
               start="Start", end="End")
)


datTL <- data.frame(Position=c(rep("President", 3), rep("Vice", 3)),
                    Name=c("Washington", "Adams", "Jefferson",
                           "Adams", "Jefferson", "Burr"),
                    start=as.Date(x=rep(c("1789-03-29", "1797-02-03", 
                                          "1801-02-03"),2)),
                    end=as.Date(x=rep(c("1797-02-03", "1801-02-03", 
                                        "1809-02-03"),2)))

Timeline <- gvisTimeline(data=datTL, 
                         rowlabel="Name",
                         barlabel="Position",
                         start="start", 
                         end="end",
                         options=list(timeline="{groupByRowLabel:false}",
                                      backgroundColor='#ffd', 
                                      height=350,
                                      colors="['#cbb69d', '#603913', '#c69c6e']"))

plot(Timeline)
df <- read.table("education_only.txt", sep = "\t", header = T)
df$Start <- as.Date(df$Start)
df$End <- as.Date(df$End)
str(df)
df$Start[1] <- as.Date("1996-09-01")
df$Start[4] <- as.Date("2015-06-01")

Timeline <- gvisTimeline(data = df, 
                         rowlabel = "Degree",
                         barlabel="School",
                         start="Start", 
                         end="End",
                         options=list(timeline="{groupByRowLabel:false}",
                                      backgroundColor='#ffd', 
                                      height=350))

                                      colors="['#cbb69d', '#603913', '#c69c6e']"))
plot(Timeline)



