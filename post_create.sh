id=$1
ssh_key_path=$2
file_to_copy=$3

$destination="$id:/workspace"

commands=("vastai attach ssh $id $ssh_key_path" "vastai copy $file_to_copy $destination -i $ssh_key_path" "ssh $(vastai ssh-url $id)")

for command in commands;
do
    echo $command
done
