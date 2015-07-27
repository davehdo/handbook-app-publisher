# Introduction
Organizes content for display in a mobile app, specifically [Agile web-widget](https://github.com/davehdo/agilemd-widget-custom). The content from this app is accessible as a JSON API.

# Getting started

## Run Mongodb
```
$ mkdir data
$ echo 'mongod --bind_ip=$IP --dbpath=data --nojournal --rest "$@"' > mongod
$ chmod a+x mongod
```

You can start mongodb by running the mongod script on your project root:
```
$ ./mongod
```

## Run rails server
```rails s```

## Point external application to use these data
Access modules
```
GET /folders.json
```

Access document
```
GET /docs/234.json
```