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
        <div class="layui-input-inline" style="width: 300px;">
            <span class="layui-span-input font22">${member.mobile}</span>
            <span class="layui-span-input font22 redColorClass">(登录账号)</span>
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
<script src="../plugins/layui/layui.js" charset="utf-8"></script>
<script>
    layui.use(['form', 'layedit', 'laydate','upload'], function(){
        var form = layui.form()
                ,layer = layui.layer
                ,layedit = layui.layedit
                ,laydate = layui.laydate;

        //创建一个编辑器
        var editIndex = layedit.build('LAY_demo_editor');

        //自定义验证规则
        form.verify({
            title: function(value){
                if(value.length < 5){
                    return '标题至少得5个字符啊';
                }
            }
            ,pass: [/(.+){6,12}$/, '密码必须6到12位']
            ,content: function(value){
                layedit.sync(editIndex);
            }
        });


        //监听提交
        form.on('submit(demo1)', function(data){

            var areaCode = $("#oneLevel").val()+"-";
            var twoLevel = $("#twoLevel").val();
            var threeLevel = $("#threeLevel").val();
            if(twoLevel) {
                areaCode += twoLevel + "-";
            }
            if(threeLevel) {
                areaCode += threeLevel + "-";
            }
            $("#areaCode").val(areaCode);
            $.ajax({
                type: "POST",
                url: "/member/updateInfo.json",
                data: $("#memberInfo").serialize(),
                dataType: "json",
                success: function(data){
                    if(data.flag) {
                        layer.alert("保存成功！");
                    }else {
                        layer.alert("保存失败！");
                    }
                }
            });
            return false;
        });

        layui.upload({
            url: 'http://image.qibaba.cn/fileUpload/iframeCrossOriginUpload/master.html'
            ,elem: '#uploadHeadPortrait' //指定原始元素，默认直接查找class="layui-upload-file"
            ,method: 'post' //上传接口的http类型
            ,success: function(data){
                console.log(data);
                if(data.flag) {
                    var path = data.data.src;
                    LAY_demo_upload.src = path;
                    $("#headPortrait").val(path);
                }else {
                    layer.alert("头像上传失败！");
                }
            }
        });

        form.on('select(selectArea)', function(data) {
            var oldDom = data.elem;
            var selectVal = data.value;
            var areaCode = $("#areaCode1").val();
            if (selectVal != areaCode) {
                $("#areaCode1").val(selectVal)
            } else {
                return;
            }
            var level = $(oldDom).attr("id");
            if (level != "threeLevel") {
                $.ajax({
                    type: "POST",
                    url: "/area/getSonAreas.json",
                    data: {parentId: selectVal},
                    dataType: "json",
                    async: false,
                    success: function (data) {
                        if (data.flag) {
                            var content = '<option value="">请选择</option>';
                            var pleaseSelect = content;
                            data.areas.forEach(function (item, index) {
                                content += '<option value="' + item.id + '">' + item.name + '</option>';
                            });
                            if (level == "oneLevel") {
                                $("#twoLevel").html(content);
                                $("#threeLevel").html(pleaseSelect);
                            } else {
                                $("#threeLevel").html(content);
                            }
                            form.render('select');
                        } else {
                            layer.msg("区域加载失败！");
                        }
                    }
                });
            }
        });
    });
</script>