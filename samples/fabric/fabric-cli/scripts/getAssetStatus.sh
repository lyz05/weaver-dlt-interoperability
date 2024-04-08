CC=$(cat config.json | jq -r .network2.chaincode)
echo -e "\n\n############## 貨幣鏈 Fabric network2: $CC ################\n"
echo -e "查詢貨幣鏈上Alice的資產"
./bin/fabric-cli chaincode query --local-network=network2 --user=alice mychannel $CC GetMyWallet '[]'
echo -e "查詢貨幣鏈上Bob的資產"
./bin/fabric-cli chaincode query --local-network=network2 --user=bob mychannel $CC GetMyWallet '[]'

CC=$(cat config.json | jq -r .network1.chaincode)
echo -e "\n\n############## 供應鏈 Fabric network1: $CC ################\n"
echo -e "查詢供應鏈上Alice的資產"
./bin/fabric-cli chaincode query --local-network=network1 --user=alice mychannel $CC GetMyAssets '[]'
echo -e "查詢供應鏈上Bob的資產"
./bin/fabric-cli chaincode query --local-network=network1 --user=bob mychannel $CC GetMyAssets '[]'
