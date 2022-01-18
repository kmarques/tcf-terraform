variable "network" {
  type = object({
    default_subnet_id = string,
    security_groups = list(string)
  })
}

variable "connection_infos" {
  type = object({
    db_name = string,
    user = string,
    pass = string
  })
}

variable "db_engine" {
  type = object({
    engine = string,
    version = string
  })
  default = {
    engine = "mysql",
    version = "8.0"
  }
}

variable "aws_rds_type" {
  default = "db.t2.micro"
}