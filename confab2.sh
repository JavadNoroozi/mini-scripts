

NAME=$1
SMILE=$2

smile_H=$(echo $SMILE | sed -r 's/[N]+/[NH2+]/g')

smile_CO2_1=$( echo $SMILE | sed -r 's/[N]+/)/g')
smile_CO2="[O-]C(=O)N("$smile_CO2_1



obabel -ismi -:$SMILE -O $NAME".sdf" --gen3d
obabel -ismi -:$smile_H -O $NAME"_H.sdf" --gen3d
obabel -ismi -:$smile_CO2 -O $NAME"_CO2.sdf" --gen3d

obabel $NAME".sdf" -O $NAME"_confs.mol2" --confab --conf 1000000 --rcutoff 0.5 --ecutoff 50 --verbose 
obabel $NAME"_H.sdf" -O $NAME"_H_confs.mol2" --confab --conf 1000000 --rcutoff 0.5 --ecutoff 50 --verbose 
obabel $NAME"_CO2.sdf" -O $NAME"_CO2_confs.mol2" --confab --conf 1000000 --rcutoff 0.5 --ecutoff 50 --verbose 

rm *.sdf
