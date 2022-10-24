package com.memo.post.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

@Repository
public interface PostDAO {

	public int addPost(
			@Param("userId") int userId, 
			@Param("subject") String subject,
			@Param("content") String content,
			@Param("imagePath") String file);
}
