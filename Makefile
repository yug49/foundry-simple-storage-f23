-include .env

.PHONY: build install deploy zkbuild test zktest anvil snapshot all clean remove deploy-sepolia test-coverage zk-sync-anvil update all deploy-mainnet

build :; forge build

install :; forge install foundry-rs/forge-std@v1.9.6 --no-commit

deploy :
	@forge script script/DeploySimpleStorage.s.sol:DeploySimpleStorage -vvvv

deploy-sepolia :
	@forge script script/DeploySimpleStorage.s.sol:DeploySimpleStorage --rpc-url $(SEPOLIA_RPC_URL) --private-key $(PRIVATE_KEY) --broadcast --verify --etherscan-api-key $(ETHERSCAN_API_KEY) -vvvv

deploy-mainnet :
	@forge script script/DeploySimpleStorage.s.sol:DeploySimpleStorage --rpc-url $(MAINNET_RPC_URL) --private-key $(PRIVATE_KEY) --broadcast --verify --etherscan-api-key $(ETHERSCAN_API_KEY) -vvvv

zkbuild :; forge build --zksync

test :; forge test

test-coverage :; forge coverage

zktest :; foundryup-zksync && forge test --zksync && foundryup

anvil :; anvil

zk-sync-anvil :; foundryup-zksync && anvil-zksync	
# always run `foundryup` after closing zk-sync-anvil

snapshot :; forge snapshot

all: clean remove install update build

# Clean the repo
clean  :; forge clean

# Remove modules
remove :; rm -rf .gitmodules && rm -rf .git/modules/* && rm -rf lib && touch .gitmodules && git add . && git commit -m "modules"

update :; forge update

all :; clean remove install update build