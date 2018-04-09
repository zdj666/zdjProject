$(function() {
	/*for(var i=0;i<eventData.length;i++){
		console.log(eventData[i].start+"--"+eventData[i].title);
	}*/

	changeStyle();
	$('#calendar').text("");
	$('#calendar').fullCalendar({
		header: {
			left: 'prev,next today',
			center: 'title',
			right: 'month,agendaWeek,agendaDay'
		},
		editable: true,
		dragOpacity: {
			agenda: .5,
			'':.6
		},
		eventDrop: function(event,dayDelta,minuteDelta,allDay,revertFunc) {

            //$('#myModalLoading').modal('show');
            
			var year = event.start.getFullYear();
			var month = (event.start.getMonth()+1);
			if(month<10){
				month="0"+month;
			}
			var day = event.start.getDate();
			if(day<10){
				day="0"+day;
			}
			var d = year+"-"+month+"-"+day;
            console.log(event.title + "---"+d); 
           // console.log(revertFunc);
            
            var grade_id=$("#grade").val();
            console.log((event.title).split(",")[0]);
            var cr = ((event.title).split(",")[0]).substring(3,5);
            var t = ((event.title).split(",")[1]).substring(5,16);
            
            console.log(grade_id+"--"+t+"-"+cr);
            var xmlhttp = new XMLHttpRequest();
			xmlhttp.onreadystatechange = function(){
				if(xmlhttp.readyState==4&&xmlhttp.status==200){
					var getIfo =""+xmlhttp.responseText;
					console.log(getIfo);
					if(getIfo=="0"){
						$('#myModalTrue').modal('show');
					}else{
						console.log("课程拖动失败");
						//$('#myModalLoading').modal('hide');
						revertFunc();
						$('#myModalFalse').modal('show');
						//console.log($('#myModaFalse').html());
						
					}
				}
			};
			xmlhttp.open("post","getTimeConfictBool.do",true);
			xmlhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
			xmlhttp.send("gradeId="+grade_id+"&date="+d+"&time="+t+"&classroom="+cr);
            
			changeStyle();
    	},
		selectable: true,
		select: function( startDate, endDate, allDay, jsEvent, view ){
			console.log("选择了"+startDate);
			var year = startDate.getFullYear();
			var month = (startDate.getMonth()+1);
			if(month<10){
				month="0"+month;
			}
			var day = startDate.getDate();
			if(day<10){
				day="0"+day;
			}
			var t = year+"-"+month+"-"+day;
			console.log("时间"+t);
			eventData.push({
				"title":"添加新的课程",
				"start":""+t
			});
			console.log(eventData.length);
			/*for(var i=0;i<eventData.length;i++){
				
				if(eventData[i].title=="147"){
					console.log("$$$");
				}
			}*/
			changeStyle();
			$.getScript("js/event.js");
		},
		events: eventData,
		dayClick: function(date, allDay, jsEvent, view) {
			
    	},
		eventClick:function(event){
			console.log("-------"+event.title+"----"+event.start);
			var titleIfo = event.title;
			var ary = new Array(2);
			ary  = titleIfo.split(",");
			
			if(ary[1]==undefined){
				//$('#myModalAlt').modal('show');
				ary[0]="";
				ary[1]="";
			}else{
				for(var i=0;i<ary.length;i++){
					ary[i]=(ary[i].split("["))[1];
					ary[i]=ary[i].substring(0,ary[i].length-1);
					//console.log("基本信息"+ary[i]);
				}
			
			}
			
			var dayIfo = event.start;
			dayIfo = ""+dayIfo.getFullYear()+"-"+(dayIfo.getMonth()+1)+"-"+dayIfo.getDate();
			//将添加到模态框上
			console.log(ary[1]);
			$("#classroomIfo").val(""+ary[0]);
			$("#h1").val(""+ary[1].substring(0,2));
			$("#m1").val(""+ary[1].substring(3,5));
			$("#h2").val(""+ary[1].substring(6,8));
			$("#m2").val(""+ary[1].substring(9,11));
			//$("#timeIfo").val(""+ary[1]);
			$("#dayIfo").val(""+dayIfo);
			showModle();
			changeStyle();
		}
	});
	
});