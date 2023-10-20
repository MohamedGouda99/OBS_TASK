#!/bin/bash

# Define user data
users=(
    "John, john_j123@domain.com, 325"
    "Susan, ,510"
    "Jane, jane_j121@domain.com, 131"
    "Karl, karl_ka234@domain.com"
    "Bert, bert_bb23@localhost, 150"
)

# Create input.txt and add user data
for user in "${users[@]}"; do
    echo "$user" >> input.txt
done

# Process input.tx
while IFS=',' read -r name email id; do
    name=$(echo "$name" | sed 's/^[ \t]*//;s/[ \t]*$//')
    email=$(echo "$email" | sed 's/^[ \t]*//;s/[ \t]*$//')
    id=$(echo "$id" | sed 's/^[ \t]*//;s/[ \t]*$//')

    if [[ -n "$id" && -n "$email" ]]; then
        id_type=$(awk -v id="$id" 'BEGIN {print (id%2==0) ? "even" : "odd"}')
        
        if [[ "$email" =~ ^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}$ ]]; then
            echo "The ID of $email is $id_type number."
        else
            echo "Invalid email for $name"
        fi
    else
        echo "Invalid parameters for $name"
    fi
done < input.txt
