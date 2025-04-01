# Minimum-Viable OCM Package

## Developer Journey

2. Download [ocm-cli](https://ocm.software)
3. Create `ocm/simple-btp-package/component-constructor.yaml` which points to cluster specific k8s crossplane manifest at `manifests/helm/umbrella/blueprints/provider-btp-accounts.abc.shoot.live.k8s-hana.ondemand.com`
4. Add `ociArtifact` and `helmChart` of dependent crossplane providers to `ocm/simple-btp-package/component-constructor.yaml` 
4. Created dedicated Docker Repository
5. Package+Login Docker Repository + Push Package

```bash
# package ocm oci
processing component-constructor.yaml...
  processing document 1...
    processing index 1
found 1 component
adding component mvp-ocm-mcp:v0.0.2...
  adding resource ociImage: "name"="provider-kubernetes","version"="0.15.0"...
  adding resource ociImage: "name"="provider-helm","version"="0.19.0"...
  adding resource ociImage: "name"="provider-btp","version"="1.0.2"...
  adding resource helmChart: "name"="external-secrets","version"="0.13.0"...
  adding resource helmChart: "name"="crossplane","version"="1.18.0"...
  adding resource fileSystem: "name"="k8s-crossplane-manifests-provider-btp-accounts","version"="<componentversion>"...

# login to 
docker login <repo> -u <user_name>

# upload oci to artifact repository
ocm transfer componentversion --recursive --copy-resources ./mvp-ocm-mcp ocm
transferring version "mvp-ocm-mcp:v0.0.2"...
...resource 0 provider-kubernetes[ociImage](crossplane-contrib/provider-kubernetes:v0.15.0)...
...resource 1 provider-helm[ociImage](crossplane-contrib/provider-helm:v0.19.0)...
...resource 2 provider-btp[ociImage](sap/crossplane-provider-btp/crossplane/provider-btp:v1.0.2)...
...resource 3 external-secrets[helmChart]...
...resource 4 crossplane[helmChart]...
...resource 5 k8s-crossplane-manifests-provider-btp-accounts[fileSystem]...
...adding component version...
1 versions transferred

# verify uploaded resources
 ocm get resource --repo ocm mvp-ocm-mcp:v0.0.2 -o wide
NAME                                           VERSION IDENTITY TYPE       RELATION ACCESSTYPE  ACCESSSPEC
crossplane                                     1.18.0           helmChart  external localBlob   {"localReference":"sha256:cbe2efdf04e06fc5f5306567dd5e655b4ad771f0bf58a85fe0c91fc4f4016de2","mediaType":"application/vnd.cncf.helm.chart.content.v1.tar+gzip"}
external-secrets                               0.13.0           helmChart  external localBlob   {"localReference":"sha256:7c8dd8dc4a39c9aea8e4a1b8a1d6e60081704868fbc8a843a239bb1af917364b","mediaType":"application/vnd.cncf.helm.chart.content.v1.tar+gzip"}
k8s-crossplane-manifests-provider-btp-accounts v0.0.2           fileSystem local    localBlob   {"localReference":"sha256:317f1d632f3c5933dafd029f5371fbc1aaca1148eae28017c9d280d475343fde","mediaType":"application/x-tar"}
provider-btp                                   1.0.2            ociImage   external ociArtifact {"imageReference":"ocm/sap/crossplane-provider-btp/crossplane/provider-btp:v1.0.2@sha256:aaf71ca40a4850e407a331dea50b4bde5edaaa892d0ea8395bb3b71f47243ec6"}
provider-helm                                  0.19.0           ociImage   external ociArtifact {"imageReference":"ocm/crossplane-contrib/provider-helm:v0.19.0@sha256:239d2e74884b3b9f91dea97d88d7764b24383789236d1400e106f7acfb10b320"}
provider-kubernetes                            0.15.0           ociImage   external ociArtifact {"imageReference":"ocm/crossplane-contrib/provider-kubernetes:v0.15.0@sha256:c3daebeb97e24677fd217b4823feb25f80814845d8c43a4cd2d11d56da57deef"}

```

6. Install flux+ocm controller [Gardener Shoot k8c cluster](https://dashboard.garden.canary.k8s.ondemand.com/namespace/garden-co-golden/shoots/test) to test consume OCM OCI artifact.
- flux -> https://fluxcd.io/flux/installation/
- ocm controller -> https://ocm.software/docs/controller/installation/

7. Create k8s secret which contains credentials to pull image from artifact repository
```bash
kubectl create secret docker-registry pull-secret -n ocm-system \
    --docker-server=mcp-blueprints.common.repositories.cloud.sap \
    --docker-username=<user_name> \
    --docker-password=cm.... \
    --docker-email=steffen....@sap.com
```
7. Instruct OCM controller to download component `mvp-ocm-mcp` from repository `ocm`
- see  [k8s-manifests-ocm-component-version-resource.yaml](./k8s-manifests-ocm-component-version-resource.yaml)
```bash
k apply -f ./k8s-manifests-ocm-component-version-resource.yaml
```
8. Instruct OCM controller to install resource `k8s-crossplane-manifests-provider-btp-accounts` to k8s cluster
- see [./k8s-manifests-flux-deployer.yaml](./k8s-manifests-flux-deployer.yaml.yaml)
```bash
k apply -f ./k8s-manifests-flux-deployer.yaml
```
9. Verify `.status` of applied k8s manifests
