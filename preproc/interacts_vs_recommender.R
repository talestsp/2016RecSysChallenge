library(data.table)

#100756422
imp.rows = 201871539

#4413348
int.rows = 8826678

data.int = fread("/home/tales/development/recsys2016/data/interactions/interactions-v01.csv")#[1:8826678]
colnames(data.int)[4] = "week.int"
data.imp = fread("/home/tales/development/recsys2016/data/impressions/v02/impressions-v02.csv")#[100756423:201871539]
colnames(data.imp)[2] = "week.imp"

gc()

##### HOW MANY INTERACTED ITEMS WERE RECOMMENDED BY XING SYSTEM?
data.int$key = paste(data.int$user_id, data.int$item_id)
#data.int = NULL
gc()
data.imp$key = paste(data.imp$user_id, data.imp$item_id)
#data.imp = NULL
gc()

data.int.rec = data.int[is.element(data.int$key, data.imp$key),]

nrow(data.int.rec) #1733349 + 1739940
nrow(data.int) #8826678
nrow(data.int.rec) / nrow(data.int) #0.1963761 + 0.1971229 = 0.393499

#>>>>>>>>>>>> 0.393499

##### HOW MANY INTERACTED ITEMS WERE RECOMMENDED BY XING SYSTEM BEFORE THE INTERACTION?
#TO DO

##### LOCATION 



#HOW MANY INTERACTIONS WERE MADE WITHOUT RECOMMENDER
#pegar o data.merge e considerar apenas a menor week.imp ????
