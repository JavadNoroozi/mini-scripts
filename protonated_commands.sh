 #! /bin/csh -fv
 name=$1
 
 cp job.sh $name/protonated
 cd $name/protonated
 rm core.* *.log


 sed --i 's/mp2-cc-pVTZ/G4/g' *.com
 sed --i 's/%Mem=5GB/%Mem=25GB/g' *.com
 sed --i 's/%NProcShared=4/%NProcShared=6/g' *.com
 sed --i 's/298/298/g' *.com



 sed --i "s/XXX/$name"_H"/g" job.sh
 n_confs=$(ls -dq *.com | wc -l)
 sbatch --array=1-$n_confs job.sh
 

