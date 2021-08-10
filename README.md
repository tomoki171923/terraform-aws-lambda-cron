# Terraform Module for Cloudwatch-Event to Lambda

Terraform module, which creates AWS cloudwatch event resources to invoke lambda function.

## Usage

~~~
module "lambda_event" {
  source              = "git::https://github.com/tomoki171923/terraform-cloudwatch-event.git"
  name                = "your_event_name"
  description         = "this is the event to invoke your lambda function."
  schedule_expression = "cron(30 3 1,15,30 * ? *)" # 1st/15th/30th, AM 3:30(GMT)
  tags = {
    Terraform    = "true"
    Microservice = "YourMicroservice"
  }
  input                = <<DOC
{
    "id": "abcdefghij"
}
  DOC
  lambda_alias_arn     = "your_lambda_function_alias_arn"
  lambda_alias_name    = "your_lambda_function_alias_name"
  lambda_function_name = "your_lambda_function_name"
}
~~~