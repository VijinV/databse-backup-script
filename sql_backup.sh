#!/bin/bash

# Variables
USERNAME="wordpress_user"
PASSWORD="P@55word"
DATABASE="wordpress_db"
BACKUP_DIR="/path/to/backup/directory"
DATE=$(date +%F_%H-%M-%S)
BACKUP_FILE="$BACKUP_DIR/backup-$DATE.sql"
GIT_REPO_DIR="/path/to/your/git/repo"
GIT_BRANCH="main"

# Create backup
mysqldump -u $USERNAME -p$PASSWORD $DATABASE > $BACKUP_FILE
if [ $? -ne 0 ]; then
    echo "mysqldump failed"
    exit 1
fi

# Navigate to the git repository
cd $GIT_REPO_DIR

# Copy backup to the git repository directory
cp $BACKUP_FILE $GIT_REPO_DIR

# Git operations
git add $(basename $BACKUP_FILE)
git commit -m "Database backup: $DATE"
git push origin $GIT_BRANCH
if [ $? -ne 0 ]; then
    echo "Git push failed"
    exit 1
fi

echo "Backup and push to GitHub completed successfully"
