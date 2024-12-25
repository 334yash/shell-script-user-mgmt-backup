#!/bin/bash

# Colors for output
GREEN="\e[32m"
RED="\e[31m"
NC="\e[0m" # No Color

# Backup directory
BACKUP_DIR="/var/backups"
echo -e "${GREEN}Shell Script for User Management and Backup${NC}"
echo "1. Add User"
echo "2. Delete User"
echo "3. List Users"
echo "4. Backup Files/Directories"
echo "5. Exit"
read -p "Enter your choice: " choice
case $choice in
1)
    # Add User
    read -p "Enter username to add: " username
    sudo useradd $username && echo -e "${GREEN}User $username added successfully!${NC}" || echo -e "${RED}Failed to add user.${NC}"
    ;;
2)
    # Delete User
    read -p "Enter username to delete: " username
    sudo userdel $username && echo -e "${GREEN}User $username deleted successfully!${NC}" || echo -e "${RED}Failed to delete user.${NC}"
    ;;
3)
    # List Users
    echo -e "${GREEN}Listing all users:${NC}"
    cat /etc/passwd | grep "/home" | cut -d: -f1
    ;;
4)
    # Backup Files/Directories
    read -p "Enter the file/directory path to backup: " path
    if [ -e $path ]; then
        tar -czvf "$BACKUP_DIR/backup_$(date +%Y%m%d%H%M%S).tar.gz" $path && echo -e "${GREEN}Backup completed successfully!${NC}"
    else
        echo -e "${RED}Invalid path. Backup failed.${NC}"
    fi
    ;;
5)
    echo -e "${GREEN}Exiting...${NC}"
    exit 0
    ;;
*)
    echo -e "${RED}Invalid choice!${NC}"
    ;;
esac

