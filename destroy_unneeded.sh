predict_instance=20364567

if [ -t 0 ]; then
        echo "No input received. Please pipe a list of instance ids."
        exit 1
fi

mapfile -t ids
if [ "${ids[@]}" -eq 0 ]; then
        echo "No ids"
        exit 1
fi

for id in "${ids[@]}"; do
        if [ $id != $predict_instance ]; then
                echo "$predict_instance is not predict_instance"
                command="vastai destroy instance $id"
                echo $command
                $command
        else
                echo "$predict_instance is predict_instance"
        fi
done
