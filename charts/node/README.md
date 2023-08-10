# node

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.8.7](https://img.shields.io/badge/AppVersion-0.8.7-informational?style=flat-square)

Deploy a Chainflip Validator or Archive node on Kubernetes

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Chainflip Labs | <dev@chainflip.io> | <https://chainflip.io> |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| cli | object | `{"enabled":true,"image":{"pullPolicy":"Always","repository":"chainfliplabs/chainflip-cli","tag":""}}` | chainflip-cli configuration |
| cli.enabled | bool | `true` | enable chainflip-cli |
| cli.image | object | `{"pullPolicy":"Always","repository":"chainfliplabs/chainflip-cli","tag":""}` | chainflip-cli image settings |
| cli.image.pullPolicy | string | `"Always"` | chainflip-cli image pull policy |
| cli.image.repository | string | `"chainfliplabs/chainflip-cli"` | chainflip-cli image repository |
| cli.image.tag | string | `""` | chainflip-cli image tag |
| common | object | `{"basePath":"/etc/chainflip","keys":{"ethereumKey":"","ethereumKeyFileName":"ethereum_key_file","existingSecret":"","generateKeysOnStart":false,"keysPath":"/etc/chainflip/keys","nodeKey":"","nodeKeyFileName":"node_key_file","signingKey":"","signingKeyFileName":"signing_key_file"},"role":"validator"}` | shared settings across the chainflip-engine and chainflip-node |
| common.basePath | string | `"/etc/chainflip"` | root path for the chainflip configuration |
| common.keys | object | `{"ethereumKey":"","ethereumKeyFileName":"ethereum_key_file","existingSecret":"","generateKeysOnStart":false,"keysPath":"/etc/chainflip/keys","nodeKey":"","nodeKeyFileName":"node_key_file","signingKey":"","signingKeyFileName":"signing_key_file"}` | default path for validator keys |
| common.keys.ethereumKey | string | `""` | ethereum key; recommended to leave empty and provide through a secret |
| common.keys.ethereumKeyFileName | string | `"ethereum_key_file"` | ethereum key file name |
| common.keys.existingSecret | string | `""` | exiting secret with keys |
| common.keys.generateKeysOnStart | bool | `false` | use the chainflip-cli to inject all keys on start |
| common.keys.keysPath | string | `"/etc/chainflip/keys"` | base path for all keys |
| common.keys.nodeKey | string | `""` | node key; recommended to leave empty and provide through a secret |
| common.keys.nodeKeyFileName | string | `"node_key_file"` | node key file name |
| common.keys.signingKey | string | `""` | signing key; recommended to leave empty and provide through a secret |
| common.keys.signingKeyFileName | string | `"signing_key_file"` | signing key file name |
| common.role | string | `"validator"` | desired role for your node; `validator` or `archive` |
| engine | object | `{"extraArgs":{},"fullnameOverride":"","healthcheck":{"enabled":true,"hostname":"0.0.0.0","port":"5555"},"image":{"pullPolicy":"Always","repository":"chainfliplabs/chainflip-engine","tag":""},"persistence":{"accessModes":["ReadWriteOnce"],"enabled":true,"size":"5Gi","storageClass":""},"ports":{"ip":"8078"},"resources":{},"service":{"annotations":{},"port":80,"type":"ClusterIP"},"settings":{"btc":{"http_node_endpoint":"","rpc_password":"flip","rpc_user":"flip"},"dot":{"http_node_endpoint":"","ws_node_endpoint":""},"eth":{"http_node_endpoint":"","ws_node_endpoint":""},"existingConfigMap":"","node_p2p":{"allow_local_ip":true,"ip_address":""}}}` | chainflip-engine configuration |
| engine.extraArgs | object | `{}` | chainflip-engine extra arguments |
| engine.fullnameOverride | string | `""` | override the default value of the engine pod |
| engine.healthcheck | object | `{"enabled":true,"hostname":"0.0.0.0","port":"5555"}` | chainflip-engine healthcheck settings |
| engine.healthcheck.enabled | bool | `true` | enable chainflip-engine healthcheck |
| engine.healthcheck.hostname | string | `"0.0.0.0"` | chainflip-engine healthcheck hostname |
| engine.healthcheck.port | string | `"5555"` | chainflip-engine healthcheck port |
| engine.image | object | `{"pullPolicy":"Always","repository":"chainfliplabs/chainflip-engine","tag":""}` | chainflip-engine image settings |
| engine.image.pullPolicy | string | `"Always"` | chainflip-engine image pull policy |
| engine.image.repository | string | `"chainfliplabs/chainflip-engine"` | chainflip-engine image repository |
| engine.image.tag | string | `""` | chainflip-engine image tag |
| engine.persistence | object | `{"accessModes":["ReadWriteOnce"],"enabled":true,"size":"5Gi","storageClass":""}` | chainflip-engine persistence settings |
| engine.persistence.accessModes | list | `["ReadWriteOnce"]` | chainflip-engine volume access mode |
| engine.persistence.enabled | bool | `true` | enable chainflip-engine persistence |
| engine.persistence.size | string | `"5Gi"` | chainflip-engine volume size |
| engine.persistence.storageClass | string | `""` | chainflip-engine volume storage class |
| engine.ports | object | `{"ip":"8078"}` | chainflip-engine ports |
| engine.ports.ip | string | `"8078"` | chainflip-engine p2p port |
| engine.resources | object | `{}` | chainflip-engine resources |
| engine.service | object | `{"annotations":{},"port":80,"type":"ClusterIP"}` | chainflip-engine service configuration |
| engine.service.annotations | object | `{}` | chainflip-engine service annotations |
| engine.service.port | int | `80` | chainflip-engine service port |
| engine.service.type | string | `"ClusterIP"` | chainflip-engine service type |
| engine.settings | object | `{"btc":{"http_node_endpoint":"","rpc_password":"flip","rpc_user":"flip"},"dot":{"http_node_endpoint":"","ws_node_endpoint":""},"eth":{"http_node_endpoint":"","ws_node_endpoint":""},"existingConfigMap":"","node_p2p":{"allow_local_ip":true,"ip_address":""}}` | chainflip-engine Settings.toml configuration |
| engine.settings.btc | object | `{"http_node_endpoint":"","rpc_password":"flip","rpc_user":"flip"}` | bitcoin settings |
| engine.settings.btc.http_node_endpoint | string | `""` | bitcoin node http endpoint |
| engine.settings.btc.rpc_password | string | `"flip"` | bitcoin rpc password |
| engine.settings.btc.rpc_user | string | `"flip"` | bitcoin rpc user |
| engine.settings.dot | object | `{"http_node_endpoint":"","ws_node_endpoint":""}` | polkadot settings |
| engine.settings.dot.http_node_endpoint | string | `""` | polkadot node http endpoint |
| engine.settings.dot.ws_node_endpoint | string | `""` | polkadot node ws endpoint |
| engine.settings.eth | object | `{"http_node_endpoint":"","ws_node_endpoint":""}` | ethereum settings |
| engine.settings.eth.http_node_endpoint | string | `""` | ethereum node ws endpoint |
| engine.settings.eth.ws_node_endpoint | string | `""` | ethereum node http endpoint |
| engine.settings.existingConfigMap | string | `""` | existing configMap with Settings.toml |
| engine.settings.node_p2p | object | `{"allow_local_ip":true,"ip_address":""}` | node_p2p settings |
| engine.settings.node_p2p.allow_local_ip | bool | `true` | allow local ip addresses |
| engine.settings.node_p2p.ip_address | string | `""` | local ip address; this will set the ClusterIP of the service |
| extraManifests | list | `[]` | create extra kubernetes manifests |
| fullnameOverride | string | `""` | override the naming of the node chart |
| imagePullSecrets | list | `[]` | select an existing secret where your repository credentials are stored |
| nameOverride | string | `""` | override the default value of the name |
| network.bootnodes | list | `["/ip4/167.99.129.29/tcp/30333/p2p/12D3KooWPFZo5JzqiWASDSrAtbyKgW2kw4Rb5FruE29PAhJ1u4xL"]` | network bootnodes |
| network.chain | object | `{"chainspecUrl":"https://s3.eu-central-1.amazonaws.com/repo.chainflip.io/chainspecs/perseverance.chainspec.json","name":"perseverance"}` | chain settings |
| network.chain.chainspecUrl | string | `"https://s3.eu-central-1.amazonaws.com/repo.chainflip.io/chainspecs/perseverance.chainspec.json"` | download the chainspec from a URL |
| network.chain.name | string | `"perseverance"` | chain name; `perseverance` |
| node | object | `{"extraArgs":["--name=\"Chainflip Node\""],"fullnameOverride":"","image":{"pullPolicy":"Always","repository":"chainfliplabs/chainflip-node","tag":""},"metrics":{"enabled":true,"expose":true,"port":9615},"persistence":{"accessModes":["ReadWriteOnce"],"enabled":true,"size":"100Gi","storageClass":""},"ports":{"p2p":"30333","rpc":"9933","ws":"9944"},"resources":{},"service":{"annotations":{},"port":80,"type":"ClusterIP"}}` | chainflip-node configuration |
| node.extraArgs | list | `["--name=\"Chainflip Node\""]` | chainflip-node extra arguments |
| node.fullnameOverride | string | `""` | override the default value of the node pod |
| node.image | object | `{"pullPolicy":"Always","repository":"chainfliplabs/chainflip-node","tag":""}` | chainflip-node image settings |
| node.image.pullPolicy | string | `"Always"` | chainflip-node image pull policy |
| node.image.repository | string | `"chainfliplabs/chainflip-node"` | chainflip-node image repository |
| node.image.tag | string | `""` | chainflip-node image tag; default to `network.chain.name` |
| node.metrics.enabled | bool | `true` | enable prometheus metrics |
| node.metrics.expose | bool | `true` | expose prometheus metrics |
| node.metrics.port | int | `9615` | prometheus metrics port |
| node.persistence | object | `{"accessModes":["ReadWriteOnce"],"enabled":true,"size":"100Gi","storageClass":""}` | chaindata volume settings |
| node.persistence.accessModes | list | `["ReadWriteOnce"]` | chaindata volume access mode |
| node.persistence.enabled | bool | `true` | enable chaindata persistence |
| node.persistence.size | string | `"100Gi"` | chaindata volume size |
| node.persistence.storageClass | string | `""` | chaindata volume storage class |
| node.ports | object | `{"p2p":"30333","rpc":"9933","ws":"9944"}` | ports exposed by the chainflip-node |
| node.ports.p2p | string | `"30333"` | chainflip-node p2p port |
| node.ports.rpc | string | `"9933"` | chainflip-node rpc port |
| node.ports.ws | string | `"9944"` | chainflip-node ws port |
| node.resources | object | `{}` | chainflip-node resources |
| node.service | object | `{"annotations":{},"port":80,"type":"ClusterIP"}` | chainflip-node service configuration |
| node.service.annotations | object | `{}` | chainflip-node service annotations |
| node.service.port | int | `80` | chainflip-node service port |
| node.service.type | string | `"ClusterIP"` | chainflip-node service type |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
