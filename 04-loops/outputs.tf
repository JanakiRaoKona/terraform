output "private_ip" {
  value       = aws_instance.roboshop[0].private_ip
  description = "Output of the EC2 instance"
}