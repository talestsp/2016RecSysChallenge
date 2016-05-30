library(data.table)

data.int = fread("/home/tales/development/recsys2016/data/interactions/interactions-v01.csv")

#users click frequency
table.data.int = data.frame(table(data.int$item_id))
colnames(table.data.int) = c("item_id", "freq")

#item click frequency

write.csv(table.data.int, "/home/tales/development/recsys2016/data/interactions/item_click_freq.csv", quote = F, row.names = F)

#item click frequency per week

data.int$count = 1

item.click.freq.week = aggregate(count ~ item_id + week, data.int, sum)

write.csv(item.click.freq.week, "/home/tales/development/recsys2016/data/interactions/item_click_freq_per_week.csv", quote = F, row.names = F)
