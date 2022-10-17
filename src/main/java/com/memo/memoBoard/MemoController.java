package com.memo.memoBoard;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/memo")
@Controller
public class MemoController {
	
	@RequestMapping("/sign_up_view")
	public String signUpView() {
		return "signUp";
	}
	
	@RequestMapping("/sign_in_view")
	public String signInView() {
		return "signIn";
	}
}
