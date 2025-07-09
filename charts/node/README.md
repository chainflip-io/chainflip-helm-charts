# node

![Version: 0.17.0](https://img.shields.io/badge/Version-0.17.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.9.5](https://img.shields.io/badge/AppVersion-1.9.5-informational?style=flat-square)

Deploy a Chainflip Validator or Archive node on Kubernetes

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Chainflip Labs GmbH | <dev@chainflip.io> | <https://chainflip.io> |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| cli | object | `{"enabled":true,"image":{"pullPolicy":"Always","repository":"docker.io/chainfliplabs/chainflip-cli","tag":""}}` | chainflip-cli configuration |
| cli.enabled | bool | `true` | enable chainflip-cli |
| cli.image | object | `{"pullPolicy":"Always","repository":"docker.io/chainfliplabs/chainflip-cli","tag":""}` | chainflip-cli image settings |
| cli.image.pullPolicy | string | `"Always"` | chainflip-cli image pull policy |
| cli.image.repository | string | `"docker.io/chainfliplabs/chainflip-cli"` | chainflip-cli image repository |
| cli.image.tag | string | `""` | chainflip-cli image tag |
| common | object | `{"basePath":"/etc/chainflip","keys":{"arbitrumKey":"","arbitrumKeyFileName":"arbitrum_key_file","ethereumKey":"","ethereumKeyFileName":"ethereum_key_file","existingSecret":"","generateKeysOnStart":false,"keysPath":"/etc/chainflip/keys","nodeKey":"","nodeKeyFileName":"node_key_file","signingKey":"","signingKeyFileName":"signing_key_file"},"role":"validator"}` | shared settings across the chainflip-engine and chainflip-node |
| common.basePath | string | `"/etc/chainflip"` | root path for the chainflip configuration |
| common.keys | object | `{"arbitrumKey":"","arbitrumKeyFileName":"arbitrum_key_file","ethereumKey":"","ethereumKeyFileName":"ethereum_key_file","existingSecret":"","generateKeysOnStart":false,"keysPath":"/etc/chainflip/keys","nodeKey":"","nodeKeyFileName":"node_key_file","signingKey":"","signingKeyFileName":"signing_key_file"}` | default path for validator keys |
| common.keys.arbitrumKey | string | `""` | arbitrum key; recommended to leave empty and provide through a secret |
| common.keys.arbitrumKeyFileName | string | `"arbitrum_key_file"` | arbitrum key file name |
| common.keys.ethereumKey | string | `""` | ethereum key; recommended to leave empty and provide through a secret |
| common.keys.ethereumKeyFileName | string | `"ethereum_key_file"` | ethereum key file name |
| common.keys.existingSecret | string | `""` | exiting secret with keys for validator nodes, should contain signing-key, node-key, ethereum-key and arbitrum-key. for lp and broker nodes, should contain signing-key.  |
| common.keys.generateKeysOnStart | bool | `false` | use the chainflip-cli to inject all keys on start |
| common.keys.keysPath | string | `"/etc/chainflip/keys"` | base path for all keys |
| common.keys.nodeKey | string | `""` | node key; recommended to leave empty and provide through a secret |
| common.keys.nodeKeyFileName | string | `"node_key_file"` | node key file name |
| common.keys.signingKey | string | `""` | signing key; recommended to leave empty and provide through a secret |
| common.keys.signingKeyFileName | string | `"signing_key_file"` | signing key file name |
| common.role | string | `"validator"` | desired role for your node; `validator`, `archive`, `full`, `broker`, `lp` |
| engine | object | `{"affinity":{},"extraArgs":{},"extraEnv":[],"extraEnvFrom":[],"extraInitContainers":[],"fullnameOverride":"","image":{"pullPolicy":"Always","repository":"docker.io/chainfliplabs/chainflip-engine","tag":""},"livenessProbe":{"enabled":true,"failureThreshold":3,"initialDelaySeconds":30,"periodSeconds":30,"successThreshold":1,"timeoutSeconds":30},"nodeSelector":{},"pdb":{"enabled":false,"minAvailable":1},"persistence":{"accessModes":["ReadWriteOnce"],"enabled":true,"existingClaim":"","size":"5Gi","storageClass":""},"ports":{"healthcheck":{"enabled":true,"hostname":"0.0.0.0","port":"5555","service":{"annotations":{},"port":5555,"type":"ClusterIP"}},"ip":{"expose":true,"port":30078,"service":{"annotations":{},"port":30078,"type":"NodePort"}},"metrics":{"enabled":false,"hostname":"0.0.0.0","port":5566,"service":{"annotations":{},"type":"ClusterIP"}}},"readinessProbe":{"enabled":true,"failureThreshold":3,"initialDelaySeconds":30,"periodSeconds":30,"successThreshold":1,"timeoutSeconds":30},"resources":{},"settings":{"arb":{"http_endpoint":"","ws_endpoint":""},"arb_backup":{"enabled":false,"http_endpoint":"","ws_endpoint":""},"btc":{"basic_auth_password":"","basic_auth_user":"","http_endpoint":""},"btc_backup":{"basic_auth_password":"","basic_auth_user":"","enabled":false,"http_endpoint":""},"dot":{"http_endpoint":"","ws_endpoint":""},"dot_backup":{"enabled":false,"http_endpoint":"","ws_endpoint":""},"eth":{"http_endpoint":"","ws_endpoint":""},"eth_backup":{"enabled":false,"http_endpoint":"","ws_endpoint":""},"existingConfigMap":"","hub":{"http_endpoint":"","ws_endpoint":""},"hub_backup":{"enabled":false,"http_endpoint":"","ws_endpoint":""},"node_p2p":{"allow_local_ip":false,"ip_address":""},"sol":{"http_endpoint":""},"sol_backup":{"enabled":false,"http_endpoint":""}},"tolerations":[],"topologySpreadConstraints":[]}` | chainflip-engine configuration |
| engine.affinity | object | `{}` | set pod affinity |
| engine.extraArgs | object | `{}` | chainflip-engine extra arguments |
| engine.extraEnv | list | `[]` | set extra environment variables |
| engine.extraEnvFrom | list | `[]` | set extra environment variables from a secret |
| engine.extraInitContainers | list | `[]` | define extra init containers on the engine |
| engine.fullnameOverride | string | `""` | override the default value of the engine pod |
| engine.image | object | `{"pullPolicy":"Always","repository":"docker.io/chainfliplabs/chainflip-engine","tag":""}` | chainflip-engine image settings |
| engine.image.pullPolicy | string | `"Always"` | chainflip-engine image pull policy |
| engine.image.repository | string | `"docker.io/chainfliplabs/chainflip-engine"` | chainflip-engine image repository |
| engine.image.tag | string | `""` | chainflip-engine image tag |
| engine.livenessProbe.enabled | bool | `true` | enable liveness probe |
| engine.livenessProbe.failureThreshold | int | `3` | liveness probe failure threshold |
| engine.livenessProbe.initialDelaySeconds | int | `30` | liveness probe initial delay |
| engine.livenessProbe.periodSeconds | int | `30` | liveness probe period |
| engine.livenessProbe.successThreshold | int | `1` | liveness probe success threshold |
| engine.livenessProbe.timeoutSeconds | int | `30` | liveness probe timeout |
| engine.nodeSelector | object | `{}` | set node selector |
| engine.pdb | object | `{"enabled":false,"minAvailable":1}` | set pod disruption budget |
| engine.persistence | object | `{"accessModes":["ReadWriteOnce"],"enabled":true,"existingClaim":"","size":"5Gi","storageClass":""}` | chainflip-engine persistence settings |
| engine.persistence.accessModes | list | `["ReadWriteOnce"]` | chainflip-engine volume access mode |
| engine.persistence.enabled | bool | `true` | enable chainflip-engine persistence |
| engine.persistence.existingClaim | string | `""` | reference an existing PVC |
| engine.persistence.size | string | `"5Gi"` | chainflip-engine volume size |
| engine.persistence.storageClass | string | `""` | chainflip-engine volume storage class |
| engine.ports | object | `{"healthcheck":{"enabled":true,"hostname":"0.0.0.0","port":"5555","service":{"annotations":{},"port":5555,"type":"ClusterIP"}},"ip":{"expose":true,"port":30078,"service":{"annotations":{},"port":30078,"type":"NodePort"}},"metrics":{"enabled":false,"hostname":"0.0.0.0","port":5566,"service":{"annotations":{},"type":"ClusterIP"}}}` | chainflip-engine ports |
| engine.ports.healthcheck | object | `{"enabled":true,"hostname":"0.0.0.0","port":"5555","service":{"annotations":{},"port":5555,"type":"ClusterIP"}}` | chainflip-engine healthcheck settings |
| engine.ports.healthcheck.enabled | bool | `true` | enable chainflip-engine healthcheck |
| engine.ports.healthcheck.hostname | string | `"0.0.0.0"` | chainflip-engine healthcheck hostname |
| engine.ports.healthcheck.port | string | `"5555"` | chainflip-engine healthcheck port |
| engine.ports.healthcheck.service | object | `{"annotations":{},"port":5555,"type":"ClusterIP"}` | chainflip-engine healthcheck service configuration |
| engine.ports.healthcheck.service.annotations | object | `{}` | chainflip-engine healthcheck service annotations |
| engine.ports.healthcheck.service.port | int | `5555` | chainflip-engine healthcheck service port |
| engine.ports.healthcheck.service.type | string | `"ClusterIP"` | chainflip-engine healthcheck service type |
| engine.ports.ip | object | `{"expose":true,"port":30078,"service":{"annotations":{},"port":30078,"type":"NodePort"}}` | chainflip-engine p2p port |
| engine.ports.ip.expose | bool | `true` | expose chainflip-engine p2p port |
| engine.ports.ip.port | int | `30078` | chainflip-engine p2p port |
| engine.ports.ip.service | object | `{"annotations":{},"port":30078,"type":"NodePort"}` | chainflip-engine p2p service configuration |
| engine.ports.ip.service.annotations | object | `{}` | chainflip-engine p2p service annotations |
| engine.ports.ip.service.port | int | `30078` | chainflip-engine p2p service port |
| engine.ports.ip.service.type | string | `"NodePort"` | chainflip-engine p2p service type |
| engine.ports.metrics.enabled | bool | `false` | enable prometheus metrics |
| engine.ports.metrics.hostname | string | `"0.0.0.0"` | expose prometheus metrics |
| engine.ports.metrics.port | int | `5566` | prometheus metrics port |
| engine.ports.metrics.service | object | `{"annotations":{},"type":"ClusterIP"}` | prometheus metrics service configuration |
| engine.ports.metrics.service.annotations | object | `{}` | prometheus metrics service port |
| engine.ports.metrics.service.type | string | `"ClusterIP"` | prometheus metrics service type |
| engine.readinessProbe.enabled | bool | `true` | enable readiness probe |
| engine.readinessProbe.failureThreshold | int | `3` | readiness probe failure threshold |
| engine.readinessProbe.initialDelaySeconds | int | `30` | readiness probe initial delay |
| engine.readinessProbe.periodSeconds | int | `30` | readiness probe period |
| engine.readinessProbe.successThreshold | int | `1` | readiness probe success threshold |
| engine.readinessProbe.timeoutSeconds | int | `30` | readiness probe timeout |
| engine.resources | object | `{}` | chainflip-engine resources |
| engine.settings | object | `{"arb":{"http_endpoint":"","ws_endpoint":""},"arb_backup":{"enabled":false,"http_endpoint":"","ws_endpoint":""},"btc":{"basic_auth_password":"","basic_auth_user":"","http_endpoint":""},"btc_backup":{"basic_auth_password":"","basic_auth_user":"","enabled":false,"http_endpoint":""},"dot":{"http_endpoint":"","ws_endpoint":""},"dot_backup":{"enabled":false,"http_endpoint":"","ws_endpoint":""},"eth":{"http_endpoint":"","ws_endpoint":""},"eth_backup":{"enabled":false,"http_endpoint":"","ws_endpoint":""},"existingConfigMap":"","hub":{"http_endpoint":"","ws_endpoint":""},"hub_backup":{"enabled":false,"http_endpoint":"","ws_endpoint":""},"node_p2p":{"allow_local_ip":false,"ip_address":""},"sol":{"http_endpoint":""},"sol_backup":{"enabled":false,"http_endpoint":""}}` | chainflip-engine Settings.toml configuration |
| engine.settings.arb.http_endpoint | string | `""` | arb node http endpoint |
| engine.settings.arb.ws_endpoint | string | `""` | arb node ws endpoint |
| engine.settings.arb_backup.enabled | bool | `false` | enabled |
| engine.settings.arb_backup.http_endpoint | string | `""` | arb node http endpoint |
| engine.settings.arb_backup.ws_endpoint | string | `""` | arb node ws endpoint |
| engine.settings.btc | object | `{"basic_auth_password":"","basic_auth_user":"","http_endpoint":""}` | bitcoin settings |
| engine.settings.btc.basic_auth_password | string | `""` | bitcoin rpc password |
| engine.settings.btc.basic_auth_user | string | `""` | bitcoin rpc user |
| engine.settings.btc.http_endpoint | string | `""` | bitcoin node http endpoint |
| engine.settings.btc_backup.basic_auth_password | string | `""` | bitcoin backup rpc password |
| engine.settings.btc_backup.basic_auth_user | string | `""` | bitcoin backup rpc user |
| engine.settings.btc_backup.enabled | bool | `false` | enabled |
| engine.settings.btc_backup.http_endpoint | string | `""` | bitcoin backup node http endpoint |
| engine.settings.dot | object | `{"http_endpoint":"","ws_endpoint":""}` | polkadot settings |
| engine.settings.dot.http_endpoint | string | `""` | polkadot node http endpoint |
| engine.settings.dot.ws_endpoint | string | `""` | polkadot node ws endpoint |
| engine.settings.dot_backup | object | `{"enabled":false,"http_endpoint":"","ws_endpoint":""}` | set up an optional backup ethereum node |
| engine.settings.dot_backup.enabled | bool | `false` | enabled |
| engine.settings.dot_backup.http_endpoint | string | `""` | polkadot backup node http endpoint |
| engine.settings.dot_backup.ws_endpoint | string | `""` | polkadot backup node ws endpoint |
| engine.settings.eth | object | `{"http_endpoint":"","ws_endpoint":""}` | ethereum settings |
| engine.settings.eth.http_endpoint | string | `""` | ethereum node ws endpoint |
| engine.settings.eth.ws_endpoint | string | `""` | ethereum node http endpoint |
| engine.settings.eth_backup | object | `{"enabled":false,"http_endpoint":"","ws_endpoint":""}` | set up an optional backup ethereum node |
| engine.settings.eth_backup.enabled | bool | `false` | enabled |
| engine.settings.eth_backup.http_endpoint | string | `""` | ethereum backup node http endpoint |
| engine.settings.eth_backup.ws_endpoint | string | `""` | ethereum backup node ws endpoint |
| engine.settings.existingConfigMap | string | `""` | existing configMap with Settings.toml |
| engine.settings.hub.http_endpoint | string | `""` | AssetHub node http endpoint |
| engine.settings.hub.ws_endpoint | string | `""` | AssetHub node ws endpoint |
| engine.settings.hub_backup.enabled | bool | `false` | enabled |
| engine.settings.hub_backup.http_endpoint | string | `""` | AssetHub backup node http endpoint |
| engine.settings.hub_backup.ws_endpoint | string | `""` | AssetHub backup node ws endpoint |
| engine.settings.node_p2p | object | `{"allow_local_ip":false,"ip_address":""}` | node_p2p settings |
| engine.settings.node_p2p.allow_local_ip | bool | `false` | allow local ip addresses |
| engine.settings.node_p2p.ip_address | string | `""` | local ip address; this will set the ClusterIP of the service |
| engine.settings.sol.http_endpoint | string | `""` | solana node http endpoint |
| engine.settings.sol_backup.enabled | bool | `false` | enabled |
| engine.settings.sol_backup.http_endpoint | string | `""` | solana backup node http endpoint |
| engine.tolerations | list | `[]` | set pod tolerations |
| engine.topologySpreadConstraints | list | `[]` | set topology spread constraints |
| extraManifests | list | `[]` | create extra kubernetes manifests |
| fullnameOverride | string | `""` | override the naming of the node chart |
| hook | object | `{"extraAnnotations":{}}` | hook configuration |
| hook.extraAnnotations | object | `{}` | add extra annotations to the create-keys hook |
| imagePullSecrets | list | `[]` | select an existing secret where your repository credentials are stored |
| nameOverride | string | `""` | override the default value of the name |
| network.bootnodes | list | `[]` | network bootnodes |
| network.chain | object | `{"chainspecUrl":"","name":"test"}` | chain settings |
| network.chain.chainspecUrl | string | `""` | download the chainspec from a URL |
| network.chain.name | string | `"test"` | chain name: (perseverance, berghain, etc.) |
| node | object | `{"affinity":{},"chainData":{"pruning":{"blocks":256,"enabled":false,"state":256},"removeParitydb":false,"removeRocksdb":false,"snapshot":{"debug":false,"enabled":true,"retries":6},"type":"paritydb"},"extraArgs":["--name=\"Chainflip Node\""],"extraEnv":[],"extraEnvFrom":[],"fullnameOverride":"","image":{"pullPolicy":"Always","repository":"docker.io/chainfliplabs/chainflip-node","tag":""},"ingress":{"annotations":{},"enabled":false,"hosts":[],"ingressClassName":"","tls":[]},"legacyRpc":false,"livenessProbe":{"enabled":true,"failureThreshold":3,"initialDelaySeconds":30,"periodSeconds":30,"successThreshold":1,"timeoutSeconds":30},"nodeSelector":{},"pdb":{"enabled":false,"minAvailable":1},"persistence":{"accessModes":["ReadWriteOnce"],"enabled":true,"existingClaim":"","size":"100Gi","storageClass":""},"ports":{"metrics":{"enabled":false,"expose":true,"port":9615,"service":{"annotations":{},"type":"ClusterIP"}},"p2p":{"enabled":true,"port":30333,"service":{"annotations":{},"port":30333,"type":"NodePort"}},"rpc":{"enabled":true,"expose":true,"port":"9944","service":{"annotations":{},"port":9944,"type":"ClusterIP"}}},"readinessProbe":{"enabled":true,"failureThreshold":10,"initialDelaySeconds":30,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":30},"replicas":1,"resources":{},"service":{"annotations":{},"port":80,"sessionAffinity":{"enabled":false},"type":"ClusterIP"},"syncMode":"full","tolerations":[],"topologySpreadConstraints":[]}` | chainflip-node configuration |
| node.affinity | object | `{}` | set pod affinity |
| node.chainData | object | `{"pruning":{"blocks":256,"enabled":false,"state":256},"removeParitydb":false,"removeRocksdb":false,"snapshot":{"debug":false,"enabled":true,"retries":6},"type":"paritydb"}` | chainflip-node database settings |
| node.chainData.pruning | object | `{"blocks":256,"enabled":false,"state":256}` | pruning settings |
| node.chainData.pruning.blocks | int | `256` | blocks pruning depth |
| node.chainData.pruning.enabled | bool | `false` | enable pruning |
| node.chainData.pruning.state | int | `256` | state pruning depth |
| node.chainData.removeParitydb | bool | `false` | enable paritydb removal WARNING: This will remove the paritydb (../paritydb) directory, use with caution! NOTE: You probably want to disable this after use. |
| node.chainData.removeRocksdb | bool | `false` | enable rocksdb removal WARNING: This will remove the rocksdb (../db) directory, use with caution! NOTE: This will cleanup disk space after migrating to paritydb |
| node.chainData.snapshot | object | `{"debug":false,"enabled":true,"retries":6}` | snapshot init configuration |
| node.chainData.snapshot.debug | bool | `false` | snapshot download debug |
| node.chainData.snapshot.enabled | bool | `true` | enable snapshot download on init |
| node.chainData.snapshot.retries | int | `6` | snapshot download retries |
| node.chainData.type | string | `"paritydb"` | database type (rocksdb, paritydb, auto, paritydb-experimental) |
| node.extraArgs | list | `["--name=\"Chainflip Node\""]` | chainflip-node extra arguments |
| node.extraEnv | list | `[]` | set extra environment variables |
| node.extraEnvFrom | list | `[]` | set extra environment variables from a secret |
| node.fullnameOverride | string | `""` | override the default value of the node pod |
| node.image | object | `{"pullPolicy":"Always","repository":"docker.io/chainfliplabs/chainflip-node","tag":""}` | chainflip-node image settings |
| node.image.pullPolicy | string | `"Always"` | chainflip-node image pull policy |
| node.image.repository | string | `"docker.io/chainfliplabs/chainflip-node"` | chainflip-node image repository |
| node.image.tag | string | `""` | chainflip-node image tag; default to `network.chain.name` |
| node.legacyRpc | bool | `false` | use the legacy rpc commands for the node |
| node.livenessProbe.enabled | bool | `true` | enable liveness probe |
| node.livenessProbe.failureThreshold | int | `3` | liveness probe failure threshold |
| node.livenessProbe.initialDelaySeconds | int | `30` | liveness probe initial delay |
| node.livenessProbe.periodSeconds | int | `30` | liveness probe period |
| node.livenessProbe.successThreshold | int | `1` | liveness probe success threshold |
| node.livenessProbe.timeoutSeconds | int | `30` | liveness probe timeout |
| node.nodeSelector | object | `{}` | set node selector |
| node.pdb | object | `{"enabled":false,"minAvailable":1}` | set pod disruption budget |
| node.persistence | object | `{"accessModes":["ReadWriteOnce"],"enabled":true,"existingClaim":"","size":"100Gi","storageClass":""}` | chaindata volume settings |
| node.persistence.accessModes | list | `["ReadWriteOnce"]` | chaindata volume access mode |
| node.persistence.enabled | bool | `true` | enable chaindata persistence |
| node.persistence.existingClaim | string | `""` | reference an existing PVC |
| node.persistence.size | string | `"100Gi"` | chaindata volume size |
| node.persistence.storageClass | string | `""` | chaindata volume storage class |
| node.ports | object | `{"metrics":{"enabled":false,"expose":true,"port":9615,"service":{"annotations":{},"type":"ClusterIP"}},"p2p":{"enabled":true,"port":30333,"service":{"annotations":{},"port":30333,"type":"NodePort"}},"rpc":{"enabled":true,"expose":true,"port":"9944","service":{"annotations":{},"port":9944,"type":"ClusterIP"}}}` | ports exposed by the chainflip-node |
| node.ports.metrics.enabled | bool | `false` | enable prometheus metrics |
| node.ports.metrics.expose | bool | `true` | expose prometheus metrics |
| node.ports.metrics.port | int | `9615` | prometheus metrics port |
| node.ports.metrics.service | object | `{"annotations":{},"type":"ClusterIP"}` | prometheus metrics service configuration |
| node.ports.metrics.service.annotations | object | `{}` | prometheus metrics service port |
| node.ports.metrics.service.type | string | `"ClusterIP"` | prometheus metrics service type |
| node.ports.p2p | object | `{"enabled":true,"port":30333,"service":{"annotations":{},"port":30333,"type":"NodePort"}}` | chainflip-node p2p port |
| node.ports.p2p.enabled | bool | `true` | enabled |
| node.ports.p2p.port | int | `30333` | chainflip-node rpc port |
| node.ports.p2p.service | object | `{"annotations":{},"port":30333,"type":"NodePort"}` | chainflip-node rpc service configuration |
| node.ports.p2p.service.annotations | object | `{}` | chainflip-node rpc service annotations |
| node.ports.p2p.service.port | int | `30333` | chainflip-node rpc service port |
| node.ports.p2p.service.type | string | `"NodePort"` | chainflip-node rpc service type |
| node.ports.rpc | object | `{"enabled":true,"expose":true,"port":"9944","service":{"annotations":{},"port":9944,"type":"ClusterIP"}}` | chainflip-node rpc port |
| node.ports.rpc.enabled | bool | `true` | enabled |
| node.ports.rpc.expose | bool | `true` | expose chainflip-node rpc port |
| node.ports.rpc.port | string | `"9944"` | chainflip-node rpc port |
| node.ports.rpc.service | object | `{"annotations":{},"port":9944,"type":"ClusterIP"}` | chainflip-node rpc service configuration |
| node.ports.rpc.service.annotations | object | `{}` | chainflip-node rpc service annotations |
| node.ports.rpc.service.port | int | `9944` | chainflip-node rpc service port |
| node.ports.rpc.service.type | string | `"ClusterIP"` | chainflip-node rpc service type |
| node.readinessProbe.enabled | bool | `true` | enable readiness probe |
| node.readinessProbe.failureThreshold | int | `10` | readiness probe failure threshold |
| node.readinessProbe.initialDelaySeconds | int | `30` | readiness probe initial delay |
| node.readinessProbe.periodSeconds | int | `10` | readiness probe period |
| node.readinessProbe.successThreshold | int | `1` | readiness probe success threshold |
| node.readinessProbe.timeoutSeconds | int | `30` | readiness probe timeout |
| node.replicas | int | `1` | replicas; only available for archive nodes |
| node.resources | object | `{}` | chainflip-node resources |
| node.service | object | `{"annotations":{},"port":80,"sessionAffinity":{"enabled":false},"type":"ClusterIP"}` | chainflip-node service configuration |
| node.service.annotations | object | `{}` | chainflip-node service annotations |
| node.service.port | int | `80` | chainflip-node service port |
| node.service.sessionAffinity | object | `{"enabled":false}` | Session affinity |
| node.service.type | string | `"ClusterIP"` | chainflip-node service type |
| node.tolerations | list | `[]` | set pod tolerations |
| node.topologySpreadConstraints | list | `[]` | set topology spread constraints |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
