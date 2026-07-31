
resource "null_resource" "install_nginx" {

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

  provisioner "remote-exec" {
    inline = [
      "echo Connected Successfully",
      "sudo apt update",
      "sudo apt install -y nginx",
      "sudo systemctl enable nginx",
      "sudo systemctl start nginx",
      "sudo systemctl status nginx --no-pager"
    ]
  }
}