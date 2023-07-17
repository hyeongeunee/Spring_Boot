package com.example.boot07.gallery.controller;


import com.example.boot07.gallery.dto.GalleryDto;
import com.example.boot07.gallery.service.GalleryService;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

@Controller
public class GalleryController {
    @Autowired
    private GalleryService service;

    @Value("${file.location}")
    private String fileLocation;

    @GetMapping(
        value = "/gallery/images/{imageName}",
        produces = {MediaType.IMAGE_PNG_VALUE, MediaType.IMAGE_GIF_VALUE, MediaType.IMAGE_JPEG_VALUE}
    )
    @ResponseBody
    public byte[] galleryImage(@PathVariable("imageName") String imageName) throws IOException {
        String absolutePath = fileLocation + File.separator + imageName;
        InputStream is = new FileInputStream(absolutePath);
        // fileLocation 필드에는 파일이 저장되어 있는 서버의 파일 시스템상에서의 위치가 들어 있다.
        return IOUtils.toByteArray(is);
    }

    @RequestMapping("/gallery/list")
    public String getList(HttpServletRequest request) {
        service.getList(request);
        return "gallery/list";
    }

    @RequestMapping("/gallery/upload_form")
    public String uploadForm() {
        return "gallery/upload_form";
    }

    @RequestMapping("/gallery/upload_form2")
    public String uploadForm2() {
        return "gallery/upload_form2";
    }

    @RequestMapping("/gallery/upload_form3")
    public String uploadForm3() {
        return "gallery/upload_form3";
    }

    @RequestMapping("/gallery/upload_form4")
    public String uploadForm4() {
        return "gallery/upload_form4";
    }

    @RequestMapping(method = RequestMethod.POST, value = "/gallery/ajax_upload")
    @ResponseBody
    public Map<String, Object> ajaxUpload(GalleryDto dto, HttpServletRequest request) {
        // 서비스를 이용해서 업로드된 이미지를 저장하고
        service.saveImage(dto, request);
        // {"isSuccess":true} 형식의 json 문자열 응답
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("isSuccess", true);
        return map;
    }

    @RequestMapping("/gallery/upload")
    public String upload(GalleryDto dto, HttpServletRequest request) {
        // form 에서 dto 로 데이터 받아옴
        // dto : caption, MultipartFile image 를 가지고 있다.
        // request : imagePath 만드는데 사용, session 영역의 id 가져오는데 사용
        service.saveImage(dto, request);
        return "gallery/upload";
    }

    @RequestMapping(value = "/gallery/detail", method = RequestMethod.GET)
    public ModelAndView detail(ModelAndView mView, int num) {
        // 갤러리 detail 페이지에 필요한 data 를 num 으로 가져와 ModelAndView 에 저장
        service.getDetail(mView, num);
        mView.setViewName("gallery/detail");

        return mView;
    }

}
