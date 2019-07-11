#! /bin/csh -fv
name1=$1
name2=$2
cp *.sh $name1/
cd $name1/
sed --i "s/molecule/$name2/g" *.sh
sh amber_to_gromacs.sh
cd ../



