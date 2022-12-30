resource "aws_cognito_user_pool" "user" {
  name = "User_pool"
  tags = local.common_tags
}
resource "aws_cognito_user_pool" "admin" {
  name = "Admin_pool"
  tags = local.common_tags
}

resource "aws_cognito_user_group" "user" {
  name         = "Usergroup"
  description  = "Usergroup"
  user_pool_id = aws_cognito_user_pool.user.id
}

resource "aws_cognito_user_group" "admin" {
  name         = "Admingroup"
  description  = "Admin users"
  user_pool_id = aws_cognito_user_pool.admin.id
}

resource "aws_cognito_resource_server" "user" {
  name         = "UserResource"
  identifier   = "user"
  user_pool_id = aws_cognito_user_pool.user.id

  scope {
    scope_name        = "get"
    scope_description = "Get access."
  }
}

resource "aws_cognito_resource_server" "admin" {
  name         = "AdminResource"
  identifier   = "admin"
  user_pool_id = aws_cognito_user_pool.admin.id

  scope {
    scope_name        = "any"
    scope_description = "Admin access."
  }

}


resource "aws_cognito_user_pool_client" "user" {
  name         = "user_client"
  user_pool_id = aws_cognito_user_pool.user.id

  generate_secret                      = false
  allowed_oauth_flows                  = ["implicit"]
  allowed_oauth_flows_user_pool_client = true
  allowed_oauth_scopes                 = ["openid"]
  callback_urls                        = ["http://localhost:3000"]
  supported_identity_providers         = ["COGNITO"]
}

resource "aws_cognito_user_pool_client" "admin" {
  name         = var.service_name
  user_pool_id = aws_cognito_user_pool.admin.id

  generate_secret                      = false
  allowed_oauth_flows                  = ["implicit"]
  allowed_oauth_flows_user_pool_client = true
  allowed_oauth_scopes                 = ["openid"]
  callback_urls                        = ["http://localhost:3000"]
  supported_identity_providers         = ["COGNITO"]
}



resource "aws_cognito_user_pool_domain" "user" {
  domain       = "ale-user-domain"
  user_pool_id = aws_cognito_user_pool.user.id
}



resource "aws_cognito_user_pool_domain" "admin" {
  domain       = "ale-admin-domain"
  user_pool_id = aws_cognito_user_pool.admin.id
}