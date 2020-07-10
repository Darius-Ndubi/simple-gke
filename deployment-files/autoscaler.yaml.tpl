apiVersion: autoscaling/v2beta1
kind: HorizontalPodAutoscaler
metadata:
  name: ${_APPLICATION_NAME}-${_APPLICATION_NAMESPACE}
  namespace: ${_APPLICATION_NAMESPACE}
spec:
  scaleTargetRef:
    apiVersion: apps/v1beta1
    kind: Deployment
    name: ${_APPLICATION_NAME}-${_APPLICATION_NAMESPACE}
  minReplicas: ${_MIN_PODS}
  maxReplicas: ${_MAX_PODS}
  metrics:
    - type: Resource
      resource:
        name: cpu
        target:
          type: Utilization
          averageUtilization: 70