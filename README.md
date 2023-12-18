
1 - understanding docker:
--------------------------
->  First of all what is the problem we are trying to solve (i mean why there is a docker...)
        well u must know that there is a problem realeted to the software industry
    problem:
    ----------
        ->  Suppose you are trying to join a new company (suppose it is a product delivery app company)
            they introduce you with the technologies they are using in their app 
            for example:
                backend : PHP, Laravel, PostgreesSQL, PostGIS, and Redis
                Frontend: Javascript and Angular 4
            -> Basically to join the team and be able to work with them you must install the previous plugins and packages.
                - first thing you will face is the installation Errors, version error, compatibility errors...
                - let's go for the worst case scenario u face some issues u ask the teams they forget how they solved it 
                  u must ask more to know the solution and it may not work.
                - downgrade package versions so you can run the app... it's getting even worse. 
            -> After all the previous problems u solved now when you make some changes to the app and ur trying to deploy it for 
               testing, Staging and production... THEY MUST GO THROUGH UR PREVIOUS PROBLEMS...
    What / Why Docker ?
    --------------------
    why that logo ?
        -> suppose you have a cargo ship. to make the delivery they organize the commodities inside something called containers
           the DOCKER in this idea play the role of the Cargo Shp holding container of apps.
    Summury :
        DOCKER :
            -> is a technology that help you transfer your application from one envirenement to another one.

How Docker Works?
-----------------
    docker uses the linux kernel mainly, specifically the Cgroups (constrol groups) 
    Cgroups : they manage kernel ressources (CPU|GPU|RAM|IO...)
    Basically docker tell the kernel through the Cgroups its need of recourses.

    The second thing is NameSpace:
    -------------------------------
    it allows to abstract the container or hide it, it is like using nnamespace in c++.

Part 1:
-------
    -> History and Motivation
    but it work on my machine sir 
    why not ship your machine ?.. this is how docker was born (by shipping the local...)

Containers Motivation:
                    Developement                           |              Deployement
    _> "to get the dev env set up installs                 |    "to deploy ur app on  a server u must install
       x softwares ... and scripts, wait i use windows     |     the dependencies and configure the system, then copy
       well thats differente ..."                          |     the Deployement binary and run it with some options"
                                                           |
    _> "Run docker compose up"                             |      _> Run this container image with these options

_> "you can look at a container as if it is an instance from an image because once an image is running it becomes a container"

Virtualisation  vs Containerisation
_> The big difference is in security and isolation as Virtualisation is very safe because it does not share the operating system
   instead of the Containerisation witch happen to share the same files after all.
_> The speed of containers is very remarkable as it is very light weight.

Docker Hub :
------------
_> is a wharehouse for images but they are public any one can access it and pull it from it.
_> you can make your own Docker rƒegistry witch is private...(like Gitlab...)

DOCKER ARCHITECTURE
-------------------
Server docker daemon(DOCKER ENGINE)    ->      REST API    -> Client docker CLI (command line interface)

DOCKER COMMANDS:
----------------
    "docker rmi imageName/first 3 doigit from id"   -> to remove an image.
    "docker rmi imageName --force"                  -> u can't delete a running image u must use the force option.
    "docker stop ContainerName or id"               -> to stop a running container.
    "docker ps || docker ps --all"                  -> display the current running containers.
    "docker stop ContainerName"                         
    "docker start"                                  -> to run a stoped container.

    Docker run[OPTIONS] IMAGE:[TAG]
        --name      -> to give the image a TAG
        -p          ->
        -d          ->
        -it         ->
        -e          ->

Docker registries ?
---------------------
    _> where images are stored and gets updates so world and community can pull and upload their own (like github with codes)
    EXAMPLES:   docker hub (privare/public)

HOW CAN I MAKE MY OWN DOCKER IMAGE ??
--------------------------------------
    
DOCKER VOLUMES:
----------------
    _> maps files and directories inside container to ones on the host OS.
    _> persists data at container disposal.
    _> USE CASES:
        1 - File Upload
        2 - COnfiguration sync
    
THE PROCESS OF DOCKERIZING AN APP?
------------------------------------

1- do i need to copy all files ?
    _> there is some files u won't need it at all inside the container those files we can place them inside 
       a (.) ignore file .dockerignore -> and tell him what you do not want it to copy.

2- Why did we split "package.json" copy command ?
    _> to outline the files that must be recopied every time and to understand the cash of docker.

Section 3:
----------
    _> using docker in Local Development and Hot-Reload
        once we make the copy of a file the docker is unable to know if we change that file in the host machine 
        as it is already copied to the container. WE SOLVE IT USING HOT_RELOAD
        _> we add a new flag while running docker (Solution)
    _> HOT_RELOAD has an issue -> if anything happened inside the container it will be merrored to the host data.

Docker Volumes:
---------------
volumes inside docker are just processes that are running in memory, if you do not save data inside the drive it will be lost
    -> TWO WAY BINDING
        ($PWD -v)
        _> there is multiple types of volumes we already used the (bind mount = linking two thing between each other) mode 
            witch poped the issue of reflecting a change to the host file.
    _> ONE WAY BINDING
        ($PWD -v:ro)
        _> if something happened inside the container it must not be reflected to my actual host data and at the same time
           keeping the behaivior of HOT_Reload we just add the (:ro) = read only
           still an issue if i delete something from the host it will be deleted inside my container does not make sense.
    _> ANONYMOS VOLUME
        -v $(pwd -v targetDirectory)
        _> to make a repo anonymos and tell the container that there is noting that makes the linking with it
    __>SOLUTION:
        there a lot of issues, the practical way of solving it is very simple we place all important files inside a directory called (src/)
        and after that we will need to bind only this folder

Docker Compose:
----------------
is a docker utility that comes with docker it help manage containers in a smooth and clean way. It is not included in docker itself
it is independent and it has it's own version...
"Docker Compose helps with defining and running multi-container Docker applications. It allows you to specify the services, networks, and volumes in a single file, making it easier to manage complex applications and their dependencies. With a simple configuration, you can deploy and scale your applications consistently across different environments."
    _> create a file called docker-compose.yml
        first thing we must specify the 
        version version: "3"
        services:
            available apps
            container-name: test_App
            volumes:
Basically we are doing the same thing just instead of doing it manually the docker compose simplify that for us
you can even call the docker file from the docker compose.

Environment Variables:
-----------------------
like any program you must include env variables to the runing app you can do that by including it in the docker command
or easily including it inside the docker-compose under the environment variable.
if you have many env variables you can pass them inside a file .env "env_file:"

Docker Environments (Dev, Prod, ...)
------------------------------------
the most commun  way and the docs of docker tell that it is advisable to use the .env file to store ur env variable 
it must be separeted for everything :
    _> docker-compose-ref.yml   -> use it for reference
    _> docker-compose-dev.yml   -> use it for developement version
    _> docker-compose-prod.yml   -> use it for production version
to make thing more cleaner.
    to run docker with a specific file:
    use -> docker-compose -f docker-compose.dev.yml up -d
we can also use a default one for the commun data and use the others for only the changes

Multi-Stage Dockerfile:
-----------------------
we can do the same as the previous by having multiple docker files inside the project. but the better solution is

HOW TO MAKE CONTAINERS COMMUNICATE WITH EACH OTHER 
---------------------------------------------------
docker inpect gives you details and informations about the running container...

_>  docker run -it jturpin/hollywood hollywood -> film hackers console....

Docker :
--------
_> isolated process.

Cgroups:
    kernel limit recources, and keep track 
Namespaces:
    to limit a process access and make it a jail process.
    
docker ps       =>        list the running containers
docker ps -a    ->        list all containers
docker run -it  _>        inter active mode
docker run -d   _>        detach mode
binding the container port 
    docker run -d -p6000:6794

Debugging :
    docker ps
    docker logs [container_id]

docker run -d -p6000:6794 --name test container

use docker exec to get the terminal of your already running container 
    docker exec -it [container] /bin/bash

docker start -> works with containers 
docker run  -> create a container from an image

DOCKER NETWORKING:
----------------------
docker network ls
docker network create mongo-network

Purging All Unused or Dangling Images, Containers, Volumes, and Networks
    Docker provides a single command that will clean up any resources — images, containers, volumes, and networks — that are dangling (not tagged or associated with a container):
        docker system prune
    To additionally remove any stopped containers and all unused images (not just dangling images), add the -a flag to the command:
        docker system prune -a

**********************************************OPENSSL**************************************************

1 - first of all we must init the folder that hold this certificates 
    mkdir -p /etc/nginx/ssl
2 - give this folder the required permissions
    chmod   700 /etc/nginx/ssl


--------------------- CEARTE CERTIFICATE------------------------------------------

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/inception.key \
        -out /etc/nginx/ssl/inception.crt -subj "/C=MA/L=BENGUERIR/O=1337/OU=1337/CN=aelkhali.42.fr/UID=aelkhali"

openssl documentation :
    -x509 option is used togenerate a self-signed certificate.
    -subj "/type0=value0/type1=value1/type2=value2/..."
        each type-value pair represents a component of the distinguished name. The common types include:
        /C=: Country Name (e.g., US for the United States).
        /L=: Locality Name (City).
        /ST=: State or Province Name.
        /O=: Organization Name.
        /OU=: Organizational Unit Name.
        /CN=: Common Name (typically the fully qualified domain name for SSL/TLS certificates).

    -nodes option in OpenSSL is used to indicate that the private key file being created should not be encrypted with a passphrase.
    <Keep in mind that using the -nodes option means that anyone with access to the private key file can use it without providing a passphrase. 
    Therefore, you should be cautious when using unencrypted private keys, especially in production environments or when dealing with sensitive 
    information. If security is a concern, it's generally better to use passphrase-protected private keys and implement secure key management practices.>

----------------------- END CREATING THE CERTIFICATE-----------------------------

now we make nginx ready to accept those keys and use them by telling him to check the new config file

1- create a config file inside -> /etc/nginx/conf.d/test.conf
2- add this two directives to your config file:
    
    ssl_certificate /etc/nginx/ssl/example.crt;
    ssl_certificate_key /etc/nginx/ssl/example.key;
    ssl_protocols TLSv1.2 TLSv1.3;

an example config file to base on :

    server
    {
        listen 443 ssl;
        server_name aelkhali.42.fr;

        ssl_certificate /etc/nginx/ssl/example.crt;
        ssl_certificate_key /etc/nginx/ssl/example.key;
        ssl_protocols TLSv1.3;

        root /var/www/;

        location / {
            root /var/www/;
            index index.php;
        }

        location ~ \.php$ {
            include snippets/fastcgi-php.conf;
            fastcgi_pass wordpress:9000;
        }
    }


Docker Volumes and HOT RELOAD:
-------------------------------
    one of the most important thing in docker is volumes and how we can listen to files changes from the host 
    or from the container itself, and how we can transfer run time data from a running container to our host machine because 
    anything happened to the container (means a prune to the data it holds) suppose we are running a database server contianer we must save this data somewhere...as we know this container is just a running process that uses RAM memory if it stops we will not find anything...

syntax for docker volumes:
    -v  host_directory : container_directory [flag]
    
    -v: to tell docker we will add a volume
    host_directory: used to save or transfer data during run time of container
    container_directory : used to store data inside the container 
    [flag] -> used to tell docker the permission

the first one and it is the famous one it two way binding:
    when we are merroring a folder with the data inside a container for example:
        -v /app/data:/var/http/data
        -v   host_folder:container_data 
    the issue with this is if someone deleted the data folder inside the container and we are listening to it using the two way binding 
    it will be deleted from our host so we must think of limiting this access....

we must limit this full access and this will take us to the new solution -> the one way binding
-> we listen to the container data folder and we limit it's access to the folder we are mirroring the data inside
    example:
        -v /app/data:/var/http/data:ro  -> ro = read only
    now if we are inside the container and inside /var/http/data and we try to delete/create something it will not be possible
        -> this file system has read only access.

-> there still one issue after solving the previous one
    this one is very dangerous what if someone deleted the libraries from the host folder and the app inside the container depends on them this will create 
    a very big problem (container stop)
    this one can be solved by using "anonymos volumes" using the same previous syntax we add another -v to protect the important directories inside the container
    doing it this way:
        -v /app/data:/var/http/data:ro  -> ro -v /var/http/data/important

---> this what answer a very big question why people use such a hirachy to store it's application to make the binding simple
    if we use a src directory to store our app data only and let other thing outside we will make our binding easier and bind
    only the required src folder...

Docker-compose:
---------------
    is just a simple utility, that comes as an extension with docker, it does not do anything that we cannot do
    it just makes our like easier and help us manage and not write big commands to do a simple thing like building and running
    a container.
    without DC we must:
        1- build image manually
        2 - tag it manually
        3 - run a container
        ...
    docker compose simplify this process in a very short command like : docker-compose up

 