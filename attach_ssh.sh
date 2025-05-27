if [ -t 0 ]; then
        echo "No input received. Please pipe a list of instance ids."
        exit 1
fi

mapfile -t ids
if [ "${ids[@]}" -eq 0 ]; then
        echo "No ids"
        exit 1
fi

ssh_key_dir=~/.ssh/id_ed25519.pub
# TODO: pass file

for id in "${ids[@]}"; do
    command="vastai attach ssh $id $ssh_key_dir"
    echo $command
    $command
done
