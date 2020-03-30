resource "aws_cognito_user_pool" "cognito_user_pool" {
    name = var.cognito_user_pool_name
}

resource "aws_cognito_resource_server" "cognito_resource_server" {
    name = var.cognito_resource_server_name
    identifier = var.cognito_resource_server_identifier
    user_pool_id = aws_cognito_user_pool.cognito_user_pool.id

    scope {
        scope_name = "all"
        scope_description = "Access to all API endpoints"
    }
}

resource "aws_cognito_user_pool_client" "cognito_user_pool_client" {
    name = var.cognito_user_pool_client_name
    user_pool_id = aws_cognito_user_pool.cognito_user_pool.id

    allowed_oauth_flows = ["client_credentials"]
    allowed_oauth_flows_user_pool_client = true
    allowed_oauth_scopes = aws_cognito_resource_server.cognito_resource_server.scope_identifiers
    generate_secret = true
}

resource "aws_cognito_user_pool_domain" "cognito_user_pool_domain" {
    domain = var.cognito_user_pool_domain_name
    user_pool_id = aws_cognito_user_pool.cognito_user_pool.id
}
