terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = "gen-lang-client-0772730956"
  region  = "europe-west3"
  zone    = "europe-west3-a"
}

# Считываем данные нашей существующей машины
data "google_compute_instance" "my_vm" {
  name = "linuxaome123-new"
  zone = "europe-west3-a"
}

# Выводим её IP для проверки в логах CI/CD
output "vm_public_ip" {
  value = data.google_compute_instance.my_vm.network_interface[0].access_config[0].nat_ip
}
