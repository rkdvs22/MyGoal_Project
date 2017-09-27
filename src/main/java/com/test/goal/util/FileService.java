package com.test.goal.util;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

public class FileService {
private static final String FILE_PATH ="C://Users/user/Documents/Project/MyGoal/src/main/webapp/resources/img/profileImg/";
	
	// 파일 저장
	public static String saveFile(MultipartFile uploadFile) {
		String originalFileName = uploadFile.getOriginalFilename();
		
		try {
			uploadFile.transferTo(new File(FILE_PATH + originalFileName));

		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return originalFileName;
	}
	
	// 파일 삭제
	public static void deleteFile(String fileName) {
		File file = new File("C://Users/user/Documents/Project/MyGoal/src/main/webapp/resources/img/profileImg/" + fileName);
		if(file.exists()) file.delete(); // file이 존재했을때 삭제 로직 실행	
		
	}
}
