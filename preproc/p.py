import sys

index = sys.argv[1]

arq = open("/home/tales/development/recsys2016/data/parts/impressions_part_" + index + ".csv", "r")
header = arq.readline().replace("\n", "")
rows = arq.readlines()
arq.close()

new_rows = []

sep = "\t"

#process completion feedback
counter = 0

for row in rows:
	#process completion feedback
	counter = counter + 1

	rowSplit = row.replace("\n", "").split(sep)
	user = rowSplit[0]
	year = rowSplit[1]
	week = rowSplit[2]
	items = rowSplit[3].split(",")

	for item in items:
		new_rows.append(user + "," + year + "," + week + "," + item)

	#process completion feedback
	if( (counter % 50000) == 0 ):
		print str(100 * (float(counter) / len(rows)))[0:4], "% complete!"
print "100 % complete!"


arq = open("/home/tales/development/recsys2016/data/parts/impressions_clean_part_" + index + ".csv", "w")
arq.write("user_id,year,week,item\n")

for new_row in new_rows:
	arq.write(new_row + "\n")


arq.close()
