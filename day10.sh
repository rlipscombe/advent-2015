in="1321131112"; 
for f in $(seq 1 40) ; do 
    in=$(echo "$in" | fold -w1 | uniq -c | tr '\n' ' ' | tr -d ' '); 
    echo $in | tr -d '\n' | wc -c; 
done
