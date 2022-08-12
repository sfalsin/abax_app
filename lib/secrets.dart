// Store this file as lib/secrets.dart
// Generate your own file using https://github.com/pal/simple-counter-server
import 'package:amazon_cognito_identity_dart_2/cognito.dart';

const cognitoUserPoolId = 'us-east-1_JrlwpW3kd';
const cognitoClientId = '2eq8ftf9o909gqmhirvr09joqb';
const cognitoIdentityPoolId = 'us-east-1:eaec6167-9f3a-49b7-ae00-d888bc6a4304';
const awsRegion = 'us-east-1';
const apiEndpoint = 'https://m6ksrg8yd8.execute-api.us-east-1.amazonaws.com/dev2';

final userPool = CognitoUserPool(cognitoUserPoolId, cognitoClientId);