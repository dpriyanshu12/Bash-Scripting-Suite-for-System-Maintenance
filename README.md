# Bash Maintenance Suite

This project is a collection of Bash scripts designed to automate routine system maintenance tasks on Linux-based systems. It includes scripts for backups, system updates, log monitoring, and more, all organized into day-wise modules for clarity and ease of use.

## Features

- *Automated Backups*: Automate backups of important directories with retention policies.
- *System Updates*: Automatically update and clean system packages.
- *Log Monitoring*: Automatically scan logs for errors or specific patterns.
- *Interactive Menu*: Use a command-line interface to easily choose and run tasks.
- *Modular Design*: Organized into day-wise scripts to clearly separate tasks.

## Project Structure

bash-maintenance-suite/
├── Day1/
│ └── backup.sh # Backup script
├── Day2/
│ └── update_cleanup.sh # Update and cleanup script
├── Day3/
│ └── log_monitor.sh # Log monitoring script
├── Day4/
│ └── menu.sh # Interactive menu script
├── Day5/
│ └── utils.sh # Utility functions used by other scripts
└── logs/ # Directory for storing logs

## Requirements

- *Bash Shell*: The scripts are written in Bash and should be run in a Bash-compatible environment (Linux/WSL).
- *Required Tools*: tar, apt (or any similar package manager), grep, cron

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/<your-username>/bash-maintenance-suite.git
   cd bash-maintenance-suite
