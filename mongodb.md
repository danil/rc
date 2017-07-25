# MongoDB

## Backup

### Create

    mongodump --out=path/to/backup/dir

### Restore

    mongorestore path/to/backup/dir

## Batch

Execute via shell/bash script

    mongo --eval "db.serverStatus()"

## REPL

Client interactive connection

    mongo

## Databases

### List

    echo "show dbs" | mongo your_db_name

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

### Insert

Insert into collection

    db.your_collection.insert({"foo": "bar"})

#### Raw string

    db.your_collection.insert(JSON.parse("{\"foo\": \"bar\"}"))

### Find

    db.your_collection.find({"_id": ObjectId("123456789012345678901234")})
    db.your_collection.find({"foo": {$eq: "bar"}})
