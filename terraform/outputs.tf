output "cognito_pool_id_admin" {
  value = aws_cognito_user_pool.admin.id
}
output "cognito_pool_id" {
  value = aws_cognito_user_pool.user.id
}


output "cognito_client_id_user" {
  value = aws_cognito_user_pool_client.user.id
}

output "cognito_client_id" {
  value = aws_cognito_user_pool_client.admin.id
}


output "cognito_url" {
  value = "https://${aws_cognito_user_pool_domain.user.domain}.auth.${var.aws_region}.amazoncognito.com"
}

output "cognito_url_admin" {
  value = "https://${aws_cognito_user_pool_domain.admin.domain}.auth.${var.aws_region}.amazoncognito.com"
}

output "lambda_dynamo_url" {
  value = aws_lambda_function.dynamo.invoke_arn
}

output "api_url" {
  value = aws_api_gateway_deployment.this.invoke_url
}

