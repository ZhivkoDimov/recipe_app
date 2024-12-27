import 'package:aws_sdk/aws_sdk.dart';

Future<List<Map<String, dynamic>>> queryDynamoDB(
    String tableName, String keyConditionExpression, Map<String, dynamic> expressionAttributeValues) async {
  
  // Skoða docs til að klára þetta
  final dynamoDb = DynamoDB(region: 'eu-west-1');

  final params = {
    'TableName': tableName,
    'KeyConditionExpression': keyConditionExpression,
    'ExpressionAttributeValues': expressionAttributeValues,
  };

  try {
    // Perform the query
    final response = await dynamoDb.query(params);
    return response['Items'] as List<Map<String, dynamic>>; 
  } catch (e) {
    print("Error querying DynamoDB: $e");
    return []; 
  }
}
void main() async {
  final items = await queryDynamoDB(
    'cookboo-breakfast',
    'Type = :value',
    {':value': 'Breakfast'},
  );

  print(items);
}
