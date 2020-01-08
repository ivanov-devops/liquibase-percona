#!/bin/bash


CONFIG=${CONFIG:-"/liquibase/filters/test.properties"}
DB_HOST=${DB_HOST:-"mysql"}
DB_NAME=${DB_NAME:-"database"}
DB_USER=${DB_USER:-"user"}
DB_PASS=${DB_PASS:-"pass"}

echo "db.url=jdbc:mysql://${DB_HOST}/${DB_NAME}" > $CONFIG
echo "db.username=${DB_USER}" >> $CONFIG
echo "db.password=${DB_PASS}" >> $CONFIG
echo "changeLogFile=/liquibase/migrations/changelog-master.xml" >> $CONFIG
echo "driver=com.mysql.cj.jdbc.Driver" >> $CONFIG
echo "outputChangeLogFile=/liquibase/liquibase-outputChangeLog.xml" >> $CONFIG
echo "diffChangeLogFile=/liquibase/resources/liquibase-diff.xml" >> $CONFIG

