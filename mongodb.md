# MongoDB

## Batch

Execute via shell/bash script

    mongo --eval "db.serverStatus()"

## REPL

Client interactive connection

    mongo

## Databases

### List

    show dbs

### Create or use

    use your_db_name

### Remove

    use your_db_name
    db.dropDatabase()

## Collections

### List

    show collections

### Count

    db.your_collection.stats()

### Create

    db.createCollection("your_collection")

### Remove

    db.your_collection.drop()
