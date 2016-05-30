#preferences by career
arq = open("/home/tales/development/recsys2016/data/interactions/career.pref.usr.by.usr.csv", "r")
header = arq.readline().replace("\n", "").split(",")[0]
lines = arq.readlines()
arq.close()

header_complement = "pref.cl1,pref.cl2,pref.cl3,pref.cl4,pref.cl5,pref.cl6"
arq = open("/home/tales/development/recsys2016/data/interactions/career.pref.usr.by.usr.csv_formated.csv", "w")
arq.write(header + "," + header_complement + "\n")


for line in lines:
	line_split = line.replace("\n","").split(",")
	user = line_split[0]
	career_pref = line_split[1].replace(";", ",")
	new_line = user + "," + career_pref
	arq.write(new_line + "\n")

arq.close()




#preferences by industry
arq = open("/home/tales/development/recsys2016/data/interactions/industry.pref.usr.by.usr.csv", "r")
header = arq.readline().replace("\n", "").split(",")[0]
lines = arq.readlines()
arq.close()

header_complement = "pref.ind.0,pref.ind.1,pref.ind.2,pref.ind.3,pref.ind.4,pref.ind.5,pref.ind.6,pref.ind.7,pref.ind.8,pref.ind.9,pref.ind.10,pref.ind.11,pref.ind.12,pref.ind.13,pref.ind.14,pref.ind.15,pref.ind.16,pref.ind.17,pref.ind.18,pref.ind.19,pref.ind.20,pref.ind.21,pref.ind.22,pref.ind.23"
arq = open("/home/tales/development/recsys2016/data/interactions/industry.pref.usr.by.usr.csv_formated.csv", "w")
arq.write(header + "," + header_complement + "\n")


for line in lines:
	line_split = line.replace("\n","").split(",")
	user = line_split[0]
	career_pref = line_split[1].replace(";", ",")
	new_line = user + "," + career_pref
	arq.write(new_line + "\n")

arq.close()


#preferences by discipline
arq = open("/home/tales/development/recsys2016/data/interactions/discipline.pref.usr.by.usr.csv", "r")
header = arq.readline().replace("\n", "").split(",")[0]
lines = arq.readlines()
arq.close()

header_complement = "pref.disc.0,pref.disc.1,pref.disc.2,pref.disc.3,pref.disc.4,pref.disc.5,pref.disc.6,pref.disc.7,pref.disc.8,pref.disc.9,pref.disc.11,pref.disc.12,pref.disc.13,pref.disc.14,pref.disc.15,pref.disc.16,pref.disc.17,pref.disc.18,pref.disc.19,pref.disc.20,pref.disc.21,pref.disc.22,pref.disc.23"
arq = open("/home/tales/development/recsys2016/data/interactions/discipline.pref.usr.by.usr.csv_formated.csv", "w")
arq.write(header + "," + header_complement + "\n")


for line in lines:
	line_split = line.replace("\n","").split(",")
	user = line_split[0]
	career_pref = line_split[1].replace(";", ",")
	new_line = user + "," + career_pref
	arq.write(new_line + "\n")

arq.close()


#preferences by employment
arq = open("/home/tales/development/recsys2016/data/interactions/employment.pref.usr.by.usr.csv", "r")
header = arq.readline().replace("\n", "").split(",")[0]
lines = arq.readlines()
arq.close()

header_complement = "pref.empl.0,pref.empl.1,pref.empl.2,pref.empl.3,pref.empl.4,pref.empl.5"
arq = open("/home/tales/development/recsys2016/data/interactions/employment.pref.usr.by.usr.csv_formated.csv", "w")
arq.write(header + "," + header_complement + "\n")


for line in lines:
	line_split = line.replace("\n","").split(",")
	user = line_split[0]
	career_pref = line_split[1].replace(";", ",")
	new_line = user + "," + career_pref
	arq.write(new_line + "\n")

arq.close()

