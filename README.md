# docker-kubectl

## Usage (GCB)

```yaml
steps:
- name: acoshift/kubectl
  args: [set, image, deploy/app, app=gcr.io/$PROJECT_ID/app:$COMMIT_SHA]
  env:
  - SERVER=https://127.0.0.1
  - NAMESPACE=default
  secretEnv:
  - TOKEN

secrets:
- kmsKeyName: projects/[PROJECT-ID]/locations/global/keyRings/[KEY-RING]/cryptoKeys/[KEY]
  secretEnv:
    TOKEN: __ENCRYPT_TOKEN__
```
