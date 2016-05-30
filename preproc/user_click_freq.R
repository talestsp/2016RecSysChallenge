library(data.table)

data.int = fread("/home/tales/development/recsys2016/data/interactions/interactions-v01.csv")

#users click frequency
table.data.int = data.frame(table(data.int$user_id))
colnames(table.data.int) = c("user_id", "freq")

#users click frequency, considering each items

write.csv(table.data.int, "/home/tales/development/recsys2016/data/interactions/user_click_freq.csv", quote = F, row.names = F)

#users click frequency per week

data.int$count = 1

usr.click.freq.week = aggregate(count ~ user_id + week, data.int, sum)

write.csv(usr.click.freq.week, "/home/tales/development/recsys2016/data/interactions/user_click_freq_per_week.csv", quote = F, row.names = F)
