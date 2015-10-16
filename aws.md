# aws

    AWS_ACCESS_KEY_ID= your-key \
        AWS_SECRET_ACCESS_KEY=your-secret \
        aws some-command

# s3

## Download

    aws s3 sync --region your-region s3://your-bucket destination/path

## Get region

    aws s3api get-bucket-location --bucket your-bucket-name
