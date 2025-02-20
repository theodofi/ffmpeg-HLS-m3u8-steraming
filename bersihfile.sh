#!/bin/bash
find /var/www/html/live -mmin +3  -type f -name "*.ts" -exec rm -f {} \;

