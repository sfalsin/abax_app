// Store this file as lib/secrets.dart
// Generate your own file using https://github.com/pal/simple-counter-server
import 'package:amazon_cognito_identity_dart_2/cognito.dart';

const cognitoUserPoolId = 'us-east-1_HCFNQMCRU';
const cognitoClientId = '5ohdinif711vcn39e01071hskg';
const cognitoIdentityPoolId = 'us-east-1:eaec6167-9f3a-49b7-ae00-d888bc6a4304';
const awsRegion = 'us-east-1';
const apiEndpoint = 'https://5k0ipkngs5.execute-api.us-east-1.amazonaws.com/staging';

final userPool = CognitoUserPool(cognitoUserPoolId, cognitoClientId);