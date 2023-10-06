# Chainflip Helm Charts

The official collection of Helm charts maintained by Chainflip Labs and the Chainflip community.

## Usage

### node

First add the Chainflip Helm repository:

```bash
helm repo add chainflip https://chainflip-io.github.io/chainflip-helm-charts
```

Set up your values.yaml like so:

```yaml
network:
  chain:
    name: "perseverance"
    chainspecUrl: "https://s3.eu-central-1.amazonaws.com/repo.chainflip.io/chainspecs/perseverance.chainspec.json"
  bootnodes:
    - /ip4/167.99.129.29/tcp/30333/p2p/12D3KooWPFZo5JzqiWASDSrAtbyKgW2kw4Rb5FruE29PAhJ1u4xL
common:
  keys:
    generateKeysOnStart: true
engine:
  settings:
    btc:
      http_endpoint: http://a108a82b574a640359e360cf66afd45d-424380952.eu-central-1.elb.amazonaws.com
      rpc_password: flip
      rpc_user: flip
    dot:
      http_endpoint: https://pdot-rpc.chainflip.xyz:443
      ws_endpoint: wss://pdot-rpc.chainflip.xyz:443
    eth:
      http_endpoint: <YOUR_http_endpoint>
      ws_endpoint: <YOUR_ws_endpoint>
    node_p2p:
      ip_address: <YOUR_IP_ADDRESS> # pick a ClusterIP for the service
```

Then install the chart:

```bash
helm install validator chainflip/node -f values.yaml --namespace chainflip
```

The helm chart will generate fresh keys for you on the first start, such that they never live anywhere but inside your node.

Check that the pods are running:
```shell
kubectl get pods --namespace chainflip
NAME                                       READY   STATUS    RESTARTS   AGE
validator-chainflip-cli-776765bb4d-nmqp4   1/1     Running   0          1m
validator-chainflip-engine-0               1/1     Running   0          1m
validator-chainflip-node-0                 1/1     Running   0          1m
```

Check the logs of the engine to find the public key of your node;
```shell
kubectl logs validator-chainflip-engine-0 --namespace chainflip
{"timestamp":"2023-08-10T12:39:50.017852Z","level":"WARN","fields":{"message":"Your Chainflip account cFK1ay7YMLjQ6Zg25bm7Hg46SKJYw3EuQQKgM8Uvv5KhAaBvf is not funded. Note, it may take some time for your funds to be detected. WAITING for your account to be funded at block: 0xfdcd…5099"},"target":"chainflip_engine::state_chain_observer::client::extrinsic_api::signed"}
```

In this case, the public key is `cFK1ay7YMLjQ6Zg25bm7Hg46SKJYw3EuQQKgM8Uvv5KhAaBvf`.

#### Funding your node

Head to https://auctions-perseverance.chainflip.io/nodes

Click "Add Node", and fund your account with tFLIP. If you need tFLIP, head to our Discord channel.

#### Run the chainflip-cli commands

As part of the chart, we deploy the `chainflip-cli`. You can disable it later by changing your value.yaml file to:

```yaml
cli:
  enabled: false
```

Exec into the running pod, then run all the chainflip-cli commands to get set up as a validator:
```shell
kubectl exec -it validator-chainflip-cli-776765bb4d-nmqp4 -- /bin/bash
```

```shell
chainflip-cli register-account-role Validator 
```

```shell
chainflip-cli start-bidding 
```

```shell
chainflip-cli rotate
```

