<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="users" class="mypack.bean.UserBean"></jsp:useBean>
<jsp:setProperty property="*" name="users"/>
<!DOCTYPE html>
<html>
<link href="css/init_css.css" rel="stylesheet" />
<link href="css/cityselect.css" rel="stylesheet" />
<head>
	<meta charset="UTF-8">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<title>购票系统--王铮</title>
<script src="js/jquery.js"></script>
<script>

	$(function(){
		var date_now = new Date();
		var year = date_now.getFullYear();
		var month = date_now.getMonth()+1 < 10 ? "0"+(date_now.getMonth()+1) : (date_now.getMonth()+1);
		var date = date_now.getDate() < 10 ? "0"+date_now.getDate() : date_now.getDate();
		$("#birthday").attr("min",year+"-"+month+"-"+date);
	});
	function fun(obj){
	    var div = document.getElementById("scroll");
	    if(obj.value=="隐藏"){
	        div.style.display = "none";
	        obj.value = "显示";
	    } else {
	        div.style.display = "block";
	        obj.value = "隐藏";
	    }
	}
	function panduan(){
		if(document.trip.chufadi.value==""){
			alert("请选择出发地");
			trip.chufadi.focus();
			return false;
		}
		if(document.trip.mudidi.value==""){
			alert("请选择目的地");
			trip.mudidi.focus();
			return false;
		}
		if(document.trip.gotime.value==""){
			alert("请选择时间");
			trip.gotime.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<jsp:include page="header.jsp" flush="true"></jsp:include>


<div class="ban-area">
		<div class="notice" id="scroll">
			<strong style="width: 60px;">温馨提示：</strong>
				<div class="notice_in">
					<ul><li style="color:#FB7403">本网站每日06:00~23:00提供服务,在本网站购票、改签和退票须不晚于开车前30分钟；办理“变更到站”业务时，请不晚于开车前48小时。</li>
				</ul>
				</div>
				<a href="javascript:;" id = "btn" class="i-close" shape="rect" onclick="fun(this);"></a>
		</div>
</div>
	<section style="min-height: 515px;">
		<div class="index-side">
			<div class="layout booking">
				<div class="lay-hd">车票查询</div>
				<div class="lay-bd">
					<div class="booking-in">
						<div class="booking-hd" style="height:30px;">
							<center><label><p><strong>请在下面输入你的出发地和目的地</strong></p></label></center>
						</div>
						<div class="booking-bd">
							<form method="post" name="trip" action="buy_ticket.jsp" onsubmit="return panduan();">
								<table>
									<tr><td>出发地</td></tr>
									<tr><td><input type="text" class="cityinput" name="chufadi"  id="citySelect" placeholder="请输入出发地" autocomplete="off"></td></tr>
									<tr><td>目的地</td></tr>
									<tr><td><input type="text" class="cityinput" name="mudidi"  id="citySelect1" placeholder="请输入目的地" autocomplete="off"></td></tr>
									<tr><td>出发时间</td></tr>
									<tr><td><input type="date" class="cityinput" name="gotime" id="birthday"></td></tr>
									<tr>
										<td><input type="radio" name="visitor" value="student">
										<span>学生</span>
										<input type="radio" name="visitor" value="adult" checked>
										<span>成人</span></td>
									</tr>
									<tr>
										<td ><input type="image" name="submit" src="image/submit.png" onClick="document.formName.submit()"></td>
									</tr>
								</table>
							</form>
						</div>
						<script type="text/javascript"  src="js/cityselect.js"></script>
						<script type="text/javascript"  >
							var test=new Vcity.CitySelector({input:'citySelect'});
							var test=new Vcity.CitySelector({input:'citySelect1'});
						</script>
					</div>
				</div>
			</div>
			<div class="layout booking">
				<div class="lay-hd">友情链接</div>
				<div class="lay-bd">
					<div class="booking-in">
						<div class="booking-bd">
							
						这里是预留的友情链接的位置
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--图片滚动播放效果开始-->
		<div class="slideTxt" style="position: relative;">   
			
			<div id="butong_net_right" style="overflow:hidden;width:620px;">
			<table cellpadding="0" cellspacing="0" border="0">
			<tr><td id="butong_net_right1" valign="top" align="center">
			<table cellpadding="2" cellspacing="0" border="0">
			<tr align="center">
			<td><img src="image/ad/3.jpeg"></td>
			<td><img src="image/ad/1.jpeg"></td>
			<td><img src="image/ad/2.jpeg"></td>
			
			<!-- <td><img src="image/ad/4.jpg"></td> -->
			
			</tr>
			</table>
			</td>
			<td id="butong_net_right2" valign="top"></td>
			</tr>
			</table>
			</div>
			<script>
			var speed=20//速度数值越大速度越慢
			butong_net_right2.innerHTML=butong_net_right1.innerHTML
			function Marquee4(){
			if(butong_net_right.scrollLeft<=0)
			butong_net_right.scrollLeft+=butong_net_right2.offsetWidth
			else{
			butong_net_right.scrollLeft--
			}
			}
			var MyMar4=setInterval(Marquee4,speed)
			butong_net_right.onmouseover=function() {clearInterval(MyMar4)}
			butong_net_right.onmouseout=function() {MyMar4=setInterval(Marquee4,speed)}
			</script>
		</div>
		<!--图片滚动播放效果结束-->
	</section>
	
	<jsp:include page="footer.jsp" flush="true"></jsp:include>
</body>
</html>