import shutil
import glob
import os
thedir ='/home/javad/scratch/IG_calc/SET1'
#P =[ name for name in os.listdir(thedir) if os.path.isdir(os.path.join(thedir, name)) ]

P=['BA', 'SBA', 'IBA', 'GLY','PA', '3APD', '5AP','6AH', 'PAE', 'BAE','IPAP', '4IPB', 'TRC', '1DMA2P', '3MDA1P', 'DEEA',
 'DMA2M1P', 'DMA12PD', '1DEA2P', '3DEA1P', 'DMA22DP', 'EDEA', 'DMAEOE',  'DEAEEO', 'DEAB',  'DEA12PD', 'IPDEA',
 'TEA', 'PRYE', '1E3HPP', '12HEPP', '1PE',  '1PP', 'PRLD12PD', '1M2PPE',  '4PP2B',  '3PPE']

#P=['PYR', 'MOR', 'MMOR', 'MPP', 'TMPOL' ]

P=['THMAM']


for i in range(0, len(P)):
    os.chdir(thedir+'/'+P[i]+'/protonated')
    print("Current Working Directory " , os.getcwd())
    com_files = len(glob.glob1(thedir+'/'+P[i]+'/protonated', "*.com"))
    Num_of_log_files = com_files
    mol_prefix = P[i]
    f2 = open('Free_Energy', 'w')
    f3 = open('Failed_conformers.sh', 'w')
    f3.write('sbatch --array=')
    LOG=0
    failed_conformers=[]
    for j in range(Num_of_log_files):
        f1 = open(mol_prefix+'_H_c'+ str(j+1) + '.mol2.log', 'r')
        lines = f1.readlines()
        if "Normal termination of Gaussian" in lines[len(lines)-1]:
            LOG=LOG+1
            for k in range(len(lines)):
                if 'G4 Enthalpy=' in lines[k]:
                    f2.write(lines[k][26:37])
                    f2.write('\n')
        else:
            f2.write('1.1111111111111')
            failed_conformers.append(j+1)
            f2.write('\n')
            f3.write(str(j+1)+',')
        f1.close()
    f2.close()
    f3.write(' fail.sh')
    f3.close()

    integers = open('Free_Energy', 'r')
    values = [float(x) for x in integers.readlines()]
    print('total and successful log files are :', com_files, LOG)
    keys = range(1,len(values))
    dictionary = dict(zip(keys, values))
    #print(dictionary)
    for K, V in dictionary.items():
          if dictionary [K] == min(values):
             conformer = K
    print(' minimum conformer is:',conformer)
    print(' min energy is:', min(values))
    dir1= thedir+'/'+P[i]+'/min/prot'
    dir2= thedir+'/'+P[i]+'/protonated/'+P[i]+'_H_c'+str(conformer)+'.mol2.log'
    dir3= thedir+'/'+P[i]+'/protonated/'+P[i]+'_H_c'+str(conformer)+'.mol2.com'
    shutil.copy(dir2,dir1)
    shutil.copy(dir3,dir1)
    print(failed_conformers)
    print('########################################################')



