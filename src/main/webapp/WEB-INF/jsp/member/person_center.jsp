<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<p class="layui-elem-quote noborderLeft">完成个人资料</p>
<form class="layui-form" action="" id="memberInfo">
    <div class="layui-form-item">
        <label class="layui-form-label" style="margin-top: 80px;">个人头像</label>
        <div class="layui-input-block">
            <div class="site-demo-upload">
                <img id="LAY_demo_upload" src="${member.headPortrait}" >
                <div class="site-demo-upbar">
                    <input type="file" name="file" class="layui-upload-file" id="uploadHeadPortrait">
                </div>
            </div>
        </div>
        <input type="hidden" name="headPortrait" id="headPortrait" value="${member.headPortrait}">
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label"><span class="redColorClass">*</span>个人名称</label>
        <div class="layui-input-inline">
            <input type="input" name="name" value="${member.name}"  placeholder="" autocomplete="off" class="layui-input">
        </div>
        <div class="layui-form-mid layui-word-aux"></div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">性别</label>
        <div class="layui-input-block">
            <input type="radio" name="sex" value="male" title="男"  <c:if test="${member.sex == 'male'}">checked=""</c:if> >
            <input type="radio" name="sex" value="female" title="女" <c:if test="${member.sex == 'female'}">checked=""</c:if>>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label"><span class="redColorClass">*</span>联系电话</label>
        <div class="layui-input-inline">
            <input type="input" name="mobile" value="${member.mobile}"  placeholder="" autocomplete="off" class="layui-input">
        </div>
        <div class="layui-form-mid layui-word-aux"></div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">QQ</label>
        <div class="layui-input-inline">
            <input type="input" name="qq"  value="${member.qq}"  placeholder="" autocomplete="off" class="layui-input">
        </div>
        <div class="layui-form-mid layui-word-aux"></div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label"><span class="redColorClass">*</span>常用邮箱</label>
        <div class="layui-input-inline">
            <input type="input" name="email"  value="${member.email}"  placeholder="" autocomplete="off" class="layui-input">
        </div>
        <div class="layui-form-mid layui-word-aux"></div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">区域</label>
        <div class="layui-input-inline">
            <select  lay-filter="selectArea" id="oneLevel">
                <option value="">请选择</option>
                <c:forEach items="${oneLevelAreas}" var="area">
                    <option value="${area.id}" <c:if test="${area.id == selectArea.oneLevel}">selected=""</c:if>  >${area.name}</option>
                </c:forEach>
            </select>
        </div>
        <div class="layui-input-inline">
            <select  lay-filter="selectArea" id="twoLevel">
                <option value="">请选择</option>
                <%--<option value="宁波"selected="" disabled="">宁波</option>--%>
                <c:forEach items="${twoLevelAreas}" var="area">
                    <option value="${area.id}" <c:if test="${area.id == selectArea.twoLevel}">selected=""</c:if> >${area.name}</option>
                </c:forEach>
            </select>
        </div>
        <div class="layui-input-inline">
            <select lay-filter="selectArea" id="threeLevel">
                <option value="">请选择</option>
                <c:forEach items="${threeLevelAreas}" var="area">
                    <option value="${area.id}" <c:if test="${area.id == selectArea.threeLevel}">selected=""</c:if> >${area.name}</option>
                </c:forEach>
            </select>
        </div>
        <input type="hidden" id="areaCode1" >
        <input type="hidden" id="areaCode" name="areaCode" value="${member.areaCode}">
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">地址</label>
        <div class="layui-input-inline">
            <input type="input" name="address"  value="${member.address}"  placeholder="" autocomplete="off" class="layui-input">
        </div>
        <div class="layui-form-mid layui-word-aux"></div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label"><span class="redColorClass">*</span>个人介绍</label>
        <div class="layui-input-block">
            <textarea placeholder="请输入内容" name="description" class="layui-textarea">${member.description}</textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
        </div>
    </div>
</form>