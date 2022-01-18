resource "aws_db_parameter_group" "default" {
  name   = "rds-pg"
  family = "${var.db_engine.engine}${var.db_engine.version}"

  parameter {
    name  = "character_set_server"
    value = "utf8"
  }

  parameter {
    name  = "character_set_client"
    value = "utf8"
  }
}

resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = [ var.network.default_subnet_id ]

  tags = {
    Name = "RDS subnet group"
  }
}

resource "aws_db_instance" "default" {
  allocated_storage    = 100
  storage_type         = "gp2"
  engine               = var.db_engine.engine
  engine_version       = var.db_engine.version
  instance_class       = var.aws_rds_type
  identifier           = "mydb"
  name                 = var.connection_infos.db_name
  username             = var.connection_infos.user
  password             = var.connection_infos.pass
  parameter_group_name = aws_db_parameter_group.default.id
  db_subnet_group_name = aws_db_subnet_group.default.id
  vpc_security_group_ids = var.network.security_groups
  publicly_accessible  = false
  skip_final_snapshot  = true
  multi_az             = false
}