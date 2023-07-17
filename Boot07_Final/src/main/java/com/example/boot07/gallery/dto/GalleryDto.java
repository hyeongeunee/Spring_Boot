package com.example.boot07.gallery.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

// lombok 을 이용해서 Dto 만들기
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Alias("galleryDto")
public class GalleryDto {
    private int num;
    private String writer;
    private String caption;
    private String imagePath;
    private String regdate;
    private int startRowNum;
    private int endRowNum;
    private int prevNum; // 이전 글의 글 번호
    private int nextNum; // 다음 글의 글 번호
    private MultipartFile image; // 이미지 파일 업로드 처리를 위한 필드
}
