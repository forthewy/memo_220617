package com.memo.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.memo.user.dao.UserDAO;

@Service
public class UserBO {
	
	@Autowired
	private UserDAO userDAO;
	
	public boolean existlogInId(String loginId) {
		return userDAO.existlogInId(loginId);
	}
	
	public void addUser(String loginId, String password, String name, String email) {
		userDAO.insertUser(loginId, password, name, email);
	}
}
