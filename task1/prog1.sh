function isInt() {
  [ "$1" -eq "$1" ] 2>/dev/null
} 

function join_by { local d=$1; shift; echo -n "$1"; shift; printf "%s" "${@/#/$d}"; }

files=$1
lines=$2

if ! (isInt $files) || ! (isInt $lines)
then
  echo "invalid input"
  exit 1
fi

echo "executing"

for ((fileIndex = 0; fileIndex < $files; fileIndex++))
do
  positiveRandomLines=$(shuf -i 0-200 -n $lines)
  justRandomLines=()
  for line in $positiveRandomLines
  do
    ((val = $line-100))
    justRandomLines+=("$val")
  done
  
  s=$(join_by '\n' "${justRandomLines[@]}")

  echo -e $s > "$fileIndex.lines"
  echo "write file $fileIndex"
done