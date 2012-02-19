function jikoku() {
    datetime = new Date();
    y = datetime.getFullYear();
    M = datetime.getMonth() + 1;
    d = datetime.getDate();
    h = datetime.getHours();
    m = datetime.getMinutes();
    s = datetime.getSeconds();

    //"yyyy/MM/dd hh:mm:ss"に整形
    now = y + "/" + ("0"+M).slice(-2) + "/" + ("0"+d).slice(-2) + "　" + 
           ("0"+h).slice(-2) + ":" + ("0"+m).slice(-2) + ":" + ("0"+s).slice(-2);

    document.getElementById('presence_time').innerHTML = now;
    window.setTimeout("jikoku()", 1000);
}
