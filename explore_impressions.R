library("data.table")

data.impr = fread("/home/tales/development/recsys2016/data/parts/impressions/4parts/v01/impressions-v01-part1-4.csv")
data.impr = rbind(data.impr, fread("/home/tales/development/recsys2016/data/parts/impressions/4parts/v01/impressions-v01-part2-4.csv"))
data.impr = rbind(data.impr, fread("/home/tales/development/recsys2016/data/parts/impressions/4parts/v01/impressions-v01-part3-4.csv"))
data.impr = rbind(data.impr, fread("/home/tales/development/recsys2016/data/parts/impressions/4parts/v01/impressions-v01-part4-4.csv"))
colnames(data.impr) = c("user_id", "year", "week", "item", "frequency")


head(data.impr)

max.week = aggregate(week ~ user_id, data.impr, max)
min.week = aggregate(week ~ user_id, data.impr, min)

