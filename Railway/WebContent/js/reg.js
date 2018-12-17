/**
 * 
 */
function panduan(){
	var username = document.login_form.username.value;
	var password = document.login_form.password.value;
	var q_password = document.login_form.q_password.value;
	var name = document.login_form.name.value;
	var num = document.login_form.num.value;
	var email = document.login_form.email.value;
	var tel = document.login_form.tel.value;
	var selectStatus=document.getElementById('xy');
	var yzmtrue = document.login_form.yzmtrue.value;
	var yzm = document.login_form.yzm.value;
	if(yzm != yzmtrue){
		
		alert("验证码错误!");
	//	alert(yzm);
	//	alert(yzmtrue);
		login_form.yzm.focus();
		return false;
	}
	if(selectStatus.checked==false){
		alert("您未同意客户服务协议");
		login_form.username.focus();
		return false;
	}
	if(username==""){
		alert("请输入用户名");
		login_form.username.focus();
		return false;
	}
	if(password == ""){
		alert("请输入密码");
		login_form.password.focus();
		return false;
	}
	if(password != q_password){
		alert("两次密码不一致");
		login_form.q_password.focus();
		return false;
	}
	if(name == ""){
		alert("输入姓名");
		login_form.name.focus();
		return false;
	}
	if(num == ""){
		alert("输入身份证号");
		login_form.num.focus();
		return false;
	}
	if(tel == ""){
		alert("输入电话");
		login_form.tel.focus();
		return false;
	}
	
	if(!(/^1[34578]\d{9}$/.test(tel))){ 
        alert("手机号码有误，请重填");  
        login_form.tel.focus();
        return false; 
    } 
	var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
	if(reg.test(num) == false){  
       alert("身份证输入不合法");  
       login_form.num.focus();
       return  false;  
	 }  
	var yhm = /^[a-zA-Z0-9_-]{4,16}$/; 
	if(!yhm.test(username)){
		alert("用户名格式不正确!");
		login_form.username.focus();
		return false;
	}
	var pwd_re =  /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,15}$/;
	if(!pwd_re.test(password)){
		alert("密码格式不正确!");
		login_form.password.focus();
		return false;
	}
	return true;
}
function checkempty_tel(){
	var tel = document.login_form.tel.value;
	if(tel == ""){
		$("#tel_info").html("请输入手机号码!");
		$("#tel_info").css("color","red");
	}else{
		if(!(/^1[34578]\d{9}$/.test(tel))){ 
			$("#tel_info").html("手机号码不合法!");
			$("#tel_info").css("color","red");
	    }else{
	    	$("#tel_info").html("手机号码合法!");
			$("#tel_info").css("color","green");
	    } 
	}
}
function checkempty_idcard(){
	var num = document.login_form.num.value;
	if(num == ""){
		$("#idcard_info").html("请输入身份证号!");
		$("#idcard_info").css("color","red");
	}else{
		var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
		if(reg.test(num) == false){
			$("#idcard_info").html("身份证输入不合法!");
			$("#idcard_info").css("color","red");  
		 }else{
			// alert("111");
			$.ajax({
				
				type:"post",
				url:"check_idpass.jsp",
				dataType:"text",
				data:{"daijiance":num},
				success:function(msg){
					if(msg==0){
						$("#idcard_info").html("\""+num+"\" 已被注册!");
						$("#idcard_info").css("color","red");
					}else if(msg==1){
						$("#idcard_info").html("\""+num+"\" 可以使用!");
						$("#idcard_info").css("color","green");
					}else{
						$("#idcard_info").html("");
					}
				},
				error:function(){
					alert("ajax error!");
				}
			});
		}
	}
}
function checkempty_name(){
	var name = document.login_form.name.value;
	if(name == ""){
		$("#name_info").html("请输入姓名!");
		$("#name_info").css("color","red");
	}else{
		$("#name_info").html("姓名合法!");
		$("#name_info").css("color","green");
	}
}
function checkempty_denlenpass(){
	var q_password = document.login_form.q_password.value;
	var password = document.login_form.password.value;
	if(password != q_password){
		$("#qpwd_info").html("两次密码不一致!");
		$("#qpwd_info").css("color","red");
	}else{
		$("#qpwd_info").html("");
	}
}
function checkempty_pass(){
	var password = document.login_form.password.value;
	if(password == ""){
		$("#pwd_info").html("请输入密码!");
		$("#pwd_info").css("color","red");
	}else{
		$("#pwd_info").html("");
		var pwd_re =  /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,15}$/;
		if(!pwd_re.test(password)){
			$("#pwd_info").html("密码格式不正确!");
			$("#pwd_info").css("color","red");
		}else{
			$("#pwd_info").html("此密码可以使用!");
			$("#pwd_info").css("color","green");
		}
	}
}
function checkuser(){
	var username = document.login_form.username.value;
	if(username==""){
		$("#info").html("请输入用户名!");
		$("#info").css("color","red");
	}else{
		var yhm = /^[a-zA-Z0-9_-]{6,16}$/; 
		if(!yhm.test(username)){
			$("#info").html("用户名格式不正确!");
			$("#info").css("color","red");
		}else{
			$.ajax({
				type:"post",
				url:"usercheck.jsp",
				dataType:"text",
				data:{"daijiance":username},
				success:function(msg){
					if(msg==0){
						$("#info").html("\""+username+"\" 已被注册!");
						$("#info").css("color","red");
					}else if(msg==1){
						$("#info").html("\""+username+"\" 可以使用!");
						$("#info").css("color","green");
					}else{
						$("#info").html("");
					}
				},
				error:function(){
					alert("ajax error!");
				}
			});
		}
	}
}
var countdown=60; 
function sendemail(){
	var tel = document.login_form.tel.value;
	$.ajax({
		type:"post",
		url:"sendmoble_code.jsp",
		dataType:"text",
		data:{"phone":tel},
		success:function(msg){
		//	alert("this msg = "+msg);
			var aa = msg.replace(/\s/g,'');  //匹配掉jqurey ajax返回值前后追加许多空格和换行de操作
		//	alert("this msg = "+aa);
			$("input#check_yzm").val(aa);
		},
		error:function(){
			alert("yzm ajax error!");
		}
	});
    var obj = $("#btn");
    settime(obj);
    
    }

function settime(obj) { //发送验证码倒计时
    if (countdown == 0) { 
        obj.attr('disabled',false); 
        //obj.removeattr("disabled"); 
        obj.val("免费获取验证码");
        countdown = 60; 
        return;
    } else { 
        obj.attr('disabled',true);
        obj.val(countdown + " 秒后重新发送");
        countdown--; 
    } 
	setTimeout(function() { 
	    settime(obj) }
	    ,1000) 
}