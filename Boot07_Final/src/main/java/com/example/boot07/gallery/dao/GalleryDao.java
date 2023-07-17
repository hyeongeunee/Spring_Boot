package com.example.boot07.gallery.dao;


import com.example.boot07.gallery.dto.GalleryDto;

import java.util.List;

public interface GalleryDao {
    // Gallery 리스트 가져오기
    public List<GalleryDto> getList(GalleryDto dto);

    // 갤러리에 사진 저장하기
    public void insert(GalleryDto dto);

    // pk num 에 해당하는 DB 에서 Gallery 게시글 하나의 data 가져오기
    public GalleryDto getData(int num);

    // 모든 ROW 의 개수
    public int getCount(GalleryDto dto);
}
