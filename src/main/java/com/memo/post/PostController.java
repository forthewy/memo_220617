package com.memo.post;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.memo.post.bo.PostBO;
import com.memo.post.model.Post;

@RequestMapping("/post")
@Controller
public class PostController {
	
		@Autowired
		private PostBO postBO;
	
	// 글목록 화면
		@RequestMapping("/post_list_view")
		public String postListView(HttpSession session, Model model) {
			
			Integer userId =  (Integer) session.getAttribute("userId"); // 로그인이 풀려있으면 null이기 때문에 Integer

			if (userId == null) {
				// 로그인이 풀려있으면 로그인 페이지로 리다이렉트
				return "redirect:/user/sign_in_view";
			}
			
			List<Post> postList = postBO.getPostList(userId);
			
			model.addAttribute("postList", postList);
			model.addAttribute("viewName", "post/postList"); 
			return "template/layout";
		}
		
		@RequestMapping("/post_create_view")
		public String postCreateView(HttpSession session, Model model) {
			Integer userId = (Integer)session.getAttribute("userId");
			
			if (userId == null) {
				return "redirect:/user/sign_in_view";
			}
			
			model.addAttribute("viewName", "post/postCreate");
			
			return "template/layout";
		}
		
	}
