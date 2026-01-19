#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
THE_GUESS_NUMBER=$(( ( RANDOM % 1000 )  + 1 ))
echo "Numarul de ghicit este:$THE_GUESS_NUMBER"

echo Enter your username:
read USERNAME

CHECKER_USERNAME=$($PSQL "Select 1 From guesser Where username='$USERNAME'")

if [[ -z $CHECKER_USERNAME ]]
then

echo Welcome, $USERNAME! It looks like this is your first time here.

echo Guess the secret number between 1 and 1000:
read SECRET_NUMBER
CONTOR=1;

  while [[ "$SECRET_NUMBER" -ne "$THE_GUESS_NUMBER" ]]
do
   if [[ ! $SECRET_NUMBER =~ ^[0-9]+$ ]]
   then
      echo "That is not an integer, guess again:"
      read SECRET_NUMBER
      (( CONTOR++ ))
      continue
   fi

   if [[ $THE_GUESS_NUMBER -lt $SECRET_NUMBER ]] 
          then 
              echo "It's lower than that, guess again:"
              read SECRET_NUMBER
              (( CONTOR++ ))
          elif [[ $THE_GUESS_NUMBER -gt $SECRET_NUMBER ]] 
              then
                  echo "It's higher than that, guess again:"
                  read SECRET_NUMBER
                  (( CONTOR++ ))
  fi
done
echo "You guessed it in $CONTOR tries. The secret number was $THE_GUESS_NUMBER. Nice job!"

INSERT_INTO_DATABASE=$($PSQL "Insert Into guesser(username,games_played,best_game,number_of_tries) 
                              Values('$USERNAME',1,$CONTOR,$CONTOR)");

else
   GAMES_PLAYED=$($PSQL "Select games_played From guesser Where username='$USERNAME'");
   echo Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took <best_game> guesses.
echo Guess the secret number between 1 and 1000:
read SECRET_NUMBER
CONTOR=1;

  while [[ "$SECRET_NUMBER" -ne "$THE_GUESS_NUMBER" ]]
do
   if [[ ! $SECRET_NUMBER =~ ^[0-9]+$ ]]
   then
      echo "That is not an integer, guess again:"
      read SECRET_NUMBER
      (( CONTOR++ ))
      continue
   fi

   if [[ $THE_GUESS_NUMBER -lt $SECRET_NUMBER ]] 
          then 
              echo "It's lower than that, guess again:"
              read SECRET_NUMBER
              (( CONTOR++ ))
          elif [[ $THE_GUESS_NUMBER -gt $SECRET_NUMBER ]] 
              then
                  echo "It's higher than that, guess again:"
                  read SECRET_NUMBER
                  (( CONTOR++ ))
  fi
done
  echo "You guessed it in $CONTOR tries. The secret number was $THE_GUESS_NUMBER. Nice job!"

  ((GAMES_PLAYED++))
  INSERT_INTO_DATABASE=$($PSQL "Insert Into guesser(username,games_played,best_game,number_of_tries) 
                              Values('$USERNAME',$GAMES_PLAYED,$CONTOR,$CONTOR)");
fi




