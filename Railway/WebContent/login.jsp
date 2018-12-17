<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="css/init_css.css" rel="stylesheet" />
<link href="css/register_css.css" rel="stylesheet" />
<head>
<meta charset="UTF-8">
	<title>登陆</title>
<script type="text/javascript">
	function setVCode()
	{
		var vCode = document.getElementById('vcode');
		vCode.src="logcheck"+"?"+(new Date()).valueOf();
	}
	function panduan(){
		
		if(document.login_form.username.value==""){
			alert("请输入用户名");
			login_form.username.focus();
			return false;
		}
		if(document.login_form.password.value==""){
			alert("请输入密码");
			login_form.password.focus();
			return false;
		}
		if(document.login_form.code.value==""){
			alert("请输入验证码");
			login_form.code.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<jsp:include page="header.jsp" flush="true"></jsp:include>
	<section style="min-height: 515px;">
		<div class="content" style="min-height: 580px;">
			<div class="crumbs">
			    	您现在的位置：<a href="init.jsp" shape="rect">客运首页</a>
			&nbsp;>&nbsp;<a href="login.jsp" shape="rect">登陆</a>
			</div>
			<div class="layout reg">
				<div class="lay-hd">账户信息</div>
				<div class="form_info"> 
				<form action="doLogin.jsp" method="post" name = "login_form" onsubmit="return panduan()">
				<div align="center">
					<table>
						<tr>
							<td><span style="color: red;font-size: 16px;">*&nbsp;</span><span class="register_label">用户名：</span></td>
							<td><input autocomplete="off" class="register_input" type="text" name="username" placeholder="请输入您的用户名"></td>
						</tr>
						<tr>
							<td><span style="color: red;font-size: 16px;">*&nbsp;</span><span class="register_label">登陆密码：</span></td>
							<td><input autocomplete="off" class="register_input" type="password" name="password" placeholder="请输入您的密码"></td>
							<td><a href="forget_pwd.jsp">忘记密码?</a></td>
						</tr>
						<tr>
							<td><span style="color: red;font-size: 16px;">*&nbsp;</span><span class="register_label">验证码:</span>
							</td>
							<td><input autocomplete="off" class="register_input" type="text" name="code" placeholder="请输入验证码"></td>
							<td ><img id = "vcode" src="logcheck" onclick = "setVCode(this);"></td>
						</tr>
						<tr><td colspan="2">&nbsp;</td></tr>
						<tr>
							<td colspan="3" align="center">
								<input type="image" name="submit" src="image/login_submit.png" onClick="document.formName.submit()"></td>
						</tr>
					</table>
					</div>
				</form></div>
			</div>
		</div>
	</section>
	
	<jsp:include page="footer.jsp" flush="true"></jsp:include>
</body>
</html>