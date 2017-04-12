package com.hiveview.util.SMS;

import com.hiveview.util.ProperManager;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.util.ArrayList;

// org.json 第三方库请自行下载编译，或者在以下链接下载使用 jdk 1.7 的版本
// http://share.weiyun.com/630a8c65e9fd497f3687b3546d0b839e

public class SmsSingleSender {
	private int appid;
	private String appkey;
	private String url;
	
	SmsSenderUtil util = new SmsSenderUtil();

	private SmsSingleSender(int appid, String appkey ,String url) {
		this.appid = appid;
		this.appkey = appkey;
		this.url = url;
	}

	/**
	 * 普通单发短信接口，明确指定内容，如果有多个签名，请在内容中以【】的方式添加到信息内容中，否则系统将使用默认签名
	 * @param type 短信类型，0 为普通短信，1 营销短信
	 * @param nationCode 国家码，如 86 为中国
	 * @param phoneNumber 不带国家码的手机号
	 * @param msg 信息内容，必须与申请的模板格式一致，否则将返回错误
	 * @param extend 扩展码，可填空
	 * @param ext 服务端原样返回的参数，可填空
	 * @return {@link}SmsSingleSenderResult
	 * @throws Exception
	 */
	public SmsSingleSenderResult send(
			int type,
			String nationCode,
			String phoneNumber,
			String msg,
			String extend,
			String ext) throws Exception {
/*
请求包体
{
    "tel": {
        "nationcode": "86", 
        "mobile": "13788888888"
    },
    "type": 0, 
    "msg": "你的验证码是1234", 
    "sig": "fdba654e05bc0d15796713a1a1a2318c", 
    "time": 1479888540,
    "extend": "",
    "ext": ""
}
应答包体
{
    "result": 0,
    "errmsg": "OK", 
    "ext": "", 
    "sid": "xxxxxxx", 
    "fee": 1
}
*/
		// 校验 type 类型
		if (0 != type && 1 != type) {
			throw new Exception("type " + type + " error");
		}
		if (null == extend) {
			extend = "";
		}		
		if (null == ext) {
			ext = "";
		}

		// 按照协议组织 post 请求包体
        long random = util.getRandom();
        long curTime = System.currentTimeMillis()/1000;

		JSONObject data = new JSONObject();

        JSONObject tel = new JSONObject();
        tel.put("nationcode", nationCode);
        tel.put("mobile", phoneNumber);

        data.put("type", type);
        data.put("msg", msg);
        data.put("sig", util.strToHash(String.format(
        		"appkey=%s&random=%d&time=%d&mobile=%s",
        		appkey, random, curTime, phoneNumber)));
        data.put("tel", tel);
        data.put("time", curTime);
        data.put("extend", extend);
        data.put("ext", ext);

        // 与上面的 random 必须一致
		String wholeUrl = String.format("%s?sdkappid=%d&random=%d", url, appid, random);
        HttpURLConnection conn = util.getPostHttpConn(wholeUrl);

        OutputStreamWriter wr = new OutputStreamWriter(conn.getOutputStream(), "utf-8");
        wr.write(data.toString());
        wr.flush();
        
        System.out.println(data.toString());

        // 显示 POST 请求返回的内容
        StringBuilder sb = new StringBuilder();
        int httpRspCode = conn.getResponseCode();
        SmsSingleSenderResult result;
        if (httpRspCode == HttpURLConnection.HTTP_OK) {
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
            String line = null;
            while ((line = br.readLine()) != null) {
                sb.append(line);
            }
            br.close();
            JSONObject json = new JSONObject(sb.toString());
            result = util.jsonToSmsSingleSenderResult(json);
        } else {
        	result = new SmsSingleSenderResult();
        	result.result = httpRspCode;
        	result.errMsg = "http error " + httpRspCode + " " + conn.getResponseMessage();
        }
        
        return result;
	}

	/**
	 * 指定模板单发
	 * @param nationCode 国家码，如 86 为中国
	 * @param phoneNumber 不带国家码的手机号
	 * @param templId 信息内容
	 * @param params 模板参数列表，如模板 {1}...{2}...{3}，那么需要带三个参数
	 * @param sign 签名，如果填空，系统会使用默认签名
	 * @param extend 扩展码，可填空
	 * @param ext 服务端原样返回的参数，可填空
	 * @return {@link}SmsSingleSenderResult
	 * @throws Exception
	 */
	public SmsSingleSenderResult sendWithParam(
			String nationCode,
			String phoneNumber,
			int templId,
			ArrayList<String> params,
			String sign,
			String extend,
			String ext) throws Exception {
/*
请求包体
{
    "tel": {
        "nationcode": "86", 
        "mobile": "13788888888"
    }, 
    "sign": "腾讯云", 
    "tpl_id": 19, 
    "params": [
        "验证码", 
        "1234", 
        "4"
    ], 
    "sig": "fdba654e05bc0d15796713a1a1a2318c",
    "time": 1479888540,
    "extend": "", 
    "ext": ""
}
应答包体
{
    "result": 0,
    "errmsg": "OK", 
    "ext": "", 
    "sid": "xxxxxxx", 
    "fee": 1
}
*/
		if (null == nationCode || 0 == nationCode.length()) {
			nationCode = "86";
		}
		if (null == params) {
			params = new ArrayList<>();
		}
		if (null == sign) {
			sign = "";
		}
		if (null == extend) {
			extend = "";
		}		
		if (null == ext) {
			ext = "";
		}
		
		long random = util.getRandom();
		long curTime = System.currentTimeMillis()/1000;

		JSONObject data = new JSONObject();

        JSONObject tel = new JSONObject();
        tel.put("nationcode", nationCode);
        tel.put("mobile", phoneNumber);

        data.put("tel", tel);
        data.put("sig", util.calculateSigForTempl(appkey, random, curTime, phoneNumber));
        data.put("tpl_id", templId);
        data.put("params", util.smsParamsToJSONArray(params));
        data.put("sign", sign);
        data.put("time", curTime);
        data.put("extend", extend);
        data.put("ext", ext);

		String wholeUrl = String.format("%s?sdkappid=%d&random=%d", url, appid, random);
        HttpURLConnection conn = util.getPostHttpConn(wholeUrl);

        OutputStreamWriter wr = new OutputStreamWriter(conn.getOutputStream(), "utf-8");
        wr.write(data.toString());
        wr.flush();

        // 显示 POST 请求返回的内容
        StringBuilder sb = new StringBuilder();
        int httpRspCode = conn.getResponseCode();
        SmsSingleSenderResult result;
        if (httpRspCode == HttpURLConnection.HTTP_OK) {
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
            String line = null;
            while ((line = br.readLine()) != null) {
                sb.append(line);
            }
            br.close();
            JSONObject json = new JSONObject(sb.toString());
            result = util.jsonToSmsSingleSenderResult(json);
        } else {
        	result = new SmsSingleSenderResult();
        	result.result = httpRspCode;
        	result.errMsg = "http error " + httpRspCode + " " + conn.getResponseMessage();
        }
        
        return result;
	}

	//定义一个静态私有变量(不初始化，不使用final关键字，使用volatile保证了多线程访问时instance变量的可见性，避免了instance初始化时其他变量属性还没赋值完时，被另外线程调用)
	private static volatile SmsSingleSender instance;

	//定义一个共有的静态方法，返回该类型实例
	public static SmsSingleSender getIstance() {
		// 对象实例化时与否判断（不使用同步代码块，instance不等于null时，直接返回对象，提高运行效率）
		if (instance == null) {
			//同步代码块（对象未初始化时，使用同步代码块，保证多线程访问时对象在第一次创建后，不再重复被创建）
			synchronized (SmsSingleSender.class) {
				//未初始化，则初始instance变量
				if (instance == null) {
					Integer appId = Integer.parseInt(ProperManager.getString(SmsConfigKey.SMS_APP_ID.toString()));
					String appKey = ProperManager.getString(SmsConfigKey.SMS_APP_KEY.toString());
					String smsUrl = ProperManager.getString(SmsConfigKey.SMS_URL.toString());
					instance = new SmsSingleSender(appId,appKey,smsUrl);
				}
			}
		}
		return instance;
	}
}
