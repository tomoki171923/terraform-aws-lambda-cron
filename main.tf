resource "aws_cloudwatch_event_rule" "this" {
  name                = var.name
  description         = var.description
  schedule_expression = var.schedule_expression
  is_enabled          = true
  tags                = var.tags
}
resource "aws_cloudwatch_event_target" "this" {
  rule      = aws_cloudwatch_event_rule.this.name
  target_id = "lambda"
  arn       = var.lambda_alias_arn
  input     = var.input
}
resource "aws_lambda_permission" "this" {
  statement_id  = "allow_cloudwatch_${aws_cloudwatch_event_rule.this.name}_to_invoke_${var.lambda_function_name}_${var.lambda_alias_name}"
  action        = "lambda:InvokeFunction"
  function_name = "${var.lambda_function_name}:${var.lambda_alias_name}"
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.this.arn
  lifecycle {
    ignore_changes = [
      function_name,
      qualifier,
      id
    ]
  }
}