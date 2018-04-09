<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>日志管理</title>

<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css"> 

<link rel="stylesheet" type="text/css" href="css/fullcalendar.css"> 
<link rel="stylesheet" type="text/css" href="css/jquery-ui.css"> 
<link rel="stylesheet" href="css/later.css"> 
<script src="bootstrap-3.3.7-dist/js/jquery-3.2.1.min.js"></script>
<script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="js/jquery-ui.js"></script>
<style type="text/css">
	td{
		max-hieght:37px;
	}
	th{
		max-hieght:37px;
	}
</style>
</head>
<body onload="loadIfo()" style="max-width:1100px">
<div style="margin-left:30px">
	<div class="resultdiv" style="margin-left:-30px;margin-top: 0px;position:absolute;">
			<span class="resultspan" >日志信息表(可选择时间段查询)</span>
	</div>
	<div class="resultdiv"  style="margin-left:-30px;margin-top: 80px;position:absolute;">
		<span class="resultspan" >日志信息表(查询结果)</span>
	</div>
	<table class="table table-bordered table-hover" style="max-width:1100px;position: absolute;top: 125px;">
		
		<thead>
			
			<tr>
				<th style="width:60px;"><input type="checkbox" class="cb" name="checkboxAll" value="checkbox" id="checkPathAll" onclick="checkAll()">全选</th> 
				<th style="width:60px;">日志Id</th>
				<th style="width:75px;">操作用户</th>
				<th style="width:100px;">登录IP</th>
				<th style="width:100px;">访问URL</th>
				<th style="width:110px;">模块</th>
				<th style="width:170px;">调用方法</th>
				<th style="width:75px;">操作时间</th>
				<th style="width:50px;">描述</th>
				<th style="width:170px;">gmt创建</th>
			</tr>
		</thead>
		<tbody id="tbId">
			
			
		</tbody>
		<tfoot>
			<tr>
				
				<ul class="pagination pagination-sm" style="position: relative;float:left;margin-top: 40px;">
					
					
					<div style="position:absolute;top:515px;left:330px;">
						<div onclick="Page(0)" style="position:relative;float:left">
						<span class="fc-button fc-button-prev fc-state-default fc-corner-left" unselectable="on">
							<span class="fc-text-arrow">‹<p style="font-size:10px;margin-top:-25px;margin-left: 20px;">上一页</p></span>
						</span>
						</div>
						<div onclick="Page(1)" style="position:relative;float:left;">
						<span class="fc-button fc-button-next fc-state-default fc-corner-right" unselectable="on" style="margin-left:200px;margin-top: -25px;">
							<span class="fc-text-arrow" style="margin-left:35px;">›<p style="font-size:10px;margin-top:-25px;">下一页</p></span>
						</span>
						</div>
						
					</div>
					<div style="position: relative;float:left;margin-left: 30px;">
						<input type="text" class="form-control" id="t1" style="width:120px;" placeholder="起始日期"  readonly/>
					</div>
					
					<div  style="position: relative;float:left;">
						<input type="text" class="form-control" id="t2" style="margin-left:20px;width:120px;" placeholder="结束日期"  readonly/>
					</div>
					<li>
						<button onclick="selectIfo()" style="margin-left:30px;position: relative;float:left;" type="button" class="btn btn-primary">确定</button>
						<button onclick="deletIfo()" style="margin-left:30px;position: relative;float:left;" type="button" class="btn btn-primary">删除选中</button>
					</li>
				</ul>
						
		</tfoot>
	</table>
</div>
	<div class="modal fade" id="myModalAlt" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="myModalLabel">
							提示！
						</h4>
					</div>
					<div class="modal-body">
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">确定</button>
					</div>
				</div>
			</div>
		</div>
<script>
	var Ifo=[];
	var page=0;
	$( "#t1" ).datepicker({
        monthNames: ["1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月", "12月"],
        dayNamesMin: ["日", "一", "二", "三", "四", "五", "六"]
	});
	$( "#t2" ).datepicker({
        monthNames: ["1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月", "12月"],
        dayNamesMin: ["日", "一", "二", "三", "四", "五", "六"]
	});
	function checkAll(){
		console.log(""+$('#checkPathAll').prop('checked'));
		if($('#checkPathAll').prop('checked')){
			//$('#checkPathAll').prop('checked')=true;
			$("[name='checkbox']").prop("checked",true);
		}else{
			//$('#checkPathAll').prop('checked')=true;
			$("[name='checkbox']").prop("checked",false);
		}
	}
	function Page(i){
		if(i==0){
			if(page>=10){
				page-=10;
			}
			console.log("上一页"+page);
		}else{
			if(page<Ifo.length)
				page+=10;
			console.log("下一页"+page);		
		}
		showLogIfo(Ifo);
	}
	
	function loadIfo(){
		
		console.log("ajax");
		var xmlhttp  = new XMLHttpRequest();
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState==4&&xmlhttp.status==200){
				var getIfo = xmlhttp.responseText;
				//console.log(getIfo+"####");
				Ifo = eval("("+getIfo+")");
			}
		};
		xmlhttp.open("post","getLogAllIfo.do",false);
		xmlhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		xmlhttp.send();

			
		Ifo.sort(function(a,b){
			//console.log(a.gmtcreate+"-"+b.gmtcreate+"="+(a.gmtcreate<b.gmtcreate));
			
			return a.gmtcreate<b.gmtcreate?-1:1;
		});

		
		showLogIfo(Ifo);
	}
	
	function showLogIfo(logIfo){
		var showIfo=[];
		var j=0;
		if(page+10<logIfo.length){
			for(var i=page;i<page+10;i++){
				showIfo[j++] = logIfo[i];
			}
		}else{
			for(var i=page;i<logIfo.length;i++){
				showIfo[j++] = logIfo[i];
			}
		}
		$("#tbId").empty();
		for(var i=0;i<showIfo.length;i++){
			
			
			var htmlIfo="<tr style='max-height:40px;'>"+
				"<th style='max-height:40px;'><input type='checkbox' class='cb' name='checkbox' value='"+showIfo[i].id+"'></th> "+
				"<th style='max-height:40px;'>"+showIfo[i].id+"</th>"+
				"<th style='max-height:40px;'>"+showIfo[i].loginaccount+"</th>"+
				"<th style='max-height:40px;'>"+showIfo[i].loginip+"</th>";

				//长度过长 
				var acurl =""+ showIfo[i].actionurl.substring(16,showIfo[i].actionurl.lenght);
				if(acurl.length<21){
					htmlIfo=htmlIfo+"<th>"+acurl+"</th>"
				}else{
					//var ifo1 ="1"+  acurl;
					htmlIfo=htmlIfo+"<th onclick=aa('"+acurl+"')>"+acurl.substring(0,19)+"...</th>"
				}
				//"<th style='max-height:40px;'>"+showIfo[i].actionurl.substring(16,showIfo[i].actionurl.lenght)+"</th>"+
				if(showIfo[i].module.length<7){
					htmlIfo=htmlIfo+"<th>"+showIfo[i].module+"</th>"
				}else{
					htmlIfo=htmlIfo+"<th onclick=aa('"+showIfo[i].module+"')>"+showIfo[i].module.substring(0,5)+"...</th>"
				}
				//"<th style='max-height:40px;'>"+showIfo[i].module+"</th>"+
				if(showIfo[i].method.length<9){
					htmlIfo=htmlIfo+"<th>"+showIfo[i].method+"</th>"
				}else{
					htmlIfo=htmlIfo+"<th onclick=aa('"+showIfo[i].method+"')>"+showIfo[i].method.substring(0,9)+"...</th>"
				}
				//"<th style='max-height:40px;'>"+showIfo[i].method+"</th>";

				if(parseInt(showIfo[i].actiontime)<1000){
					htmlIfo=htmlIfo+"<th><1s</th>";
				
				}else{
					//console.log(Math.ceil(parseInt(showIfo[i].gmtcreate)/1000));
					htmlIfo=htmlIfo+"<th>"+Math.ceil(parseInt(showIfo[i].actiontime)/1000)+"s</th>";
				}
				//"<th style='max-height:40px;'>"+showIfo[i].actiontime+"</th>";

				if(showIfo[i].description=="执行成功"){
					htmlIfo=htmlIfo+"<th style='color:green'>成功</th>";
				}else{
					htmlIfo=htmlIfo+"<th style='color:red'>失败</th>";
				}
				htmlIfo=htmlIfo+"<th style='max-height:40px;'>"+showIfo[i].gmtcreate+"</th>"+"</tr>";
				//console.log(parseInt(showIfo[i].gmtcreate)<1000);
				
			//console.log(htmlIfo);
			$("#tbId").append(htmlIfo);
		}
	}
	function aa(i){
		$(".modal-body").html("隐藏的完整信息为："+i);
		$("#myModalAlt").modal('show');
		console.log(i);
	}
	function selectIfo(){
		page = 0;
		var t1 = $("#t1").val();
		var t2 = $("#t2").val();

		
		t1 = t1.split("/")[2]+"-"+t1.split("/")[0]+"-"+t1.split("/")[1]+" 00:00:00";
		t2 = t2.split("/")[2]+"-"+t2.split("/")[0]+"-"+t2.split("/")[1]+" 23:59:59";
		console.log(t1+"#"+t2);

		var LogIfo = [];
		var index=0;
		for(var i=0;i<Ifo.length;i++){
			console.log(Ifo[i].gmtcreate+"$$"+(Ifo[i].gmtcreate>t1)+"$$$"+(Ifo[i].gmtcreate<t2));
			if(Ifo[i].gmtcreate>t1&&Ifo[i].gmtcreate<t2){
				console.log("地址"+index+"--"+Ifo[i].id);
				LogIfo[index++]=Ifo[i];
				console.log(LogIfo[index-1].id+"信息"+(index-1));
			}
		}
		//console.log(LogIfo[0].id);
		showLogIfo(LogIfo);
	}
	
	function deletIfo(){
		var index = "";
		
		$("input[name='checkbox']:checked").each(function(){  
			console.log("选中的ID"+$(this).val());
			index=index+"-"+$(this).val();
			console.log(index+"##");
			
		});   
		
		console.log("选中的"+index);
		var xmlhttp  = new XMLHttpRequest();
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState==4&&xmlhttp.status==200){
				var getIfo = xmlhttp.responseText;
				
			}
		};
		xmlhttp.open("post","deleteLogSomeIfo.do",true);
		xmlhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		xmlhttp.send("index="+index);

		
		window.location.reload();
	}
</script>
</body>
</html>