# 貨幣鏈
echo -e "\n\n############## 貨幣鏈 Fabric network2 ################\n"
./bin/fabric-cli user add --target-network=network2 --id=alice --secret=alicepw
./bin/fabric-cli user add --target-network=network2 --id=bob --secret=bobpw
echo -e "初始化貨幣鏈上資產"
./bin/fabric-cli configure asset add --target-network=network2 --type=token --data-file=./src/data/tokens.json

# 供應鏈
echo -e "\n\n############## 供應鏈 Fabric network1: $CC ################\n"
./bin/fabric-cli user add --target-network=network1 --id=alice --secret=alicepw
./bin/fabric-cli user add --target-network=network1 --id=bob --secret=bobpw
echo -e "初始化供應鏈上資產"
./bin/fabric-cli configure asset add --target-network=network1 --type=bond --data-file=./src/data/assets.json 