N_conf = 25.0
name='AEPD'

f1 = open(name+'_Conf.txt', 'r')
lines = f1.readlines()
num_of_lines = int(len(lines)/N_conf)
my_list = range(0, len(lines), num_of_lines)

for i, j in enumerate(my_list):
    f2 = open(name+str(i+1)+'.mol2', 'w')
    for L in range(j, j+num_of_lines):
        f2.write(str(lines[L]))
    f2.close()
