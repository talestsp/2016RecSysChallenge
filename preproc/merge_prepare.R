library("data.table")

data.intr = fread("/home/tales/development/recsys2016/data/parts/interactions/interactions-v01.csv")
head(data.intr)
data.intr$created_at = NULL
head(data.intr)
data.intr = data.intr[with(data.intr, order(user_id, item_id)), ]
write.csv(data.intr, "/home/tales/development/recsys2016/data/parts/interactions/interactions-v02.csv", quote=F, row.names=F)



data.impr = fread("/home/tales/development/recsys2016/data/parts/impressions/4parts/v02/xaav02.csv")
head(data.impr)
data.intr$created_at = NULL
colnames(data.impr)[3] = "item_id"
head(data.impr)
write.csv(data.impr, "/home/tales/development/recsys2016/data/parts/impressions/4parts/v02/xaa-v02.csv", quote=F, row.names=F)


data.impr = fread("/home/tales/development/recsys2016/data/parts/impressions/4parts/v02/xabv02.csv")
head(data.impr)
data.intr$created_at = NULL
colnames(data.impr)[3] = "item_id"
head(data.impr)
write.csv(data.impr, "/home/tales/development/recsys2016/data/parts/impressions/4parts/v02/xab-v02.csv", quote=F, row.names=F)


data.impr = fread("/home/tales/development/recsys2016/data/parts/impressions/4parts/v02/xacv02.csv")
head(data.impr)
data.intr$created_at = NULL
colnames(data.impr)[3] = "item_id"
head(data.impr)
write.csv(data.impr, "/home/tales/development/recsys2016/data/parts/impressions/4parts/v02/xac-v02.csv", quote=F, row.names=F)


data.impr = fread("/home/tales/development/recsys2016/data/parts/impressions/4parts/v02/xadv02.csv")
head(data.impr)
data.intr$created_at = NULL
colnames(data.impr)[3] = "item_id"
head(data.impr)
write.csv(data.impr, "/home/tales/development/recsys2016/data/parts/impressions/4parts/v02/xad-v02.csv", quote=F, row.names=F)


data.impr = fread("/home/tales/development/recsys2016/data/parts/impressions/4parts/v02/xaev02.csv")
head(data.impr)
data.intr$created_at = NULL
colnames(data.impr)[3] = "item_id"
head(data.impr)
write.csv(data.impr, "/home/tales/development/recsys2016/data/parts/impressions/4parts/v02/xae-v02.csv", quote=F, row.names=F)


data.impr = fread("/home/tales/development/recsys2016/data/parts/impressions/4parts/v02/xafv02.csv")
head(data.impr)
data.intr$created_at = NULL
colnames(data.impr)[3] = "item_id"
head(data.impr)
write.csv(data.impr, "/home/tales/development/recsys2016/data/parts/impressions/4parts/v02/xaf-v02.csv", quote=F, row.names=F)

