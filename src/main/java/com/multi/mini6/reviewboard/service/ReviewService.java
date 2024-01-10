package com.multi.mini6.reviewboard.service;

import com.multi.mini6.reviewboard.vo.PageVo;
import com.multi.mini6.reviewboard.vo.ReviewVO;
import com.multi.mini6.reviewboard.mapper.ReviewDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReviewService {

@Autowired
ReviewDAO reviewDAO;

    public int insert(ReviewVO reviewVO) {

        return reviewDAO.insert(reviewVO);
    }


    public void review_insert(ReviewVO reviewVO){


         reviewDAO.insert(reviewVO);
    }

    public int review_update(ReviewVO reviewVO){
        return  reviewDAO.update(reviewVO);

    }
    public int review_delete(ReviewVO reviewVO){

        return reviewDAO.delete(reviewVO);
    }
    public List<ReviewVO> review_list3(PageVo pageVO){

        return reviewDAO.list(pageVO);
    }
    public int delete(ReviewVO reviewVO){

        return reviewDAO.delete(reviewVO);
    }

    public ReviewVO one(ReviewVO reviewVO) throws Exception {

        return reviewDAO.one(reviewVO);
    }
    public int count() {
        return reviewDAO.count();
    }

    public List<ReviewVO> search(String keyword) {
        return reviewDAO.search(keyword);
    }
    public int searchCount(String keyword) {
        return reviewDAO.searchCount(keyword);
    }
}

