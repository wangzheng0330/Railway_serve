<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="css/init_css.css" rel="stylesheet" />
<link href="css/register_css.css" rel="stylesheet" />
<head>
	<title>铁路畅行|忘记密码</title>
	<meta charset="UTF-8">
<script type="text/javascript" src="js/forget_pwd.js"></script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section style="min-height: 555px;">
		<div class="content" style="min-height: 555px;">
			<div class="crumbs">
			    	您现在的位置：<a href="init.jsp" >首页</a>
			&nbsp;>&nbsp;<a href="forget_pwd.jsp">忘记密码</a>
			</div>
			<div class="layout reg">
				<div class="lay-hd"></div>
				<div class="form_info" style="padding: 50px;"> 
				<div style="height: 30px;"><h1>通过短信验证码找回密码</h1></div>
				<div style="padding:0% 10% 0% 10%;">
				<div style="margin-left:20%;">
				<form name="login_form" action="doForget_pwd.jsp" method="post" onsubmit="return panduan();">
					<table  style="text-align:left;">
					<tr style="height: 20px;"></tr>
					<tr>
							<td><span style="color: red;font-size: 16px;">*&nbsp;</span><span class="register_label">请输入您的用户名：</span></td>
							<td><input  autocomplete="off" class="register_input" type="text" id="username" name="username" onblur="checkuser();"></td>
							<td><span id="info"></span></td>
					</tr>
					<tr>
							<td><span style="color: red;font-size: 16px;">*&nbsp;</span><span class="register_label">请确认您的手机号：</span></td>
							<td><input  autocomplete="off" class="register_input" type="text" id="tel" name="tel" value="" readonly="readonly"></td>
							<!-- <td><span id="info1"></span></td> 预留位置-->
					</tr>
					<tr>
							<td><span style="color: red;font-size: 16px;">*&nbsp;</span><span class="register_label">请输入新密码：</span></td>
							<td><input  autocomplete="off" class="register_input" type="password" id="pwd" name="pwd"></td>
							<!-- <td><span id="info1"></span></td> 预留位置-->
					</tr>
					<tr>
							<td><span style="color: red;font-size: 16px;">*&nbsp;</span><span class="register_label">验证码：</span></td>
							<td><input  style="width: 100px;" autocomplete="off" class="register_input" type="text" id="yzm" name="yzm" placeholder="请输入验证码">
							<input class="register_label" onclick="sendemail()" id="btn" type="button" value="获取短信验证码" autocomplete="off">
							<input type="hidden" name="yzmtrue" id="check_yzm" value="">
							</td>
						</tr>
						<tr style="height: 30px;"></tr>
					<tr>
							<td colspan="2" align="center">
								<!-- <input type="submit" name="submit"> -->
								<input type="image" name="submit" src="image/register_submit.png" onClick="document.formName.submit()">
							</td>
						</tr>
					</table>
					</form>
					</div>
					</div>
					<div style="height: 30px;"></div>
					
					<div style="height: 50px;"></div>
		
				</div>
			</div>
		</div>

	</section>
	
	<jsp:include page="footer.jsp" flush="true"></jsp:include>
</body>
</html>