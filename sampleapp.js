const http = require('http');
const { parse } = require('querystring');

const hostname = '0.0.0.0';
const port = 8080;

const server = http.createServer((req, res) => {
    if (req.method === 'POST') {
        collectRequestData(req, result => {
            console.log(result);
            res.end(`
               http method: ${req.method}
               Name: ${result.fname}
               Age: ${result.age}
           `);
        });
    }
    else {
        res.statusCode = 200;
        res.setHeader('Content-Type', 'text/html');
        res.end(`
           <!doctype html>
           <html>
           <body>
               <h1>http method: ${req.method} </h1>
               <h2>version 1.1</h2>
               <form action="/" method="post">
                   <input type="text" name="fname" /><br />
                   <input type="number" name="age" /><br />
                   <button>Save</button>
               </form>
           </body>
           </html>
       `);
    }
});

function collectRequestData(request, callback) {
    const FORM_URLENCODED = 'application/x-www-form-urlencoded';
    if (request.headers['content-type'] === FORM_URLENCODED) {
        let body = '';
        request.on('data', chunk => {
            body += chunk.toString();
        });
        request.on('end', () => {
            callback(parse(body));
        });
    }
    else {
        callback(null);
    }
}

server.listen(port, hostname, () => {
    console.log(`Server running at http://${hostname}:${port}/`);
});