MAP_SIZE=$(clc -c hz map size --name map1 -f json | jq '.Size')
if [[ $MAP_SIZE -ne 10 ]]; then
    exit 1
fi


