function jikoku() {
    d = getNowDate();
    t = getNowTime();
    document.getElementById('presence_time').innerHTML = d + "　" + t;
    window.setTimeout(jikoku, 970);
}

function getPresentTime( mydate , mytime ){
    //alert( pressedName.value );
    d = getNowDate();
    d = replaceAll(d,"/","");
    t = getNowhhmm();
    //alert(d+t);
    
    // 日付をYYYYMMDD、時刻をhhmmとしてポスト
    mydate.value = d;
    mytime.value = t;
}

function getNowDate(){
    datetime = new Date();
    y = datetime.getFullYear();
    M = datetime.getMonth() + 1;
    d = datetime.getDate();

    //"yyyy/MM/dd"に整形
    now = y +"/"+ ("0"+M).slice(-2) +"/"+ ("0"+d).slice(-2) ;
    return now ;
}

function getNowTime(){

    datetime = new Date();
    h = datetime.getHours();
    m = datetime.getMinutes();
    s = datetime.getSeconds();

    //"hh:mm:ss"に整形
    now = ("0"+h).slice(-2) +":"+ ("0"+m).slice(-2) +":"+ ("0"+s).slice(-2);
    return now ;
}

function getNowhhmm(){

    datetime = new Date();
    h = datetime.getHours();
    m = datetime.getMinutes();

    //"hhmm"に整形
    now = ("0"+h).slice(-2) + ("0"+m).slice(-2) ;
    return now ;
}

function replaceAll(expression, org, dest){ 
    return expression.split(org).join(dest);
}

