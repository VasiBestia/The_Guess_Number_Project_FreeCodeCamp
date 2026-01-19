#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
THE_GUESS_NUMBER=$(( ( RANDOM % 1000 )  + 1 ))


echo Enter your username:
read USERNAME

CHECKER_USERNAME=$($PSQL "Select 1 From guesser Where username='$USERNAME'")

if [[ -z $CHECKER_USERNAME ]]
then

echo Welcome, $USERNAME! It looks like this is your first time here.
echo Guess the secret number between 1 and 1000:
read SECRET_NUMBER

echo It's lower than that, guess again:
echo It's higher than that, guess again:
echo That is not an integer, guess again:
echo You guessed it in <number_of_guesses> tries. The secret number was <secret_number>. Nice job!

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




