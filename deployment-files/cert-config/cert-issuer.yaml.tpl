apiVersion: cert-manager.io/v1alpha2
kind: Issuer
metadata:
  name: letsencrypt-${_APPLICATION_NAMESPACE}-issuer
  namespace: ${_APPLICATION_NAMESPACE}
spec:
  acme:
    server: https://acme-v02.api.letsencrypt.org/directory
    email: ${_DEFAULT_NOTIFY}
    privateKeySecretRef:
      name: letsencrypt-${_APPLICATION_NAMESPACE}
    solvers:
    - dns01:
        clouddns:
          project: ${_GOOGLE_CLOUD_PROJECT}
          serviceAccountSecretRef:
            name: ${_DNS_SRV_NAME}
            key: key.json
