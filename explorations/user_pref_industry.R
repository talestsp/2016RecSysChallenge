library(data.table)

concat_tab <- function(x) {
	tb_relative = table(x) / length(x)
	tb_relative = round(tb_relative, 3)
	c = paste(tb_relative, collapse = ";")
	c
}

data.int = fread("/home/tales/development/recsys2016/data/interactions/interactions-v01.csv")
#data.itm = fread("/home/tales/development/recsys2016/data/items.csv")
data.itm = fread("/home/tales/development/recsys2016/data/items_v01_fixed.csv")

data.itm$longitude = NULL
data.itm$latitude = NULL
data.itm$created_at = NULL
data.itm$region = NULL
data.itm$country = NULL
data.itm$discipline_id = NULL 
data.itm$career_level = NULL
data.itm$employment = NULL  
data.itm$tags = NULL
data.itm$active_during_test = NULL
data.itm$title = NULL

nrow(data.itm)
data.itm = unique(data.itm)
nrow(data.itm)
gc()

#items.int = unique(data.int$item_id)
#items.itm = unique(data.itm$id)

data.int.1 = data.int[data.int$interaction_type == 1,]
data.int = NULL
gc()

data.int.1 = merge(data.int.1, data.itm, by.x = "item_id", by.y = "id")

data.int.1$week = NULL
gc()

data.int.1$industry_id = as.factor(data.int.1$industry_id)

#industry.pref.usr.by.usr = aggregate(industry_id ~ user_id, data.int.1, concat_tab)
#aggregate do data.table
data.int.1 <- data.table(data.int.1)
setkey(data.int.1, user_id)
industry.pref.usr.by.usr = data.int.1[, list(value = concat_tab(industry_id)), by = user_id]


head(industry.pref.usr.by.usr, 10)

write.csv(industry.pref.usr.by.usr, "/home/tales/development/recsys2016/data/interactions/industry.pref.usr.by.usr.csv", quote=F, row.names = F)


