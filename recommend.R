library("data.table")

recommend <- function(x, items.list) {
	n = 30
	table.cluster = sort(table(x),decreasing=TRUE)
	most.freq.items.sorted = data.frame(table.cluster)$x
	most.freq.items.sorted.available = intersect(most.freq.items.sorted, items.list)
	table.cluster.n = most.freq.items.sorted.available[1:n]
	table.cluster.n = table.cluster.n[!is.na(table.cluster.n)]
	paste(table.cluster.n, collapse = ",")
}

set.weight <- function(x, weight) {
  x = data.frame(x)
  x[,-1] = x[,-1] * weight
  x
}

u.empl = fread("/home/tales/development/recsys2016/data/interactions/employment.pref.usr.by.usr.csv_formated.csv")
u.empl = set.weight(u.empl, 1-1)
u.disc = fread("/home/tales/development/recsys2016/data/interactions/discipline.pref.usr.by.usr.csv_formated.csv")
u.disc = set.weight(u.disc, 1-0.5)
u.care = fread("/home/tales/development/recsys2016/data/interactions/career.pref.usr.by.usr.csv_formated.csv")
u.care = set.weight(u.care, 1-0.5)
u.indu = fread("/home/tales/development/recsys2016/data/interactions/industry.pref.usr.by.usr.csv_formated.csv")
u.indu = set.weight(u.indu, 1-0.6471)

#u.empl = data.frame("user_id" = u.empl$user_id)

usrs = merge(u.empl, u.disc, by = "user_id")
u.empl = NULL
u.disc = NULL
gc()
usrs = merge(usrs, u.care, by = "user_id")
u.care = NULL
gc()
usrs = merge(usrs, u.indu, by = "user_id")
u.indu = NULL
gc()

usrs.id = usrs$user_id
usrs$user_id = NULL
gc()

c = kmeans(usrs, 16000)

clusters = c[c("cluster")]

print(c[c("iter")])

clusters = data.frame(usrs.id, clusters)

data.int = fread("/home/tales/development/recsys2016/data/interactions/interactions-v01.csv")
data.int = data.frame(data.int$user_id, data.int$item_id)
usrs = NULL
gc()

items.ok = fread("/home/tales/development/recsys2016/data/items.csv", sep = "\t")
items.ok = items.ok[items.ok$active_during_test == 1,]
gc()

tgt.usr = fread("/home/tales/development/recsys2016/data/target_users.csv")

data.int = data.int[is.element(data.int$data.int.user_id, tgt.usr$user_id),]

data.int = merge(data.int, clusters, by.x = "data.int.user_id", by.y = "usrs.id")

itm.cluster = data.frame(data.int$data.int.item_id, data.int$cluster)
head(itm.cluster)
######### vale a pena ver se sem o unique, continua bom
itm.cluster = unique(itm.cluster)

itm.cluster <- data.table(itm.cluster)
setkey(itm.cluster, data.int.cluster)
#aggregate
items_rec = itm.cluster[, list(value = recommend(data.int.data.int.item_id, items.ok$id)), by = data.int.cluster]

head(items_rec,2)
head(data.int, 2)

data.int.rec = merge(data.int, items_rec, by.x = "cluster", by.y = "data.int.cluster")
data.int.rec = data.frame("user_id" = data.int.rec$data.int.user_id, "items" = data.int.rec$value)

data.int.rec = unique(data.int.rec)

write.table(data.int.rec, "/home/tales/development/recsys2016/solutions/s32", quote = F, row.names = F, sep = "\t")



