# TaskChain  

**TaskChain** is a decentralized to-do list built on the Ethereum blockchain. This smart contract allows users to securely create, manage, and complete tasks without relying on centralized systems. TaskChain demonstrates key blockchain concepts such as state management, event-driven architecture, and user-controlled data.

---

## Table of Contents  
- [Features](#features)  
- [Technologies Used](#technologies-used)  
- [Smart Contract Functions](#smart-contract-functions)  
- [Getting Started](#getting-started)  
  - [Prerequisites](#prerequisites)  
  - [Installation](#installation)  
  - [Deployment](#deployment)  
- [Usage](#usage)  
- [Potential Enhancements](#potential-enhancements)  
- [License](#license)

---

## Features
- **Decentralized Task Management:** Store and manage tasks without relying on centralized services.  
- **Secure Data:** Data immutably stored on the blockchain for transparency and security.  
- **Event Notifications:** Track task creation and completion with blockchain events.  
- **User Ownership:** Tasks are uniquely linked to individual Ethereum addresses.

---

## Technologies Used
- **Solidity (v0.8.x):** Smart contract development  
- **Remix IDE:** Smart contract compilation and deployment  
- **MetaMask:** Wallet for interacting with the Ethereum blockchain  
- **Ethereum Blockchain:** Transaction and data storage  
- **Rinkeby Test Network (Optional):** For testing deployments  

---

## Smart Contract Functions
### `createTask(string memory _description)`
Creates a new task with a given description. The task is stored under the user's address.  

### `getTasks()`
Returns all tasks associated with the caller's address.

### `completeTask(uint256 _taskId)`
Marks a specific task as completed by task ID.

---

## Getting Started

### Prerequisites
1. **MetaMask Wallet:** Install MetaMask from [https://metamask.io/](https://metamask.io/).  
2. **Remix IDE:** Visit [https://remix.ethereum.org/](https://remix.ethereum.org/) for contract deployment.  
3. **Ether on Test Network:** Use [faucets](https://faucet.rinkeby.io/) to get test Ether for deployments.

---

### Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/TaskChain.git
   cd TaskChain
   
2. Open the project in your preferred code editor.

3. Navigate to the contract file `TaskChain.sol` and review the code.

4. Open Remix IDE and create a new file, then copy and paste the contract code from `TaskChain.sol`.

5. Compile the contract using the Solidity compiler in Remix (make sure the compiler version matches `0.8.x`).

6. Deploy the contract using Remix's "Deploy & Run Transactions" feature. Ensure that MetaMask is connected to the desired Ethereum test network.

7. Copy the deployed contract address for future interactions.

8. Test the smart contract by interacting with the `createTask`, `getTasks`, and `completeTask` functions from Remix.
