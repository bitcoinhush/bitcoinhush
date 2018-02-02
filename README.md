# Bitcoin Hush

Bitcoin Hush is a Komodo Asset chain, so we need to download and compile that code,
which will allow us to connect to the BTCH network. We must also tell it a node to connect to that knows about the BTCH asset chain.

BTCH uses RPC port 10161 and a P2P port of 10160, you might need to allow them in your firewall. 

```
  git clone https://github.com/jl777/komodo
  cd komodo
  # This needs to download the Zcash Proving key, around ~1GB file
  ./zcutil/fetch-params.sh
  # This will take some time, replace 2 with the number of CPUs you have
  ./zcutil/build.sh -j2
  # this supply, with the .0001BTCH block reward every 1 minute, approaches 21M BTCH in ~25years
  ./src/komodod -ac_name=BTCH -ac_supply=20998641 -addnode=78.47.196.146 &> btch.log &
  # look at your BTCH logs 
  tail btch.log
  # get the current BTCH network info
  ./src/komodo-cli -ac_name=BTCH getinfo
{
  "version": 1000850,
  "protocolversion": 170002,
  "KMDversion": "0.1.1",
  "notarized": 0,
  "notarizedhash": "0000000000000000000000000000000000000000000000000000000000000000",
  "notarizedtxid": "0000000000000000000000000000000000000000000000000000000000000000",
  "notarizedtxid_height": 676423,
  "KMDnotarized_height": 676380,
  "notarized_confirms": 0,
  "walletversion": 60000,
  "balance": 0.00000000,
  "blocks": 16,
  "longestchain": 6508,
  "timeoffset": 0,
  "tiptime": 1514794526,
  "connections": 2,
  "proxy": "",
  "difficulty": 1,
  "testnet": false,
  "keypoololdest": 1516599361,
  "keypoolsize": 101,
  "paytxfee": 0.00000000,
  "relayfee": 0.00000100,
  "errors": ""
}
```

# Frequently Asked Questions

## Can I mine BTCH?

Mining does not create new money, but yes, you can earn small amounts of BTCH by helping confirm blocks, you simply add `-gen` when you start things up:

```
./src/komodod -ac_name=BTCH -ac_supply=20998641 -addnode=78.47.196.146 -gen &> btch.log &
```
Note that this will send each bit of earnings you make to a new address, which is not great. Set a `mineraddress=taddr` in your BTCH.conf to have it all go to one address


