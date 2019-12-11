# Configura o Provider Google Cloud com o Projeto

provider "google" {
  credentials = file("/vagrant/turma03-infraagil1-5e02e262e35b.json")
  project     = var.variable_project_id
  region      = var.variable_region
}

# Cria uma VM com o Google Cloud
resource "google_compute_instance" "helloworld" {
  name         = "estagiario"
  machine_type = var.variable_micro
  zone         = var.variable_zone
  
   # Defini a Imagem da VM
  boot_disk {
    initialize_params {
      image = var.variable_image_micro
    }
  }

  # Habilita rede para a VM com um IP público
  network_interface {
    network = "default"
    access_config {
    }
  }

}


# Cria SQL Gerenciado com Engine MySQL 
resource "google_sql_database_instance" "helloworld" {
  name             = var.variable_name_database
  database_version = var.variable_version_database
  region           = var.variable_region

  settings {
    tier = var.variable_micro_database
  }
}