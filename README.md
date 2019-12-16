# liquibase-percona
You can use this repository for mysql database migration for your project.
It is using image from dockerhub -> https://hub.docker.com/r/divanov/liquibase-percona with maven and percona-toolkit  
liquibase-percona extention from https://github.com/adangel/liquibase-percona is added in pom.xml
USAGE:
1. Edit file "src/main/filters/test.properties" with your database settings
2. Edit file "src/main/migrations/changelog-master.xml". It should contains all changesets files for the migration. 
There is an example "changelog-master.xml" file.
3. Edit/add your changes in files "src/main/migrations/changesets/". There are two example files
2. Download the image divanov/liquibase-percona with "docker pull divanov/liquibase-percona"
3. Run from command line "docker run -it -v `pwd`/liquibase-percona:/liquibase divanov/liquibase-percona mvn resources:resources liquibase:update -Ptest"

What the command do:
it starts a container from divanov/liquibase-percona image
adds all files from the repository as a volume
starts maven with the "pom.xml" where are described necessary dependencies and plugins:
mysql-connector-java -v 8.0.17
liquibase-maven-plugin -v 3.6.3
com.github.adangel.liquibase.ext -v 1.6.0

Maven builds with the resources from "src/main/migrations" all the changes to the desired database.
