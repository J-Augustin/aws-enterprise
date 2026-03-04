output "guardduty_detector_id" {
  description = "Guardduty dectector ID in the security account"
  value       = aws_guardduty_detector.this.id
}