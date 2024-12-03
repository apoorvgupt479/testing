git init
touch junk

declare -i x
echo "Enter Beginning date [yyyymmdd]"
read x

declare -i y
echo "Enter End date [yyyymmdd]"
read y

DATE=$x

while [ $DATE -le $y ]
do
    rand=$(( RANDOM % 100 ))

    if [ $rand -lt 30 ]; then
        commits=0
    elif [ $rand -lt 55 ]; then
        commits=1
    elif [ $rand -lt 75 ]; then
        commits=2
    elif [ $rand -lt 90 ]; then
        commits=3
    else
        commits=4
    fi

    for ((i=1; i<=commits; i++))
    do
        echo "a" >> junk
        git add .
        msg="commit ${DATE} #$i"
        git commit -m "$msg" --date="$(date -R -d ${DATE})"
        git push -u origin main
    done

    DATE=$(date +%Y%m%d -d "$DATE + 1 day")
done
