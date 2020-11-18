#! /bin/bash
# Use the json_diff tool to compare the Nickel export and the original json.

files=("guestbook-controller" "guestbook-service" "redis-master-service" "redis-master-controller" "redis-slave-controller" "redis-slave-service")

for f in "${files[@]}"
do
    echo "** Processing ${f}"
    json_diff f "${f}.json" "${f}.ncl.json"
done
echo "Done."
