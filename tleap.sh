
source leaprc.gaff 
SUS = loadmol2 molecule_resp.mol2 
check SUS 
loadamberparams molecule.frcmod
saveoff SUS sus.lib 
saveamberparm SUS molecule.prmtop molecule.inpcrd
quit



