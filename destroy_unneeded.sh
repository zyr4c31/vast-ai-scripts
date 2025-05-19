declare -a ids
ids=("20086350")

for id in $ids;
do
    echo "vastai destroy instance $id"
    vastai destroy instance $id || true
done
