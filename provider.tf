# Configura o Provider Google Cloud com o Projeto

provider "google" {
  credentials = file("/vagrant/turma03-infraagil1-5e02e262e35b.json")
  project     = var.variable_project_id
  region      = var.variable_region
}
