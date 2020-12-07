reference 
https://aws.amazon.com/jp/blogs/aws/new-for-aws-lambda-container-image-support/


## Use AWS supported base image
```shell script
docker build -t random-letter-for-lambda:original -f ./original.dockerfile .                          
docker run -p 9022:8080 -it --rm random-letter-for-lambda:original
```

```
curl -XPOST "http://localhost:9022/2015-03-31/functions/function/invocations" -d '{}'
```

## Use custome base image
Be sure to install aws-lambda-rie on the host machine beforehand.

```shell script
docker build -t random-letter-for-lambda:custome -f ./custome.dockerfile .                          
docker run -v ~/.aws-lambda-rie:/aws-lambda -p 9022:8080 random-letter-for-lambda:custome
```

```shell script
curl -XPOST "http://localhost:9022/2015-03-31/functions/function/invocations" -d '{}'
```

## Login to AWS ECR
```shell script
aws ecr get-login-password | docker login --username AWS --password-stdin ${IMAGE_URI}
```