#! /bin/bash
# Generate all the config files of the guestbook-go example from the Nickel
# files.

files=("guestbook-controller" "guestbook-service" "redis-master-service" "redis-master-controller" "redis-slave-controller" "redis-slave-service")
makefile="Makefile.gen"

for f in "${files[@]}"
do
    echo "** Exporting ${f}"
    rm -f "${f}.ncl.json"
    nickel -f "${f}.ncl" export -o "${f}.ncl.json"
done

echo "** Generating Makefile"
rm -f "${makefile}"
nickel -f "Makefile.ncl" export -o "${makefile}" --format raw
echo "Done."
