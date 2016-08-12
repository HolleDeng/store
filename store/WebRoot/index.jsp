<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
		<meta charset="utf-8" />
		<title>alibaba商城！</title>
		<link rel="stylesheet" type="text/css" href="css/index.css" />
		<script type="text/javascript" src="./js/jquery.js"></script>
		<script type="text/javascript" src="./js/index.js"></script>
		<link rel="shortcut icon" href="./img/title_logo.ico" />
	</head>

	<body>
		<!--最上面广告-->
		<div id="layout_adt">
			<div id="top_adt">
				<a href="####" title="PPTV手机众筹" style="display: block;overflow: hidden;">
				</a>
				<a class="x" href="####"></a>
			</div>
			<div id="top_adt_big">
				<img style="width: 100%;display: block;" src='img/duizhang.jpg'/>
			</div>
		</div>
		<!--最上面广告结束-->
		<!--注册登录-->
		<div id="layout_nav">
			<div id="top_nav">
				<div class="top_nav_left scrollx">
					<a href="####"><strong>网站导航</strong></a>
					<span class="xin"></span>
					<img class="arrow" src="img/arrow2.png" />
					<div class="wangzhandaohang scrolly">
						<dl>
							<dt>特色购物</dt>
							<dd>办宁互联</dd>
							<dd>办宁V购</dd>
							<dd>办宁卡</dd>
							<dd>海外购</dd>
							<dd>政企采购</dd>
							<dd>大聚惠</dd>
							<dd>0元试用</dd>
							<dd>视频购物</dd>
							<dd>办公直通车</dd>
							<dd>闪拍</dd>
							<dd>预售</dd>
							<dd>新发现</dd>
						</dl>
						<dl>
							<dt>生活助手</dt>
							<dd>零钱宝</dd>
							<dd>手机充值</dd>
							<dd>火车票</dd>
							<dd>转账还款</dd>
							<dd>约服务</dd>
							<dd>水电煤</dd>
							<dd>保险</dd>
							<dd>彩票</dd>
							<dd>机票</dd>
							<dd>酒店团购</dd>
							<dd>门店查询</dd>
							<dd></dd>
						</dl>
						<dl>
							<dt>会员服务</dt>
							<dd>会员联盟</dd>
							<dd>办宁社区</dd>
							<dd>延长保修</dd>
							<dd>免费书城</dd>
							<dd>易付宝</dd>
							<dd>办宁理财</dd>
							<dd>办宁金融</dd>
						</dl>
						<dl>
							<dt>更多热点</dt>
							<dd>办宁满座网</dd>
							<dd>PPTV</dd>
							<dd>客户端</dd>
							<dd>商家入驻</dd>
							<dd>办宁云盘</dd>
							<dd>办宁众包</dd>
							<dd>办宁联盟</dd>
							<dd>用户体验</dd>
							<dd>应用商店</dd>
							<dd>公益频道</dd>
							<dd>校园代理</dd>
							<dd>办宁加盟</dd>
							<dd>办宁云</dd>
						</dl>
					</div><!-- 网站导航 --><!-- 这个东西的网站导航的代码 -->
				</div>
				<div class="top_nav_right">
					<div class="login">
						<a href="####">登录</a>
						<a href="####" style="margin-left: 8px;">注册</a>
					</div>
					<div class="mydingdan scrollx">
						<a href="####">我的订单
							<img class="arrow" src="img/arrow2.png"/>
							<div class="wodedingdan scrolly">
							<p>待支付</p>
							<p>待收货</p>
							<p>待评价</p>
							<p>修改订单</p>
						</div>
						</a>

					</div>
					<div class="myyigou scrollx">
						<a href="####">我的易购
					 		<img class="arrow" src="img/arrow2.png"/>
					 		<div class="wodeyigou scrolly">
						    <p>我的消息</p>
						    <p>我的金融</p>
						    <p>我的收藏</p>
						    <p>我的优惠券</p>
						    <p>打卡赚云钻</p>
						    <p>会员联盟</p>
					    </div>
					    </a>

					</div>

					<a class="hb" href="####">
						<em class="ng-iconfont cart">&#xe623;</em>
						<span>购物车</span>
						<span class="yuan">
							<b class="num">0</b>
						</span>
					</a>
					<div class="scrollx myphone">
						<a href="####" class="shouji">
							<em class="ng-iconfont mb">&#xe604;</em>手机办宁
							<img class="arrow" src="img/arrow2.png" />
						</a>
						<div class="shoujisuning scrolly">
							<div class="shoujisuning_left">
								<p>扫一扫，下载易购客户端</p>
								<img src="img/small_yigou/code.png" alt="" />
							</div>
							<div class="shoujisuning_right">
								<img src="img/small_yigou/app-ebook.png" />
								<img src="img/small_yigou/app-sn.png" alt="" />
								<img src="img/small_yigou/app-pptv.png" />
								<img src="img/small_yigou/app-suning.png" alt="" />
								<p>更多应用》</p>
							</div>
							<p class="green"><img src="img/small_yigou/newreg.png" /></p>
							<p class="cha"><em class="ng-iconfont">&#xe627;</em></p>
						</div>

					</div>

					<a class="hb" href="####">易付宝</a>
					<a class="hb" href="####">政企采购</a>
					<div class="myserve scrollx">
						<a href="####">服务中心
						<img class="arrow" src="img/arrow2.png"/>
						<div class="fuwuzhongxin scrolly">
							<p>帮助中心</p>
							<p>查找门店</p>
							<p>退换货</p>
							<p>约服务</p>
							<p>投诉</p>
							<p>建议反馈</p>
							<p>在线咨询</p>
					    </div>
					</a>
					</div>
				</div>

			</div>
		</div>
		<!--登录导航结束-->
		<!--搜索-->
		<div id="search">
			<a href="####" class="logo"></a>
			<div class="main_search">
				<div class="ng_search">
					<i class="ng-iconfont search-icon">&#xe619;</i>
					<form action="">
						<div class="search-keyword-box">
							<input value="" id="searchKeywords" type="text" class="search-keyword" />
						</div>
						<input id="searchSubmit" type="submit" class="search-btn" value="搜索" />
						<div class="hotwords">
							<a href="####">PPTV互联网电视</a>
							<a href="####">三星note5</a>
							<a href="####">奶粉</a>
							<a href="####">烤箱</a>
							<a href="####">智能电视</a>
							<a href="####">大闸蟹</a>
							<a href="####" style="color: #FF6600;">香港莎莎</a>
							<a href="####">佳能70d</a>
						</div>
					</form>
				</div>
			</div>
		</div>
		<!--搜索结束-->
		<!--详细分类导航-->
		<!--详细分类导航结束-->
		<!--大图轮播-->
		<div id="layout_main_pic">
			<div id="main_pic">
				<a class="banner-btn banner-prev" href="####">
					<span class="btn-bg"></span>
					<i class="arr"></i>
				</a>
				<a class="banner-btn banner-next" href="####">
					<span class="btn-bg"></span>
					<i class="arr"></i>
				</a>
				<div class="banner-pic">
					<ul>
						<li style="background:#7701A1;display:block;">
							<a href="####" title="">
								<img src="img/1.jpg" alt="" />
							</a>
						</li>
						<li style="background:#99cce1">
							<a href="####" title="">
								<img src="img/2.jpg" alt=" " />
							</a>
						</li>
					</ul>
					<ul>
						<li style="background:#9D5CFE">
							<a href="####" title="">
								<img src="img/3.jpg" alt="" />
							</a>
						</li>
					</ul>
					<ul>
						<li style="background:#FFFFFF">
							<a href="####" title="">
								<img src="img/4.jpg" alt="" />
							</a>
						</li>
					</ul>
					<ul>
						<li style="background:#EBEFFB">
							<a href="####" title="">
								<img src="img/5.jpg" alt="" />
							</a>
						</li>
					</ul>
					<ul>
						<li style="background:#6539E6">
							<a href="####" title="">
								<img src="img/6.jpg" alt="" />
							</a>
						</li>
					</ul>
					<ul>
						<li style="background:#FDAB01">
							<a href="####" title="">
								<img src="img/7.jpg" alt="" />
							</a>
						</li>
						<li style="background:#DD073B">
							<a href="####" title="">
								<img src="img/8.jpg" alt="" />
							</a>
						</li>
					</ul>
					<ul>
						<li style="background:#478FFE">
							<a href="####" title="">
								<img src="img/9.jpg" alt="" />
							</a>
						</li>
						<li style="background:#CE46CE">
							<a href="####" title="">
								<img src="img/10.jpg" alt="" />
							</a>
						</li>
					</ul>
					<ul>
						<li style="background:#5E21BD">
							<a href="####" title="">
								<img src="img/11.jpg" alt="" />
							</a>
						</li>
					</ul>
					<ul>
						<li style="background:#EB1587">
							<a href="####" title="">
								<img src="img/12.jpg" alt="" />
							</a>
						</li>
						<li style="background:#1A192B">
							<a href="####" title="">
								<img src="img/13.jpg" alt="" />
							</a>
						</li>
					</ul>
					<ul>
						<li style="background:#FF0E3E">
							<a href="####" title="">
								<img src="img/14.jpg" alt="" />
							</a>
						</li>
						<li style="background:#FFB500">
							<a href="####" title="">
								<img src="img/15.jpg" alt="" />
							</a>
						</li>
					</ul>
					<ul>
						<li style="background:#F5091D">
							<a href="####" title="">
								<img src="img/16.jpg" alt="" />
							</a>
						</li>
						<li style="background:#478FFE">
							<a href="####" title="">
								<img src="img/17.jpg" alt="" />
							</a>
						</li>
					</ul>
				</div>
				<ul class="banner-ctrl">
					<li data-num="0">
						<span class="bg"></span>
						<div class="ctrl-dot">
							<i></i>
							<i></i>
						</div>
						<div class="title-item">
							<span class="title-bg"></span>
							<div class="title-list">
								<p><i></i><a href="####">安全座椅98元秒杀</a></p>
								<p><i></i><a href="####">西门子突破想象 不一样</a></p>
							</div>
						</div>
						<h4>精选</h4>
					</li>
					<li data-num="2">
						<span class="bg"></span>
						<div class="ctrl-dot">
							<i></i>
						</div>
						<div class="title-item">
							<span class="title-bg"></span>
							<div class="title-list">
								<p><i></i><a href="####">服饰秋季新品五折起</a></p>
							</div>
						</div>
						<h4>服饰家装</h4>
					</li>
					<li data-num="3">
						<span class="bg"></span>
						<div class="ctrl-dot">
							<i></i>
						</div>
						<div class="title-item">
							<span class="title-bg"></span>
							<div class="title-list">
								<p><i></i><a href="####">安全座椅3折起</a></p>
							</div>
						</div>
						<h4>母婴玩具</h4>
					</li>
					<li data-num="4">
						<span class="bg"></span>
						<div class="ctrl-dot">
							<i></i>
						</div>
						<div class="title-item">
							<span class="title-bg"></span>
							<div class="title-list">
								<p><i></i><a href="####">九月酒日 9.9元起</a></p>
							</div>
						</div>
						<h4>办宁超市</h4>
					</li>
					<li data-num="5">
						<span class="bg"></span>
						<div class="ctrl-dot">
							<i></i>
						</div>
						<div class="title-item">
							<span class="title-bg"></span>
							<div class="title-list">
								<p><i></i><a href="####">换季buy面膜 联合100减50</a></p>
							</div>
						</div>
						<h4>美妆个护</h4>
					</li>
					<li data-num="6">
						<span class="bg"></span>
						<div class="ctrl-dot">
							<i></i>
							<i></i>
						</div>
						<div class="title-item">
							<span class="title-bg"></span>
							<div class="title-list">
								<p><i></i><a href="####">百里挑一 选潮phone</a></p>
								<p><i></i><a href="####">红米2A 499元现货购买</a></p>
							</div>
						</div>
						<h4>手机通讯</h4>
					</li>
					 
				</ul>
				公告栏开始
				公告栏结束
			</div>

		</div>
		<!--大图轮播结束-->

		<!--特色馆-->
		<div id="charact">
			<div class="title">
				<h3>特色馆</h3>
				<h4>CHARACTERISTIC</h4>
			</div>
			<div class="col1">
				<a href="####" title="名品特卖"><img src="img/tese1.jpg" alt="" /></a>
			</div>
			
			<ul class="col2">
				<li class="item0"></li>
				<li class="item1">
					<a href="####" title="大聚惠"><img src="img/tese2.jpg" alt="" /></a>
				</li>
				<li class="item2">
					<a href="####" title="全球闪购"><img src="img/tese4.jpg" alt="" /></a>
				</li>
			</ul>
			<div class="col3">
				<span class="line1"></span><span class="line2"></span>
				<ul>
					<li class="item1">
						<a href="####" title="闪拍"><img src="img/tese5.jpg" alt="" /></a>
					</li>
					<li class="item2">
						<a href="####" title="试用"><img src="img/tese6.jpg" alt="" /></a>
					</li>
					 
				</ul>
			</div>
			<ul class="col4">
				<li>
					<a href="####" title="优惠券"><img src="img/tese9.jpg" alt="" /></a>
				</li>
				<li>
					<a href="####" title="中华特色馆"><img src="img/tese10.jpg" alt="" /></a>
				</li>
				 
			</ul>
		</div>
		<!--特色馆结束-->
	 
	 
<!--1楼-->
		<div class="floor one" id="one">
			<div class="floor_top">
				<div class="title">
					<h3>
						<b>1F</b>
						服饰百货
					</h3>
					<h4></h4>
				</div>
				<ul class="tab">
					<!-- <li class="on"><a href="manager_all_goods"><i></i><em>热门活动</em></a></li> -->
					<li class=""><a href="manager_all_goods"><i></i><em>热卖商品</em></a></li>
				</ul>
				<div class="links">
					<a href="####">女装</a>
					<a href="####">男装</a>
					<a href="####">内衣</a>
					<a href="####">女鞋</a>
					<a href="####">箱包</a>
					<a href="####">珠宝配饰</a>
					<a href="####">钟表眼镜</a>
					<a href="####">运动户外</a>
				</div>
			</div>
			<div class="floor_down">
				<div class="side">
					<a class="big" href="####" title=""><img src="img/tese1.jpg" alt=""></a>

					<div class="entrances entrances4">
						<a href="####">
							<span class="bg"></span>
							<i class="ng-iconfont">&#xe613;</i>
							<em>服装城</em>
						</a>
					 
					</div>
					
					<!-- 品牌列表 -->
					<ul class="brands">
						<li class="item1">
							<a href="####" title=""> </a>
						</li>
					  
					</ul>
				</div>

			   
			

				<div class="main-col J-domLazy" style="display: block;">
				
					<ul class="col2">
						<s:iterator value="list" status="st">
				     	 <!-- <s:if test="#st.index % 4 == 0">
				   			<br>
					 	 </s:if> -->
						  <li>
							<p class="face">
								<a href="<s:url action="manager_find_action"> <s:param name="number" value="number"></s:param></s:url>">
				 					<img src='<s:property value="savePath"/>' width="200" height="100" border="0"/>
								</a>
							</p>
							<p class="name"><a href="manager_find_action"><s:param name="number" value="number"></s:param></a></p>
							<p class="price"><s:param name="number" value="number"></s:param></p>
						  </li>
					   </s:iterator>
				 	</ul>
					
				</div>

			</div>
		</div>
		<div id="adv_article">
			<a href="####"><img src="img/adv_article1.jpg" /></a>
		</div>
	 <!-- 1楼结束 -->
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 <br/><br/><br/>
	 
		<!--引入底部文件 或者是： include file=”bottom.html“ -->
			<include file="bottom.html" />
		    <jsp:include page="bottom.jsp" flush="true" /> 
		<%
		%>
		 
		 
		 
		<div id="right_float">
			<div class="top">
				<p class="top_top">
					<a class="geren" href="####"></a>
				</p>
				<p class="gwc">
					<a class="gouwuche" href="####"></a>
					<span class="tip" href="####">购物车</span>
					<span class="rows">0</span>
				</p>
			</div>
			<div class="center">

				<p class="yidong">
					<a class="chongzhi" href="####"></a>
					<a class="l_r1 l_rw" href="####">充值</a>
				</p>
				<p class="yidong">
					<a class="zuji yidong" href="####"></a>
					<a class="l_r2 l_rw" href="####">足迹</a>
				</p>
			</div>
			<div class="down">
				<p class="yidong">
					<a class="erwei" href="####"></a>
					<a class="l_r3 l_rw3" href="####"><img src="img/ewm.png" /></a>
				</p>
				<p class="yidong">
					<a class="jiaoliu" href="####"></a>
					<a class="l_r4 l_rw2" href="####">在线咨询</a>
				</p>
				<p class="yidong">
					<a class="liuyan" href="####"></a>
					<a class="l_r5 l_rw2" href="####">调查问卷</a>
				</p>
				<p class="yidong">
					<a class="fanhui" href="#"></a>
					<a class="l_r6 l_rw2" href="#">返回顶部</a>
				</p>
			</div>
		</div>
		<div id="left_float"></div>

		<!--浮动导航-->
		<div id="layout_float_nav">
			<div id="float_nav">
				<div class="sort_index scrollx">
					<a class="sort_index_top" href="####">
						<em class="ng-iconfont">&#xe621;</em><span>全部商品分类</span>
					</a>
					<div class="sort_index_down scrolly">
						<ul class="list">
							<li>
								<em class="ng-iconfont">&#xe611;</em>
								<a href="####">母婴</a>
								<a href="####">玩具</a>
								<a href="####">童装童鞋</a>
								<div class="go_right">
									<div class="cate-list">
										<dl>
											<dt>孕婴奶粉</dt>
											<dd>
												<a class="red" href="####">pre段</a>
												<a href="####">1段</a>  
												<a href="####">孕妈奶粉</a>
												<a class="red" href="####">特配奶粉</a>
												<a href="####">羊奶粉</a>
											</dd>
										</dl>
										 
										 
									</div>
									<div class="tupian">
										<a href="####"><em class="ng-iconfont">&#xe627;</em></a>
										<img src="img/go_right/1.jpg"/></div>
								</div>
							</li>
							<li>
								<em class="ng-iconfont">&#xe604;</em>
								<a href="####">手机</a>
								<a href="####">数码</a>
								<a href="####">办宁互联</a>
								<div class="go_right">
									<div class="cate-list">
										
										<dl>
											<dt>孕婴洗护</dt>
											<dd><a href="####">洗衣液/皂</a>
											<a href="####">宝宝沐浴</a>
											<a href="####">儿童防晒</a>
											<a class="red" href="####">防蚊/驱蚊</a>
											<a href="####">爽身粉</a>
											<a href="####">奶瓶清洗</a>
											<a href="####">孕妇护肤</a></dd>
										</dl>
										 
										 
									</div>
									<div class="tupian">
										<a href="####"><em class="ng-iconfont">&#xe627;</em></a>
										<img src="img/go_right/2.jpg"/></div>
								</div>
							</li>
						</ul>
						
					</div>
				</div>
				<div class="ng_search">

					<form action="">
						<div class="search-keyword-box">
							<i class="ng-iconfont search-icon">&#xe619;</i>
							<input value="" id="searchKeywords" type="text" class="search-keyword" />
						</div>
						<input id="searchSubmit" type="submit" class="search-btn" value="搜索" />
					</form>
				</div>
				<div class="login">
					<a href="####">登录</a>
					<a href="####" style="margin-left: 8px;">注册</a>
				</div>
				<a href="####" class="che">
					<em class="ng-iconfont cart">&#xe623;</em>
					<span>购物车</span>
					<span class="yuan">
					<b class="num">0</b>
				</span>
				</a>
				<div></div>
			</div>

		</div>
		<!--浮动导航结束-->

		<!-- 左侧固定 -->
<div id="float_left">
			<ul class="floor-guide">
				<li>
					<a href="#one" class="name">服饰百货</a>
					<a href="####" class="icon ng-iconfont"></a>
				</li>
				 
			</ul>
		</div>

		<!-- 左侧固定结束 -->

	</body>

</html>
