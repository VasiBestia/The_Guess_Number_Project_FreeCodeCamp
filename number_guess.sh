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

  while [[ "$SECRET_NUMBER" -ne "$THE_GUESS_NUMBER" ]]
do
   if [[ ! $SECRET_NUMBER =~ ^[0-9]+$ ]]
   then
      echo "That is not an integer, guess again:"
      read $SECRET_NUMBER
      continue
   fi

   if [[ $THE_GUESS_NUMBER -lt $SECRET_NUMBER ]] 
          then 
              echo "It's lower than that, guess again:"
              read SECRET_NUMBER
          elif [[ $THE_GUESS_NUMBER -gt $SECRET_NUMBER ]] 
              then
                  echo "It's higher than that, guess again:"
                  read SECRET_NUMBER
  fi
done
echo You guessed it in number_of_guesses tries. The secret number was secret_number. Nice job!
else
   GAMES_PLAYED=$($PSQL "Select games_played From guesser Where username='$USERNAME'");
   echo Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took <best_game> guesses.
echo Guess the secret number between 1 and 1000:
read SECRET_NUMBER

echo It's lower than that, guess again:
echo It's higher than that, guess again:
echo That is not an integer, guess again:
echo You guessed it in <number_of_guesses> tries. The secret number was <secret_number>. Nice job!

fi




