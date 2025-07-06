#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo $($PSQL "ALTER SEQUENCE games_game_id_seq RESTART WITH 1")
echo $($PSQL "ALTER SEQUENCE teams_team_id_seq RESTART WITH 1")
echo $($PSQL "TRUNCATE teams, games")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do

  if [[ $WINNER != 'winner' ]]
    then
     TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")

    if [[ -z $TEAM_ID ]]
      then
      INSERT_INTO_TEAMS=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
    fi
  fi

  if [[ $OPPONENT != 'opponent' ]]
    then
     TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

    if [[ -z $TEAM_ID ]]
      then
      INSERT_INTO_TEAMS=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      if [[ $INSERT_INTO_TEAMS == "INSERT 0 1" ]] 
        then
        echo "INSERTED '$OPPONENT' into teams" 
      fi
    fi
  fi

 if [[ $YEAR != "year" ]]
   then
    GAME_ID=$($PSQL "SELECT game_id FROM games WHERE year=$YEAR AND winner='$WINNER' AND opponent='$OPPONENT'")

    if [[ -z $GAME_ID ]]
     then
      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
      OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
      INSERT_INTO_GAMES=$($PSQL "INSERT INTO games(year, round, winner_goals, opponent_goals, winner_id, opponent_id)
       VALUES ($YEAR, '$ROUND',$WINNER_GOALS, $OPPONENT_GOALS, $WINNER_ID, $OPPONENT_ID)")
    fi 

  fi
done
