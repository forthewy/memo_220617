package com.memo.test;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TestController {
	
	@Autowired
	TestDAO testDAO;
	
	@ResponseBody
	@RequestMapping("test1")
	public String test1() {
		return "Hello world";
	}
	
	@ResponseBody
	@RequestMapping("test2")
	public Map<String, Object> test2() {
		Map<String, Object> fruits = new HashMap<>();
		
		fruits.put("apple", 1);
		fruits.put("banana", 2);
		fruits.put("apple", 333);
		
		return fruits;
	}
	
	@RequestMapping("test3")
	public String test3() {
		return "test";
	}
	
	@ResponseBody
	@RequestMapping("test4")
	public Map<String, Object> test4() {
		return testDAO.getTest();
	}
}
