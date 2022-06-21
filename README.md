# liquibase-percona docker container
You can use this repository for mysql database migration for your project.
It is using image from dockerhub -> [divanov/liquibase-percona](https://hub.docker.com/r/divanov/liquibase-percona "dockerhub")   with maven and percona-toolkit
liquibase-percona extention from [adangel](https://github.com/adangel/liquibase-percona "github") is added in pom.xml

## Usage:
The container expect you to provied 4 variables (DB_NAME,DB_HOST,DB_USER,DB_PASS) and mount direcotry container all the migrations + the migration changelog.

To run the container you need to do:
```
docker run -e DB_HOST='host' -e DB_NAME='name' -e DB_USER='user' -e DB_PASS='pass' -it -v ./path/to/ur/migration/dir:/liquibase/migrations divanov/liquibase-percona mvn resources:resources liquibase:update -Ptest
```

## What the command do:
1. It starts a container from divanov/liquibase-percona image
2. Adds all files from the repository as a volume
3. Starts maven with the "pom.xml" where are described necessary dependencies and plugins:

>mysql-connector-java -v 8.0.17
>liquibase-maven-plugin -v 3.6.3
>com.github.adangel.liquibase.ext -v 1.6.0

##### Maven builds with the resources from "src/main/migrations" all the changes to the desired database.
Also it is very useful to use this with Gitlab.
Then you can add something like this code in your .gitlab-ci
```
    - mvn resources:resources liquibase:tag -Dliquibase.tag="${CI_JOB_ID}" liquibase:update
```
Where the changes will be tagged with the build and later you can rollback by this tag
```
    - mvn resources:resources liquibase:rollback -Dliquibase.rollbackTag="${CI_JOB_ID}"
```

