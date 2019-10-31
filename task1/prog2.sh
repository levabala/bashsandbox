files=$(ls *lines)
lines=""
for file in $files
do
  for line in "$(cat $file)"
  do
    lines+="$line"
    lines+=$'\n'
  done
done

echo -e "${lines::-1}" > "unsorted"

s=$(sort -g unsorted | uniq)

echo -e "$s" > "sorted"

echo "done"