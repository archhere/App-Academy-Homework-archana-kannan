document.addEventListener("DOMContentLoaded", function(){
  var canvas = document.getElementById('mycanvas');
  var ctx = canvas.getContext('2d');

  ctx.fillStyle = "blue";
  ctx.fillRect(0,0,400,400);


  ctx.beginPath();
  ctx.arc(200,210,50,0,2*Math.PI,true);
  ctx.strokeStyle = 'red';
  ctx.lineWidth = 5;
  ctx.stroke();
  ctx.fillStyle = "red";
  ctx.fill();



});
