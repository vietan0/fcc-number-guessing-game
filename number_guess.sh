#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guessing_game -t --no-align -c"

echo "Enter your username:"
read USERNAME

# welcome line
USER=$($PSQL "SELECT * FROM users WHERE username = '$USERNAME'")

if [[ -z $USER ]]; then
  # new user
  INSERT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  USER=$($PSQL "SELECT * FROM users WHERE username = '$USERNAME'")

  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  # existing user
  echo $USER | while IFS="|" read USERNAME GAMES_PLAYED BEST_GAME; do
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  done
fi

ANSWER=$(($RANDOM % 1000))
# echo "Answer is $ANSWER"

GUESS_COUNT=0

while [[ GUESS -ne ANSWER ]]; do
  # if block below is only for echo prompt
  if [[ GUESS_COUNT -eq 0 ]]; then
    # first guess
    echo "Guess the secret number between 1 and 1000:"
  else
    # every guesses after that
    if [[ ! $GUESS =~ ^[0-9]+$ ]]; then
      # not integer case
      echo "That is not an integer, guess again:"
    else
      # valid integer
      if [[ GUESS -lt ANSWER ]]; then
        echo "It's higher than that, guess again:"
      else
        echo "It's lower than that, guess again:"
      fi
    fi
  fi
  read GUESS
  ((GUESS_COUNT = GUESS_COUNT + 1))
done

echo "You guessed it in $GUESS_COUNT tries. The secret number was $ANSWER. Nice job!"

# update tables
INSERT_GAME=$($PSQL "INSERT INTO games(answer, guess_count, username) values($ANSWER, $GUESS_COUNT, '$USERNAME')")
UPDATE_USER=$($PSQL "UPDATE users SET games_played = games_played + 1 WHERE username = '$USERNAME'")
BEST_GAME=$($PSQL "SELECT MIN(guess_count) FROM games WHERE username = '$USERNAME'")
UPDATE_BEST_GAME=$($PSQL "UPDATE users SET best_game = $BEST_GAME WHERE username = '$USERNAME'")
