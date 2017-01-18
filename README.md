# Contao for Docker 

## Build or pull

Build with

    $ sudo docker build -t priorist/contao .

or pull straight from the hub

    $ sudo docker pull priorist/contao

## Run

Ensure MySQL server is accessible from within container and run

    $ docker-compose up

Browse to http://localhost/contao/install.php to begin installation.
