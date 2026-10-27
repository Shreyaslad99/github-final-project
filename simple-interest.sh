#!/bin/bash

# Simple Interest Calculator

read -r -p "Enter the principal amount: " principal
read -r -p "Enter the rate of interest (% per year): " rate
read -r -p "Enter the time period (in years): " time

# Validate user input
if ! [[ "$principal" =~ ^[0-9]+([.][0-9]+)?$ &&
        "$rate" =~ ^[0-9]+([.][0-9]+)?$ &&
        "$time" =~ ^[0-9]+([.][0-9]+)?$ ]]; then
    echo "Error: Please enter valid non-negative numbers."
    exit 1
fi

# Calculate simple interest
interest=$(awk -v p="$principal" -v r="$rate" -v t="$time" 
    'BEGIN { printf "%.2f", (p * r * t) / 100 }')

echo "Simple interest: $interest"
