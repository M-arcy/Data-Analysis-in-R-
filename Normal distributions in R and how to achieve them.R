# of trips Fall
# of participants Fall
# of trips per Year
# participants per Year
# increase/decrease of prior year
# Average # people per trip

hist(Seattle_ParksnRec$nRec$nRec$X..of.trips.Fall)
hist(Seattle_ParksnRec$X..of.trips.Fall ^ 1/3)
#transformations didn't help

hist(Seattle_ParksnRec$X..of.participants.Fall)
#Normal distribution -  no transformation needed

hist(Seattle_ParksnRec$`# of trips per year`)
hist(Seattle_ParksnRec$`# of trips per year`^1/3)
#More of a bell shape after cube root transformation

hist(Seattle_ParksnRec$`# participants per year`)
#bimodal. can't transform

hist(Seattle_ParksnRec$`increase/decrease of prior year`)
#Normal. no transformation needed

hist(Seattle_ParksnRec$`Average # people per trip`)
#Normal. no transformation needed
