#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# Get input argument
# If no input argument print usage
if [ $# -eq 0 ]; then
    echo "Please provide an element as an argument."
    exit
fi

# Handle input argument
# If input is numeric, get element symbol
# If input is string length less than 3, get element name
# If input is string, get element symbol
if [[ $1 =~ ^[0-9]+$ ]]; then
    symbol=$($PSQL "SELECT symbol FROM elements WHERE atomic_number = $1")
elif [ ${#1} -lt 3 ]; then
    symbol=$($PSQL "SELECT symbol FROM elements WHERE symbol = '$1'")
else
    symbol=$($PSQL "SELECT symbol FROM elements WHERE name = '$1'")
fi

# If no element found, print error message
if [ -z "$symbol" ]; then
    echo "I could not find that element in the database."
    exit
fi

atomic_number=$($PSQL "SELECT atomic_number FROM elements WHERE symbol = '$symbol'")
name=$($PSQL "SELECT name FROM elements WHERE symbol = '$symbol'")
type=$($PSQL "SELECT type from types where type_id = (SELECT type_id FROM properties WHERE atomic_number = '$atomic_number')")
mass=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number = '$atomic_number'")
melting_point=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number = '$atomic_number'")
boiling_point=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number = '$atomic_number'")

echo "The element with atomic number $atomic_number is $name ($symbol). It's a $type, with a mass of $mass amu. $name has a melting point of $melting_point celsius and a boiling point of $boiling_point celsius."


