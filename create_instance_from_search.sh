./search_offers.sh | awk 'NR>1 {print $1}' | while read ID; do
    ./pass_id_create_instance.sh "$ID"
done
