function t(){
var time=document.getElementById("time");
var d=new Date();
var year=d.getFullYear();// 获取4位的年份
var day=d.getDate();
var month=d.getMonth();// 从0-11
var week=d.getDay();// 从0-7
var hours=d.getHours();
var minutes=d.getMinutes();
var seconds=d.getSeconds();
if(hours<10)
hours = "0"+hours;
if(minutes<10)
minutes = "0"+minutes;
if(seconds<10)
seconds = "0"+seconds;
switch(parseInt(week)){
case 0:week="SUN";break;
case 1:week="MON";break;
case 2:week="TUE";break;
case 3:week="WED";break;
case 4:week="THU";break;
case 5:week="FRI";break;
case 6:week="SAT";break;
}
time.innerHTML=hours+":"+minutes+":"+seconds+" "+week+" "
+year+"/"+(month+1)+"/"+day+"";
};
var intervalId;// 全局变量，存储setInterval函数返回的ID值
onload=function(){
intervalId=setInterval(t,1000);
};
