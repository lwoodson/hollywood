## Hollywood POC Project

Playground for a complexish enterprise rails demo app.  Want to demonstrate
various techniques of enterprise architecture -- engines, SOA, etc...

## What Is The App
The application very sillily models hollywood.  There are movies and actors
and castings that link the two.  More specifically:

### Model
* Movies
** Have a title, description, production start, production finish and premiere
date
** Have a list of castings that includes all actors that have been cast in roles
* Actor
** Have a first name & last name
** Have a list of castings that covers their castings in the past and future
* Casting
** Join between a movie and an actor
** Have a role name

### Public Application Features
* Public users will be able to page through lists of movies sorted by premiere
date
* Public users will be able to view details of each movie, including the actors
that have been cast in various roles

### Admin Application Features
* Admin site will be hosted at '/admin'
* Admin site will require authentication
* Admin users will be able to list, create, read & update movies
* Admin users will be able to list, create, read & update actors
* Admin users will be able to associate actors to movies through castings
* Admin users will be allowed to bulk import movie, actor & casting data into
the system via a JSON format

### API Features
* Should allow fetching of movies in the system that includes an id, name and
premier date
* Should allow fetching of actors in the system that includes an id, first name
and last name
* Should allow fetching movie details that includes all movie data, including
castings
* Should allow fetching actor details that includes all actor data, including
castings

### Far Future
* Tool to assist actors in choosing which movies they should pick so as to
earn the most money over the course of their foreseeable carreer
* Public site feature that allows users to choose an actor, and specify a list
of potential upcoming movie projects and determine the best choice of movies
for the actor to make
* The upcoming movie projects will have start & end dates as well as monetary
compensation.
* The system should choose the best selection of movie projects for the actor
so as to maximize their compensation over the time period spanned by the
various movie projects they are considering


## Project strucutre
There are several things within this project...

* *core* The core domain code shared across various applications
* *admin* Rails engine providing the admin application
* *public* Rails engine providing the public site application
* *web* Rails application encompassing mounting the admin and public engines
* *imports* Java service application that mass imports data in JSON import
* *api* Sinatra application exposing a RESTful api of data
* *career_planner* Rails engine providing the career planner feature

## Planning
Look at the [TODO](TODO) file.

## Notes
This is where I will add notes of things I learn while implementing this project

* Rails Engines
** Generate with ```rails plugin new foo --dummy-app=spec/dummy -T```
** Wasted some time trying to get haml layouts to work.  I needed to include
the haml gem in the embedding rails app and things worked like you would
expect.  It does *not* matter if the haml gem is declared as a runtime
dependency of the engine, application.haml will not be picked up by default.

## Questions
These are questions I want to answer

** How can I declare gems to be available for different groups (say pry for dev)
that cascade across projects?

