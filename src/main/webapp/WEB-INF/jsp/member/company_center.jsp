<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
            <div class="member_info">
                <div class="p_icon"><img src="${member.headPortrait}" /></div>
                <div class="member_info_font">
                    <p><span class="x_m">${member.name}</span><span>金牌顾问${member.type}</span></p>
                    <p class="memberTitle">${member.companyName}</p>
                    <p class="member_jieshao" style="line-height: 28px;">${member.description}</p>
                    <a href="adviser/detail/7.html"><button class="layui-btn" lay-submit="" lay-filter="demo1">查看店铺</button></a>
                </div>
                <div class="clear"></div>
            </div>
            <p class="layui-elem-quote noborderLeft">商机推荐</p>
            <div class="layui-form">
                <table class="layui-table" lay-skin="line">
                    <colgroup>
                        <col width="260">
                        <col width="110">
                        <col width="120">
                        <col width="200">
                        <col>
                    </colgroup>
                    <tr>
                        <th>需求名称</th>
                        <th>联系人</th>
                        <th>联系电话</th>
                        <th>所在地区</th>
                        <th>发布时间</th>
                    </tr>
                    <c:forEach items="${counselors}" var="member">
                        <tr>
                            <td>周先生申请100万元贷款</td>
                            <td>${member.name}</td>
                            <td>1560018****</td>
                            <td>北京-北京市-东城区</td>
                            <td><fmt:formatDate value="${member.addTime}"   pattern="yyyy-MM-dd" type="date" dateStyle="long" /></td>
                            <%--<td>${member.description}</td>--%>
                        </tr>
                    </c:forEach>
                </table>
            </div>