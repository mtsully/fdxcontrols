# Copyright 2018 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# ----------------------------------------------------------
# WARNING: This file is autogenerated. Do not manually edit.
# ----------------------------------------------------------

apiVersion: apps/v1
kind: Deployment
metadata:
  name: robotester
  annotations:
    ves.io/workload-flavor: medium
spec:
  selector:
    matchLabels:
      app: robotester
  template:
    metadata:
      labels:
        app: robotester
    spec:
      terminationGracePeriodSeconds: 5
      initContainers:
      - name: init-robotester
        image: registry.gitlab.com/f5-security-test/download-robotester-files:latest
        imagePullPolicy: Always
        volumeMounts:
        - name: robot-tests # mount the volume where downloaded file will be saved
          mountPath: /robot-tests
        - name: fdx-nuclei-templates # mount the volume where downloaded file will be saved
          mountPath: /fdx
      containers:
      - name: robotester
        image: registry.gitlab.com/f5-security-test/robotester
        imagePullPolicy: Always
        env:
        - name: AWS_S3_BUCKET_NAME
          value: ${aws_s3_bucket_name}
        - name: GCP_STORAGE_BUCKET_NAME
          value: ${gcp_storage_bucket_name}
        - name: MAIL_HOST
          value: ${mail_host}
        - name: MAIL_PORT
          value: "${mail_port}"
        - name: MAIL_API_KEY
          value: ${mail_api_key}
        - name: MAIL_API_SECRET
          value: ${mail_api_secret} 
        - name: MAIL_TO_ADDR
          value: ${mail_to_addr}
        - name: MAIL_FROM_ADDR
          value: ${mail_from_addr}            
        volumeMounts:
        - name: robot-tests
          mountPath: /opt/robotframework/tests/
        - name: robot-reports
          mountPath: /opt/robotframework/reports
        - name: nuclei-config
          mountPath: /.config/nuclei
        - name: nuclei-templates
          mountPath: /nuclei-templates
        - name: fdx-nuclei-templates # mount the volume where downloaded file will be saved
          mountPath: /nuclei-templates/fdx
      volumes:
      - name: robot-tests
        emptyDir: {}
      - name: robot-reports
        emptyDir: {}
      - name: nuclei-config
        emptyDir: {}
      - name: nuclei-templates
        emptyDir: {}
      - name: fdx-nuclei-templates
        emptyDir: {}

---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nodeoidcproxy
  annotations:
    ves.io/workload-flavor: medium
spec:
  selector:
    matchLabels:
      app: nodeoidcproxy
  template:
    metadata:
      labels:
        app: nodeoidcproxy
    spec:
      terminationGracePeriodSeconds: 5
      containers:
      - name: nodeoidcproxy
        image: registry.gitlab.com/f5-security-test/node-oidc-proxy
        imagePullPolicy: Always
        ports:
        - containerPort: 8080
        env:
        - name: SERVICE_PORT
          value: "8080"
---
apiVersion: v1
kind: Service
metadata:
  name: nodeoidcproxy
  labels:
    app: nodeoidcproxy
spec:
  type: ClusterIP
  selector:
    app: nodeoidcproxy
  ports:
  - name: http
    port: 8080
    targetPort: 8080
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nodeoidcprovider
  annotations:
    ves.io/workload-flavor: medium
spec:
  selector:
    matchLabels:
      app: nodeoidcprovider
  template:
    metadata:
      labels:
        app: nodeoidcprovider
    spec:
      terminationGracePeriodSeconds: 5
      containers:
      - name: nodeoidcprovider
        image: registry.gitlab.com/f5-security-test/node-oidc-provider
        imagePullPolicy: Always
        ports:
        - containerPort: 3000
        env:
        - name: SERVICE_PORT
          value: "3000"
---
apiVersion: v1
kind: Service
metadata:
  name: nodeoidcprovider
  labels:
    app: nodeoidcprovider
spec:
  type: ClusterIP
  selector:
    app: nodeoidcprovider
  ports:
  - name: http
    port: 3000
    targetPort: 3000
---
