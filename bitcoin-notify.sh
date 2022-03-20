#!/usr/bin/fish
curl --silent "http://api.coindesk.com/v1/bpi/currentprice.json" | python -c "import json, sys; print(json.load(sys.stdin)['bpi']['USD']['rate'])" > ~/tmp/bitcoin.log && notify-send "Bitcoin Price" (cat ~/tmp/bitcoin.log)
