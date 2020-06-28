# MongoDB

## Get version

    mongo your_db_name --eval='printjson(db.version());'

## Backup create

    mongodump --out=path/to/backup/dir

## Backup restore

    mongorestore path/to/backup/dir

## Batch

Execute via shell/bash script

    mongo your_db_name --eval='printjson(db.serverStatus());'

## REPL

Client interactive connection

    mongo

## XFS or EXT4

<https://docs.mongodb.com/manual/administration/production-notes/#kernel-and-file-systems>

## Database help/list available commands

    mongo your_db_name --eval='printjson(db.help());'

## Databasrs list

    echo "show dbs" | mongo your_db_name

## Database get name

Get current db name

    mongo your_db_name --eval='printjson(db.getName());'

## Stats

Get current db statistics

    mongo your_db_name --eval='printjson(db.stats());'

## Database create or use

    use your_db_name

## Database drop/remove

    mongo your_db_name --eval='printjson(db.dropDatabase());'

## Collections list

    show collections
    echo "printjson(db.getCollectionNames());" | mongo your_db_name

## Collection create

    db.createCollection("your_collection")
    mongo your_db_name --eval="db.createCollection('your_collection')"

## Collection help/list available commands

    mongo your_db_name --eval='printjson(db.your_collection.help());'

## Collection stats/count documents

    mongo your_db_name --eval='printjson(db.your_collection.count());'

## Collection stats/count documents

    mongo your_db_name --eval='printjson(db.your_collection.stats());'

## Collection drop/remove

    mongo your_db_name --eval='printjson(db.your_collection.drop());'
    mongo your_db_name --eval='printjson(db.your_collection.remove());'

## Insert into collection

Insert into collection

    db.your_collection.insert({"foo": "bar"}));

## Insert raw string into collection

    db.your_collection.insert(JSON.parse("{\"foo\": \"bar\"}")));

## Find in collection

    db.your_collection.find({"_id": ObjectId("123456789012345678901234")}));
    printjson(db.your_collection.find({"foo": {$eq: "bar"}}));

## Find highest value in collection

Find greatest value

    db.your_collection.find().sort({yourPropertyName:-1}).limit(1));

## Find lowest value in collection

Find lowest value

    db.your_collection.find().sort({yourPropertyName:1}).limit(1));

## List latest records in collection

List 3 last (tail) records

    db.your_collection.find().sort({$natural:-1}).limit(3));

## List oldest records in collection

List 3 last (tail) records

    printjson(db.your_collection.find().sort({$natural:-1}).limit(3).toArray());

## Update/overwrite whole object

    db.your_collection.update({_id: ObjectId("42")}, {foo: "bar"}));

## Update individual field

    db.your_collection.update({_id: ObjectId("42")}, {$set: {foo: 42}}));

## Upsert

Insert object with id or update/increment individual field

    db.your_collection.update({_id: ObjectId("42")}, {$inc: {count: 1}}, true));

## Update batch

    db.your_collection.update({}, {$set: {foo: 42}}, false, true));

## Strict JSON

Print JSON in strict mode compatible with [JSON RFC](http://www.json.org)

    mongo your_db_name --eval='JSON.stringify(db.your_collection.find().sort({$natural:-1}).limit(3).toArray(), null, 2);'
    mongoexport --db your_db_name --collection your_collection --jsonArray

## GUI

* https://github.com/Studio3T/robomongo
* https://github.com/mongo-express/mongo-express
* https://github.com/azat-co/mongoui
