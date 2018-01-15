# MongoDB

## Backup

### Create

    mongodump --out=path/to/backup/dir

### Restore

    mongorestore path/to/backup/dir

## Batch

Execute via shell/bash script

    mongo your_db_name --eval 'printjson(db.serverStatus());'

## REPL

Client interactive connection

    mongo

## XFS or EXT4

<https://docs.mongodb.com/manual/administration/production-notes/#kernel-and-file-systems>

## Databases

### List

    echo "show dbs" | mongo your_db_name

### Name

Get current db name

    mongo your_db_name --eval 'printjson(db.getName());'

### Create or use

    use your_db_name

### Remove

    mongo your_db_name --eval 'printjson(db.dropDatabase());'

## Collections

### List

    show collections
    echo "printjson(db.getCollectionNames());" | mongo your_db_name

### Create

    db.createCollection("your_collection")
    mongo your_db_name --eval "db.createCollection('your_collection')"

### Count documents

    mongo your_db_name --eval 'printjson(db.your_collection.stats());'

### Remove

    mongo your_db_name --eval 'printjson(db.your_collection.drop());'

### Insert

Insert into collection

    mongo your_db_name --eval 'printjson(db.your_collection.insert({"foo": "bar"}));'

#### Raw string

    mongo your_db_name --eval 'printjson(db.your_collection.insert(JSON.parse("{\"foo\": \"bar\"}")));'

### Find

    mongo your_db_name --eval 'printjson(db.your_collection.find({"_id": ObjectId("123456789012345678901234")}));'
    mongo your_db_name --eval 'printjson(db.your_collection.find({"foo": {$eq: "bar"}}));'

#### Find highest value

Find greatest value

    mongo your_db_name --eval 'printjson(db.your_collection.find().sort({yourPropertyName:-1}).limit(1));'

#### Find lowest value

Find lowest value

    mongo your_db_name --eval 'printjson(db.your_collection.find().sort({yourPropertyName:1}).limit(1));'

### List

#### Latest records

List 3 last (tail) records

    mongo your_db_name --eval 'printjson(db.your_collection.find().sort({$natural:-1}).limit(3));'

#### Oldest records

List 3 last (tail) records

    mongo your_db_name --eval 'printjson(db.your_collection.find().sort({$natural:-1}).limit(3).toArray());'

## Strict JSON

Print JSON in strict mode compatible with [JSON RFC](http://www.json.org)

    mongo your_db_name --eval 'JSON.stringify(db.your_collection.find().sort({$natural:-1}).limit(3).toArray(), null, 2);'
    mongoexport --db your_db_name --collection your_collection --jsonArray
