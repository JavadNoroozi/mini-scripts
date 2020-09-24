import sys

name=sys.argv[1]

k = 0

with open(name+'_confs.mol2', 'r') as f:
    for line in f:
        words = line.split()
        for i in words:
            if(i=='@<TRIPOS>MOLECULE'):
                k=k+1
print(name, "number of the conformers is:")
print(k)

N_conf = k


lines = open(name+'_confs.mol2', 'r').readlines()
num_of_lines = int(len(lines)/N_conf)
my_list = range(0, len(lines), num_of_lines)

for i, j in enumerate(my_list):
    f2 = open(name+'_c'+str(i+1)+'.mol2', 'w')
    for L in range(j, j+num_of_lines):
        f2.write(str(lines[L]))
    f2.close()
