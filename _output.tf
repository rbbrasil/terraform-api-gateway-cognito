output "app_client_secret" {
  value = aws_cognito_user_pool_client.cognito_user_pool_client.client_secret
  description = "App client secret"
}
