<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
     <meta name="viewport" content="width=1366, initial-scale=1, user-scalable=no">
    <meta name="renderer" content="webkit">
    <title>短信网关3.3</title>
    <meta http-equiv="Cache-Control" content="no-siteapp">
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->
    <link rel="shortcut icon" href="http://47.96.251.139:9999/favicon.ico">
    <link href="css/bootstrap.min14ed.css" rel="stylesheet">
    <link href="css/font-awesome.min93e3.css" rel="stylesheet">
    <link href="css/style.min862f.css" rel="stylesheet">
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.metisMenu.js"></script>
    <script src="js/jquery.slimscroll.min.js"></script>
    <script src="js/layer.min.js"></script>
    <script src="js/hplus.min.js"></script>
    <script type="text/javascript" src="js/contabs.min.js"></script>
    
<link rel="stylesheet" href="css/layer.ext.css" id="layui_layer_skinlayerextcss"><link rel="stylesheet" href="css/style.css" id="layui_layer_skinmoonstylecss"></head>
<body class="fixed-sidebar full-height-layout gray-bg  pace-done" style="overflow: hidden"><div class="pace  pace-inactive"><div class="pace-progress" data-progress-text="100%" data-progress="99" style="width: 100%;">
  <div class="pace-progress-inner"></div>
</div>
<div class="pace-activity"></div></div>
    <div id="wrapper">
        <nav class="navbar-default navbar-static-side" role="navigation">
            <div class="nav-close"><i class="fa fa-times-circle"></i>
            </div>
            <div class="slimScrollDiv" style="position: relative; width: auto; height: 100%;"><div class="sidebar-collapse" style="width: auto; height: 100%;">
                <ul class="nav" id="side-menu">
                    <li class="nav-header">
                        <div class="dropdown profile-element">
                            <span><img alt="image" class="img-rounded" src="images/smgw.png" style="width:150px"></span>
                            <!-- <a data-toggle="dropdown" class="dropdown-toggle" href="main.html#">
                                <span class="clear">
                               <span class="block m-t-xs text-xs block"><strong class="font-bold">admin</strong><b class="caret"></b></span>
                 
                                </span>
                            </a> -->
                          <!--   <ul class="dropdown-menu animated fadeInRight m-t-xs">
                                <li><a class="J_menuItem" href="" data-index="0"><i class="fa fa-key"></i> 修改密码</a>
                                </li>
                                <li class="divider"></li>
                                <li><a href="login.html" class="action-logout"><i class="fa fa-coffee"></i> 安全退出</a>
                                </li>
                            </ul> -->
                        </div>
                        <div class="logo-element">SMS<br>3.0
                        </div>
                    </li> 

                    <li>
                        <a href="main.html#">
                            <i class="fa fa-cog"></i>
                            <span class="nav-label">数据管理</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level collapse">  
                          <li><a href="${pageContext.request.contextPath}/upTel" class="J_menuItem" data-index="1">号码上传</a> </li>    
                        </ul>
                        <ul class="nav nav-second-level collapse">  
                          <li><a href="${pageContext.request.contextPath}/showTask" class="J_menuItem" data-index="2">任务列表</a> </li>    
                        </ul>
                    </li>
                      
                    
         
                    
                    <!-- <li>
                        <a href="main.html#">
                            <i class="fa fa fa-bar-chart-o"></i>
                            <span class="nav-label">待审信息</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level collapse">
         
                   <li><a href="2_1.html" class="J_menuItem" data-index="9">待审核内容</a> </li>
                   <li><a href="2_2.html" class="J_menuItem" data-index="10">帐号报备内容审核</a> </li>
              

                        </ul>
                    </li>
                    <li>
                        <a href="main.html#">
                          <i class="fa fa-rocket"></i>   
                            <span class="nav-label">通道管理</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level collapse">
                                 <li><a href="3_1.html" class="J_menuItem" data-index="11">接入信息配置</a> </li>
                                <li><a href="3_2.html" class="J_menuItem" data-index="12">通道信息配置</a> </li>
                                <li><a href="3_3.html" class="J_menuItem" data-index="13">通道组配置</a> </li>
                        </ul>
                    </li>

                    <li>
                        <a href="main.html#"><i class="fa fa-user-secret"></i> <span class="nav-label">客户管理 </span> <span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level collapse">
                        <li><a href="4_1.html" class="J_menuItem" data-index="14">客户信息配置</a> </li>
                        <li><a href="4_2.html" class="J_menuItem" data-index="15">客户账号管理</a> </li>
                        <li><a href="4_3.html" class="J_menuItem" data-index="16">上行路由配置</a> </li>
                        <li><a href="4_4.html" class="J_menuItem" data-index="17">充值记录查询</a> </li>
                        
                        </ul>
                    </li>
                    <li>
                        <a href="main.html#"><i class="fa fa-newspaper-o"></i> <span class="nav-label">日志查询</span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level collapse">
                            <li><a href="5_1.html" class="J_menuItem" data-index="18">下行消息记录</a> </li>
                            <li><a href="5_2.html" class="J_menuItem" data-index="19">上行消息记录</a> </li>
                            <li><a href="5_3.html" class="J_menuItem" data-index="20">状态报告记录</a> </li>
                            <li><a href="5_4.html" class="J_menuItem" data-index="21">正在重推报告</a> </li>
                              <li><a href="5_5.html" class="J_menuItem" data-index="22">告警日志记录</a> </li>
                        </ul>
                    </li>
                    <li>
                        <a href="main.html#"><i class="fa fa fa-bar-chart-o"></i><span class="nav-label">数据统计</span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level collapse">
                               
                               <li><a href="6_1.html" class="J_menuItem" data-index="23">数据统计</a> </li>
                               <li><a href="6_2.html" class="J_menuItem" data-index="24">利润统计</a> </li>
                               <li><a href="6_3.html" class="J_menuItem" data-index="25">返还统计</a> </li>
                        </ul>
                    </li>
                    <li>
                        <a href="main.html#"><i class="fa fa-home"></i> <span class="nav-label">关于网关</span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level collapse">
                                <li><a href="7_1.html" class="J_menuItem" data-index="26">系统介绍</a> </li>
                                <li><a href="7_2.html" class="J_menuItem" data-index="27">接口文档</a> </li>
                                <li><a href="7_3.html" class="J_menuItem" data-index="28">错误代码</a> </li>
                                
                        </ul>
                    </li>
                   
                </ul> -->
            </div><div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 4px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 917px;"></div><div class="slimScrollRail" style="width: 4px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.9; z-index: 90; right: 1px;"></div></div>
        </nav>
        <div id="page-wrapper" class="gray-bg dashbard-1">
            <div class="row border-bottom">
                <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                    <div class="navbar-header">
                    </div>
                    <ul class="nav navbar-top-links navbar-right">
                        <li class="dropdown">
                           <!--  <a class="dropdown-toggle count-info" data-toggle="dropdown" href="main.html#">
                                <i class="fa fa-envelope"></i> <span class="label label-warning message-count">0</span>
                            </a> -->
                         
                            <ul class="dropdown-menu dropdown-messages">
                                <div></div>

                                <li>
                                    <div class="text-center link-block">
                                        <a class="J_menuItem" href="jinggao.html" data-index="29">
                                            <i class="fa fa-envelope"></i> <strong> 查看所有告警</strong>
                                        </a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                        <li class="dropdown hidden-xs">
                            <a class="right-sidebar-toggle" aria-expanded="false">
                                <i class="fa fa-tasks"></i> 主题
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
            <div class="row content-tabs">
                <button class="roll-nav roll-left J_tabLeft">
                    <i class="fa fa-backward"></i>
                </button>
                <nav class="page-tabs J_menuTabs">
                    <div class="page-tabs-content">
                        <a href="javascript:;" class="active J_menuTab" data-id="welcome.jsp">首页  <i class="fa fa-refresh J_refresh"></i></a>
                    </div>
                </nav>
                <button class="roll-nav roll-right J_tabRight">
                    <i class="fa fa-forward"></i>
                </button>
                <div class="btn-group roll-nav roll-right">
                    <button class="dropdown J_tabClose" data-toggle="dropdown">
                        关闭操作<span class="caret"></span>
                    </button>
                    <ul role="menu" class="dropdown-menu dropdown-menu-right">
                        <li class="J_tabShowActive"><a>定位当前选项卡</a> </li>
                        <li class="divider"></li>
                        <li class="J_tabCloseAll"><a>关闭全部选项卡</a> </li>
                        <li class="J_tabCloseOther"><a>关闭其他选项卡</a> </li>
                    </ul>
                </div>
                <a href="${pageContext.request.contextPath}/logout" class="roll-nav roll-right J_tabExit action-logout"><i class="fa fa fa-sign-out">
                </i>退出</a>
            </div>
            <div class="row J_mainContent" id="content-main">
                <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="${pageContext.request.contextPath}/welcome" frameborder="0" data-id="welcome.jsp" seamless></iframe>
            </div>
            <div class="footer">
         
            </div>
        </div>
        <div id="right-sidebar">
            <div class="slimScrollDiv" style="position: relative; width: auto; height: 100%;"><div class="sidebar-container" style="width: auto; height: 100%;">
                <ul class="nav nav-tabs navs-3">
                    <li class="active"><a data-toggle="tab" href="main.html#tab-1"><i class="fa fa-gear"></i>主题 </a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div id="tab-1" class="tab-pane active">
                        <div class="sidebar-title">
                            <h3>
                                <i class="fa fa-comments-o"></i>主题设置</h3>
                            <small><i class="fa fa-tim"></i>你可以从这里选择和预览主题的布局和样式，这些设置会被保存在本地，下次打开的时候会直接应用这些设置。</small>
                        </div>
                        <div class="skin-setttings">
                            <div class="title">
                                主题设置</div>
                            <div class="setings-item">
                                <span>收起左侧菜单</span>
                                <div class="switch">
                                    <div class="onoffswitch">
                                        <input type="checkbox" name="collapsemenu" class="onoffswitch-checkbox" id="collapsemenu">
                                        <label class="onoffswitch-label" for="collapsemenu">
                                            <span class="onoffswitch-inner"></span><span class="onoffswitch-switch"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="setings-item">
                                <span>固定顶部</span>
                                <div class="switch">
                                    <div class="onoffswitch">
                                        <input type="checkbox" name="fixednavbar" class="onoffswitch-checkbox" id="fixednavbar">
                                        <label class="onoffswitch-label" for="fixednavbar">
                                            <span class="onoffswitch-inner"></span><span class="onoffswitch-switch"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="setings-item">
                                <span>固定宽度 </span>
                                <div class="switch">
                                    <div class="onoffswitch">
                                        <input type="checkbox" name="boxedlayout" class="onoffswitch-checkbox" id="boxedlayout">
                                        <label class="onoffswitch-label" for="boxedlayout">
                                            <span class="onoffswitch-inner"></span><span class="onoffswitch-switch"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="title">
                                皮肤选择</div>
                            <div class="setings-item default-skin nb">
                                <span class="skin-name "><a href="main.html#" class="s-skin-0">默认皮肤 </a></span>
                            </div>
                            <div class="setings-item blue-skin nb">
                                <span class="skin-name "><a href="main.html#" class="s-skin-1">蓝色主题 </a></span>

                            </div>
                            <div class="setings-item yellow-skin nb">
                                <span class="skin-name "><a href="main.html#" class="s-skin-3">黄色/紫色主题 </a></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div><div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 4px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 856px;"></div><div class="slimScrollRail" style="width: 4px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.4; z-index: 90; right: 1px;"></div></div>
        </div>
    </div>


</body></html>