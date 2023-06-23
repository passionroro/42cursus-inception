#!/bin/sh

eval "$(cat /usr/local/bin/db_create.sql)" | mariadb

/usr/bin/mysql_safe

