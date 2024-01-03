# NitorAssessmentPortal

> NitorAssessmentPortal is an internal assessment portal for Nitor Infotech Pvt. Ltd.


# Table of contents

* Local application setup guide (One time setup)
  1. [Install Dependencies](#install-dependencies)
  2. [Setup Application](#setup-application)
  3. [Manage Database Migrations](#manage-database-migrations)
  4. [Create superuser](#create-superuser)
  5. [Setup pre-commit hook](#setup-pre-commit-hook) (Optional for now)
* [Running the application](#running-the-application)
* [Generate entity relationship from models](#generate-entity-relationship-from-models)
* [Extras and References](#extras-and-references)


## Install Dependencies
1. [Install Docker version 20.10.22](https://docs.docker.com/engine/install/)
2. [Install docker-compose version v2.15.1](https://docs.docker.com/compose/install/)


## Setup Application

1. Clone the repository, go to the cloned directory using command line
2. Build the image
    ```
    DOCKER_BUILDKIT=0 docker-compose build --no-cache
    ```
3. Run the containers
    ```
    docker-compose up -d
    ```
4. Check if services/containers are up or not using below commands:
    ```
    docker-compose ps
    ```
5. Check logs for each services to see if apps are running within container or not using below command:
    ```
    docker-compose logs service_name_here -f --tail number_of_trail_lines_here
    ```
    e.g. `docker-compose logs web -f --tail 100` to see last 100 lines of web container logs.
6. If already having local postgres database to be migrated to postgres container then follow below steps:
    ```
    # Dump data from local database
    pg_dump -U local_db_username -W -F t local_db_name > data.tar
    # Restore data into postgres container
    cat data.tar | docker exec -i nitorassessmentportal-postgres-1 pg_restore -U postgres_db_username -d postgres_db_name
    ```


## Manage Database Migrations
1. Go to the cloned directory using command line
2. Create new migrations:
    ```
    docker-compose exec web python manage.py makemigrations <rest_of_the_options_here_if_needed>
    ```
2. Check the migrations:
    ```
    docker-compose exec web python manage.py showmigrations <rest_of_the_options_here_if_needed>
    ```
3. Apply the migrations:
    ```
    docker-compose exec web python manage.py migrate <rest_of_the_options_here_if_needed>
    ```


## Create superuser
1. Go to the cloned directory using command line
2. Run below command to create superuser:
    ```
    docker-compose exec web python manage.py createsuperuser
    ```


## Setup pre-commit hook

1. Go to the cloned directory
2. Activate venv if not already done
```
source .venv/bin/activate
```
2. Install the git hook script
```
pre-commit install
```
Validate if getting the result as `pre-commit installed at .git/hooks/pre-commit`

3. After this before every commit command, unit test will run automatically.
4. If you get error: `Executable pytest not found`, please check if virtual environment is activated or not.
5. [Read more on pre-commit](https://pre-commit.com/)


## Running the application

## Running the application
1. Go to the cloned directory using command line
2. Run below command to down the services/containers:
    ```
    docker-compose down
    ```
3. Update .env file as per need. If .env not present please clone .env.example file and create it.
3. Run below command to up the services/containers in detached mode if .env is updated:
    ```
    docker-compose up -d --force-recreate --remove-orphans
    ```
    If .env is not updated then even `docker-compose up -d` is sufficient


## Generate entity relationship from models

1. After setting up the project, go to the cloned directory
2. Activate venv if not already done and go to project app directory
```
source .venv/bin/activate
cd nitoronlinetestportal
```
3. Run below command to generate a `.png` file
```
./manage.py runserver
manage.py graph_models -a -o models.png
```


## Extras and References
1. Restart services `docker-compose restart`
2. [Postman Collection for backend APIs](NitorAssessmentPortal.postman_collection.json)
