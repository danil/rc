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
    echo "db.getCollectionNames();" | mongo your_db_name

### Create

    db.createCollection("your_collection")
    mongo your_db_name --eval "db.createCollection('your_collection')"

### Count documents

    db.your_collection.stats()

### Remove

    db.your_collection.drop()
