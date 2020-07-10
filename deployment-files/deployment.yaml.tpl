apiVersion: apps/v1
kind: Deployment
metadata:
  name: ${_APPLICATION_NAME}-${_APPLICATION_NAMESPACE}
  namespace: ${_APPLICATION_NAMESPACE}
  labels:
    app: ${_APPLICATION_NAME}-${_APPLICATION_NAMESPACE}
spec:
  replicas: ${_MIN_PODS}
  selector:
    matchLabels:
      app: ${_APPLICATION_NAME}-${_APPLICATION_NAMESPACE}
  template:
    metadata:
      labels:
        app: ${_APPLICATION_NAME}-${_APPLICATION_NAMESPACE}
    spec:
      containers:
      - name: ${_APPLICATION_NAME}-${_APPLICATION_NAMESPACE}
        image: gcr.io/$_GOOGLE_CLOUD_PROJECT/${_APPLICATION_NAME}-${_APPLICATION_NAMESPACE}:${SHORT_SHA}
        resources:
            limits:
              cpu: ${_MAX_CPU}
              memory: ${_MAX_MEM}
            requests:
              cpu: 125m
              memory: 128Mi
        ports:
        - containerPort: ${_TARGET_PORT}
