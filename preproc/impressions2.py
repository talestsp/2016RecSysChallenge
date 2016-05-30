import sys

index = sys.argv[1]

arq = open("/home/tales/development/recsys2016/data/parts/impressions_clean_part_" + index + ".csv", "r")
header = arq.readline().replace("\n", "")
rows = arq.readlines()
arq.close()

user_year_week_item_count = {}

sep = ","

rows.append("0,0,0,0,0,0")

#user_prev = rows[0].split(sep)[0]
#year_prev = rows[0].split(sep)[1]
#week_prev = rows[0].split(sep)[2]
#item = rows[0].split(sep)[3]

rows = sorted(rows)

row_prev = rows[0]

progress = 0
counter = 0
x = 0
for row in rows:
	x = x + 1

	if(row == "2106272,2015,37,2040947\n"):
		print x
		print row

	row = row.replace("\n","")
	progress = progress + 1

	if(row != row_prev):
		user_year_week_item_count[row] = counter

		row_prev = row
		counter = 0

	counter = counter + 1

		#process completion feedback
	if( (progress % 10000000) == 0 ):
		print str(100 * (float(progress) / len(rows)))[0:4], "% complete!"
print "100 % complete!"


for i in user_year_week_item_count.keys():
	print i, user_year_week_item_count[i]
	break

print "2106272,2015,37,2040947", user_year_week_item_count["2106272,2015,37,2040947"]
print "1994446,2015,45,2389021", user_year_week_item_count["1994446,2015,45,2389021"]
print "1921205,2015,36,373332", user_year_week_item_count["1921205,2015,36,373332"] 






print "len(rows)", len(rows)
