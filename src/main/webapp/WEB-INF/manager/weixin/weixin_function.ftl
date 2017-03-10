<!DOCTYPE html>
<html lang="en">
<head>
	<#include "${managerViewPath}/include/meta.ftl"/>
	<style>
		.ztree{
			margin-top:0px;
			padding-left:40px;
			padding-right:40px;
		}
		body .ms-content-body{
			width:85%;
		}
		
		body .ms-content-body-panel{
			margin:0;
			padding:0;
			overflow-y: hidden;
		}
		.ms-content--body-title{
		border-bottom: 1px solid #d3d7db;
   		background: #fff;
   		color: #666;
   		line-height: 45px;
   		padding: 0 10px;
    	width: 100%;
    	z-index: 1500;
    	text-align: center;
		font-weight:900;
		}
	</style>
</head>
<body style="height:100%;">
	<@ms.content>
		<@ms.contentMenu>
			<div class="ms-content--body-title" style="background:none;">${weixinName?default('暂无')}</div>
		 	<ul id="menuTree" class="ztree">
			</ul> 
			<!-- 树形模块菜单结束 -->
		</@ms.contentMenu>
		<@ms.contentBody style="width:85%">
			<@ms.contentPanel>
				<iframe src="${managerPath}/weixin/weixinPeople/list.do" style="width:100%;maring:0;padding:0;border:none;height:100%;background-image: url(${static}/skin/manager/${manager_ui}/images/loading.gif);  background-repeat: no-repeat;  background-position: center;" id="listFrame" target="listFrame" ></iframe>
			</@ms.contentPanel>
		</@ms.contentBody>
	</@ms.content>
</body>
</html>
<script>
	$(function(){
		$.fn.zTree.init($("#menuTree"),setting,nodes);
	})
	
	/******设置节点信息开始******/
	//设置信息
	var setting = {
		edit: {
			enable: false,
			showRemoveBtn: false,
			showRenameBtn: false,
			drag: {
				prev: true,
				next: true,
				inner: true,
				isMove: false
			}
		},
		data: {
			simpleData: {
				enable: true
			}
		},
		view: {
			showLine: false,
			showIcon: false
		}
	};
	var nodes = [
		{ "id":0, "name":"微信设置", "url":"", "click":"$('#listFrame').attr('src','${managerPath}/weixin/'+${weixinId}+'/edit.do')"},
		{ "id":1, "name":"微信菜单", "url":"", "click":"$('#listFrame').attr('src','${managerPath}/weixin/menu/list.do')"},
		{ "id":1, "name":"素材列表", "url":"", "click":"$('#listFrame').attr('src','${managerPath}/weixin/news/list.do')"},
		{ "id":1, "name":"微信用户", "url":"", "click":"$('#listFrame').attr('src','${managerPath}/weixin/weixinPeople/list.do')"},
		{ "id":1, "name":"群发消息", "url":"", "click":"$('#listFrame').attr('src','${managerPath}/weixin/message/index.do')"},
		{ "id":1, "name":"关注回复", "url":"", "click":"$('#listFrame').attr('src','${managerPath}/weixin/subscribe/subscribe.do')"},
		{ "id":1, "name":"关键字回复", "url":"", "click":"$('#listFrame').attr('src','${managerPath}/weixin/messagekey/list.do')"},
		{ "id":1, "name":"返回", "url":"", "click":"$('#listFrame').attr('src','${managerPath}/weixin/list.do'),$('.ms-content-menu').hide(),$('.ms-content-body').css('width','100%')"}
	]
	/******设置节点信息结束******/
</script>