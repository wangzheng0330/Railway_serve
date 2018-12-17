/**
 * 
 */

$("#btn1").click(function(){
	$("#all_ticket").show();
	$("#yichuxing_ticket").hide();
	$("#weichuxing_ticket").hide();
	$("#tuipiao_ticket").hide();
	$("#btn1").addClass("active");
	$("#btn2").removeClass("active");
	$("#btn3").removeClass("active");
	$("#btn4").removeClass("active");
});


$("#btn2").click(function(){
	$("#all_ticket").hide();
	$("#yichuxing_ticket").show();
	$("#weichuxing_ticket").hide();
	$("#tuipiao_ticket").hide();
	$("#btn2").addClass("active");
	$("#btn1").removeClass("active");
	$("#btn3").removeClass("active");
	$("#btn4").removeClass("active");
});


$("#btn3").click(function(){
	$("#all_ticket").hide();
	$("#yichuxing_ticket").hide();
	$("#weichuxing_ticket").show();
	$("#tuipiao_ticket").hide();
	$("#btn3").addClass("active");
	$("#btn1").removeClass("active");
	$("#btn2").removeClass("active");
	$("#btn4").removeClass("active");
});


$("#btn4").click(function(){
	$("#all_ticket").hide();
	$("#yichuxing_ticket").hide();
	$("#weichuxing_ticket").hide();
	$("#tuipiao_ticket").show();
	$("#btn4").addClass("active");
	$("#btn3").removeClass("active");
	$("#btn2").removeClass("active");
	$("#btn1").removeClass("active");
});