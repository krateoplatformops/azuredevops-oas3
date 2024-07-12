#!/bin/bash

# Check if the correct number of arguments were passed
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <input_file> <field_to_remove> <output_file>"
    exit 1
fi

# Assign the arguments to variables
inputFile="$1"
fieldName="$2"
outputFile="$3"

# Construct the yq command with the provided arguments
command="yq 'del(.. | select(has(\"${fieldName}\")).${fieldName})' ${inputFile} > ${outputFile}"

# Execute the constructed command
eval "${command}"

echo "Command executed successfully. Output saved to ${outputFile}."
