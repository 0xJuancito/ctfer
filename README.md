# Playground 🎪

## Geth

- [Docs](https://geth.ethereum.org/docs/getting-started)

### Commands

#### Run Node

```bash
geth --dev --http
```

##### Create Blocks Every X Seconds

```bash
geth --dev --http --dev.period 12
```

##### Local Test

Geth:

```bash
rm -rf data/keystore data/geth && ./build/bin/geth --datadir=./data init genesis.json && ./build/bin/geth --dev --http --datadir ./data -dev.period 1
```

Test:

```bash
forge script ./script/Counter.s.sol --rpc-url 127.0.0.1:8545 --tc CounterScript --skip-simulation --broadcast
```

PK for test account `0x439017E6afe22A28fb1B556413d7C4B26b8dc0e1`:

- `0xbfcd0e032489319f4e5ca03e643b2025db624be6cf99cbfed90c4502e3754850`

#### Check Account Balance

```bash
curl -X POST http://127.0.0.1:8545 \
  -H "Content-Type: application/json" \
  --data '{"jsonrpc":"2.0", "method":"eth_getBalance", "params":["0xca57f3b40b42fcce3c37b8d18adbca5260ca72ec","latest"], "id":1}'
```

#### Send Transaction

```bash
curl -X POST http://127.0.0.1:8545 \
    -H "Content-Type: application/json" \
   --data '{"jsonrpc":"2.0", "method":"eth_sendTransaction", "params":[{"from": "0xca57f3b40b42fcce3c37b8d18adbca5260ca72ec","to": "0xce8dba5e4157c2b284d8853afeeea259344c1653","value": "0x16345785d8a0000"}], "id":1}'
```

#### Read Logs

```bash
curl 127.0.0.1:8545 \
  -X POST \
  -H "Content-Type: application/json" \
  --data '{"method":"eth_getLogs","params":[{"address": "0xdAC17F958D2ee523a2206206994597C13D831ec7"}],"id":1,"jsonrpc":"2.0"}'
```