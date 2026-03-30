🔹 Project Overview

This project demonstrates a complete Kubernetes-based deployment of a WordPress application with MySQL database, implementing production-grade DevOps practices including:

Namespaces for isolation
Secrets and ConfigMaps for configuration
StatefulSets for MySQL
Persistent Volumes for data storage
Deployments for WordPress
Services (ClusterIP, NodePort, Headless)
Horizontal Pod Autoscaling (HPA)
Resource requests/limits
Health probes
Helm (package management)
🏗️ Architecture

Include an architecture diagram:

👉 (You can create using draw.io or similar)

Example components:

User → NodePort Service → WordPress Pods
WordPress Pods → MySQL Headless Service → StatefulSet Pods
MySQL Pods → PVC → PersistentVolume
⚙️ Tech Stack
Kubernetes (Kind cluster)
kubectl
Helm
WordPress (frontend)
MySQL (backend)
Metrics Server (for HPA)
📦 Features Implemented
Namespace isolation (capstone)
Secure credentials using Secrets
Configurable environment using ConfigMaps
Stateful database using StatefulSet
Persistent storage using PVC
External access via NodePort
Internal service discovery via Headless Service
Autoscaling using HPA (CPU 50%)
Resource management (CPU/memory limits)
Liveness & readiness probes
Scalable deployment architecture
🚀 Deployment Steps
# Create namespace
kubectl apply -f manifests/namespace.yaml

# Apply secrets & config
kubectl apply -f manifests/secret.yaml
kubectl apply -f manifests/configmap.yaml

# Deploy MySQL
kubectl apply -f manifests/mysql-pv.yaml
kubectl apply -f manifests/mysql-pvc.yaml
kubectl apply -f manifests/mysql-headless-svc.yaml
kubectl apply -f manifests/mysql-statefulset.yaml

# Deploy WordPress
kubectl apply -f manifests/wordpress-deployment.yaml
kubectl apply -f manifests/wordpress-service.yaml

# Apply HPA
kubectl apply -f manifests/hpa.yaml
📊 Verification
kubectl get all -n capstone
kubectl get pvc -n capstone
kubectl get hpa -n capstone
🔥 Load Testing (Autoscaling Demo)
kubectl run load-generator -n capstone --image=busybox -it -- /bin/sh
while true; do wget -q -O- http://wordpress-svc.capstone.svc.cluster.local; done
🧨 Cleanup
kubectl delete namespace capstone
🧠 4. Key Learning Outcomes (Important for recruiters)
Kubernetes workload types (Deployment vs StatefulSet)
Storage in Kubernetes (PVC, PV)
Service discovery (ClusterIP, NodePort, Headless)
Autoscaling using HPA
Observability via Metrics Server
Configuration management using ConfigMaps & Secrets
Real-world app deployment architecture
🖼️ 5. Architecture Diagram

Include a diagram in your repo:

You can describe it like:

Internet → NodePort Service → WordPress Pods
                           ↓
                   MySQL Headless Service
                           ↓
                     StatefulSet Pods
                           ↓
                         PVC → PV


Resume Bullet (Bonus)

You can include this in your resume:

Built and deployed a full-stack WordPress application on Kubernetes using Deployments and StatefulSets with persistent storage, implemented autoscaling using HPA, configured Services (ClusterIP, NodePort, Headless), and managed secrets/configurations using ConfigMaps and Secrets.