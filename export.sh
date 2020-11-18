#! /bin/zsh

files=("guestbook-controller" "guestbook-service" "redis-master-service" "redis-master-controller" "redis-slave-controller" "redis-slave-service")

for f in $files
do
    echo "Processing ${f}"
    rm -f "${f}.ncl.json"
    nickel -f "${f}.ncl" export -o "${f}.ncl.json" && json_diff f "${f}.json" "${f}.ncl.json"
    echo "------------------------------------"
done
