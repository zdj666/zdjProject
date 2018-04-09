var Script = function () {

    /* initialize the external events
     -----------------------------------------------------------------*/

    $('#external-events div.external-event').each(function() {

        // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
        // it doesn't need to have a start or end
        var eventObject = {
            title: $.trim($(this).text()) // use the element's text as the event title
        };

        // store the Event Object in the DOM element so we can get to it later
        $(this).data('eventObject', eventObject);

        // make the event draggable using jQuery UI
        $(this).draggable({
            zIndex: 999,
            revert: true,      // will cause the event to go back to its
            revertDuration: 0  //  original position after the drag
        });

    });


    /* initialize the calendar
     -----------------------------------------------------------------*/

    var date = new Date();
    var d = date.getDate();
    var m = date.getMonth();
    var y = date.getFullYear();
	
	//修改数据
	/*var ary = new Array(2);
	ary[0]={
		"title":"123123",
		"start":"2017-11-12"
	};
	ary[1]={
		"title":"***23123",
		"start":"2017-11-11"
	};
	for(var i=0;i<ary.length;i++){
		console.log(eventData[i].title+"--------------------------"+i);
	}*/
	//
    $('#calendar').fullCalendar({
        header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,basicWeek,basicDay'
        },
        editable: true,
        eventDrop:function(event, delta, revertFunc) { 
        	
        	var t = event.start.getFullYear()+"-"+(event.start.getMonth()+1)+"-"+event.start.getDate();
            console.log(event.title + "---"+t); 
           // console.log(revertFunc);
            if (!confirm("Are you sure about this change?")) { 
                revertFunc(); 
            } 
     
        },
        eventOverlap:false,
        droppable: true, // this allows things to be dropped onto the calendar !!!
        drop: function(date, allDay) { // this function is called when something is dropped
        	console.log("移动");
            // retrieve the dropped element's stored Event Object
            var originalEventObject = $(this).data('eventObject');

            // we need to copy it, so that multiple events don't have a reference to the same object
            var copiedEventObject = $.extend({}, originalEventObject);

            // assign it the date that was reported
            copiedEventObject.start = date;
            copiedEventObject.allDay = allDay;

            // render the event on the calendar
            // the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
            $('#calendar').fullCalendar('renderEvent', copiedEventObject, true);

            // is the "remove after drop" checkbox checked?
            if ($('#drop-remove').is(':checked')) {
                // if so, remove the element from the "Draggable Events" list
            	console.log("移动evenet");
                $(this).remove();
            }

        },
        events:eventData,
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
					console.log("基本信息"+ary[i]);
				}
			
			}
			
			var dayIfo = event.start;
			dayIfo = ""+dayIfo.getFullYear()+"-"+(dayIfo.getMonth()+1)+"-"+dayIfo.getDate();
			//将添加到模态框上
			
			$("#classroomIfo").val(""+ary[0]);
			$("#timeIfo").val(""+ary[1]);
			$("#dayIfo").val(""+dayIfo);
			showModle();
			
		}
    });


}();