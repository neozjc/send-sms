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
	 <script>
        (function ($) {
            $.ajaxBak = $.ajax;

            $.ajax = function (options) {
                options.timeout = 300000;
                options.url = options.url + (options.url.indexOf("?") > 0 ? "&" : "?") + "r=" + Math.random();

                options.complete = function (e) {
                    $("body").hideLoading();
                }

                if (options.showloading !== false) {
                    $("body").showLoading();
                }

                try {
                    return $.ajaxBak.call(this, options);
                } catch (e) {
                    if (options.showloading !== false) {
                        $("body").hideLoading();
                    }
                }
                return this;
            }
        })(jQuery);

       $(document).ready(function(){
            $(".icheck-me").iCheck({checkboxClass:"icheckbox_square-green",radioClass:"iradio_square-green",});
            $(".input-group.date").datepicker({todayBtn:"linked",keyboardNavigation:!1,forceParse:!1,calendarWeeks:!0,autoclose:!0});
            $("[data-toggle='tooltip']").tooltip();
            $("[data-toggle=popover]").popover()
       });
    </script>
<style>
body {
	font-size: 12px;
	color: #111111;
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
th {
    font-size:14px;
    text-align:center;
    vertical-align:middle;
}
td{
    font-size:10px;
    text-align:center;
    vertical-align:middle;
}
</style>
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
	
	
	<form action="${pageContext.request.contextPath}/getSomeTask" method="post">
	  <div class="input-group m-b" style="margin-bottom: 0px;">
                <div class="input-daterange input-group" id="datepicker" >
                    <div class="input-group date m-b" style="float:left">
                        <span class="input-group-addon">时间范围&nbsp;<i class="yoyee yoyee-calendar"></i></span>
                        <input type="text" class="input-sm form-control" name="begintime" id="begintime"  onchange="myRefundBeginTime(this)">
                        <span class="input-group-addon">到</span>
                    </div>
                    <div class=" input-group date m-b" style="margin-left: -4px;float:left">
                        <span class="input-group-addon"><i class="yoyee yoyee-calendar"></i></span>
                        <input type="text" class="input-sm form-control" name="endtime" id="endtime"  onchange="myRefundEndTime(this)">
                    </div>
                    <div style="float:left">  
                       <input type="submit" value="查询" class="btn-primary btn action-query">
                    </div>
                </div>  
            </div>
            <div class="form-group ">
                <div class="input-group m-b">
                    <input type="hidden" class="btn-primary btn action-query">
                </div>
               
            </div>
        </form>
	<form name="DefaultForm" method="post"
		action="http://47.96.251.139:9999/GwSpUpdate.aspx" id="DefaultForm">
		<div class="listCanvas">	
			<table id="mainTable"
				class="table table-striped table-bordered table-hover" id="opTable">
				<thead>
					<tr>
						<th>账号</th>
						<th>批次号</th>
						<th>短信条数</th>
						<th>发送代码</th>
						<th style="width:17%;">发送内容</th>
						<th>发送备注</th>
						<th>创建时间</th>
						<th>发送时间</th>
						<th>状态</th>
						<th style="width:5%;">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${tasks}" var="task" >
					<tr>
					  <c:if test="${not empty task}">
						    <td>${task.username}</td>
						    <td>${task.taskid}</td>
						    <td>${task.telnum}</td>
						    <td>${task.sendcode}</td>
						    <td>${task.content}</td>
						    <td>${task.remarks}</td>  
						    <td><fmt:formatDate value="${task.createTime}"
								pattern="yyyy-MM-dd HH:mm:ss" /></td>    
						    <td><fmt:formatDate value="${task.sendTime}"
								pattern="yyyy-MM-dd" /></td>    
						    <td>${task.status}</td>
						   <!--  <td><a href="javascript:;"
							class="btn btn-success btn-xs action-edit" data-id="1"><i
								class="fa fa-edit"></i>&nbsp;编辑</a>&nbsp;&nbsp;<a
							href="javascript:;" data-id="1"
							class="action-permission  btn btn-info btn-xs"><i
								class="fa fa-edit"></i>&nbsp;权限</a>&nbsp;&nbsp;<a
							href="javascript:;" data-id="1"
							class="action-delete   btn btn-default btn-xs"><i
								class="fa fa-trash"></i>&nbsp;删除</a></td> -->
						     <td>
						     <a href="${pageContext.request.contextPath}/getTaskDetail?taskid=${task.taskid}"><input type="text"  value="查询详情" class="btn btn-link"></a>
						     <a href="${pageContext.request.contextPath}/downloadFile?taskid=${task.taskid}"><input type="text"  value="批次下载" class="btn btn-link"></a> 
						      <a href="${pageContext.request.contextPath}/downResultFile?taskid=${task.taskid}"><input type="text"  value="结果下载" class="btn btn-link"></a>  
							 </td>  
						     
						 </c:if>
					</tr>
					</c:forEach>
						 
				</tbody>
			</table>
		</div>
		<div id="pagination">
			<div>
				共 <span class="label label-info">${pageInfo.pages}</span>页信息 ，
				第<span class="label label-info">${pageInfo.pageNum}</span>页
				<a href="${pageContext.request.contextPath}/showTask?pageNum=${pageInfo.prePage}"><span class="label label-info">上一页</span></a>
				<a href="${pageContext.request.contextPath}/showTask?pageNum=${pageInfo.nextPage}"><span class="label label-info">下一页</span></a>
			</div>
			<div class="pagination"></div>
		</div>
	</form>
</body>
</html>