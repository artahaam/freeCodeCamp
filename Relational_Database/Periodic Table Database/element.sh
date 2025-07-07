#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table -t --no-align --tuples-only -c"
if [[ -z $1 ]]
then 
  echo Please provide an element as an argument.
else

MAIN_MENU(){
  INPUT=$1
  # echo "input is $INPUT "
  # find info in db
  # if input is a number
  if [[ $INPUT =~ ^[0-9]+$ ]]
  then
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number = $INPUT ")
  elif [[ $INPUT =~ ^[a-zA-Z]+$ ]]
  then
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE name = '$INPUT' OR symbol = '$INPUT' ")
  # elif [[ $INPUT =~ ^[A-Z]+$ ]]
  # then
  #   ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol = '$INPUT' ")
  fi
  
  # if exists

  if [[ -z $ATOMIC_NUMBER ]]
  then
    # if does'nt exist
    echo I could not find that element in the database.
    # I could not find that element in the database.
  else
    # print out the info
    # $ATOMIC_NUMBER
    NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number = $ATOMIC_NUMBER")
    SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number = $ATOMIC_NUMBER")
    # echo $NAME
    # echo $SYMBOL
    TYPE_ID=$($PSQL "SELECT type_id FROM properties WHERE atomic_number = $ATOMIC_NUMBER")
    TYPE=$($PSQL "SELECT type FROM types WHERE type_id = $TYPE_ID")
    ATOMIC_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number = $ATOMIC_NUMBER")
    MELTING_POINT_CELSIUS=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number = $ATOMIC_NUMBER")
    BOILING_POINT_CELSIUS=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number = $ATOMIC_NUMBER")
    echo -e "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
  fi
}
  MAIN_MENU $1
fi
