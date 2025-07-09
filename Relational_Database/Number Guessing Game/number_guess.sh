#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USERNAME
USER_ID=$($PSQL "SELECT user_id FROM users WHERE name = '$USERNAME' ")

if [[ -z $USER_ID ]]
then
  echo -e "Welcome, $USERNAME! It looks like this is your first time here."
  INSER_INTO_USERS=$($PSQL "INSERT INTO users(name) VALUES('$USERNAME')")
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE name = '$USERNAME' ")
else
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE name = '$USERNAME' ")
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id = $USER_ID")
  BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM games WHERE user_id = $USER_ID")
  echo -e "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi


SECRET_NUMBER=$(( (RANDOM % 1000) + 1 ))


INSERT_INTO_GAMES=$($PSQL "INSERT INTO games(secret_number, user_id) VALUES($SECRET_NUMBER, $USER_ID);")
counter=1

echo -e "Guess the secret number between 1 and 1000:\n"

while [[ counter != 0 ]]
do
  read GUESS 

  if [[ $GUESS =~ ^[0-9]+$ ]]
  then
    if [[ $GUESS -gt $SECRET_NUMBER ]]
    then
      echo -e "It's lower than that, guess again:\n"
    elif [[ $GUESS -lt $SECRET_NUMBER ]]
    then
      echo -e "It's higher than that, guess again:\n"
    else
      echo -e "You guessed it in $counter tries. The secret number was $SECRET_NUMBER. Nice job!"
      INSERT_INTO_GAMES=$($PSQL "UPDATE games SET guesses = $counter")
      break
    fi 
    
    ((counter++))

  else
    echo -e "That is not an integer, guess again:\n"
  fi  

done