package com.memo.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component	 //일반적인 스프링 빈
public class FileManagerService {
	
	private Logger log = LoggerFactory.getLogger(FileManagerService.class);
	
	// 실제 이미지가 저장될 경로(서버)
	public static final String FILE_UPLOAD_PATH = "D:\\parkjeesoo\\memo\\workspace\\images/";
	// 노트북 경로
	// "D:\\Jane\\spring-project\\memo\\workspace\\images/"; 
	
	//input: 멀티파트 파일, userLoginId
	//output: 이미지 패스
	public String saveFile(String userLoginId, MultipartFile file) {
		// 파일 디렉토리 예) forthewy_1620156723/sun.png  이름_시간/.. 한글명이면 안 나옴... 영어로 바꾸는 처리 해줄것.
		String directoryName = userLoginId + "_" + System.currentTimeMillis() + "/"; // forthewy_1620156723/
		String filePath = FILE_UPLOAD_PATH + directoryName; // "D:\\parkjeesoo\\memo\\workspace\\images/forthewy_1620156723" 폴더...
	
		File directory = new File(filePath);
		if (directory.mkdir() == false) {
			return null; // 디렉토리 생성 실패시 null 리턴
		} 
		
		// 파일 업로드: byte
		try {
			byte[] bytes = file.getBytes();
			Path path = Paths.get(filePath + file.getOriginalFilename()); // OriginalFilename은 사용자가 업로드한 파일 이름
			Files.write(path, bytes);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		
		
		// 성공 했으면 이미지 url path 를 리턴한다. (WebMvcConfig 에서 매핑한 이미지 path)
		//http://localhost/images/forthewy_1666614604058/whale.jpg
		return "/images/" + directoryName + file.getOriginalFilename();
	}
	
	public void deleteFile(String imgPath) {
		// imgPath : /images/forthewy_1666614604058/whale.jpg
		
		// /images/ => 구문을 제거
		Path path = Paths.get(FILE_UPLOAD_PATH + imgPath.replace("/images/", ""));
		if (Files.exists(path)) {
			try {
				Files.delete(path); // 이미지를 삭제
			} catch (IOException e) {
				log.error("[이미지 삭제] 이미지 삭제 실패 imagePath:{}" , imgPath);
			} 
		}
		
		// 디렉토리(폴더) 삭제
		path = path.getParent();
		if (Files.exists(path)) {
			try {
				Files.delete(path); // 디렉토리를 삭제
			} catch (IOException e) {
				log.error("[이미지 삭제] 디렉토리 삭제 실패 imagePath:{}" , imgPath);
			} 
		}
	}
}
