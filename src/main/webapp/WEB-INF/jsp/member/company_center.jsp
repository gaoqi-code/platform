<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
            <div class="member_info">
                <div class="p_icon"><img src="http://qbb.open580.com/uploadFile/uploadImg/20170329/1490768323819.png" /></div>
                <div class="member_info_font">
                    <p><span class="x_m">${member.name}</span><span>金牌顾问${member.type}</span></p>
                    <p class="memberTitle">${member.companyName}</p>
                    <p class="member_jieshao" style="line-height: 28px;">${member.description}</p>
                    <a href="adviser/detail/7.html"><button class="layui-btn" lay-submit="" lay-filter="demo1">查看店铺</button></a>
                </div>
                <div class="clear"></div>
            </div>
            <p class="layui-elem-quote noborderLeft">需求信息</p>
            <div class="layui-form">
                <table class="layui-table" lay-skin="line">
                    <colgroup>
                        <col width="150">
                        <col width="150">
                        <col width="200">
                        <col>
                    </colgroup>
                    <thead>
                    <tr>
                        <th>需求名称</th>
                        <th>1111</th>
                        <th>出场时间</th>
                        <th>格言</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${counselors}" var="member">
                        <tr>
                            <td>${member.name}</td>
                            <td>${member.nation}</td>
                            <td><fmt:formatDate value="${member.addTime}"   pattern="yyyy-MM-dd" type="date" dateStyle="long" /></td>
                            <td>${member.description}</td>
                        </tr>

                    </c:forEach>
                    <%--<tr>--%>
                    <%--<td>张爱玲</td>--%>
                    <%--<td>汉族</td>--%>
                    <%--<td>1920-09-30</td>--%>
                    <%--<td>于千万人之中遇见你所遇见的人，于千万年之中，时间的无涯的荒野里…</td>--%>
                    <%--</tr>--%>
                    <%--<tr>--%>
                    <%--<td>Helen Keller</td>--%>
                    <%--<td>拉丁美裔</td>--%>
                    <%--<td>1880-06-27</td>--%>
                    <%--<td> Life is either a daring adventure or nothing.</td>--%>
                    <%--</tr>--%>
                    <%--<tr>--%>
                    <%--<td>岳飞</td>--%>
                    <%--<td>汉族</td>--%>
                    <%--<td>1103-北宋崇宁二年</td>--%>
                    <%--<td>教科书再滥改，也抹不去“民族英雄”的事实</td>--%>
                    <%--</tr>--%>
                    <%--<tr>--%>
                    <%--<td>孟子</td>--%>
                    <%--<td>华夏族（汉族）</td>--%>
                    <%--<td>公元前-372年</td>--%>
                    <%--<td>猿强，则国强。国强，则猿更强！ </td>--%>
                    <%--</tr>--%>
                    </tbody>
                </table>
            </div>