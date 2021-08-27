document.addEventListener("DOMContentLoaded", function(){
    const canvasEl = doucment.getElementbyID("mycanvas");
    canvasEl.width = 500;
    canvasEl.height = 500;
    const ctx = canvasEl.getContext("2d");

    ctx.fillStyle = "marroon";
    ctx.fillRect(0, 0, 500, 500);

    ctx.beginPath();
    ctx.arc(200, 200, 40, 0, 2*Math.PI, true);
    ctx.strokeStyle = "red";
    ctx.lineWidth = 4;
    ctx.stroke();
    ctx.fillStyle = "blue";
    ctx.fill();

});
