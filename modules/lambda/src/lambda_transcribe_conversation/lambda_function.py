def lambda_handler(event, context):
    print(event['Records'][0]['Sns']['Message'])
    message = 'Hello World!'
    return {
        'message' : message
    }