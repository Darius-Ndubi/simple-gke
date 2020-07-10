apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: ${_APPLICATION_NAME}-${_APPLICATION_NAMESPACE}
  namespace: ${_APPLICATION_NAMESPACE}
  annotations:
    kubernetes.io/ingress.class: "nginx"
    nginx.ingress.kubernetes.io/force-ssl-redirect: "true"
    cert-manager.io/issuer: "letsencrypt-${_APPLICATION_NAMESPACE}-issuer"
spec:
  tls:
  - hosts:
    - ${_HOST_DOMAIN_WEB}
    - ${_HOST_DOMAIN_API}
  rules:
  - host: ${_HOST_DOMAIN_WEB}
    http:
      paths:
      - backend:
          serviceName: ${_APPLICATION_NAME_WEB}-service-${_APPLICATION_NAMESPACE}
          servicePort: 80
  - host: ${_HOST_DOMAIN_API}
    http:
      paths:
      - backend:
          serviceName: ${_APPLICATION_NAME_API}-service-${_APPLICATION_NAMESPACE}
          servicePort: 80