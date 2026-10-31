
#!/bin/bash
source lib/functions.sh
touch logs/taken.log

while true
do
    echo "===== MEDICINE REMINDER ====="
    echo "1. View Medicine List"
    echo "2. Today's Schedule"
    echo "3. Next Dose"
    echo "4. Mark Medicine as Taken"
    echo "5. Low Stock Warning"
    echo "6. View Taken Log"
    echo "7. Exit"

    echo "Enter Your Choice:"
    read choice

    case $choice in

    1)
        echo "Medicine List:"
        cat data/meds.csv
        ;;

    2)
        echo "Today's Schedule:"
        head -1 data/meds.csv
        tail -n +2 data/meds.csv | sort -t, -k2
        ;;

    3)
        echo "Enter Current Time:"
        read current

        echo "Next Medicine:"
        tail -n +2 data/meds.csv | sort -t, -k2 |
        awk -F, -v t="$current" '
        $2 > t {
            print $1
            print $2
            found=1
            exit
        }
        END {
            if (!found)
                print "No more doses today."
        }'
        ;;

    4)
        echo "Enter Medicine Name:"
        read med

        awk -F, -v m="$med" 'BEGIN {OFS=","}
        NR==1 {print; next}
        $1==m && $4>0 {$4=$4-1; found=1}
        {print}
        END {
            if (!found)
                print "Medicine not found or stock is zero!" > "/dev/stderr"
        }' data/meds.csv > data/temp.csv

        if grep -q "^$med," data/meds.csv && [ "$(awk -F, -v m="$med" '$1==m && $4>=0 {print $4; exit}' data/meds.csv)" -gt 0 ]
        then
            mv data/temp.csv data/meds.csv
            echo "$med - $(date)" >> logs/taken.log
            echo "Medicine marked as taken!"
            echo "Stock updated successfully!"
        else
            rm -f data/temp.csv
            echo "Medicine not found or stock is zero!"
        fi
        ;;

    5)
        echo "Low Stock Medicines:"
        awk -F, '
        NR>1 && $4<5 {
            print $1, "Stock:", $4
            found=1
        }
        END {
            if (!found)
                print "No low stock medicines."
        }' data/meds.csv
        ;;

    6)
        echo "Taken Medicine Log:"
        cat logs/taken.log
        ;;

    7)
        echo "Thank You for Using Medicine Reminder!"
        break
        ;;

    *)
        echo "Invalid Choice! Try Again."
        ;;

    esac
done
