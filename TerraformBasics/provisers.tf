
resource "null_resource" "dummy_resource" {
  provisioner "local-exec" {
    command = "echo 'Hello'> status.txt"
    
  }

  provisioner "local-exec" {
    when = destroy
    command = "echo 'Hello'> status.txt"
  }
  
}
