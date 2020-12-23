

for d in */ ; do
sh neutral_commands.sh  "${d%?}"

done


for d in */ ; do
sh protonated_commands.sh  "${d%?}"

done


for d in */ ; do
sh carbamate_commands.sh  "${d%?}"

done

