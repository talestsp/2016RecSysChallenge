library("data.table")

u.empl = fread("/home/tales/development/recsys2016/data/interactions/employment.pref.usr.by.usr.csv_formated.csv")
u.disc = fread("/home/tales/development/recsys2016/data/interactions/discipline.pref.usr.by.usr.csv_formated.csv")
u.care = fread("/home/tales/development/recsys2016/data/interactions/career.pref.usr.by.usr.csv_formated.csv")
u.indu = fread("/home/tales/development/recsys2016/data/interactions/industry.pref.usr.by.usr.csv_formated.csv")

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

c = kmeans(usrs, 768)

clusters = c[c("cluster")]

clusters = data.frame(usrs.id, clusters)

data.int = fread("/home/tales/development/recsys2016/data/interactions/interactions-v01.csv")
data.int = data.frame(data.int$user_id, data.int$item_id)
usrs = NULL
gc()

data.int = merge(data.int, clusters, by.x = "data.int.user_id", by.y = "usrs.id")

tgt.usr = fread("/home/tales/development/recsys2016/data/target_users.csv")

#analisando o caso do cluster 477
table.cluster = sort(table(data.int[data.int$cluster == 477,]$data.int.item_id),decreasing=TRUE)
table.cluster[1:3]
names(table.cluster[1:3])




