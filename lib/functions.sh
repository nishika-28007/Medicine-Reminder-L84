#!/bin/bash

show_medicines() {
    echo "Medicine List:"
    cat data/meds.csv
}

show_schedule() {
    echo "Today's Schedule:"
    head -1 data/meds.csv
    tail -n +2 data/meds.csv | sort -t, -k2
}

show_low_stock() {
    echo "Low Stock Medicines:"
    awk -F, 'NR>1 && $4<5 {
        print $1, "Stock:", $4
    }' data/meds.csv
}
