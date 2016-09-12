var app = require('express')();
var http = require('http').Server(app);
var io = require('socket.io')(http);
Tail = require('tail').Tail;
outTail = new Tail('/supervisor/out.log');
errorTail = new Tail('/supervisor/error.log');

app.get('/', function(req, res){
  res.sendFile(__dirname + '/index.html');
});

io.on('connection', function(socket){
  socket.on('outlog', function(msg){
    outTail.on('line', function(data) {
      io.emit('out', data);
    });
  });
  socket.on('errorlog', function(msg){
    errorTail.on('line', function(data) {
      io.emit('out', data);
    });
  });
});

http.listen(4000, function(){
  console.log('listening on *:4000');
});