def expand_line_by_title(lineSplit):
	new_lines = []
	for jobrole in lineSplit[1].split(","):
		new_line = [lineSplit[0]] + [jobrole] + lineSplit[2:]
		new_lines.append(new_line)

	return new_lines

def expand_line_by_tags(lineSplit):
	new_lines = []
	for tags in lineSplit[10].split(","):
		new_line = lineSplit[:10] + [tags] + lineSplit[11:]
		new_lines.append(new_line)
	return new_lines

def write_csv(lines_list, path, sep):
	arq = open(path, "w")
	arq.write(header.replace("\t",","))
	for lineSplit in lines_list:
		line = sep.join(lineSplit)
		arq.write(line + "\n")
	arq.close()


arq = open("/home/tales/development/recsys2016/data/items.csv")
header = arq.readline()
lines = arq.readlines()
arq.close()

sep = "\t"

formated_lines_by_title = []

for line in lines:
	lineSplit = line.replace("\n", "").split("\t")
	title = lineSplit[1]

	if (len(title.split(",")) > 1):
		for new_lineSplit in expand_line_by_title(lineSplit):
			formated_lines_by_title.append(new_lineSplit)
	else:
		formated_lines_by_title.append(lineSplit)	

formated_lines = []

for lineSplit in formated_lines_by_title:
	tags = lineSplit[10]
	if (len(tags.split(",")) > 1):
		for new_lineSplit in expand_line_by_tags(lineSplit):
			formated_lines.append(new_lineSplit)
	else:
		formated_lines.append(lineSplit)	


write_csv(formated_lines, "/home/tales/development/recsys2016/data/items_v01.csv", ",")
