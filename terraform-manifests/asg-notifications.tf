resource "aws_sns_topic" "myasg_sns_topic" {
  name = "${local.name}-${random_pet.this.id}"

}
resource "aws_sns_topic_subscription" "myasg_sns_topic_subscription" {
  endpoint  = "mkh_noori@yahoo.com"
  protocol  = "email"
  topic_arn = aws_sns_topic.myasg_sns_topic.arn
}
resource "aws_autoscaling_notification" "myasg_notification" {
  group_names = [aws_autoscaling_notification.myasg_notification]
  notifications = [
    "autoscaling:EC2_INSTANCE_LAUNCH",
    "autoscaling:EC2_INSTANCE_TERMINATE",
    "autoscaling:EC2_INSTANCE_LAUNCH_ERROR",
    "autoscaling:EC2_INSTANCE_TERMINATE_ERROR",
  ]
  topic_arn = aws_sns_topic.myasg_sns_topic.arn
}