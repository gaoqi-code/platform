package com.hiveview.comm;

import org.apache.log4j.Logger;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

public class JedisUtil {
	
	private static final Logger LOG = Logger.getLogger(JedisUtil.class.getName());
	
	static JedisPool pool=null;
	static Jedis jedis=null;
	
	public static Jedis getJedis(){
		if(jedis==null){
			//String jedisIp = ProperManager.getString("jedisIp");
			String jedisIp = "42.96.191.13";
			pool = new JedisPool(new JedisPoolConfig(),jedisIp);
			jedis = pool.getResource();
			LOG.debug(jedisIp+" 成功创建redis连接 -------------------------------------");
		}
		return jedis;
	}
	
	/** 加入队列 **/
	public static int save(String key,String value){
		try {
			if(value==null||value.equals("")){
				return -1;
			}
			value = value.replaceAll("\n", "");//去掉换行
			getJedis().lpush(key, value);
			//System.out.println(getJedis().llen(key)+">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
			LOG.debug("成功加入队列------------------------------------------------------------");
			return 1;
		} catch (Exception e) {
			LOG.info("加入队列失败"+e.getMessage());
			return -2;
		}
	}
	
	/** 删除 **/
	public static int delete(String key){
		getJedis().del(key);
		return -1;
	}
	
//	public static void main(String[] args) {
//		String s = "[{\"videosetId\":\"1174438\",\"cp\":2,\"type\":1}]"; 
//		//getJedis().lpush("videosetIds",s);
//		save("videosetIds",s);
//	}
}
