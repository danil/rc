# MongoDB

    mongo

## Databases

### List

    show dbs

### Create of use

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
