const request = require('request');
const http = require('http')

let counter = 0

process
  .on('SIGTERM', shutdown('SIGTERM'))
  .on('SIGINT', shutdown('SIGINT'))
  .on('uncaughtException', shutdown('uncaughtException'));

  function shutdown(signal) {
    return (err) => {
      console.log(`${ signal }...`);
      if (err) console.error(err.stack || err);
      setTimeout(() => {
        console.log('...waited 5s, exiting.');
        process.exit(err ? 1 : 0);
      }, 5000).unref();
    };
  }

function vote(){
    const options = {
        method: 'POST',
        url: 'https://voting-vote-producer.r7.com/vote',
        headers: {
          authority: 'voting-vote-producer.r7.com',
          'user-agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36',
          'content-type': 'application/x-www-form-urlencoded',
          accept: '*/*',
          origin: 'https://afazenda.r7.com',
          'sec-fetch-site': 'same-site',
          'sec-fetch-mode': 'cors',
          'sec-fetch-dest': 'empty',
          referer: 'https://afazenda.r7.com/a-fazenda-12/votacao',
          'accept-language': 'en-US,en;q=0.9,pt;q=0.8'
        },
        form: {voting_id: '271', alternative_id: '658'},
      };
      
      request(options, function (error, response, body) {
        if (error) throw new Error(error);
      
        console.log(response.statusCode);
        console.log(`votos: `, counter)

        if (response.statusCode === 200) counter++
      })
}

setInterval(vote, 5000)

const requestListener = function(req, res) {
  res.writeHead(200);
  res.end('Hello, World!');
}

const server = http.createServer(requestListener);
// this should be the last line
server.listen(parseInt(process.env.PORT) || 3000);
