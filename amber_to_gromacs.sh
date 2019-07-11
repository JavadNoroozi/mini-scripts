#! /bin/csh -fv


# This simply create an ac file from gaussian output
antechamber -i molecule.mol2.log -fi gout -o molecule.ac -fo ac 

# This extract esp from gaussian output
espgen -i molecule.mol2.log -o molecule.esp

# generate the two stage input files
respgen -i molecule.ac -o molecule.respin1 -f resp1
respgen -i molecule.ac -o molecule.respin2 -f resp2

# do a two stage charge fitting
resp -O -i molecule.respin1 -o molecule.respout1 -e molecule.esp -t qout_stage1
resp -O -i molecule.respin1 -o molecule.respout1 -e molecule.esp -q qout_stage1 -t qout_stage2
# Add the charges for the ac file
antechamber -i molecule.ac -fi ac -o molecule_resp.ac -fo ac -c rc -cf qout_stage2 
# convert ac file to mol2
antechamber -i molecule_resp.ac -fi ac -o molecule_resp.mol2 -fo mol2 

# Check to see if Amber has all the parameters
parmchk2 -i molecule_resp.mol2 -f mol2 -o molecule.frcmod

tleap -s -f tleap.sh 
acpype -p molecule.prmtop -x molecule.inpcrd 

mv MOL_GMX.top molecule_GMX.itp
cp molecule_GMX.itp ../itp 
