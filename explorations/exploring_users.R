library(data.table)

data.int = fread("/home/tales/development/recsys2016/data/interactions/interactions-v01.csv")
usr_target = fread("/home/tales/development/recsys2016/data/target_users.csv")

sum(is.element(usr_target$user_id, data.int$user_id) == T) / nrow(usr_target)

