/**
 * 
 */
function panduan(){
	
	//return false;
	var username = $("#username").val();
	var password = $("#pwd").val();
	var yzm = $("#yzm").val();
	var yzmtrue = $("#check_yzm").val();	
	if(yzm != yzmtrue){
		alert("验证码错误!");
		//alert(yzm);
	//	alert(yzmtrue);
		login_form.yzm.focus();
		return false;
	}
	if(username==""){
		alert("请输入用户名");
		login_form.username.focus();
		return false;
	}
	if(password==""){
		alert("请输入密码");
		login_form.pwd.focus();
		return false;
	}
	var pwd_re =  /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,10}$/;
	if(!pwd_re.test(password)){
		alert("密码格式不正确!");
		login_form.pwd.focus();
		return false;
	}
	return true;
}
function checkuser(){
	var username = document.login_form.username.value;
	username = $("#username").val();
	//alert(username);
	if(username==""){
		$("#info").html("请输入用户名!");
		$("#info").css("color","red");
	}else{
		$.ajax({
			type:"post",
			url:"find_pwd.jsp",
			dataType:"text",
			data:{"daijiance":username},
			success:function(msg){
				//alert(msg);
				var aa = msg.replace(/\s/g,'');
				if(aa=="no"){
					$("#info").html("\""+username+"\" 不存在!");
					$("#info").css("color","red");
				}else{
					$("#tel").val(aa);
					$("#info").html("");
				}
			},
			error:function(){
				alert("forget_pwd ajax error!");
			}
		});
	}
}
var countdown=60; 
function sendemail(){
	var tel = document.login_form.tel.value;
	$.ajax({
		type:"post",
		url:"sendmoble_pwd.jsp",
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