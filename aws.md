# aws

## Install

Install command line interface

    pip install awscli

## Authentication/authorization

    AWS_ACCESS_KEY_ID= your-key \
        AWS_SECRET_ACCESS_KEY=your-secret \
        aws some-command

## s3

### Buckets list

    aws s3 ls
    aws s3api list-buckets --query 'Buckets[].Name'

### Files list

    aws s3 ls --recursive --human-readable --summarize path/to/directory

### Download

    aws s3 sync --region your-region s3://your-bucket destination/path

### Upload public files

    aws s3 cp --region your-region --recursive --acl public-read \
        path/to/directory s3://your-bucket

### Get region

    aws s3api get-bucket-location --bucket your-bucket-name
