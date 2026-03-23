🧠 Kubernetes Learning Summary (Today)

🔹 1. Pods & YAML Basics
Created Pods using YAML
Understood structure:
apiVersion
kind
metadata
spec
Learned common mistakes:
Wrong indentation ❌
Missing fields like image ❌

🔹 2. BusyBox (Debugging Tool)
Lightweight container used for:
Testing DNS
Running shell commands
Example:
kubectl run dns-test --image=busybox --rm -it -- sh

🔹 3. Labels & Selectors (VERY IMPORTANT 🔥)
Labels = identity of Pods
Services use selectors to find Pods

👉 Key learning:

If labels don’t match → Service won’t work


🔹 4. Kubernetes Services (Core Concept)
✅ ClusterIP
Default service type
Works only inside cluster
✅ NodePort
Exposes app using:
<NodeIP>:NodePort

👉 Your learning:

Doesn’t work directly in Kind/WSL
Use port-forward instead ✅
✅ LoadBalancer
Used in cloud (AWS/GCP/Azure)
Provides external IP

👉 Your learning:

Shows <pending> locally
Because no cloud provider ❌

🔹 5. Port Forwarding (VERY IMPORTANT)
kubectl port-forward service/my-app-nodeport 8080:80

👉 Learned:

Local port → Cluster service → Pod
Used for testing/debugging
Must match targetPort (container port)

🔥 6. Real Debugging Skill (MOST VALUABLE)

You debugged a real issue:

❌ Problem:

Service was pointing to wrong port (30080)

✅ Fix:

Corrected targetPort: 80

👉 Key takeaway:

Kubernetes may show everything “Running” but still fail due to config issues


🔹 7. Endpoints Concept
kubectl get endpoints

👉 Learned:

Shows actual Pod IP + port
Best way to debug Service issues

🔹 8. DNS in Kubernetes

Tested inside BusyBox:

nslookup web-app-clusterip

👉 Learned:

Short name works inside namespace
Full DNS:
service.namespace.svc.cluster.local

🔹 9. Service Hierarchy (IMPORTANT)
ClusterIP → NodePort → LoadBalancer

👉 Learned:

LoadBalancer includes both NodePort + ClusterIP

🔹 10. Key Commands Mastered 💪
kubectl apply -f
kubectl get pods/services
kubectl describe
kubectl port-forward
kubectl exec
kubectl logs
kubectl get endpoints
🎯 Final Understanding (Big Picture)

You now understand:

User → Service → Pod → Container

And how traffic flows in Kubernetes 🚀