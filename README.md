# Hyperledger Fabric Test Network Automation

Automate the setup and management of the Hyperledger Fabric test network with ease.

## Description

This project aims to simplify the process of setting up and interacting with a Hyperledger Fabric test network for testing and experimentation purposes. It includes automation scripts that streamline various tasks, such as network initialization, chaincode deployment, and querying.

## Getting Started

1. Clone this repository to your local machine.
2. Ensure you have the necessary dependencies and prerequisites installed.
3. Customize the script parameters, environment variables, and paths to match your setup.
4. Make the script executable: `chmod +x start.sh`.
5. Run the script: `./start.sh`.

**Note:** Ensure that you save the `start.sh` script in the `test-network` directory.

## Usage

The primary script, `start.sh`, automates the following steps:

1. Cleaning up previous network artifacts.
2. Starting the test network and creating a channel.
3. Deploying chaincode to the channel.
4. Setting required environment variables.
5. Checking peer versions.
6. Providing a user menu to invoke chaincode or query assets.

## Hyperledger Fabric Version

This project is tailored for Hyperledger Fabric version 2.4.0.


## Script Details

The script uses Hyperledger Fabric's built-in commands and environment variables to interact with the test network. It covers tasks such as invoking chaincode and querying asset details.

For a more detailed explanation of how the script works, refer to the script itself:(./start.sh).

## Contributing

Contributions to this project are welcome! If you find issues, have suggestions, or want to enhance the automation, feel free to create pull requests or open issues.

## License

This project is licensed under the [MIT License](LICENSE).

---

**Disclaimer:** This project is not officially affiliated with the Hyperledger project. Hyperledger is a registered trademark of the Linux Foundation.
