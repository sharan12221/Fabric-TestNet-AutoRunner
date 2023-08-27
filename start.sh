#!/bin/bash

# Clean up previous artifacts
./network.sh down

# Start the test network
./network.sh up createChannel -c mychannel -ca

# Deploy chaincode
./network.sh deployCC -c mychannel -ccn basic -ccp ../asset-transfer-basic/chaincode-go/ -ccl go

# Set environment variables
export PATH=${PWD}/../bin:$PATH
export FABRIC_CFG_PATH=$PWD/../config/
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="Org1MSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/organizations/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt
export CORE_PEER_MSPCONFIGPATH=${PWD}/organizations/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp
export CORE_PEER_ADDRESS=localhost:7051

# Check peer version
export PATH="../bin:$PATH"
chmod +x ../bin/peer
peer version

# Display menu and handle user choices
while true; do
    echo "Choose an option:"
    echo "1. Invoke chaincode"
    echo "2. Query package chaincode (Give asset id..)"
    echo "3. Exit"

    read choice

    case $choice in
        1)
            # Invoke the chaincode
            peer chaincode invoke -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com --tls --cafile "${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem" -C mychannel -n basic --peerAddresses localhost:7051 --tlsRootCertFiles "${PWD}/organizations/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt" --peerAddresses localhost:9051 --tlsRootCertFiles "${PWD}/organizations/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt" -c '{"function":"InitLedger","Args":[]}'
            ;;
        2)
            # Read user input for asset ID
            echo "Enter asset ID:"
            read assetID

            # Query package chaincode for asset
            queryResult=$(peer chaincode query -C mychannel -n basic -c "{\"Args\":[\"ReadAsset\",\"$assetID\"]}")

            if [[ $queryResult == Error:* ]]; then
                echo "Error: $queryResult"
            else
                echo "Asset details:"
                echo "$queryResult"
            fi
            ;;
        
        3)
            echo "Exiting..."
            echo "Network is Not Down still...."
            echo "Use './network.sh down' to down the network"
            exit
            ;;
        *)
            echo "Invalid choice. Please choose a valid option."
            ;;
    esac
done

# This will be printed when the loop exits
