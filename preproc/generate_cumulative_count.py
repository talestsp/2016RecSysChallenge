import sys

#this function only works with dataset ordered first by user_id, than by week
def do_map(usr_rows, arq):
        user = usr_rows[0][0]
        mapa = {}

        for row in usr_rows:
                user = row[0]
                item = row[2]
                freq = int(row[3])

                if(not item in mapa.keys()):
                        mapa[item] = freq
                else:
                        #update cumulative count to the last week
                        mapa[item] = mapa[item] +  freq

                #update row
                row.append(str(mapa[item]))
                new_row = ",".join(row) + "\n"
                arq.write(new_row)


filename = sys.argv[1]
is_header = sys.argv[2]

path = "/home/tales/development/recsys2016/data/parts/impressions/4parts/v02/" + filename
print "Loading data..."

arq = open(path, "r")
if (is_header == "T"):
	header = arq.readline().replace("\n", "")
rows = arq.readlines()
arq.close()
print "Data loaded!"

sep = ","

rows.append("0,0,0,0,0")

user_prev = rows[0].split(sep)[0]

usr_rows = []

progress = 0
counter = 0

path = "/home/tales/development/recsys2016/data/parts/impressions/4parts/v02/" + filename + "v02.csv"

arq = open(path, "w")
if (is_header == "T"):
	arq.write(header + sep + "cumulative_count\n")

print "Processing data..."
for row in rows:
        rowSplit = row.replace("\n","").split(sep)
        user = rowSplit[0]
        counter = counter + 1

        if (user != user_prev):
                do_map(usr_rows, arq)
                usr_rows = []
                user_prev = user

        usr_rows.append(rowSplit)

        if( (counter % (len(rows) / 1000)) == 0 ):
                progress = progress + 1
                print str(100 * (float(counter) / len(rows)))[0:4], "% complete!"
print "100 % complete!"

arq.close() 

