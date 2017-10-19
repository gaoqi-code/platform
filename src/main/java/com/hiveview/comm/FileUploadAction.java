package com.hiveview.comm;

import com.google.common.collect.Maps;
import com.hiveview.util.Data;
import com.hiveview.util.Constants;
import com.hiveview.util.ProperManager;
import net.sf.json.JSONObject;
import org.apache.commons.lang3.time.DateFormatUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import utils.log.LogMgr;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

@Controller
@RequestMapping("/fileUpload")
public class FileUploadAction {
	Logger logger = Logger.getLogger(FileUploadAction.class);

	private static final String IMG_DOMAIN = "http://image.qibaba.cn/";
	private static final String MASTER_DOMAIN = "http://www.qibaba.cn/";
	private static final String ADMIN_DOMAIN = "http://admin.qibaba.cn/";

	/**
	 * 异步上传
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/upload")
	public Map<String,Object> upload(HttpServletRequest request) throws Exception {

		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		// String basePath =
		// request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();//访问路径：http://localhost:8080
//		String basePath = request.getScheme() + "://" + request.getServerName();// 访问路径：http://localhost
		// String localPath =
		// request.getSession().getServletContext().getRealPath("upload");//物理路径

		String imgUpload ="uploadFile/uploadImg/"+DateFormatUtils.format(new Date(), "yyyyMMdd");
		String realPath = request.getSession().getServletContext().getRealPath("/")+imgUpload;

		HashMap<String, Object> result = Maps.newHashMap();
		Boolean flag = false;
		// 创建目录 -->若物理路径不存在，则创建物理路径
		String newFileName = "";// 新文件名
		if (mkdir(realPath)) {
			logger.info("+++++++++++++++++创建目录" + realPath + "+++++++++++++++++");
			String fileName = "";
			String filePath = "";

			Iterator<String> iter = multipartRequest.getFileNames();
			while (iter.hasNext()) {
				MultipartFile file = multipartRequest.getFile(iter.next());
				fileName = file.getOriginalFilename();
				//			fileType = getFileType(fileName);
				//			if (fileType == 4) {
				// propKey = "subtitlePath";
				//			}
				if (fileName.lastIndexOf(".") > -1) {
					newFileName = System.currentTimeMillis() + fileName.substring(fileName.lastIndexOf("."));
					File localFile = null;
					//				localFile = new File(realPath + "/" + newFileName);
					filePath = realPath + "//" + newFileName;
					localFile = new File(filePath);
					file.transferTo(localFile);
				}
			}
			flag = true;
		}

//		{
//				"code": 0 //0表示成功，其它失败
//				,"msg": "" //提示信息 //一般上传失败后返回
//				,"data": {
//					 "src": "图片路径"
//					,"title": "图片名称" //可选
//					}
//		}
		String imgPath = imgUpload+"/"+newFileName;
		result.put("flag", flag);
		result.put("code", flag?0:1);
		result.put("msg", flag?"图片上传成功！":"图片上传失败！");
		Map<String, Object> data = Maps.newHashMap();
		data.put("src", imgPath);
		result.put("data", data);
		return result;
	}

	/**
	 * iframe跨域请求解决方案
	 * @param request
	 * @param mav
	 * @author huxunqiang
	 * @throws Exception
	 */
	@RequestMapping(value = "/iframeCrossOriginUpload/{system}")
	public ModelAndView iframeCrossOriginUpload(HttpServletRequest request,@PathVariable("system")String system, ModelAndView mav) throws Exception {

		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		String imgUpload ="uploadFile/uploadImg/"+DateFormatUtils.format(new Date(), "yyyyMMdd");
		String realPath = request.getSession().getServletContext().getRealPath("/")+imgUpload;
		HashMap<String, Object> result = Maps.newHashMap();
		Boolean flag = false;
		// 创建目录 -->若物理路径不存在，则创建物理路径
		String newFileName = "";// 新文件名
		if (mkdir(realPath)) {
			String fileName;
			String filePath;

			Iterator<String> iter = multipartRequest.getFileNames();
			while (iter.hasNext()) {
				MultipartFile file = multipartRequest.getFile(iter.next());
				fileName = file.getOriginalFilename();
				if (fileName.lastIndexOf(".") > -1) {
					newFileName = System.currentTimeMillis() + fileName.substring(fileName.lastIndexOf("."));
					File localFile = null;
					//				localFile = new File(realPath + "/" + newFileName);
					filePath = realPath + "//" + newFileName;
					localFile = new File(filePath);
					file.transferTo(localFile);
				}
			}
			flag = true;
		}
//		{
//				"code": 0 //0表示成功，其它失败
//				,"msg": "" //提示信息 //一般上传失败后返回
//				,"data": {
//					 "src": "图片路径"
//					,"title": "图片名称" //可选
//					}
//		}
		String imgPath = imgUpload+"/"+newFileName;
		result.put("flag", flag);
		result.put("code", flag?0:1);
		result.put("msg", flag?"图片上传成功！":"图片上传失败！");
		Map<String, Object> data = Maps.newHashMap();
		data.put("src", IMG_DOMAIN + imgPath);
		result.put("data", data);
		JSONObject jsonObject = JSONObject.fromObject(result);
		StringBuffer sbHtml = new StringBuffer();
		String url;
		if ("master".equals(system)) {
			url = MASTER_DOMAIN + "crossOrigin/receiveVal.jsp";
		} else {
			url = ADMIN_DOMAIN + "crossOrigin/receiveVal.jsp";
		}
		sbHtml.append("<form id=\"alipaysubmit\" name=\"alipaysubmit\" action=\"" + url+ "\" method=\"post\">");
		sbHtml.append("<input type=\"hidden\" name=\"dataMsg\" value='" + jsonObject.toString() + "'/>");
		sbHtml.append("<input type=\"submit\" value=\"提交\" style=\"display:none;\"></form>");
		sbHtml.append("<script>document.forms['alipaysubmit'].submit();</script>");
		mav.getModel().put("resultStr",sbHtml);
		mav.setViewName("crossOrigin/transmitVal");
		return mav;
	}

	@RequestMapping(value = "/uploadTemp")
	public String upload(HttpServletRequest request,HttpServletResponse response, String propKey,String module, Integer ruleType,Integer visitWay) throws Exception {

		int fileType = 1;// 标识文件类型
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		// String basePath =
		// request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();//访问路径：http://localhost:8080
		String basePath = request.getScheme() + "://" + request.getServerName();// 访问路径：http://localhost
		// String localPath =
		// request.getSession().getServletContext().getRealPath("upload");//物理路径

		String extName = "";// 扩展名
		String newFileName = "";// 新文件名

		Iterator<String> iter = multipartRequest.getFileNames();

		// 创建目录 -->若物理路径不存在，则创建物理路径
		String propPath = getPathForProperties(propKey)+"/"+module;
		String realPath = mkdir(propPath, 2);
		logger.info("+++++++++++++++++创建目录" + realPath + "+++++++++++++++++");
		String fileName = "";
		while (iter.hasNext()) {
			MultipartFile file = multipartRequest.getFile(iter.next());
			fileName = file.getOriginalFilename();

			fileType = getFileType(fileName);
			if (fileType == 4) {
				// propKey = "subtitlePath";
			}

			if (fileName.lastIndexOf(".") > -1) {
				extName = fileName.substring(fileName.lastIndexOf("."));
				newFileName = System.currentTimeMillis() + extName;

				File localFile = null;
				localFile = new File(realPath + "/" + newFileName);
				file.transferTo(localFile);
			}
		}
		response.setContentType("application/json;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		final PrintWriter out = response.getWriter();
		out.print(java.net.URLDecoder.decode(getVisitPath(propPath, visitWay, basePath, realPath,newFileName), "utf-8"));
		out.flush();
		return null;
	}

	@RequestMapping(value = "/uploadSuffix")
	public String uploadSuffix(HttpServletRequest request,
			HttpServletResponse response, String propKey, Integer ruleType,
			String suffix) throws Exception {

		int fileType = 1;// 标识文件类型
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		// String basePath =
		// request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();//访问路径：http://localhost:8080
		String basePath = request.getScheme()+"://" + request.getServerName();// 访问路径：http://localhost
		// String localPath =
		// request.getSession().getServletContext().getRealPath("upload");//物理路径

		String extName = "";// 扩展名
		String newFileName = "";// 新文件名

		Iterator<String> iter = multipartRequest.getFileNames();

		// 创建目录 -->若物理路径不存在，则创建物理路径
		String propPath = getPathForProperties(propKey);
		String realPath = mkdir(propPath, 2);
		logger.info("+++++++++++++++++创建目录" + realPath + "+++++++++++++++++");
		String fileName = "";
		while (iter.hasNext()) {
			MultipartFile file = multipartRequest.getFile(iter.next());
			fileName = file.getOriginalFilename();

			fileType = getFileType(fileName);
			if (fileType == 4) {
				// propKey = "subtitlePath";
			}

			if (fileName.lastIndexOf(".") > -1) {
				extName = fileName.substring(fileName.lastIndexOf("."));
				newFileName = System.currentTimeMillis() + extName;

				File localFile = null;
				localFile = new File(realPath + "/"
						+ System.currentTimeMillis() + suffix + extName);
				file.transferTo(localFile);
			}
		}
		response.setContentType("application/json;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		final PrintWriter out = response.getWriter();
		out.print(java.net.URLDecoder.decode(
				getVisitPath(propPath, basePath, realPath, newFileName),
				"utf-8"));
		out.flush();
		return null;
	}

	/**
	 * 删除无效的文件
	 * 
	 * @param request
	 * @param response
	 * @param fileUrl
	 *            要删除的文件URL http://localhost/tvimg/focus/20141/1388990051456.jpg
	 * @param propKey
	 *            存放目录 /home/nginx/upload/tvimg/focus
	 * @param ruleType
	 * @param visitWay
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/delete")
	public Data delete(HttpServletRequest request,
					   HttpServletResponse response, String fileUrl, String propKey,
					   Integer ruleType, Integer visitWay) throws Exception {
		// 获取文件的存放目录
		String propPath = getPathForProperties(propKey);
		// 返回最长公共目录 /tvimg/focus
		String commonStr = getLCString(fileUrl.toCharArray(),
				propPath.toCharArray());
		// 获取文件存放的真实目录
		String realPath = propPath + fileUrl.split(commonStr)[1];
		File localFile = null;
		localFile = new File(realPath);
		if (localFile.isFile() && localFile.exists()) {
			localFile.delete();
		}
		return new Data(1, "");
	}

	/**
	 * 确定保存，将临时目录下的文件移动到正确的目录下，并返回正确的路径
	 * 
	 * @param request
	 * @param response
	 * @param fileUrl
	 * @param propKey
	 * @param ruleType
	 * @param visitWay
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/saveFile")
	public Data saveFile(HttpServletRequest request,
			HttpServletResponse response, String fileUrl, String propKey,
			Integer ruleType, Integer visitWay) throws Exception {
		// 获取临时文件的存放目录
		String tempPath = getPathForProperties("tempPath");
		// 正确的文件路径
		String propPath = getPathForProperties(propKey);
		// 最长公共目录 /tvimg/focus
		String commonStr = getLCString(fileUrl.toCharArray(),
				tempPath.toCharArray());
		String extPath = fileUrl.split(commonStr)[1];
		String realPath = mkdir(propPath, 2);
		// System.currentTimeMillis() + extName;
		String extName = extPath.substring(extPath.lastIndexOf("."));
		File tempFile = new File(tempPath + extPath);
		String newFileName = System.currentTimeMillis() + extName;
		File destFile = new File(realPath + "/" + newFileName);
		tempFile.renameTo(destFile);
		String basePath = request.getScheme() + "://" + request.getServerName();
		String result = java.net.URLDecoder.decode(
				getVisitPath(propPath, visitWay, basePath, realPath,
						newFileName), "UTF-8");
		Data data = new Data();
		data.setCode(1);
		data.setObj(result);
		return data;
	}
	
	@RequestMapping(value = "/sendStoreServer")
	public Data sendStoreServer(String imgName, String propKey) throws Exception {
		// 正确的文件路径
		String[] arg = imgName.split("/");
		int fileType = getFileType(arg[1]);
		String propStr=getPathForProperties(propKey);
		String module;
		if(fileType==1){
			module = propStr.substring(propStr.lastIndexOf("tvimg")+5);
		}else
			module = propStr.substring(propStr.lastIndexOf("tvapk")+5);
		String commondHeadFile = "/usr/bin/rsync -avP --password-file=/etc/rsyncd.psw ";
		//远程服务器
		String imgServer=getPathForProperties("imagesServer");
		String appServer=getPathForProperties("appsServer");
		
		Data data = new Data();
		try {
			data.setCode(1);
			//2.同步文件
			StringBuffer fileAbsolutePath = new StringBuffer(getPathForProperties("tempPath"));
			fileAbsolutePath.append("/").append(imgName);//获得本地文件路径
			StringBuffer synchronizationFileCommond = new StringBuffer(commondHeadFile);
			synchronizationFileCommond.append(fileAbsolutePath.toString());
			if(fileType==1){
				synchronizationFileCommond.append(" root@").append(imgServer).append("::dataSource").append("/tvimg");
				data.setMsg(getVisitPath(propStr,"http://"+imgServer,propStr+arg[0],arg[1]));
			}else if(fileType==3){
				synchronizationFileCommond.append(" root@").append(appServer).append("::dataSource").append("/tvapk");
				data.setMsg(getVisitPath(propStr,"http://"+appServer,propStr+arg[0],arg[1]));
			}
			synchronizationFileCommond.append(module);//精确到模块
			synchronizationFileCommond.append("/").append(arg[0]).append("/");//精确到日期[201402]
			logger.info("==========>>>开始执行同步文件命令：" + synchronizationFileCommond.toString());
//			RsyncUtils.rsyncExec(synchronizationFileCommond.toString());
		} catch (Exception e) {
			data.setCode(0);
			data.setMsg("");
			e.printStackTrace();
		}
		return data;
	} 

	
	public static void main(String[] args) {
//		FileUploadAction f = new FileUploadAction();
		String propStr = "/home/nginx/upload/tvimg/appIcon";
		System.out.println(propStr.substring(propStr.lastIndexOf("tvimg")+5));
	}
	/**
	 * 获取str1和str2的最长公共串
	 * 
	 * @param str1
	 * @param str2
	 * @return
	 */
	private String getLCString(char[] str1, char[] str2) {
		int i, j;
		int len1, len2;
		len1 = str1.length;
		len2 = str2.length;
		int maxLen = len1 > len2 ? len1 : len2;
		int[] max = new int[maxLen];
		int[] maxIndex = new int[maxLen];
		int[] c = new int[maxLen];

		for (i = 0; i < len2; i++) {
			for (j = len1 - 1; j >= 0; j--) {
				if (str2[i] == str1[j]) {
					if ((i == 0) || (j == 0))
						c[j] = 1;
					else
						c[j] = c[j - 1] + 1;
				} else {
					c[j] = 0;
				}

				if (c[j] > max[0]) { // 如果是大于那暂时只有一个是最长的,而且要把后面的清0;
					max[0] = c[j];
					maxIndex[0] = j;

					for (int k = 1; k < maxLen; k++) {
						max[k] = 0;
						maxIndex[k] = 0;
					}
				} else if (c[j] == max[0]) { // 有多个是相同长度的子串
					for (int k = 1; k < maxLen; k++) {
						if (max[k] == 0) {
							max[k] = c[j];
							maxIndex[k] = j;
							break; // 在后面加一个就要退出循环了
						}

					}
				}
			}
		}
		String returnStr = "";
		for (j = 0; j < maxLen; j++) {
			if (max[j] > 0) {
				for (i = maxIndex[j] - max[j] + 1; i <= maxIndex[j]; i++) {
					returnStr += String.valueOf(str1[i]);
				}
			}
		}
		return returnStr;
	}

	// 获得文件后缀名
	private String getFileSuffixName(String fileName) {
		return fileName.substring(fileName.lastIndexOf(".") + 1,
				fileName.length());
	}

	// 获得文件类型
	private int getFileType(String fileName) {
		String suffix = getFileSuffixName(fileName).toLowerCase();
		if (suffix.equals("jpg") || suffix.equals("png")
				|| suffix.equals("gif") || suffix.equals("ico")
				|| suffix.equals("bmp")) {
			return 1;
		} else if (suffix.equals("txt") || suffix.equals("csv")) {
			return 2;
		} else if (suffix.equals("apk")) {
			return 3;
		} else if (suffix.equals("mp4") || suffix.equals("m3u8")
				|| suffix.equals("3gp")) {
			return 5;
		} else {
			return 4;// 字幕
		}
	}

	// 创建目录
	private String mkdir(String path, Integer flag) {
		String date = DateFormatUtils.format(new Date(), "yyyyMMdd");
		String realPath = path + date;
		File saveFile = new File(realPath);
		if (!saveFile.exists() && !saveFile.isDirectory()) {
			saveFile.mkdirs();
		}
		return realPath;
	}
	// 创建目录
	private boolean mkdir(String path) {
		boolean flag = true;
		try {
			File saveFile = new File(path);
			if (!saveFile.exists() && !saveFile.isDirectory()) {
				saveFile.mkdirs();
			}
		} catch (Exception e) {
			LogMgr.writeErrorLog("创建目录失败",e);
			flag = false;
		}
//		if(!saveFile.getParentFile().exists()) {
//			//如果目标文件所在的目录不存在，则创建父目录
//			saveFile.getParentFile().mkdirs();
//		}
		return flag;
	}
//	private String mkdir(String path) {
//		File saveFile = new File(path);
//		if (!saveFile.exists() && !saveFile.isDirectory()) {
//			saveFile.mkdirs();
//		}
//		return path;
//	}

	private String getVisitPath(String propPath, Integer visitWay,
			String basePath, String realPath, String newFileName) {
		StringBuilder configPath = null;
		if (null == visitWay) {
			return getVisitPath(propPath, basePath, realPath, newFileName);
		} else {
			configPath = new StringBuilder(realPath).append("/").append(
					newFileName);
		}
		logger.info("================返回到页面上的文件路径:" + configPath.toString());
		return configPath.toString();
	}

	private String getVisitPath(String propPath, String basePath,
			String realPath, String newFileName) {
		StringBuilder configPath = null;
		String visitPath = realPath.substring(
				realPath.lastIndexOf(Constants.UPLOAD) + 6, realPath.length());
		configPath = new StringBuilder(basePath).append(visitPath).append("/")
				.append(newFileName);
		logger.info("================返回到页面上的文件路径:" + configPath.toString());
		return configPath.toString();
	}

	//
	private String getPathForProperties(String key) throws IOException {
		return ProperManager.getString(key);
	}
}