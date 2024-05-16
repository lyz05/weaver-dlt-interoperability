# Preimage to Hash
time ./bin/fabric-cli hash --hash_fn=SHA256 secrettext
# Network2 Alice->Bob token1:1500
time ./bin/fabric-cli asset exchange lock --fungible --timeout-duration=3600 --locker=alice --recipient=bob --hashBase64=ivHErp1x4bJDKuRo6L5bApO/DdoyD/dG0mAZrzLZEIs= --target-network=network2 --param=token1:1500
time ./bin/fabric-cli asset exchange is-locked --fungible --locker=alice --recipient=bob --target-network=network2 --param=token1:1500  --contract-id=<contract-id>
# Network1 Bob->Alice bond01:phone04
time ./bin/fabric-cli asset exchange lock --timeout-duration=1800 --locker=bob --recipient=alice --hashBase64=ivHErp1x4bJDKuRo6L5bApO/DdoyD/dG0mAZrzLZEIs= --target-network=network1 --param=bond01:phone04
time ./bin/fabric-cli asset exchange is-locked  --locker=bob --recipient=alice --target-network=network1 --param=bond01:phone04
# Network1 Bob->Alice claim
time ./bin/fabric-cli asset exchange claim --recipient=alice --locker=bob --target-network=network1 --param=bond01:phone04 --secret=<hash-pre-image> 
# Network2 Alice->Bob claim
time ./bin/fabric-cli asset exchange claim --fungible --recipient=bob --locker=alice --target-network=network2 --contract-id=<contract-id> --secret=<hash-pre-image>

# 提前撤回资金
./bin/fabric-cli asset exchange unlock --locker=alice --recipient=bob --target-network=network2 --contract-id=