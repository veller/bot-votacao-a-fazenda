VOTES=0;
while :; do
  curl 'https://voting-vote-producer.r7.com/vote' \
  -H 'authority: voting-vote-producer.r7.com' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.80 Safari/537.36' \
  -H 'content-type: application/x-www-form-urlencoded' \
  -H 'accept: /' \
  -H 'origin: https://afazenda.r7.com' \
  -H 'sec-fetch-site: same-site' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://afazenda.r7.com/a-fazenda-12/votacao' \
  -H 'accept-language: en-US,en;q=0.9,pt;q=0.8' \
  --data-raw 'voting_id=237&alternative_id=561' \
  --compressed;
  sleep 2;
  let VOTES=VOTES+1;
  echo Mateus vai ficar sim senhor. Votos: "$VOTES"
done