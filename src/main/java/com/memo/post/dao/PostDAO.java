package com.memo.post.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.memo.post.model.Post;

@Repository
public interface PostDAO {

	public int addPost(
			@Param("userId") int userId, 
			@Param("subject") String subject,
			@Param("content") String content,
			@Param("imagePath") String file);
	
	public int updatePost(
			@Param("postId") int postId, 
			@Param("userId") int userId, 
			@Param("subject") String subject,
			@Param("content") String content,
			@Param("imagePath") String file);

	public List<Post> selectPostListByUserId(int userId);
	
	
	public Post selectPostByPostIdAndUserId(
			@Param("postId") int postId,
			@Param("userId") int userId);
	
	public Post selectPostByPostId(int postId);
	
}
