path = "/home/tales/development/recsys2016/data/interactions/interactions-v01.csv"
print "Loading data..."

arq = open(path, "r")
header = arq.readline().replace("\n", "")
rows = arq.readlines()
arq.close()
print "Data loaded!"

sep = ","

#user: (item: (rowSplit))
usr_rowSplit = {}

progress = 0
counter = 0

for row in rows:
	rowSplit = row.replace("\n","").split(sep)
	user = rowSplit[0]
	item = rowSplit[1]
	counter = counter + 1
	if (not user in usr_rowSplit.keys()):
		usr_rowSplit[user] = [rowSplit]
	else:
		usr_rowSplit[user].append(rowSplit)
	if( (counter % (len(rows) / 1000)) == 0 ):
		progress = progress + 1
		print str(100 * (float(counter) / len(rows)))[0:4], "% complete!"
print "100 % complete!"