# MySQL Backup Script

This repository contains a script to back up a MySQL database on an Ubuntu server, schedule the backup to run every 7 days using cron, and push the backups to a GitHub repository.

## Prerequisites

- MySQL server
- Git
- AWS CLI (optional, for uploading backups to AWS S3)

## Installation

1. **Install Required Tools**

   Ensure `mysqldump` and Git are installed:

   ```sh
   sudo apt update
   sudo apt install mysql-client git

## Usage

1. **Make the file Executable**
     
     ```sh
     chmod +x /path/to/backup_and_push.sh


2. **Test the sql.backup.sh**
     Ensure `shell script` is Properly working
     
     ```sh
        /path/to/backup_and_push.sh

3. **Scheduling the Backup with Cron**

    1. **Open Crontab Editor**

        ```sh 
            crontab -e

    2. **Add Cron Job**
        Add the following line to schedule the backup script to run every 7 days at 2 AM:

        ```sh 

            0 2 */7 * * /home/your_user/backup_and_push.sh
    3. **Save and Exit**


### Suggestions:
**a.** Verify the cron job by checking the creation of the backup file and the Git commit.

**b.** Use email notifications in crontab for success/failure alerts by adding `MAILTO="your_email@example.com"` at the top of the crontab file.


     