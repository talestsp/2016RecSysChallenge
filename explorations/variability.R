library(data.table)

variability <- function(x, n) {
	sorted_table = sort(table(x),decreasing=TRUE)
  
	p1 = sorted_table[1] / length(x)
	p2 = sorted_table[2] / length(x)
	p3 = sorted_table[3] / length(x)
	p4 = sorted_table[4] / length(x)
	p5 = sorted_table[5] / length(x)
  
	p = c(p1,p2,p3,p4,p5)
  sum(p[1:n])
  
}

data.int = fread("/home/tales/development/recsys2016/data/interactions/interactions-v01.csv")
data.itm = fread("/home/tales/development/recsys2016/data/items_v01_fixed.csv")

data.itm$longitude = NULL
data.itm$latitude = NULL
data.itm$created_at = NULL
data.itm$region = NULL
data.itm$country = NULL 
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

data.int.1$employment = as.factor(data.int.1$employment)
data.int.1$discipline_id = as.factor(data.int.1$discipline_id)
data.int.1$industry_id = as.factor(data.int.1$industry_id)
data.int.1$career_level = as.factor(data.int.1$career_level)

#aggregate do data.table
data.int.1 <- data.table(data.int.1)
setkey(data.int.1, user_id)

unique(data.int.1$employment)
unique(data.int.1$discipline_id)
unique(data.int.1$industry_id)
unique(data.int.1$career_level)

employment.pref.usr.by.usr = data.int.1[, list(value = variability(employment,1)), by = user_id]
discipline.pref.usr.by.usr = data.int.1[, list(value = variability(discipline_id,1)), by = user_id]
industry.pref.usr.by.usr = data.int.1[, list(value = variability(industry_id,1)), by = user_id]
career.pref.usr.by.usr = data.int.1[, list(value = variability(career_level,1)), by = user_id]

#calcular a variabilidade
###coluna pela mesma coluna? por exemplo, quem clicou em career=1 teve que varibilidade
variability

