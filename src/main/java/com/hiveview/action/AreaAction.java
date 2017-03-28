package com.hiveview.action;

import com.google.common.collect.Maps;
import com.hiveview.entity.Area;
import com.hiveview.service.IAreaService;
import utils.log.LogMgr;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/area")
public class AreaAction {

    @Autowired
    private IAreaService areaService;

    @ResponseBody
    @RequestMapping(value="/getSonAreas")
    public Map<String,Object> getSonAreas(HttpServletRequest request) {
        Map<String, Object> result = Maps.newHashMap();
        Boolean flag = true;
        String parentId = request.getParameter("parentId");
        try {
            List<Area> areas= areaService.getSonAreas(Long.parseLong(parentId));
            result.put("areas",areas);
        } catch (Exception e) {
            LogMgr.writeErrorLog(e);
            flag = false;
        }
        result.put("flag",flag);
        return result;
    }



}
