function init(){
	//先获取到的值为0
	  var getCount=document.getElementById("OnClickCount").innerHTML;	
			//将0的值传递进来，因为是第0次传入
	      getFunction(getCount);
}

function getFunction(getCounts){
	
	//这里面获取到用户传递过来的后台用户数量
	var  getAllUserCount=document.getElementById("getUserCounts").innerHTML;
	//所有的值都在这里面了！！！！！！！！！1
	 var getgroupJudge=document.getElementById("getGrounpJudge").innerHTML;
	 //这里面存入的是这一周的
	 var getgroupJudges=document.getElementById("getGrounpJudges").innerHTML;
	
	 var getPerUser=getgroupJudge.split("&amp;");
	 var tArray = new Array(); 
	 for(var s=0;s<getPerUser.length;s++){
		 tArray[s]=new Array();
		 var getPerUserJudge=getPerUser[s].split(",");
		 for(var k=0;k<getPerUserJudge.length;k++){ 
		 tArray[s][k]=getPerUserJudge[k];	 
		 }
	 }	 
	 
	 var getPerUsers=getgroupJudges.split("&amp;");
	 var tArrays = new Array(); 
	 for(var s=0;s<getPerUsers.length;s++){
		 tArrays[s]=new Array();
		 var getPerUserJudges=getPerUsers[s].split(",");
		 for(var k=0;k<getPerUserJudges.length;k++){ 
		 tArrays[s][k]=getPerUserJudges[k];	 
		 }
	 }	 
	 
	 
	//获取到前台的count值
	var getYear=document.getElementById("getYear");
	
	
	var getMonHao=document.getElementById("getMonHao");
	var getTuesHao=document.getElementById("getTuesHao");
	var getWednesHao=document.getElementById("getWednesHao");
	var getThursHao=document.getElementById("getThursHao");
	var getFriHao=document.getElementById("getFriHao");
	var getSaturHao=document.getElementById("getSaturHao");
	var getSunHao=document.getElementById("getSunHao");

	   var g=new Date();
	   getYear.innerHTML='<span style="font-size:40px;">'+g.getFullYear();+'</span>';
	   var getDay=g.getDay();
	   switch(getDay){
	   case 0:
		   var getMon=g.getTime()-(6+getCounts*7)*24*60*60*1000;
		   var getMonDay=new Date(getMon).getDate();
		   var getTues=g.getTime()-(5+getCounts*7)*24*60*60*1000;
		   var getTuesDay=new Date(getTues).getDate();
		   var getWended=g.getTime()-(4+getCounts*7)*24*60*60*1000;
		   var getWendedDay=new Date(getWended).getDate();
		   var getTurs=g.getTime()-(3+getCounts*7)*24*60*60*1000;
		   var getTursDay=new Date(getTurs).getDate();
		   var getFri=g.getTime()-(2+getCounts*7)*24*60*60*1000;
		   var getFriDay=new Date(getFri).getDate();
		   var getStatur=g.getTime()-(1+getCounts*7)*24*60*60*1000;
		   var getStaturDay=new Date(getStatur).getDate();		
		   var getSun=g.getTime()-(getCounts*7)*24*60*60*1000;
		   var getSunDay=new Date(getSun).getDate();	
		   getMonHao.innerHTML='<span>'+getMonDay+'</span>';
		   getTuesHao.innerHTML='<span>'+getTuesDay+'</span>';
		   getWednesHao.innerHTML='<span>'+getWendedDay+'</span>'; 
		   getThursHao.innerHTML='<span>'+getTursDay+'</span>';
		   getFriHao.innerHTML='<span>'+getFriDay+'</span>';
		   getSaturHao.innerHTML='<span>'+getStaturDay+'</span>';
		   getSunHao.innerHTML='<span>'+getSunDay+'</span>';
		   for(var i=0;i<getAllUserCount;i++){
				var getUserName=document.getElementById("getUserNames"+i).innerHTML;
				var getMonDay=document.getElementById("getPerUserMon"+i);
				getMonDay.innerHTML='<img style="width:90px;height:40px;" src="image/'+tArray[i][6]+'.jpg"/>';
				var getTuesDay=document.getElementById("getPerUserTues"+i);
				getTuesDay.innerHTML='<img style="width:90px;height:40px;" src="image/'+tArray[i][5]+'.jpg"/>';
				var getWednesDay=document.getElementById("getPerUserWednes"+i);
				getWednesDay.innerHTML='<img style="width:90px;height:40px;" src="image/'+tArray[i][4]+'.jpg"/>';
				var getThursDay=document.getElementById("getPerUserThurs"+i);
				getThursDay.innerHTML='<img style="width:90px;height:40px;" src="image/'+tArray[i][3]+'.jpg"/>';
				var getFriDay=document.getElementById("getPerUserFri"+i);
				getFriDay.innerHTML='<img style="width:90px;height:40px;" src="image/'+tArray[i][2]+'.jpg"/>';
				var getSaturDay=document.getElementById("getPerUserSatur"+i);
				getSaturDay.innerHTML='<img style="width:90px;height:40px;" src="image/'+tArray[i][1]+'.jpg"/>';
				var getSunDay=document.getElementById("getPerUserSun"+i);
				getSunDay.innerHTML='<img style="width:90px;height:40px;" src="image/'+tArray[i][0]+'.jpg"/>';					
				}
		   		break;
	   case 1:
		   var getMon=g.getTime()-(getCounts*7)*24*60*60*1000;
		   var getMonDay=new Date(getMon).getDate();
		   var getTues=g.getTime()-(getCounts*7-1)*24*60*60*1000;
		   var getTuesDay=new Date(getTues).getDate();
		   var getWended=g.getTime()-(getCounts*7-2)*24*60*60*1000;
		   var getWendedDay=new Date(getWended).getDate();
		   var getTurs=g.getTime()-(getCounts*7-3)*24*60*60*1000;
		   var getTursDay=new Date(getTurs).getDate();
		   var getFri=g.getTime()-(getCounts*7-4)*24*60*60*1000;
		   var getFriDay=new Date(getFri).getDate();
		   var getStatur=g.getTime()-(getCounts*7-5)*24*60*60*1000;
		   var getStaturDay=new Date(getStatur).getDate();		
		   var getSun=g.getTime()-(getCounts*7-6)*24*60*60*1000;
		   var getSunDay=new Date(getSun).getDate();	
		   getMonHao.innerHTML='<span>'+getMonDay+'</span>';
		   getTuesHao.innerHTML='<span>'+getTuesDay+'</span>';
		   getWednesHao.innerHTML='<span>'+getWendedDay+'</span>'; 
		   getThursHao.innerHTML='<span>'+getTursDay+'</span>';
		   getFriHao.innerHTML='<span>'+getFriDay+'</span>';
		   getSaturHao.innerHTML='<span>'+getStaturDay+'</span>';
		   getSunHao.innerHTML='<span>'+getSunDay+'</span>';
		   for(var i=0;i<getAllUserCount;i++){
				var getMonDay=document.getElementById("getPerUserMon"+i);
				getMonDay.innerHTML='<img style="width:90px;height:40px;" src="image/'+tArray[i][0]+'.jpg"/>';
				if(getCounts==0){
					var getTuesDay=document.getElementById("getPerUserTues"+i);
					getTuesDay.innerHTML='<img style="width:90px;height:40px;" src="image/0.jpg"/>';
					var getWednesDay=document.getElementById("getPerUserWednes"+i);
					getWednesDay.innerHTML='<img style="width:90px;height:40px;" src="image/0.jpg"/>';
					var getThursDay=document.getElementById("getPerUserThurs"+i);
					getThursDay.innerHTML='<img style="width:90px;height:40px;" src="image/0.jpg"/>';
					var getFriDay=document.getElementById("getPerUserFri"+i);
					getFriDay.innerHTML='<img style="width:90px;height:40px;" src="image/0.jpg"/>';
					var getSaturDay=document.getElementById("getPerUserSatur"+i);
					getSaturDay.innerHTML='<img style="width:90px;height:40px;" src="image/0.jpg"/>';
					var getSunDay=document.getElementById("getPerUserSun"+i);
					getSunDay.innerHTML='<img style="width:90px;height:40px;" src="image/0.jpg"/>';				
				}else{
				var getTuesDay=document.getElementById("getPerUserTues"+i);
				getTuesDay.innerHTML='<img style="width:90px;height:40px;" src="image/'+tArrays[i][6]+'.jpg"/>';
				var getWednesDay=document.getElementById("getPerUserWednes"+i);
				getWednesDay.innerHTML='<img style="width:90px;height:40px;" src="image/'+tArrays[i][5]+'.jpg"/>';
				var getThursDay=document.getElementById("getPerUserThurs"+i);
				getThursDay.innerHTML='<img style="width:90px;height:40px;" src="image/'+tArrays[i][4]+'.jpg"/>';
				var getFriDay=document.getElementById("getPerUserFri"+i);
				getFriDay.innerHTML='<img style="width:90px;height:40px;" src="image/'+tArrays[i][3]+'.jpg"/>';
				var getSaturDay=document.getElementById("getPerUserSatur"+i);
				getSaturDay.innerHTML='<img style="width:90px;height:40px;" src="image/'+tArrays[i][2]+'.jpg"/>';
				var getSunDay=document.getElementById("getPerUserSun"+i);
				getSunDay.innerHTML='<img style="width:90px;height:40px;" src="image/'+tArrays[i][1]+'.jpg"/>';					
					}
				}   		
		   	    break;	
	   case 2:
		   var getMon=g.getTime()-(getCounts*7+1)*24*60*60*1000;
		   var getMonDay=new Date(getMon).getDate();
		   var getTues=g.getTime()-(getCounts*7)*24*60*60*1000;
		   var getTuesDay=new Date(getTues).getDate();
		   var getWended=g.getTime()-(getCounts*7-1)*24*60*60*1000;
		   var getWendedDay=new Date(getWended).getDate();
		   var getTurs=g.getTime()-(getCounts*7-2)*24*60*60*1000;
		   var getTursDay=new Date(getTurs).getDate();
		   var getFri=g.getTime()-(getCounts*7-3)*24*60*60*1000;
		   var getFriDay=new Date(getFri).getDate();
		   var getStatur=g.getTime()-(getCounts*7-4)*24*60*60*1000;
		   var getStaturDay=new Date(getStatur).getDate();		
		   var getSun=g.getTime()-(getCounts*7-5)*24*60*60*1000;
		   var getSunDay=new Date(getSun).getDate();	
		   getMonHao.innerHTML='<span>'+getMonDay+'</span>';
		   getTuesHao.innerHTML='<span>'+getTuesDay+'</span>';
		   getWednesHao.innerHTML='<span>'+getWendedDay+'</span>'; 
		   getThursHao.innerHTML='<span>'+getTursDay+'</span>';
		   getFriHao.innerHTML='<span>'+getFriDay+'</span>';
		   getSaturHao.innerHTML='<span>'+getStaturDay+'</span>';
		   getSunHao.innerHTML='<span>'+getSunDay+'</span>';
		   for(var i=0;i<getAllUserCount;i++){
				var getMonDay=document.getElementById("getPerUserMon"+i);
				getMonDay.innerHTML='<img style="width:90px;height:40px;" src="image/'+tArray[i][1]+'.jpg"/>';
				var getTuesDay=document.getElementById("getPerUserTues"+i);
				getTuesDay.innerHTML='<img style="width:90px;height:40px;" src="image/'+tArray[i][0]+'.jpg"/>';
				if(getCounts==0){
				
					var getWednesDay=document.getElementById("getPerUserWednes"+i);
					getWednesDay.innerHTML='<img style="width:90px;height:40px;" src="image/0.jpg"/>';
					var getThursDay=document.getElementById("getPerUserThurs"+i);
					getThursDay.innerHTML='<img style="width:90px;height:40px;" src="image/0.jpg"/>';
					var getFriDay=document.getElementById("getPerUserFri"+i);
					getFriDay.innerHTML='<img style="width:90px;height:40px;" src="image/0.jpg"/>';
					var getSaturDay=document.getElementById("getPerUserSatur"+i);
					getSaturDay.innerHTML='<img style="width:90px;height:40px;" src="image/0.jpg"/>';
					var getSunDay=document.getElementById("getPerUserSun"+i);
					getSunDay.innerHTML='<img style="width:90px;height:40px;" src="image/0.jpg"/>';				
				}else{
					var getWednesDay=document.getElementById("getPerUserWednes"+i);
					getWednesDay.innerHTML='<img style="width:90px;height:40px;" src="image/'+tArrays[i][6]+'.jpg"/>';
					var getThursDay=document.getElementById("getPerUserThurs"+i);
					getThursDay.innerHTML='<img style="width:90px;height:40px;" src="image/'+tArrays[i][5]+'.jpg"/>';
					var getFriDay=document.getElementById("getPerUserFri"+i);
					getFriDay.innerHTML='<img style="width:90px;height:40px;" src="image/'+tArrays[i][4]+'.jpg"/>';
					var getSaturDay=document.getElementById("getPerUserSatur"+i);
					getSaturDay.innerHTML='<img style="width:90px;height:40px;" src="image/'+tArrays[i][3]+'.jpg"/>';
					var getSunDay=document.getElementById("getPerUserSun"+i);
					getSunDay.innerHTML='<img style="width:90px;height:40px;" src="image/'+tArrays[i][2]+'.jpg"/>';					
					}
				}   		
		   	    break;	
	   case 3:
		   var getMon=g.getTime()-(getCounts*7+2)*24*60*60*1000;
		   var getMonDay=new Date(getMon).getDate();
		   var getTues=g.getTime()-(getCounts*7+1)*24*60*60*1000;
		   var getTuesDay=new Date(getTues).getDate();
		   var getWended=g.getTime()-(getCounts*7)*24*60*60*1000;
		   var getWendedDay=new Date(getWended).getDate();
		   var getTurs=g.getTime()-(getCounts*7-1)*24*60*60*1000;
		   var getTursDay=new Date(getTurs).getDate();
		   var getFri=g.getTime()-(getCounts*7-2)*24*60*60*1000;
		   var getFriDay=new Date(getFri).getDate();
		   var getStatur=g.getTime()-(getCounts*7-3)*24*60*60*1000;
		   var getStaturDay=new Date(getStatur).getDate();		
		   var getSun=g.getTime()-(getCounts*7-4)*24*60*60*1000;
		   var getSunDay=new Date(getSun).getDate();	
		   getMonHao.innerHTML='<span>'+getMonDay+'</span>';
		   getTuesHao.innerHTML='<span>'+getTuesDay+'</span>';
		   getWednesHao.innerHTML='<span>'+getWendedDay+'</span>'; 
		   getThursHao.innerHTML='<span>'+getTursDay+'</span>';
		   getFriHao.innerHTML='<span>'+getFriDay+'</span>';
		   getSaturHao.innerHTML='<span>'+getStaturDay+'</span>';
		   getSunHao.innerHTML='<span>'+getSunDay+'</span>';
		   for(var i=0;i<getAllUserCount;i++){
				var getMonDay=document.getElementById("getPerUserMon"+i);
				getMonDay.innerHTML='<img style="width:90px;height:40px;" src="image/'+tArray[i][2]+'.jpg"/>';
				var getTuesDay=document.getElementById("getPerUserTues"+i);
				getTuesDay.innerHTML='<img style="width:90px;height:40px;" src="image/'+tArray[i][1]+'.jpg"/>';
				var getWednesDay=document.getElementById("getPerUserWednes"+i);
				getWednesDay.innerHTML='<img style="width:90px;height:40px;" src="image/'+tArray[i][0]+'.jpg"/>';
				if(getCounts==0){
					var getThursDay=document.getElementById("getPerUserThurs"+i);
					getThursDay.innerHTML='<img style="width:90px;height:40px;" src="image/0.jpg"/>';
					var getFriDay=document.getElementById("getPerUserFri"+i);
					getFriDay.innerHTML='<img style="width:90px;height:40px;" src="image/0.jpg"/>';
					var getSaturDay=document.getElementById("getPerUserSatur"+i);
					getSaturDay.innerHTML='<img style="width:90px;height:40px;" src="image/0.jpg"/>';
					var getSunDay=document.getElementById("getPerUserSun"+i);
					getSunDay.innerHTML='<img style="width:90px;height:40px;" src="image/0.jpg"/>';				
				}else{
					var getThursDay=document.getElementById("getPerUserThurs"+i);
					getThursDay.innerHTML='<img style="width:90px;height:40px;" src="image/'+tArrays[i][6]+'.jpg"/>';
					var getFriDay=document.getElementById("getPerUserFri"+i);
					getFriDay.innerHTML='<img style="width:90px;height:40px;" src="image/'+tArrays[i][5]+'.jpg"/>';
					var getSaturDay=document.getElementById("getPerUserSatur"+i);
					getSaturDay.innerHTML='<img style="width:90px;height:40px;" src="image/'+tArrays[i][4]+'.jpg"/>';
					var getSunDay=document.getElementById("getPerUserSun"+i);
					getSunDay.innerHTML='<img style="width:90px;height:40px;" src="image/'+tArrays[i][3]+'.jpg"/>';					
					}
				}   		
		   	    break;	   	    
	   case 4:
		   var getMon=g.getTime()-(getCounts*7+3)*24*60*60*1000;
		   var getMonDay=new Date(getMon).getDate();
		   var getTues=g.getTime()-(getCounts*7+2)*24*60*60*1000;
		   var getTuesDay=new Date(getTues).getDate();
		   var getWended=g.getTime()-(getCounts*7+1)*24*60*60*1000;
		   var getWendedDay=new Date(getWended).getDate();
		   var getTurs=g.getTime()-(getCounts*7)*24*60*60*1000;
		   var getTursDay=new Date(getTurs).getDate();
		   var getFri=g.getTime()-(getCounts*7-1)*24*60*60*1000;
		   var getFriDay=new Date(getFri).getDate();
		   var getStatur=g.getTime()-(getCounts*7-2)*24*60*60*1000;
		   var getStaturDay=new Date(getStatur).getDate();		
		   var getSun=g.getTime()-(getCounts*7-3)*24*60*60*1000;
		   var getSunDay=new Date(getSun).getDate();	
		   getMonHao.innerHTML='<span>'+getMonDay+'</span>';
		   getTuesHao.innerHTML='<span>'+getTuesDay+'</span>';
		   getWednesHao.innerHTML='<span>'+getWendedDay+'</span>'; 
		   getThursHao.innerHTML='<span>'+getTursDay+'</span>';
		   getFriHao.innerHTML='<span>'+getFriDay+'</span>';
		   getSaturHao.innerHTML='<span>'+getStaturDay+'</span>';
		   getSunHao.innerHTML='<span>'+getSunDay+'</span>';
		   for(var i=0;i<getAllUserCount;i++){
				var getMonDay=document.getElementById("getPerUserMon"+i);
				getMonDay.innerHTML='<img style="width:90px;height:40px;" src="image/'+tArray[i][3]+'.jpg"/>';
				var getTuesDay=document.getElementById("getPerUserTues"+i);
				getTuesDay.innerHTML='<img style="width:90px;height:40px;" src="image/'+tArray[i][2]+'.jpg"/>';
				var getWednesDay=document.getElementById("getPerUserWednes"+i);
				getWednesDay.innerHTML='<img style="width:90px;height:40px;" src="image/'+tArray[i][1]+'.jpg"/>';
				var getThursDay=document.getElementById("getPerUserThurs"+i);
				getThursDay.innerHTML='<img style="width:90px;height:40px;" src="image/'+tArray[i][0]+'.jpg"/>';
				if(getCounts==0){
					var getFriDay=document.getElementById("getPerUserFri"+i);
					getFriDay.innerHTML='<img style="width:90px;height:40px;" src="image/0.jpg"/>';
					var getSaturDay=document.getElementById("getPerUserSatur"+i);
					getSaturDay.innerHTML='<img style="width:90px;height:40px;" src="image/0.jpg"/>';
					var getSunDay=document.getElementById("getPerUserSun"+i);
					getSunDay.innerHTML='<img style="width:90px;height:40px;" src="image/0.jpg"/>';				
				}else{
					var getFriDay=document.getElementById("getPerUserFri"+i);
					getFriDay.innerHTML='<img style="width:90px;height:40px;" src="image/'+tArrays[i][6]+'.jpg"/>';
					var getSaturDay=document.getElementById("getPerUserSatur"+i);
					getSaturDay.innerHTML='<img style="width:90px;height:40px;" src="image/'+tArrays[i][5]+'.jpg"/>';
					var getSunDay=document.getElementById("getPerUserSun"+i);
					getSunDay.innerHTML='<img style="width:90px;height:40px;" src="image/'+tArrays[i][4]+'.jpg"/>';					
					}
				}   		
		   	    break;	  
	   case 5:
		   var getMon=g.getTime()-(getCounts*7+4)*24*60*60*1000;
		   var getMonDay=new Date(getMon).getDate();
		   var getTues=g.getTime()-(getCounts*7+3)*24*60*60*1000;
		   var getTuesDay=new Date(getTues).getDate();
		   var getWended=g.getTime()-(getCounts*7+2)*24*60*60*1000;
		   var getWendedDay=new Date(getWended).getDate();
		   var getTurs=g.getTime()-(getCounts*7+1)*24*60*60*1000;
		   var getTursDay=new Date(getTurs).getDate();
		   var getFri=g.getTime()-(getCounts*7)*24*60*60*1000;
		   var getFriDay=new Date(getFri).getDate();
		   var getStatur=g.getTime()-(getCounts*7-1)*24*60*60*1000;
		   var getStaturDay=new Date(getStatur).getDate();		
		   var getSun=g.getTime()-(getCounts*7-2)*24*60*60*1000;
		   var getSunDay=new Date(getSun).getDate();	
		   getMonHao.innerHTML='<span>'+getMonDay+'</span>';
		   getTuesHao.innerHTML='<span>'+getTuesDay+'</span>';
		   getWednesHao.innerHTML='<span>'+getWendedDay+'</span>'; 
		   getThursHao.innerHTML='<span>'+getTursDay+'</span>';
		   getFriHao.innerHTML='<span>'+getFriDay+'</span>';
		   getSaturHao.innerHTML='<span>'+getStaturDay+'</span>';
		   getSunHao.innerHTML='<span>'+getSunDay+'</span>';
		   for(var i=0;i<getAllUserCount;i++){
				var getMonDay=document.getElementById("getPerUserMon"+i);
				//alert(tArray[i][0]+","+tArray[i][1]+","+tArray[i][2]+","+tArray[i][3]+","+tArray[i][4]+","+tArray[i][5]+","+tArray[i][6]+","+tArray[i][7]+",");
				getMonDay.innerHTML='<img style="width:90px;height:40px;" src="image/'+tArray[i][4]+'.jpg"/>';
				var getTuesDay=document.getElementById("getPerUserTues"+i);
				getTuesDay.innerHTML='<img style="width:90px;height:40px;" src="image/'+tArray[i][3]+'.jpg"/>';
				var getWednesDay=document.getElementById("getPerUserWednes"+i);
				getWednesDay.innerHTML='<img style="width:90px;height:40px;" src="image/'+tArray[i][2]+'.jpg"/>';
				var getThursDay=document.getElementById("getPerUserThurs"+i);
				getThursDay.innerHTML='<img style="width:90px;height:40px;" src="image/'+tArray[i][1]+'.jpg"/>';
				var getFriDay=document.getElementById("getPerUserFri"+i);
				getFriDay.innerHTML='<img style="width:90px;height:40px;" src="image/'+tArray[i][0]+'.jpg"/>';
				if(getCounts==0){
					var getSaturDay=document.getElementById("getPerUserSatur"+i);
					getSaturDay.innerHTML='<img style="width:90px;height:40px;" src="image/0.jpg"/>';
					var getSunDay=document.getElementById("getPerUserSun"+i);
					getSunDay.innerHTML='<img style="width:90px;height:40px;" src="image/0.jpg"/>';				
				}else{
					var getSaturDay=document.getElementById("getPerUserSatur"+i);
					getSaturDay.innerHTML='<img style="width:90px;height:40px;" src="image/'+tArrays[i][6]+'.jpg"/>';
					var getSunDay=document.getElementById("getPerUserSun"+i);
					getSunDay.innerHTML='<img style="width:90px;height:40px;" src="image/'+tArrays[i][5]+'.jpg"/>';					
					}
				}   		
		   	    break;	    	    
	   case 6:
		   var getMon=g.getTime()-(getCounts*7+5)*24*60*60*1000;
		   var getMonDay=new Date(getMon).getDate();
		   var getTues=g.getTime()-(getCounts*7+4)*24*60*60*1000;
		   var getTuesDay=new Date(getTues).getDate();
		   var getWended=g.getTime()-(getCounts*7+3)*24*60*60*1000;
		   var getWendedDay=new Date(getWended).getDate();
		   var getTurs=g.getTime()-(getCounts*7+2)*24*60*60*1000;
		   var getTursDay=new Date(getTurs).getDate();
		   var getFri=g.getTime()-(getCounts*7+1)*24*60*60*1000;
		   var getFriDay=new Date(getFri).getDate();
		   var getStatur=g.getTime()-(getCounts*7)*24*60*60*1000;
		   var getStaturDay=new Date(getStatur).getDate();		
		   var getSun=g.getTime()-(getCounts*7-1)*24*60*60*1000;
		   var getSunDay=new Date(getSun).getDate();	
		   getMonHao.innerHTML='<span>'+getMonDay+'</span>';
		   getTuesHao.innerHTML='<span>'+getTuesDay+'</span>';
		   getWednesHao.innerHTML='<span>'+getWendedDay+'</span>'; 
		   getThursHao.innerHTML='<span>'+getTursDay+'</span>';
		   getFriHao.innerHTML='<span>'+getFriDay+'</span>';
		   getSaturHao.innerHTML='<span>'+getStaturDay+'</span>';
		   getSunHao.innerHTML='<span>'+getSunDay+'</span>';
		   for(var i=0;i<getAllUserCount;i++){
				var getMonDay=document.getElementById("getPerUserMon"+i);
				getMonDay.innerHTML='<img style="width:90px;height:40px;" src="image/'+tArray[i][5]+'.jpg"/>';
				var getTuesDay=document.getElementById("getPerUserTues"+i);
				getTuesDay.innerHTML='<img style="width:90px;height:40px;" src="image/'+tArray[i][4]+'.jpg"/>';
				var getWednesDay=document.getElementById("getPerUserWednes"+i);
				getWednesDay.innerHTML='<img style="width:90px;height:40px;" src="image/'+tArray[i][3]+'.jpg"/>';
				var getThursDay=document.getElementById("getPerUserThurs"+i);
				getThursDay.innerHTML='<img style="width:90px;height:40px;" src="image/'+tArray[i][2]+'.jpg"/>';
				var getFriDay=document.getElementById("getPerUserFri"+i);
				getFriDay.innerHTML='<img style="width:90px;height:40px;" src="image/'+tArray[i][1]+'.jpg"/>';
				var getSaturDay=document.getElementById("getPerUserSatur"+i);
				getSaturDay.innerHTML='<img style="width:90px;height:40px;" src="image/'+tArray[i][0]+'.jpg"/>';
				if(getCounts==0){
					var getSunDay=document.getElementById("getPerUserSun"+i);
					getSunDay.innerHTML='<img style="width:90px;height:40px;" src="image/0.jpg"/>';				
				}else{
					var getSunDay=document.getElementById("getPerUserSun"+i);
					getSunDay.innerHTML='<img style="width:90px;height:40px;" src="image/'+tArrays[i][6]+'.jpg"/>';					
					}
				}   		
		   	    break;	     	    
		   	    
	   }
	
}

function huoQuToday(value){
	 var getCount=document.getElementById("OnClickCount");
	 	 getCount.innerHTML=parseInt(getCount.innerHTML)+1;
	 	var getOnClickNum=getCount.innerHTML;
	var getToday=new Date();
	var getWeekCount=getToday.getDay();
	//这里面的是用户自己的在某星期的信息,这里面是用户是否来了的记录，获取到这些重要目的是想要让他变色
	for(var i=0;i<value;i++){
	var getUserMon=document.getElementById("getPerUserMons"+i);
	var getUserTues=document.getElementById("getPerUserTuess"+i);
	var getUserWednes=document.getElementById("getPerUserWedness"+i);
	var getUserThurs=document.getElementById("getPerUserThurss"+i);
	var getUserFri=document.getElementById("getPerUserFris"+i);
	var getUserSatur=document.getElementById("getPerUserSaturs"+i);
	var getUserSun=document.getElementById("getPerUserSuns"+i);
	switch(getWeekCount){
	case 0:	
		getUserSun.style.backgroundColor="#0ff";
		break;
	case 1:	
		getUserMon.style.backgroundColor="#0ff";
		break;
	case 2:	
		getUserTues.style.backgroundColor="#0ff";
		break;
	case 3:	
		getUserWednes.style.backgroundColor="#0ff";
		break;
	case 4:	
		getUserThurs.style.backgroundColor="#0ff";
		break;
	case 5:	
		getUserFri.style.backgroundColor="#0ff";
		break;
	case 6:	
		
		getUserSatur.style.backgroundColor="#0ff";
		break;	
		}
	}
	   var g=new Date();
	   var getDay=g.getDay();
	   switch(getDay){
	   case 0:
		   window.location.href="huoquUser.do?getOnClickNum="+getOnClickNum;
		   break;
		 case 1:
			 window.location.href="huoquUser.do?getOnClickNum="+getOnClickNum;
			   break;
		 case 2:
			 window.location.href="huoquUser.do?getOnClickNum="+getOnClickNum;
		   break;
		 case 3:
			 window.location.href="huoquUser.do?getOnClickNum="+getOnClickNum;
		   break;
		 case 4:
			 window.location.href="huoquUser.do?getOnClickNum="+getOnClickNum;
		   break;
		 case 5:
			 window.location.href="huoquUser.do?getOnClickNum="+getOnClickNum;
		   break;
		 case 6:
			window.location.href="huoquUser.do?getOnClickNum="+getOnClickNum;		
		   break;
	   }
}

function left(){
	var outMouth=document.getElementById("outMouth").innerHTML;
	if(outMouth==1){
		alert("本月签到记录查询触底！");
	}else{
	var getCountId=document.getElementById("OnClickCount").innerHTML;
	var getNowTime=new Date();
	var getWeek=getNowTime.getDay();
	switch(getWeek){
	case 0:
		var getcount=document.getElementById("OnClickCount");
			getcount.innerHTML=parseInt(getCountId)+1;
		var getOnClickNum=getcount.innerHTML;
		window.location.href="addUserJudge.do?getOnClickNum="+getOnClickNum;
		break;
	case 1:
		var getcount=document.getElementById("OnClickCount");
			getcount.innerHTML=parseInt(getCountId)+1;
		var getOnClickNum=getcount.innerHTML;
		window.location.href="addUserJudge.do?getOnClickNum="+getOnClickNum;
		break;
	case 2:
		var getcount=document.getElementById("OnClickCount");
			getcount.innerHTML=parseInt(getCountId)+1;
		var getOnClickNum=getcount.innerHTML;
		window.location.href="addUserJudge.do?getOnClickNum="+getOnClickNum;
		break;
	case 3:
		var getcount=document.getElementById("OnClickCount");
		getcount.innerHTML=parseInt(getCountId)+1;
		var getOnClickNum=getcount.innerHTML;
		window.location.href="addUserJudge.do?getOnClickNum="+getOnClickNum;
		break;
	case 4:
		var getcount=document.getElementById("OnClickCount");
			getcount.innerHTML=parseInt(getCountId)+1;
		var getOnClickNum=getcount.innerHTML;
		window.location.href="addUserJudge.do?getOnClickNum="+getOnClickNum;
		break;
	case 5:
		var getcount=document.getElementById("OnClickCount");
			getcount.innerHTML=parseInt(getCountId)+1;
		var getOnClickNum=getcount.innerHTML;
		window.location.href="addUserJudge.do?getOnClickNum="+getOnClickNum;
		break;
	case 6:
		var getcount=document.getElementById("OnClickCount");
			getcount.innerHTML=parseInt(getCountId)+1;
		var getOnClickNum=getcount.innerHTML;
		window.location.href="addUserJudge.do?getOnClickNum="+getOnClickNum;
		break;
	}  
	
		
	}
}

function right(){
	var getCountId=document.getElementById("OnClickCount").innerHTML;
	var getNowTime=new Date();
	var getWeek=getNowTime.getDay();
	switch(getWeek){
	case 0:
		var getcount=document.getElementById("OnClickCount");
		getcount.innerHTML=parseInt(getCountId)-1;
		var getOnClickNum=getcount.innerHTML;
		window.location.href="addUserJudge.do?getOnClickNum="+getOnClickNum;
		break;
	case 1:
		var getcount=document.getElementById("OnClickCount");
		getcount.innerHTML=parseInt(getCountId)-1;
		var getOnClickNum=getcount.innerHTML;
		window.location.href="addUserJudge.do?getOnClickNum="+getOnClickNum;
		break;
	case 2:
		var getcount=document.getElementById("OnClickCount");
		getcount.innerHTML=parseInt(getCountId)-1;
		var getOnClickNum=getcount.innerHTML;
		window.location.href="addUserJudge.do?getOnClickNum="+getOnClickNum;
		break;	
	case 3:
		var getcount=document.getElementById("OnClickCount");
		getcount.innerHTML=parseInt(getCountId)-1;
		var getOnClickNum=getcount.innerHTML;
		window.location.href="addUserJudge.do?getOnClickNum="+getOnClickNum;
		break;	
	case 4:
		var getcount=document.getElementById("OnClickCount");
		getcount.innerHTML=parseInt(getCountId)-1;
		var getOnClickNum=getcount.innerHTML;
		window.location.href="addUserJudge.do?getOnClickNum="+getOnClickNum;
		break;
	case 5:
		var getcount=document.getElementById("OnClickCount");
		getcount.innerHTML=parseInt(getCountId)-1;
		var getOnClickNum=getcount.innerHTML;
		window.location.href="addUserJudge.do?getOnClickNum="+getOnClickNum;
		break;	
	case 6:
		var getcount=document.getElementById("OnClickCount");
		getcount.innerHTML=parseInt(getCountId)-1;
		var getOnClickNum=getcount.innerHTML;
		window.location.href="addUserJudge.do?getOnClickNum="+getOnClickNum;
		break;	
	case 7:
		var getcount=document.getElementById("OnClickCount");
		getcount.innerHTML=parseInt(getCountId)-1;
		var getOnClickNum=getcount.innerHTML;
		window.location.href="addUserJudge.do?getOnClickNum="+getOnClickNum;
		break;	
	}
}










