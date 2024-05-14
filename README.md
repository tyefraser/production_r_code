# AWS R SQL Runner

This repository contains scripts to run R code on an AWS EC2 instance and execute SQL files in a specific order.

## Repository Structure
- `scripts/`: Contains SQL scripts to be executed.
- `src/`: Contains the main R script.
- `run.sh`: Shell script to call the R script.
- `README.md`: This file.

## Setup and Usage

1. Ensure you have R installed on your AWS EC2 instance.
2. Clone this repository to your AWS EC2 instance.
3. Make the shell script executable: `chmod +x run.sh`
4. Run the shell script: `./run.sh`