package com.send.sms.service;
import com.send.sms.pojo.User;


public interface UserService {
	
	/**
	 * 用户登录
	 * @param  loginname
	 * @param  password
	 * @return User对象
	 * */
	User login(String username);
}
