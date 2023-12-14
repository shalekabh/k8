swapoff -a
vi /etc/fstab - (make sure swap line is deleted or commented out)
sudo modprobe overlay
sudo modprobe br_netfilter

cat <<EOF | sudo tee /etc/modules-load.d/containerd.conf
overlay
br_netfilter
EOF

cat <<EOF | sudo tee /etc/sysctl.d/99-kubernetes-cri.conf
net.bridge.bridge-nf-call-iptables = 1
net.ipv4.ip_forward = 1
net.bridge.bridge-nf-call-ip6tables = 1
EOF

sudo sysctl --system
sudo apt-get update
sudo apt-get install -y containerd
sudo mkdir -p /etc/containerd
sudo containerd config default | sudo tee /etc/containerd/config.toml
sudo vi /etc/containerd/config.toml

In this section - [plugins."io.containerd.grpc.v1.cri".containerd.runtimes.runc.options] - change this - SystemdCgroup = false to true

sudo systemctl restart containerd
apt-cache policy kubelet | head -n 20
sudo apt update
VERSION=1.20.1-00
sudo apt-get install -y kubectl=$VERSION kubeadm=$VERSION kubelet=$VERSION
sudo apt-mark hold kubelet kubectl kubeadm containerd
sudo systemctl status kubelet.service
sudo systemctl status containerd.service
sudo systemctl enable kubelet.service
sudo systemctl enable containerd.service
