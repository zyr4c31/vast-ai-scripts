vastai show instances |
    awk 'NR>1 {print $1}' |
    while read ID; do
            echo $ID
    done
