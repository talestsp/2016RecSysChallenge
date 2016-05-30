def expand_line_by_jobrole(lineSplit):
	new_lines = []
	for jobrole in lineSplit[1].split(","):
		new_line = [lineSplit[0]] + [jobrole] + lineSplit[2:]
		new_lines.append(new_line)

	return new_lines

def expand_line_by_edu_fieldofstudies(lineSplit):
	new_lines = []
	for edu_fieldofstudies in lineSplit[11].split(","):
		new_line = lineSplit[:11] + [edu_fieldofstudies]
		new_lines.append(new_line)
	return new_lines

def write_csv(lines_list, path, sep):
	arq = open(path, "w")
	arq.write(header.replace("\t",","))
	for lineSplit in lines_list:
		#print ">", lineSplit
		line = sep.join(lineSplit)
		arq.write(line + "\n")
	arq.close()


arq = open("/home/tales/development/recsys2016/data/users.csv")
header = arq.readline()
lines = arq.readlines()
arq.close()

sep = "\t"

formated_lines_by_jobrole = []

for line in lines:
	lineSplit = line.replace("\n", "").split("\t")
	jobrole = lineSplit[1]

	if (len(jobrole.split(",")) > 1):
		for new_lineSplit in expand_line_by_jobrole(lineSplit):
			formated_lines_by_jobrole.append(new_lineSplit)

	else:
		formated_lines_by_jobrole.append(lineSplit)		

formated_lines = []


for lineSplit in formated_lines_by_jobrole:
	edu_fieldofstudies = lineSplit[11]

	if (len(edu_fieldofstudies.split(",")) > 1):
		for new_lineSplit in expand_line_by_edu_fieldofstudies(lineSplit):
			formated_lines.append(new_lineSplit)

	else:
		formated_lines.append(lineSplit)		

write_csv(formated_lines, "/home/tales/development/recsys2016/data/users_v01.csv", ",")
