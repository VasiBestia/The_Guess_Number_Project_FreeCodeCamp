# 🎲 Number Guessing Game

![Bash](https://img.shields.io/badge/Shell_Script-121011?style=for-the-badge&logo=gnu-bash&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)
![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)

A command-line interface (CLI) game developed as part of the **freeCodeCamp Relational Database Certification**. The program generates a random number between 1 and 1000 and challenges the user to guess it, while tracking user statistics in a PostgreSQL database.

## 📋 Project Overview

The goal of this project was to create a Bash script that interacts with a PostgreSQL database to maintain persistent user data. The system recognizes returning users, tracks how many games they have played, and records their best performance (fewest guesses).

### Key Features
* **User Authentication:** Identifies users by username.
    * **New Users:** Adds them to the database and welcomes them.
    * **Returning Users:** Retrieves and displays their total games played and best game score.
* **Game Logic:**
    * Generates a random number between 1 and 1000.
    * Provides real-time feedback ("It's lower than that" or "It's higher than that").
    * Validates input to ensure only integers are accepted.
* **Data Persistence:** Automatically updates the user's stats (games played and best game) upon winning.
---
## 🗄️ Database Schema

The project uses a PostgreSQL database named `number_guess` with a normalized table structure to store user statistics.

### `guesser` Table
| Column | Type | Constraints | Description |
| :--- | :--- | :--- | :--- |
| `guesser_id` | SERIAL | PRIMARY KEY | Unique identifier for the user |
| `username` | VARCHAR(22) | NOT NULL | The player's username |
| `games_played` | INT | DEFAULT 0 | Total number of games completed |
| `best_game` | INT | - | Fewest number of guesses to win |
---
## 🚀 How to Run

### Prerequisites
* Linux/Unix Terminal (or WSL)
* PostgreSQL installed and running
* Bash

### 1. Database Setup
Create the database and restore the schema (if using the SQL dump):
```bash
psql -U postgres -c "CREATE DATABASE number_guess;"
psql -U postgres -d number_guess -f number_guess.sql
```
2. Make Executable
Ensure the script has permission to execute:

```bash

chmod +x number_guess.sh
```
3. Start the Game
Run the script from the terminal:

```bash

./number_guess.sh
```
---
### 🎮 Example Gameplay
```plaintext

Enter your username:
> VasiBestia

Welcome back, VasiBestia! You have played 5 games, and your best game took 8 guesses.

Guess the secret number between 1 and 1000:
> 500
It's higher than that, guess again:
> 750
It's lower than that, guess again:
> 600
You guessed it in 3 tries. The secret number was 600. Nice job!
```
---
### 🧠 Technical Highlights
Bash Scripting: Utilized while loops, if/else conditional logic, and read commands for game flow.

Input Validation: Implemented Regex checks (=~ ^[0-9]+$) to handle non-integer inputs gracefully.

SQL Integration: Used psql command-line tools to SELECT, INSERT, and UPDATE records dynamically based on script variables.

Randomization: Generated random integers using the internal $RANDOM variable modulo 1000.

### Created by Vasilescu Alexandru Gabriel for the freeCodeCamp Relational Database Certification.
