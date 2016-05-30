library("data.table")

data.intr = fread("/home/tales/development/recsys2016/data/interactions.csv")
head(data.intr)

to.date = substr(as.POSIXct(data.intr$created_at, origin="1970-01-01"), 1, 10)
data.intr$week = format(as.POSIXct(to.date), "%U")

#data.intr saved 

write.csv(data.intr, "/home/tales/development/recsys2016/data/parts/interactions-v01.csv", sep = ",", quote = F, row.names = F)