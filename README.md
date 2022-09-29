# shuff.io API

This project is the API that powers [shuff.io](https://shuff.io). The tech stack includes:
 - [Ruby](https://www.ruby-lang.org/en/)
 - [Grape](http://github.com/ruby-grape/grape)
   - [Grape Starter](https://github.com/LeFnord/grape-starter)
   - [Grape Swagger](http://github.com/ruby-grape/grape-swagger)
 - [Active Record](https://github.com/rails/rails/tree/main/activerecord)
 - [Redoc](https://github.com/Redocly/redoc)


## Usage

You'll need Ruby 3.1.2 installed. [asdf](https://github.com/asdf-vm) is recommended to install Ruby versions. Development can instead be done within Docker containers (more details coming soon). Once Ruby is installed, install dependencies by running `./script/setup` or `bundle install`.

Grape Starter gives us some scripts to simplify development. We should update these to suit our needs, along with adding more.

#### `Setup`

```
$ ./script/setup
```

Installs dependencies

#### `Test`

```
$ ./script/test
```

Runs tests

#### `Run`

```
$ ./script/server *port (default: 9292)
```
and go to: [http://localhost:port/doc](http://localhost:9292/doc)
to access the OAPI documentation.

For production, set `RACK_ENV=production`
```
$ RACK_ENV=production ./script/server *port (default: 9292)
```

#### `Update`

```
$ ./script/update
```

Updates dependencies

#### `Stop`

```
$ ./script/stop
```

Stops server if run in production mode

## Rake Tasks

#### List Routes

```
rake routes
```

#### OpenApi Documentation and Validation

```
rake oapi:fetch
rake oapi:validate
```
comming from: [`grape-swagger` Rake Tasks](https://github.com/ruby-grape/grape-swagger#rake-tasks)

## Docker

- build: `docker build -t shuffio_api .`
- run: `docker run -it -p 9292:9292 --rm shuffio_api`
