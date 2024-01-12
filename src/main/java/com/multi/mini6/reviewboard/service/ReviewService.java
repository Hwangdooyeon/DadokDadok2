package com.multi.mini6.reviewboard.service;

import com.multi.mini6.reviewboard.vo.PageVo;
import com.multi.mini6.reviewboard.vo.ReviewVO;
import com.multi.mini6.reviewboard.mapper.ReviewDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

    public List<ReviewVO> search(PageVo pageVo) {
        return reviewDAO.search(pageVo);
    }

    public int searchCount(PageVo pageVo) {
        return reviewDAO.searchCount(pageVo);
    }
    @Transactional
    public int increaseViews(int reviewId) {
        return reviewDAO.increaseViews(reviewId);
    }
    public int getReviewViews(int reviewId) {
        return reviewDAO.getReviewViews(reviewId);
    }
}

