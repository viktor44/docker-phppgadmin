#! /bin/bash

set -e

TAG="phppgadmin:test"

cd "$(dirname "$0")/.."

sudo docker build --tag "$TAG" . 
