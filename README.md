# Synthesis Software Technologies' public Cloud Custodian (C7N) AWS Lambda Layer 


[![Build Status](https://travis-ci.org/synthesis-labs/aws-c7n-lambda-layer.svg?branch=master)](https://travis-ci.org/synthesis-labs/aws-c7n-lambda-layer)

This repo outlines some of the details on Synthesis' public Cloud Custodian AWS Lambda Layer. For the latest layer version see the section: [Latest C7N Layer Version](#versions) below.

# What is Cloud Custodian
Cloud Custodian is an open source real-time compliance and cost management product created by Capital One. See [Capital One’s website](https://www.capitalone.io/docs/index.html) for more detail.

# About the Synthesis Software Technologies' public Cloud Custodian AWS Lambda Layer 
To create this layer, we use a Travis CI Pipeline pointing to this GitHub repository which contains the configuration of the pipeline.
The pipeline does the following:

1.	Specifies the version of python to use
2.	Creates a virtual environment with Custodian inside of it
3.	Deploys the virtual environment as a public Lambda layer

This pipeline will be run and updated as critical version changes are made to Custodian, creating a new layer version each time. Our latest layer version will be on this README in the section [Latest C7N Layer Version](#versions). We have made this pipeline visible to you for you to see exactly what we are including in this layer giving you the comfort of knowing what will be in your environment.

# Using the Synthesis Software Technologies' public Cloud Custodian AWS Lambda Layer 
Running a Lambda function using our layer is quite a simple task. First, create your function – this should be a Python 2.7 runtime Lambda with a role you decide to give it.

Once you have your Lambda, you can click on the “Layers” button while previewing your lambda in the Lambda console.

Next, click on the “Add a layer” button and fill in the layer ARN you would like to use from the [Latest C7N Layer Version](#versions) table below   

Once this has been done, your Lambda now has access to our Custodian source files, and you can easily write up your Lambda code to fetch your Custodian policies and run them as you wish. See the section [Custodian Example](#Example)

# Latest C7N Layer Version <a id="versions"></a>
|Date Published | Layer Name | Layer Version | Lambda Arn| Compatable runtime |
|:-----------:|:-----------:|:-----------:|:-----------:|--------:|
| 10/01/2019 | c7n-lambda-layer | 8 | arn:aws:lambda:eu-west-1:459295082152:layer:c7n-lambda-layer:8 | Python 2.7.12 |

# Custodian Example <a id="Example"></a>
Below is an example of how you can run the Custodian command through our AWS Lambda Layer: 

```python
import commands

def lambda_handler(event, context):
    print(commands.getstatusoutput("python /opt/custodian-layer/custodian schema ec2"))
```