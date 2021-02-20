#!/bin/bash
# Reading lines in /etc/fstab

FILE=/etc/fstab

{
  read line1
  read
  read line3
} < $FILE

echo "First line in $FILE is:"
echo "$line1"

echo

echo "Third line in $FILE is:"
echo "$line3"

exit 0