resource "aws_db_instance" "mysql"{
    engine = var.engine_name
    engine_version = var.engine_version
    instance_class = var.instance_class
    allocated_storage = var.allocated_storage
    storage_type = var.storage_type
    identifier = var.identifier
    username = var.username
    password = var.password
    publicly_accessible = var.publicly_accessible
    skip_final_snapshot = var.publicly_accessible

    tags = {
      Name = "RDSdb"
    }
}