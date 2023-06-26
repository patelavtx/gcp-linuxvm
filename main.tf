data "http" "ip" {
  url = "https://ifconfig.me"
}

# Bootstrapping Script to Install Apache
data "template_file" "linux-metadata" {
template = <<EOF
sudo apt-get update; 
sudo apt-get install -y apache2;
sudo systemctl start apache2;
sudo systemctl enable apache2;
EOF
}

# Firewall filters
# Allow http
resource "google_compute_firewall" "allow-http" {
  name    = "${var.vm_name}-fw-allow-http"
  network = var.vpc_name
  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
  
  source_ranges = ["0.0.0.0/0"]
  target_tags = ["http"] 
}
# allow ssh
resource "google_compute_firewall" "allow-ssh" {
  name    = "${var.vm_name}-fw-allow-ssh"
  network = var.vpc_name
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags = ["ssh"]
  # allow icmp
}
resource "google_compute_firewall" "allow-icmp" {
  name    = "${var.vm_name}-fw-allow-icmp"
  network = var.vpc_name
  allow {
    protocol = "icmp"
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags = ["icmp"]
}


# Create VM
resource "google_compute_instance" "vm_instance_public" {
  name         = var.vm_name
  machine_type = var.linux_instance_type
  zone         = var.gcp_zone
  tags         = ["ssh","http", "icmp"]
  boot_disk {
    initialize_params {
      image = var.ubuntu_2004_sku
    }
  }
  metadata_startup_script = data.template_file.linux-metadata.rendered
  network_interface {
    network       = var.vpc_name
    subnetwork    = var.network_subnet_name
    access_config { }
  }
}


