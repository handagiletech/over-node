#!/bin/bash

cd ./consensus
./beacon-chain --dolphin --accept-terms-of-use --datadir=./data --jwt-secret ../execution/data/geth/jwtsecret --checkpoint-sync-url="https://asia-northeast3-protocol-pool.cloudfunctions.net" --suggested-fee-recipient=0xF8de7116c9A4e47674BC0bA3B402851666B5D535