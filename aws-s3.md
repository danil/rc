# aws

## Install

Install command line interface

    pip install awscli

## Authentication/authorization

    AWS_ACCESS_KEY_ID= your-key \
        AWS_SECRET_ACCESS_KEY=your-secret \
        aws some-command

## Username

Default user names
<https://alestic.com/2014/01/ec2-ssh-username>

     OS/Distro       | Official AMI | Legacy / Community / Other AMI
                     | ssh Username |         ssh Usernames
---------------------+--------------+-------------------------------
Amazon Linux         | ec2-user     |
Ubuntu               | ubuntu       | root
Debian               | admin        | root
RHEL 6.4 and later   | ec2-user     |
RHEL 6.3 and earlier | root         |
Fedora               | ec2-user     | root
Centos               | centos       | root
SUSE                 | root         |
BitNami              | bitnami      |
TurnKey              | root         |
NanoStack            | ubuntu       |
FreeBSD              | ec2-user     |
OmniOS               | root         |

## s3

### Buckets list

    aws s3 ls
    aws s3api list-buckets --query 'Buckets[].Name'

### Files list

    aws s3 ls --recursive --human-readable --summarize bucket/path/to/directory

### Cat file

    aws s3 cp s3://bucket/path/to/file -

### Download

    aws s3 sync --region your-region s3://your-bucket destination/path

### Upload public files

    aws s3 cp --recursive --region your-region --acl public-read
              path/to/directory s3://your-bucket

### Upload with symlinks

    aws s3 cp --recursive --follow-symlinks path/to/directory s3://your-bucket

### Remove

#### File

    aws s3 rm s3://your-bucket/path/to/file

#### Directory

    aws s3 rm --recursive s3://your-bucket/path/to/directory

### Get region

    aws s3api get-bucket-location --bucket your-bucket-name
