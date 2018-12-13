<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>登陆界面</title>
<link
	href="${pageContext.request.contextPath}/css/bootstrap.min14ed.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/css/font-awesome.min93e3.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/custom.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/animate.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/style.min862f.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/sweetalert.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/datepicker3.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/css/jquery.numberedtextarea.css"
	rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/json.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/content.min.js"></script>
<script src="${pageContext.request.contextPath}/js/icheck.min.js"></script>
<script src="${pageContext.request.contextPath}/js/sweetalert.min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/bootstrap-datepicker.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-loading.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-form.js"></script>
<style>
.top-content .text {
	color: #fff;
	margin-top: 70px;
}

.top-content .text h1 {
	color: #fff;
}

.top-content .description {
	margin: 20px 0 10px 0;
}

.top-content .description p {
	opacity: 0.8;
}

.top-content .description a {
	color: #fff;
}

.top-content .description a:hover, .top-content .description a:focus {
	border-bottom: 1px dotted #fff;
}

.form-box {
	margin-top: 35px;
}

.form-top {
	overflow: hidden;
	padding: 0 25px 15px 25px;
	background: #fff;
	-moz-border-radius: 4px 4px 0 0;
	-webkit-border-radius: 4px 4px 0 0;
	border-radius: 4px 4px 0 0;
	text-align: left;
}

.form-top-left {
	float: left;
	width: 75%;
	padding-top: 45px;
}

.form-top-left h3 {
	margin-top: 0;
}

.form-top-right {
	float: left;
	width: 25%;
	padding-top: 5px;
	font-size: 66px;
	color: #ddd;
	line-height: 100px;
	text-align: right;
}

.form-bottom {
	padding: 25px 25px 30px 25px;
	background: #eee;
	-moz-border-radius: 0 0 4px 4px;
	-webkit-border-radius: 0 0 4px 4px;
	border-radius: 0 0 4px 4px;
	text-align: left;
}

.form-bottom form textarea {
	height: 100px;
}

.form-bottom form button.btn {
	width: 100%;
}

.form-bottom form .input-error {
	border-color: #4aaf51;
}

.social-login {
	margin-top: 35px;
}

.social-login h3 {
	color: #fff;
}

.social-login-buttons {
	margin-top: 25px;
}
/*.obtain-hidden { display: none; }*/
.countdown-hidden {
	display: none;
}

.again-hidden {
	display: none;
}
</style>
</head>
<body>
	<!-- Top content -->
	<div class="top-content">
		<div class="inner-bg">
			<div class="container">
				<div class="row">
					<div class="text-center text">
						<h1>
							<strong>短信发送</strong>
						</h1>

					</div>
				</div>
				<div class="row">
					<div class="col-sm-6 col-sm-offset-3 form-box">
						<div class="form-top">
							<div class="form-top-left">
								<h3>后台管理系统</h3>

							</div>
							<div class="form-top-right">
								<i class="fa fa-key"></i>
							</div>
						</div>
						<div class="form-bottom">
							<form role="form" action="${pageContext.request.contextPath}/toLogin" method="post" class="login-form">
								<div class="form-group">
									<label class="sr-only" for="form-username"> 账号</label> <input
										name="username" placeholder="账号..."
										class="form-username form-control" id="form-username"
										type="text">
								</div>
								<div class="form-group">
									<label class="sr-only" for="form-password"> 密码</label> <input
										name="password" placeholder="密码..."
										class="form-password form-control" id="form-password"
										type="password">
								</div>
								<button type="submit" class="btn">登录</button>
							</form>
						</div>
					</div>
					<div class="modal inmodal fade" id="userDialog" style="top: 200px;"
						tabindex="-1" role="dialog" aria-hidden="true">
						<div class="modal-dialog form-horizontal">
							<div class="modal-content ">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">
										<span aria-hidden="true">×</span><span class="sr-only">Close</span>
									</button>
									<h4 class="modal-title">短信验证</h4>
								</div>
								<div class="modal-body">
									<div class="form-group">
										<label class="col-sm-3 control-label"> 账号预留手机</label>
										<div class="col-sm-9">
											<input type="text" name="mobile" id="mobile" value=""
												class="form-control">
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label"> 验证码</label>
										<div class="col-sm-7">
											<div class="input-group">
												<input type="text" class="form-control" name="smscode"
													id="smscode" value="" maxlength="6"> <span
													class="input-group-addon obtain-hidden" id="obtain">获取验证码</span>
												<span class="input-group-addon countdown-hidden"
													id="countdown">500秒 </span><span
													class="input-group-addon again-hidden" id="again">重新获取
												</span>
											</div>
										</div>
									</div>
								</div>
								<div class="modal-footer">
									<button class="btn btn-default" data-dismiss="modal"
										aria-hidden="true">取消</button>
									&nbsp;&nbsp;
									<button class="btn btn-primary action-save">确定</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div
		style="left: 0px; top: 0px; overflow: hidden; margin: 0px; padding: 0px; height: 900px; width: 1903px; z-index: -999999; position: fixed;"
		class="backstretch">
		<img src="images/bg.jpg"
			style="position: absolute; margin: 0px; padding: 0px; border: medium none; width: 1903px; height: 280px; left: 0px;">
	</div>


</body>
</html>