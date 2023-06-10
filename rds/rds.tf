resource "aws_db_instance" "base_rds" {
    allocated_storage = 10
    db_name           = "demodb"
    engine            = "mysql"
    engine_version    = "5.7"
    instance_class    = "db.t2.micro"
    backup_retention_period = 7
    username          = var.DB_USERNAME
    password          = var.DB_PASSWORD
    parameter_group_name = "default.mysql5.7"
    skip_final_snapshot = true
}


resource "aws_db_instance" "base_replica" {
    replicate_source_db        = aws_db_instance.base_rds.identifier
    auto_minor_version_upgrade = true
    backup_retention_period    = 7
    identifier                 = "replica"
    instance_class             = "db.t2.micro"
    multi_az                   = true
    skip_final_snapshot        = true
    storage_encrypted          = true

    timeouts {
        create = "60m"
        update = "60m"
        delete = "60m"
    }
}

resource "aws_db_instance" "base_replica_multi_az" {
    replicate_source_db        = aws_db_instance.base_rds.identifier
    auto_minor_version_upgrade = true
    backup_retention_period    = 7
    identifier                 = "replica-mutli-az"
    instance_class             = "db.t2.micro"
    multi_az                   = false
    skip_final_snapshot        = true
    storage_encrypted          = true

    timeouts {
        create = "60m"
        update = "60m"
        delete = "60m"
    }
}
