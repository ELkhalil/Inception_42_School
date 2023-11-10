
1 - understanding docker:
------------------------
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
_> you can make your own Docker registry witch is private...(like Gitlab...)

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
    




















