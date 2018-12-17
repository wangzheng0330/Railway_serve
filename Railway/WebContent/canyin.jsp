<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>铁路服务|餐饮·特产</title>
<link href="css/canyin.css" rel="stylesheet" />
<script src="js/jquery.js"></script>
<script>
$(function(){
	var date_now = new Date();
	var year = date_now.getFullYear();
	var month = date_now.getMonth()+1 < 10 ? "0"+(date_now.getMonth()+1) : (date_now.getMonth()+1);
	var date = date_now.getDate() < 10 ? "0"+date_now.getDate() : date_now.getDate();
	$("#birthday").attr("min",year+"-"+month+"-"+date);
});
</script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div style="height: 10px;"></div>

<div class="index-search  index-main">
        <div class="search-con" style="width: 1000px;">
            <div class="item item-time ">
                <div class="item-bd">
                    <i class="i-date"></i>
                    <label class="label" style="display: none;">乘车日期</label>
                    <input type="date"  class="inp inp-date" id="birthday">
                </div>
            </div>

            <div class="item item-num">
                <div class="item-bd" style="overflow: visible">
                    <label class="label list-label">车次</label>
                    <input type="text" class="inp list-inp " id="a1" value="" placeholder="" maxlength="5" style="text-transform: uppercase" data-provide="typeahead" data-items="4" autocomplete="off">
                    <input class="input" type="hidden" id="topicId">
                    
                    
                </div>
            </div>
            <div class="item item-station">
                <div class="item-bd">
                    <div class="form-item">
                        <label for="fromStation" class="label list-label">乘车站</label>
                        <input type="hidden" value="BJP" id="a2">
                        <input class="inp list-inp" id="citySelect" type="text">
                    </div>
                </div>
            </div>
            <div class="item item-station">
                <div class="item-bd">
                    <div class="form-item">
                        <label for="toStation" class="label list-label">到达站</label>
                        <input type="hidden" value="SHH" id="toStation">
                        <input class="inp list-inp" id="citySelect1" type="text">
                    </div>
                </div>
            </div>
            <div class="item-btn"><a href="#" id="search">搜索</a></div>
        </div>
    </div>

<script type="text/javascript"  src="js/cityselect.js"></script>
<script type="text/javascript"  >
	var test=new Vcity.CitySelector({input:'citySelect'});
	var test=new Vcity.CitySelector({input:'citySelect1'});
	$("#search").click(function(){
		alert("本网站暂未开放餐饮");
	});
</script>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>