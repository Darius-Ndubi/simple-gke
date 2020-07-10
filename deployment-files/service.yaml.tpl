kind: Service
apiVersion: v1
metadata:
  name: ${_APPLICATION_NAME}-service-${_APPLICATION_NAMESPACE}
  namespace: ${_APPLICATION_NAMESPACE}
  labels:
    app: ${_APPLICATION_NAME}-${_APPLICATION_NAMESPACE}
spec:
  selector:
    app: ${_APPLICATION_NAME}-${_APPLICATION_NAMESPACE}
  ports:
    - port: 80
      name: http
      protocol: TCP
      targetPort: ${_TARGET_PORT}
  type: NodePort