blacklist=(19297299)

gpu_floor=22
gpu_ceil=24
train_dph=0.17
train_query="gpu_total_ram > $gpu_floor gpu_total_ram < $gpu_ceil dph < $train_dph"
train_command="vastai search offers gpu_total_ram > $gpu_floor gpu_total_ram < $gpu_ceil dph < $train_dph"

predict_dph=0.049
predict_query="dph < $predict_dph static_ip=true"

predict_command="vastai search offers dph < $predict_dph static_ip=true"
for item in "${blacklist[@]}"; do
    predict_command+=" machine_id!=$item"
done

# command_to_run=$train_command
command_to_run=$predict_command
#
echo $command_to_run
$command_to_run
