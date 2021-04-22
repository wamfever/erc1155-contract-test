# In order to deploy the smart contract follow the next steps

## Setup:
```bash
npm install
```

```bash
node scripts/setup.js {{mnemonic}} {{etherscan_api_key}} {{jsonRPC_link}}
```

## Deploy contract:
```bash
truffle migrate --network rinkeby  (use --reset for subsequent deployments)
```

```bash
truffle run verify KeykoTest --network rinkeby
```

## Setup Minter DApp
1. Copy address from truffle output or from ``build/KeykoTest.json`` under key "networks" and paste it in Minter DApp project in ``services/ContractData.tsx`` 
2. Copy abi from ``build/KeykoTest.json`` and paste it in Minter DApp project in ``services/ContractData.tsx``

