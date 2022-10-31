package com.memo.post.bo;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.memo.common.FileManagerService;
import com.memo.post.dao.PostDAO;
import com.memo.post.model.Post;

@Service
public class PostBO {

	//private Logger log = LoggerFactory.getLogger(PostBO.class); // Mybatis loger 은 지운다.
	private Logger log = LoggerFactory.getLogger(this.getClass()); 

	@Autowired
	private PostDAO postDAO;
	
	@Autowired
	private FileManagerService fileManagerService;
	
	
	
	public int addPost(int userId, String userLoginId, 
			String subject, String content, MultipartFile file) {
		
		String imagePath = null;
		
		if (file != null) {
			// 파일이 있을때만 업로드 처리 => 서버에 업로드
			imagePath = fileManagerService.saveFile(userLoginId, file);
		}
		
		// db insert
		 return postDAO.addPost(userId, subject, content, imagePath);
	}
	
	public int updatePost(int postId, int userId, String userLoginId, String subject
			, String content, MultipartFile file) {
		
		// 기존 글을 가지고 온다. (post 존재 유무 확인 , 이미지가 교체될때 기존이미지를 제거하기 위해서) 
		// BO에 가공 로직이 있을수 있기에 BO로 부른다.
		Post post = getPostByPostId(postId);
		if (post == null) {
			log.warn("[update post] 수정할 메모가 존재하지 않습니다. postId:{}, userId:{}", postId, userId);
			return 0;
		}
		
		// file이 있으면 이미지 수정 => 업로드 (실패시 기존 이미지는 그대로 둔다.) => 성공 기존 이미지 제거
		String imgPath = null;
		if (file != null) {
			// 업로드
			imgPath = fileManagerService.saveFile(userLoginId, file);
			
			// 업로드 성공하면 기존 이미지 제거
			if (imgPath != null && post.getImagePath() != null) {
				// 업로드가 실패할 수 있으므로 업로드가 성공한 후 제거
				fileManagerService.deleteFile(post.getImagePath());
			}
			// 업로드 실패하면 null로 내려간다.
		}
		
		// DB에 update => imagePath가 없으면 mybatis 에서 업데이트하지 않도록 처리
		return postDAO.updatePost(postId, userId, subject, content, imgPath);
	}
	
	public List<Post> getPostListByUserId(int userId) {
		return postDAO.selectPostListByUserId(userId);
	}
	
	public Post getPostByPostIdAndUserId(int postId, int userId) {
		return postDAO.selectPostByPostIdAndUserId(postId, userId);
	}
	
	public Post getPostByPostId(int postId) {
		return postDAO.selectPostByPostId(postId);
	}
	
	public int deletePostByPostId(int postId) {
		// 기존 글 가져오기
		Post post = getPostByPostId(postId);
		
		if (post == null) {
			log.warn("[delete post] 삭제할 게시글이 없습니다. postId:{}", postId);
			return 0;
		}
		
		// 업로드 되었던 이미지 패스가 존재하면 이미지 삭제
		if (post.getImagePath() != null) {
			fileManagerService.deleteFile(post.getImagePath());
		}
		
		return postDAO.deletePostByPostId(postId);
	}
}
