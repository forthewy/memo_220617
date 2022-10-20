package com.memo.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserDAO {

	public boolean existlogInId(String loginId);
	
	public void insertUser(
			@Param("loginId") String loginId, 
			@Param("password") String password, 
			@Param("name") String name, 
			@Param("name") String email);
}
