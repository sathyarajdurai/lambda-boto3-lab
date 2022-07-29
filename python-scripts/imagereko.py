import boto3


def lambda_handler(event, context):
    client = boto3.client("rekoginition")

    for records in event["Records"]:
        bucket_name = record["s3"]["bucket"]["name"]
        image_object = record["s3"]["object"]["key"]
    
    print(bucket_name)
    print(image_object)