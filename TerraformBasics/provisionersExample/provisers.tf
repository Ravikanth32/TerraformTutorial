# resource "null_resource" "dummy_resource" {
#   provisioner "local-exec" {
#     command = "echo 'Hello' > status.txt"

#   }
# #   provisioner "local-exec" {
# #     when    = destroy
# #     command = "echo 'Hello' > status.txt"
# #   }

# connection {
#         type = "ssh"
#         host = aws_instance.web.public_ip
#         user = "ec2-user"
#         private_key = file("RaviAccount.pem")
#       }
#   provisioner "file" {
#       source = "status.txt"
#       destination = "/tmp/status.txt"
#   }

#   provisioner "remote-exec" {
      
#       inline = [
#         "echo 'Hello' > tmp/status1.txt"
#       ]
    
#   }

#   depends_on = [aws_instance.web]

# }
