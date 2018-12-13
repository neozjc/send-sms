<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<title>上传号码</title>
<link rel="shortcut icon" href="http://47.96.251.139:9999/favicon.ico">
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
<script src="${pageContext.request.contextPath}/js/loading.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>	
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
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.numberedtextarea.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/mytek-pager.js"></script>
<script src="${pageContext.request.contextPath}/js/mytek-pagination.js"
	type="text/javascript"></script>
<style>
body {
	font-size: 12px;
	color: #111111;
}
.loadingWrap{
	position:fixed;
	top:0;
	left:0;
	width:100%;
	height:100%;
	z-index:300;
	background-image:url(images/loading.gif);
	background-repeat:no-repeat;
	background-position:center center;
	background-color:#000;
	background-color:rgba(0,0,0,0.5);
	filter:alpha(opacity=50);
}

.mask {
	position: absolute;  
	top: 0px;  
	filter: alpha(opacity = 60);  
	background-color: #777;
	z-index: 1002;
	left: 0px;
	opacity: 0.5;
	-moz-opacity: 0.5;
	text-align: center;
	display: none;
}

.mask span {
	height: 70%;
	display: inline-block;
	vertical-align: middle;
}

.mask span img {
	vertical-align: middle;
}
</style>
<script>
$(document).ready(function(){
    $(".icheck-me").iCheck({checkboxClass:"icheckbox_square-green",radioClass:"iradio_square-green",});
    $(".input-group.date").datepicker({todayBtn:"linked",keyboardNavigation:!1,forceParse:!1,calendarWeeks:!0,autoclose:!0});
    $("[data-toggle='tooltip']").tooltip();
    $("[data-toggle=popover]").popover()
});
  function sub(){
	    var id = 0;
	    var telTxt = document.getElementById("telTxt").value;
	    var sendcode = document.getElementById("sendcode").value;
	    var content = document.getElementById("content").value;
	    if(telTxt!="")
	    	id++;
	    if(sendcode!="")
	    	id++
	    if(content!="")
	    	id++
	    if(id==3){
	    	//新建一个div元素节点
			var div=document.createElement("div");
		    div.setAttribute("class", "loadingWrap"); 
		    div.innerHTML = "<h4>号码插入中......<h4>";
			//把div元素节点添加到body元素节点中成为其子节点，但是放在body的现有子节点的最后
			document.body.appendChild(div);
		    document.getElementById("txtForm").submit();//表单提交      
	    }else{
	     alert("表单前三项不能为空！！")
	    }
}
</script>
<script>
        $(function() {
        	 var segment = $("#segment").val();
             var province = $("#province").val();
             var cardType = $("#cardType").val();
            function formatFlagIcon(flag) {  
                return flag > 0 ? "<span class='label label-primary'>" + flag + "çº§åè­¦</span>" : "<span class='label label-default'>å³é­</span>";
            }
        

            $(document).on("click", "#MenuID", function() {
                var id = $(this).val();
                if (id == 1) {
                    $("input[name='MenuID']").prop("checked", $(this).is(":checked"));
                } else {
                    $("[data-prentid='" + id + "']").prop("checked", $(this).is(":checked"));

                    $("input[data-prentid='" + id + "']").each(function() {
                        var partentid = $(this).val();
                        $("[data-prentid='" + partentid + "']").prop("checked", $(this).is(":checked"));
                    })
                    //$("[data-prentid='" + id + "']").prop("checked", $(this).is(":checked"));
                }
            });

       
    </script>
</head>
<body class="white-bg">
	<div class="wrapper wrapper-content table-responsive">


		<div class="modal inmodal fade" id="userDialog" tabindex="-1"
			role="dialog" aria-hidden="true">
			<div class="modal-dialog form-horizontal">
				<div class="modal-content ">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title">添加/修改账户</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label class="col-sm-2 control-label"> 账户</label>
							<div class="col-sm-10">
								<input type="text" name="account" id="account" value=""
									class="form-control">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"> 密码</label>
							<div class="col-sm-10">
								<input type="password" name="password" id="password" value=""
									class="form-control">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label  col-sm-2"> 账号设置 </label>
							<div class="col-sm-10">
								<div class="icheckbox_square-green" style="position: relative;">
									<input type="checkbox" class="icheck-me" name="isVerification"
										id="isVerification" style="position: absolute; opacity: 0;">
									<ins class="iCheck-helper"
										style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins>
								</div>
								是否开启IP验证和短信验证 <span class="help-block m-b-none">开启后用户登录时会判断客户登录IP与报备IP是否一致,不一致则进行短信验证</span>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label  col-sm-2"> IP验证 </label>
							<div class="col-sm-6">
								<input type="text" name="clientIp" id="clientIp" value=""
									class="form-control">
							</div>
							<span class="help-block m-b-none">客户端IP,如：192.123.10.23</span>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"> 手机号码 </label>
							<div class="col-sm-6">
								<input type="text" name="mobile" id="mobile" value=""
									class="form-control">
							</div>
							<div class="col-sm-4">
								<select name="mobileFlag" id="mobileFlag" class="form-control">
									<option value="0">不接收告警</option>
									<option value="1">1级告警（待定告警）</option>
									<option value="2">2级告警（警告告警）</option>
									<option value="3">3级告警（次要告警）</option>
									<option value="4">4级告警（重大告警）</option>
									<option value="5">5级告警（严重告警）</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"> 电子邮件 </label>
							<div class="col-sm-6">
								<input type="text" name="email" id="email" value=""
									class="form-control">
							</div>
							<div class="col-sm-4">
								<select name="emailFlag" id="emailFlag" class="form-control">
									<option value="0">不接收告警</option>
									<option value="1">1级告警（待定告警）</option>
									<option value="2">2级告警（警告告警）</option>
									<option value="3">3级告警（次要告警）</option>
									<option value="4">4级告警（重大告警）</option>
									<option value="5">5级告警（严重告警）</option>
								</select>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button class="btn btn-default" data-dismiss="modal"
							aria-hidden="true">取消</button>
						&nbsp;&nbsp;
						<button class="btn btn-primary action-save">保存</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<form id="txtForm" method="post" action="${pageContext.request.contextPath}/upTelFile" enctype="multipart/form-data">
	  <div class="listCanvas" style="margin-left:30px;margin-right:30px;">
			       <div class="form-group">
			           <label for="name">号码文件</label>
			       	   <input type="file" name="telTxt" id="telTxt" class="form-control" placeholder="请选择号码文件：仅支持txt格式"/>
			       </div>
			       <div class="form-group">
					    <label for="name">发送代码</label>
					    <input type="text" name="sendcode" id="sendcode" class="form-control" placeholder="">
			
  					</div>
  					 <div class="form-group">
  					    <label for="name">发送时间</label>
					    <div class=" input-group date m-b" style="margin-left: -4px;float:left">
	                        <span class="input-group-addon"><i class="yoyee yoyee-calendar"></i></span>
	                        <input type="text" class="input-sm form-control" name="sendTime" id="endtime" onchange="myRefundEndTime(this)">
                        </div>    
                     </div>  
			        <div class="form-group">
	                   <label for="name">发送内容</label>
	                   <textarea class="form-control" name="content" id="content" rows="3"></textarea>
                    </div>
                     <div class="form-group">
	                   <label for="name">发送备注</label>
	                   <textarea class="form-control" name="remarks" rows="3"></textarea>
                    </div>
                    <div class="form-group">
					   <input type="button" onclick="sub()"  value="上传文件"  class="btn btn-primary"/>   
  				    </div>  
			<!-- <input type="submit" onclick="sub()" value="上传文件" class="btn btn-primary"> -->
	  </div>
	</form>
</body>   

</html>