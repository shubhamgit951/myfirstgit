resource "null_resource" "copy_image" {

  depends_on = [
    azurerm_linux_virtual_machine.vm
  ]

  connection {
    type        = "ssh"
    host        = azurerm_public_ip.pip.ip_address
    user        = var.admin_username
    private_key = file("/Users/shubhamsingh/.ssh/id_rsa")
    timeout     = "5m"
  }

  provisioner "file" {
    source      = "/Users/shubhamsingh/Downloads/photo.jpg"
    destination = "/home/azureuser/background1.jpg"
  }

}