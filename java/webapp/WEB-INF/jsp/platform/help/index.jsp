<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>帮助中心</title>
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/static/css/main.min.css">
</head>
<body> <jsp:include page="${pageContext.servletContext.contextPath}/platform/index/menu?id=help_p"  ></jsp:include>
<div class="member-nav help">
    <a href="#help-1" class="current">功能介绍</a>
    <a href="#help-2">指标注释-首页</a>
    <a href="#help-3">指标注释-店铺分析</a>
    <a href="#help-4">指标注释-会员分析 </a>
    <a href="#help-5">指标注释-运营概况</a>
    <a href="#help-6">指标注释-商品分析</a>
</div>
<div class="wrapper">
    <div class="main">
        <!-- 一 -->
        <div class="overlap flow-deal light" id="help-1">
            <div class="sys-title title-deg">
                <div class="help-tit">一、功能介绍</div>
            </div>
            <div class="overlap-cont help">
                <div class="help-line"><span>首&#12288;&#12288;页：</span>首页从运营概况、流量趋势、新增会员等一系列经营角度对平台店铺进行分析，让您对平台运营情况了然于胸。</div>
                <div class="help-line"><span>店铺分析：</span>店铺分析从店铺分布、店铺入驻数量、店铺层级、店铺排名等角度，帮您分析各店铺运营情况。</div>
                <div class="help-line"><span>会员分析：</span>会员分析包括新增会员、会员分布、会员价值、会员画像四个模块，旨在帮助您对平台会员情况精准把控。</div>
                <div class="help-line"><span>运营分析：</span>运营分析提供运营概况、流量交易趋势、转化率三个方面的分析，洞悉运营细节，掌控生意细节。</div>
                <div class="help-line"><span>参数设置：</span>参数设置提供店铺层级设置、新会员设置功能，可以自定义店铺层级与新会员。</div>
            </div>
        </div>

        <!-- 二.1 -->
        <div class="overlap flow-deal light" id="help-2">
            <div class="sys-title title-deg">
                <div class="help-tit">二、指标注释 — 2.1 首页</div>
            </div>
            <div class="overlap-cont help">
                <div class="help-line"><span>访客数：</span>选择时间段内访问您店铺页面或宝贝详情页的去重人数，一个人在统计时间范围内访问多次只记为一个。所有终端访客数为PC端访客数和无线端访客数相加去重。</div>
                <div class="help-line"><span>浏览量：</span>店铺或商品详情页被访问的次数，一个人在统计时间内访问多次记为多次。所有终端的浏览量等于PC端浏览量和无线端浏览量之和。</div>
                <div class="help-line"><span>人均浏览量：</span>浏览量/访客数，多天的人均浏览量为各天人均浏览量的日均值。</div>
                <div class="help-line"><span>跳失率：</span>一天内，来访您店铺浏览量为1的访客数/店铺总访客数，即访客数中，只有一个浏览量的访客数占比。该值越低表示流量的质量越好。多天的跳失率为各天跳失率的日均值。</div>
                <div class="help-line"><span>平均停留时间：</span>来访您店铺的所有访客总的停留时长/访客数，单位为秒，多天的人均停留时长为各天人均停留时长的日均值。</div>
                <div class="help-line"><span>支付金额：</span>买家拍下后通过支付宝支付给您的金额，未剔除事后退款金额，预售阶段付款在付清当天才计入内。所有终端的支付金额为PC端支付金额和无线端支付金额之和。特别说明，支付渠道不论是电脑上还是手机上，拍下为电脑上，就将后续的支付金额计入PC端；拍下为手机或Pad上，就将后续的支付金额计入无线端。</div>
                <div class="help-line"><span>成交量：</span>来访您店铺的所有访客总的停留时长/买家支付的件数，未剔除事后退货的件数，预售阶段付款在付清当天才计入内。所有终端的成交量为PC端成交量和无线端成交量之和。特别说明，支付渠道不论是电脑上还是手机上，拍下为电脑上，就将后续的成交量计入PC端；拍下为手机或Pad上，就将后续的成交量计入无线端。</div>
                <div class="help-line"><span>订单数：</span>统计时间内，支付的订单数。</div>
                <div class="help-line"><span>客单价：</span>统计时间内，支付金额/支付买家数，即平均每个支付买家的支付金额。</div>
                <div class="help-line"><span>支付买家数：</span>统计时间内，完成支付的去重买家人数，预售分阶段付款在付清当天才计入内；所有终端支付买家数为PC端和无线端支付买家去重人数，即统计时间内在PC端和无线端都对商品完成支付，买家数记为1个。特别说明，不论支付渠道是电脑还是手机，拍下为电脑上，就将该买家数计入PC端支付买家数；拍下为手机或Pad上，就将该买家数计入无线端支付买家数。</div>
                <div class="help-line"><span>支付转化率：</span>统计时间内，支付买家数/访客数，即来访客户转化为支付买家的比例。</div>
                <div class="help-line"><span>在线商品数：</span>截止当前，在线的商品总数量。</div>
                <div class="help-line"><span>被支付商品数：</span>统计时间内，被支付的商品总数量。</div>
            </div>
        </div>

        <!-- 二.2 -->
        <div class="overlap flow-deal light" id="help-3">
            <div class="sys-title title-deg">
                <div class="help-tit">二、指标注释 — 2.2 店铺分析</div>
            </div>
            <div class="overlap-cont help">
                <div class="help-line"><span>店铺访客数：</span>统计周期内访问您店铺页面的去重人数，一个人在统计时间范围内访问多次只记为一个。所有终端访客数为PC端访客数和无线端访客数相加去重。</div>
                <div class="help-line"><span>支付金额：</span>买家拍下后通过支付宝支付给您的金额，未剔除事后退款金额，预售阶段付款在付清当天才计入内。所有终端的支付金额为PC端支付金额和无线端支付金额之和。特别说明，支付渠道不论是电脑上还是手机上，拍下为电脑上，就将后续的支付金额计入PC端；拍下为手机或Pad上，就将后续的支付金额计入无线端。支付转化率：统计时间内，支付买家数/访客数，即来访客户转化为支付买家的比例。</div>
                <div class="help-line"><span>支付转化率：</span>统计时间内，支付买家数/访客数，即来访客户转化为支付买家的比例。</div>
                <div class="help-line"><span>客单价：</span>统计时间内，支付金额/支付买家数，即平均每个支付买家的支付金额。成交商品种类数：统计时间内，被支付的商品SPU总数。</div>
            </div>
        </div>

        <!-- 二.3 -->
        <div class="overlap flow-deal light" id="help-4">
            <div class="sys-title title-deg">
                <div class="help-tit">二、指标注释 — 2.3 会员分析</div>
            </div>
            <div class="overlap-cont help">
                <div class="help-line"><span>会员等级：</span>普通会员，VIP会员，高级会员，至尊会员</div>
                <div class="help-line"><span>会员价值：</span>R是会员最近一次未购物天数，F是统计时间段内会员购物总次数</div>
            </div>
        </div>

        <!-- 二.4 -->
        <div class="overlap flow-deal light" id="help-5">
            <div class="sys-title title-deg">
                <div class="help-tit">二、指标注释 — 2.4 运营概况</div>
            </div>
            <div class="overlap-cont help">
                <div class="help-line"><span>下单转化率：</span>统计时间内，下单买家数/访客数，即来访客户转化为下单买家的比例。</div>
                <div class="help-line"><span>下单-支付转化率：</span>统计时间内，支付买家数/下单买家数，即下单买家转化为支付买家的比例。 </div>
                <div class="help-line"><span>支付转化率：</span>统计时间内，支付买家数/访客数，即来访客户转化为支付买家的比例。</div>
            </div>
        </div>

        <!-- 二.5 -->
        <div class="overlap flow-deal light" id="help-6">
            <div class="sys-title title-deg">
                <div class="help-tit">二、指标注释 — 2.5 商品分析</div>
            </div>
            <div class="overlap-cont help">
                <div class="help-line"><span>被下单商品数：</span>统计时间内，被下单的商品数量</div>
                <div class="help-line"><span>被支付商品数：</span>统计时间内，被支付的商品数量</div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/static/js/help.js"></script>
</body>
</html>