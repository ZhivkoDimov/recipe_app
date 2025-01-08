import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> createTable() async {
  final endpoint = 'https://dynamodb.us-east-1.amazonaws.com/';
  final headers = {
    'Content-Type': 'application/x-amz-json-1.0',
    'X-Amz-Target': 'DynamoDB_20120810.CreateTable',
    'Authorization': 'your_aws_signature',
    'x-amz-date': '20231227T000000Z',
  };

  final body = jsonEncode({
    "TableName": "RecipesTable",
    "KeySchema": [
      {
        "AttributeName": "RecipeID",
        "KeyType": "HASH"
      }
    ],
    "AttributeDefinitions": [
      {
        "AttributeName": "RecipeID",
        "AttributeType": "S"
      },
      {
        "AttributeName": "RecipeName",
        "AttributeType": "S"
      }
    ],
    "ProvisionedThroughput": {
      "ReadCapacityUnits": 5,
      "WriteCapacityUnits": 5
    }
  });

  final response = await http.post(
    Uri.parse(endpoint),
    headers: headers,
    body: body,
  );

  if (response.statusCode == 200) {
    print('Table created successfully!');
  } else {
    print('Error: ${response.statusCode} - ${response.body}');
  }
}
