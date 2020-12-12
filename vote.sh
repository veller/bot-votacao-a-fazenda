VOTES=0;
while :; do
  http_response=$(curl -s -o response.txt -w "%{http_code}" https://voting-vote-producer.r7.com/vote \
  -H 'authority: voting-vote-producer.r7.com' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36' \
  -H 'content-type: application/x-www-form-urlencoded' \
  -H 'accept: */*' \
  -H 'origin: https://afazenda.r7.com' \
  -H 'sec-fetch-site: same-site' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://afazenda.r7.com/a-fazenda-12/votacao' \
  -H 'accept-language: en-US,en;q=0.9,pt;q=0.8' \
  --data-raw 'voting_id=297&alternative_id=740' \
  --compressed)
  if [ $http_response == "200" ]; then
    echo mateus vai ficar sim. Votos: "$VOTES"
    let VOTES=VOTES+1;
  else
    echo "Error"
  fi
  sleep 2;
done