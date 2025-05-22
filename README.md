# Sausage Store

![image](https://user-images.githubusercontent.com/9394918/121517767-69db8a80-c9f8-11eb-835a-e98ca07fd995.png)

## 🧩 Stack

- **Frontend:** Vue.js / NGINX
- **Backend:** Go (reporting service), Java Spring Boot (sausage-store)
- **Databases:** PostgreSQL, MongoDB
- **Infrastructure:** Kubernetes, Helm, Docker, GitHub Actions CI/CD
- **Monitoring & Autoscaling:** Metrics-server, HPA, VPA

---

## 🚀 Deployment

Проект разворачивается в Kubernetes с помощью Helm-чартов и CI/CD пайплайна через GitHub Actions.

**Продакшн-домен:**  
➡ [https://front-korney1978.2sem.students-projects.ru](https://front-korney1978.2sem.students-projects.ru)

---

## 📦 Установка вручную (локально через Helm)

1. Установить зависимости:
   - [Helm](https://helm.sh/)
   - [kubectl](https://kubernetes.io/)
   - Kubernetes-кластер с установленным metrics-server

2. Установить Helm-чарт:

```bash
helm upgrade --install sausage-store ./sausage-store-chart \
  -n r-devops-magistracy-project-2sem-36310026