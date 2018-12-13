package com.send.sms.service.imp;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.send.sms.dao.UserMapper;
import com.send.sms.pojo.User;
import com.send.sms.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {
	@Autowired
	private UserMapper userMapper;

	@Override
	public User login(String username) {
		User user = userMapper.login(username);
		return user;
	}

}
