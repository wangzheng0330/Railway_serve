<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="css/init_css.css" rel="stylesheet" />
<link href="css/register_css.css" rel="stylesheet" />
<head>
	<title>网上购票系统|注册</title>
	<meta charset="UTF-8">
	<script src="js/jquery.js"></script>
	<script src="js/reg.js"></script>
</head>
<body>
	<jsp:include page="header.jsp" flush="true"></jsp:include>
	<section style="min-height: 515px;">
		<div class="content" style="min-height: 580px;">
			<div class="crumbs">
			    	您现在的位置：<a href="init.jsp">客运首页</a>
			&nbsp;>&nbsp;<a href="register.jsp">注册</a>
			</div>
			<div class="layout reg">
				<div class="lay-hd">账户信息</div>
				<div class="form_info" > 
				<div style="padding:0% 10% 0% 10%;">
				<div style="margin-left:30%;">
				<form name="login_form" action="doRegister.jsp" method="post" onsubmit="return panduan()">
					<table style="text-align:left;">
						<tr>
							<td><span style="color: red;font-size: 16px;">*&nbsp;</span><span class="register_label">用户名：</span></td>
							<td><input  autocomplete="off" class="register_input" type="text" name="username" onblur="checkuser();" placeholder="用户名设置成功后不可修改"></td>
							<td><span id="info"></span></td>
						</tr>
						<tr>
							<td><span style="color: red;font-size: 16px;">*&nbsp;</span><span class="register_label">登陆密码：</span></td>
							<td><input class="register_input" type="password" onblur="checkempty_pass();" name="password" placeholder="6-15位大小字母加数字"></td>
							<td><span id="pwd_info"></span></td>
						</tr>
						<tr>
							<td><span style="color: red;font-size: 16px;">*&nbsp;</span><span class="register_label">确认密码：</span></td>
							<td><input class="register_input" type="password" onblur="checkempty_denlenpass()" name="q_password" placeholder="再次输入您的、登陆密码"></td>
							<td><span id="qpwd_info"></span></td>
						</tr>
						<tr>
							<td><span style="color: red;font-size: 16px;">*&nbsp;</span><span class="register_label">证件类型：</span></td>
							<td>
								<select class="register_input" name = "zj_type">
									<option value ="1">中国居民身份证</option>
									<option value ="2">港澳居民往来内地通行证</option>
									<option value="3">台湾居民来往大陆通行证</option>
									<option value="4">护照</option>
								</select>
							</td>
						</tr>
						<tr>
							<td><span style="color: red;font-size: 16px;">*&nbsp;</span><span class="register_label">姓名：</span></td>
							<td><input  autocomplete="off" onblur="checkempty_name()" class="register_input" type="text" name="name" placeholder="请输入姓名"></td>
							<td><span id="name_info"></span></td>
						</tr>
						<tr>
							<td><span style="color: red;font-size: 16px;">*&nbsp;</span><span class="register_label">证件号码：</span></td>
							<td><input  autocomplete="off" class="register_input" onblur="checkempty_idcard()" type="text" name="num" placeholder="请输入您的证件号码"></td>
							<td><span id="idcard_info"></span></td>
						</tr>
						<tr>
							<td><span style="color: white;font-size: 16px;">*&nbsp;</span><span class="register_label">邮箱：</span></td>
							<td><input  autocomplete="off" class="register_input" type="text" name="email" placeholder="请正确填写邮箱地址"></td>
						</tr>
						<tr>
							<td><span style="color: red;font-size: 16px;">*&nbsp;</span><span class="register_label">手机号码：</span></td>
							<td><input  autocomplete="off" class="register_input" type="text" onblur="checkempty_tel()" name="tel" placeholder="请输入您的手机号码"></td>
							<td><span id="tel_info"></span></td>
						</tr>
						<tr>
							<td><span style="color: red;font-size: 16px;">*&nbsp;</span><span class="register_label">验证码：</span></td>
							<td><input  style="width: 100px;" autocomplete="off" class="register_input" type="text" name="yzm" placeholder="请输入验证码">
							<input class="register_label" onclick="sendemail()" id="btn" type="button" value="获取短信验证码" autocomplete="off">
							<input type="hidden" name="yzmtrue" id="check_yzm" value="">
							</td>
						</tr>
						<tr>
							<td colspan="2"><input type="checkbox" name="xieyi" id="xy" ><span>&nbsp;我已阅读并同意遵守<a target="_blank" href="fuwu.jsp">《王铮铁路客户服务协议》</a></span></td>
						</tr>
						<tr><td colspan="2">&nbsp;</td></tr>
						<tr>
							<td colspan="2" align="center">
								<!-- <input type="submit" name="submit"> -->
								<input type="image" name="submit" src="image/register_submit.png" onClick="document.formName.submit()">
							</td>
						</tr>
					</table>
				</form></div>
				</div>
				</div>
			</div>
		</div>
	</section>
	
	<jsp:include page="footer.jsp" flush="true"></jsp:include>
	<script type="text/javascript"> </script>
</body>
</html>