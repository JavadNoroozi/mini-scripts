rm log


for f in *.log; do
DG=$(ps -ef | awk '{for (I=1;I<=NF;I++) if ($I == "Enthalpy=") {print $(I+5)};}' $f)

echo "$f $DG " >>log
done

