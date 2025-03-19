# foundry-simple-storage

It is a smart contract project written in [Solidity](https://docs.soliditylang.org/en/latest/) using [Foundry](https://book.getfoundry.sh/).

- It a simple and fist smart contract I developed leveraging Foundry. It has different type of storage variables holding different values.

## Getting Started

- [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git): You'll know you did it right if you can run `git --version` and you see a response like `git version x.x.x`
- [foundry](https://getfoundry.sh/): You'll know you did it right if you can run `forge --version` and you see a response like `forge 0.2.0 (816e00b 2023-03-16T00:05:26.396218Z)`
- [make](https://www.gnu.org/software/make/manual/make.html) (optional - either you can install `make` or you can simply substitute the make commands with forge commands by referring to the Makefile after including your .env file): You'll know you did it right if you can run `make --version` and you will see a response like `GNU Make 3.81...`

## Installation

- Install foundry-fund-me

```bash
    git clone https://github.com/yug49/foundry-fund-me-f23
    cd foundry-fund-me
```

- Make a .env file

```bash
    touch .env
```

- Open the .env file and fill in the details similar to:

```env
    SEPOLIA_RPC_URL=<YOUR SEPOLIA RPC URL>
    MAINNET_RPC_URL=<YOUR MAINNET RPC URL>
    ETHERSCAN_API_KEY=<YOUR ETHERSCAN API KEY>
    PRIVATE_KEY=<YOUR PRIVATE KEY>
```

- Install dependencies and libraries

```bash
    make install
```

## Usage

### Deploy

```bash
make deploy
```

### Testing

- for local anvil

```bash
    make test
```

- for zksync (only testing works for now not zk-sync deploy)

```bash
    make zktest
```

### Coverage

```bash
make test-coverage
```

## Deployment to a testnet or mainnet

- You must have your `.env` file ready as told in installation section
- If pushing on github, DO NOT FORGET to add the `.env` file in the `.gitignore`

### Sepolia Testnet

```bash
make deploy-sepolia
```

### Mainnet

```bash
make deploy-mainnet
```

### Scripts

After deploying, you can run the scripts.

Using cast:

- Before using this first method (recommended), don't forget to make your .env as described above and run command `source .env`. You will know you did it right if command, `echo $SEPOLIA_RPC_URL` prints the exact same sepolia rpc url you mentioned in your `.env` file.

```bash
cast send <SIMPLE_STORAGE_CONTRACT_ADDRESS> "store()" <YOUR_FAVROUITE_NUMBER> --private-key $PRIVATE_KEY
cast call <SIMPLE_STORAGE_CONTRACT_ADDRESS> "retrieve()"
cast send <SIMPLE_STORAGE_CONTRACT_ADDRESS> "addPerson(string,uint256)" <YOUR_NAME> <YOUR_FAVROUITE_NUMBER> --private-key $PRIVATE_KEY
```

or

```bash
cast send <SIMPLE_STORAGE_CONTRACT_ADDRESS> "store()" <YOUR_FAVROUITE_NUMBER> --private-key <PRIVATE_KEY>
cast call <SIMPLE_STORAGE_CONTRACT_ADDRESS> "retrieve()"
cast send <SIMPLE_STORAGE_CONTRACT_ADDRESS> "addPerson(string,uint256)" <YOUR_NAME> <YOUR_FAVROUITE_NUMBER> --private-key <PRIVATE_KEY>
```

- Here `$SEPOLIA_RPC_URL` or `<PRIVATE_KEY>` is the RPC url of the node of the Sepolia Chain we are sending our transactions to. You can use any other RPC url if you are using any other chain.
- `$PRIVATE_KEY` or `<PRIVATE_KEY>` is the private key of the account you are using to sign your transaction.
- `<YOUR_FAVROUITE_NUMBER>` is the number we want to store.

### Estimate gas

You can estimate how much gas things cost by running:

```bash
make snapshot
```

## Formatting

To run code Formatting

```bash
forge fmt
```

## 🔗 Links

Loved it? lets connect on:

[![twitter](https://img.shields.io/badge/twitter-1DA1F2?style=for-the-badge&logo=twitter&logoColor=white)](https://x.com/yugAgarwal29)
[![linkedin](https://img.shields.io/badge/linkedin-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/yug-agarwal-8b761b255/)
