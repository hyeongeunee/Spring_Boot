package com.example.boot07.gallery.service;

import com.example.boot07.gallery.dto.GalleryDto;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

public interface GalleryService {
    // 갤러리의 List 가져오기
    public void getList(HttpServletRequest request);

    // 갤러리 detail 페이지에 필요한 data 를 ModelAndView 에 저장
    public void getDetail(ModelAndView mView, int num);

    // 갤러리에 사진 upload & DB 저장하기
    public void saveImage(GalleryDto dto, HttpServletRequest request);

    public void getData(HttpServletRequest request);
}
