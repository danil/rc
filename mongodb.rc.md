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

    db.createCollection("yourCollName")
    mongo your_db_name --eval='db.createCollection("yourCollName');'

## Collection help/list available commands

    mongo your_db_name --eval='printjson(db.yourCollName.help());'

## Collection stats/count documents

    mongo your_db_name --eval='printjson(db.yourCollName.count({yourFldName: {$gt: 42}}));'

## Collection stats/count documents

    mongo your_db_name --eval='printjson(db.yourCollName.stats());'

## Collection drop/remove

    mongo your_db_name --eval='printjson(db.yourCollName.drop());'
    mongo your_db_name --eval='printjson(db.yourCollName.remove());'

## Insert into collection

Insert into collection

    db.yourCollName.insert({"foo": "bar"});

## Insert raw string into collection

    db.yourCollName.insert(JSON.parse("{\"foo\": \"bar\"}"));

## Find in collection

    db.yourCollName.find({"_id": ObjectId("123456789012345678901234")});
    db.yourCollName.find({"foo": {$eq: "bar"}});

## Find highest value in collection

Find greatest value

    db.yourCollName.find().sort({yourFldName:-1}).limit(1);

## Find lowest value in collection

Find lowest value

    db.yourCollName.find().sort({yourFldName:1}).limit(1);

## Find and paginate

    db.yourCollName.find().limit(1).skip(1);

## Find and select specific fields

    db.yourCollName.find({}, {_id: 0, yourFldName: 1});

## Sort ascending

    db.yourCollName.find().sort({yourFldName: 1});

## Sort descending

    db.yourCollName.find().sort({yourFldName: -1});

## List latest records in collection

List 3 last (tail) records

    db.yourCollName.find().sort({$natural:-1}).limit(3);

## List oldest records in collection

List 3 last (tail) records

    db.yourCollName.find().sort({$natural:-1}).limit(3).toArray();

## Update/overwrite whole object

    db.yourCollName.update({_id: ObjectId("42")}, {foo: "bar"});

## Update individual field

    db.yourCollName.update({_id: ObjectId("42")}, {$set: {foo: 42}});

## Upsert

Insert object with id or update/increment individual field

    db.yourCollName.update({_id: ObjectId("42")}, {$inc: {yourFldName: 1}}, true);

## Update batch

    db.yourCollName.update({}, {$set: {foo: 42}}, false, true);

## Strict JSON

Print JSON in strict mode compatible with [JSON RFC](http://www.json.org)

    mongo your_db_name --eval='JSON.stringify(db.yourCollName.find().sort({$natural:-1}).limit(3).toArray(), null, 2);'
    mongoexport --db your_db_name --collection yourCollName --jsonArray

## GUI

* https://github.com/Studio3T/robomongo
* https://github.com/mongo-express/mongo-express
* https://github.com/azat-co/mongoui
