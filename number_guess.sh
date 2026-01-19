#!/bin/bash


echo Enter your username:
read USERNAME

echo Welcome back, <username>! You have played <games_played> games, and your best game took <best_game> guesses.
echo Guess the secret number between 1 and 1000:
read SECRET_NUMBER

echo It's lower than that, guess again:
echo It's higher than that, guess again:
echo That is not an integer, guess again:
echo You guessed it in <number_of_guesses> tries. The secret number was <secret_number>. Nice job!

echo Welcome, <username>! It looks like this is your first time here.
echo Guess the secret number between 1 and 1000:
read SECRET_NUMBER

echo It's lower than that, guess again:
echo It's higher than that, guess again:
echo That is not an integer, guess again:
echo You guessed it in <number_of_guesses> tries. The secret number was <secret_number>. Nice job!
