package com.multi.mini6.reviewboard.controller;


import com.multi.mini6.reviewboard.vo.PageVo;
import com.multi.mini6.reviewboard.vo.ReviewCommentVO;
import com.multi.mini6.reviewboard.vo.ReviewVO;
import com.multi.mini6.reviewboard.service.ReviewCommentService;
import com.multi.mini6.reviewboard.service.ReviewService;
import org.apache.ibatis.reflection.SystemMetaObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/reviewboard")
public class ReviewController {
    @Autowired
    ReviewService reviewService;

    @Autowired
    ReviewCommentService reviewCommentService;

    @RequestMapping("/review_insert_move")
    public String insert_move() {
        return "reviewboard/review_insert";
    }

    @RequestMapping("/review_insert")
    public String insert(ReviewVO reviewVO, Model model) {


        reviewService.review_insert(reviewVO);

        return "forward:/reviewboard/review_list3?page=1";
    }

    @RequestMapping("/review_update_move")
    public String update_move() {

        return "reviewboard/review_update";
    }

    @RequestMapping("/review_update")
    public String update(ReviewVO reviewVO, Model model) {
        int result = reviewService.review_update(reviewVO);
        System.out.println("result"+ result);
        model.addAttribute("review_update", result);
        System.out.println(result >= 1);
        if (result >= 1) {

            System.out.println("if");
            return "forward:/reviewboard/review_list3?page=1";
        } else {
            System.out.println("else");
            return "reviewboard/review_update";

        }

    }


    @RequestMapping("/review_list3")
    public void list(PageVo pageVO, Model model) {
        pageVO.setStartEnd();//start, end계산해주는 메서드
        System.out.println("===> " + pageVO);
        List<ReviewVO> list = reviewService.review_list3(pageVO);
        //전체 페이지수 구하기
        System.out.println(list);
        int count = reviewService.count(); //전체게시물 수
        System.out.println("전체 게시물수>> " + count);
        int pages = count / 10;
        if (count % 10 != 0) {
            pages = count / 10 + 1;
        }
        //모델로 views까지 페이지수를 넘겨야 페이지수 버튼을 만들 수 있음.
        System.out.println("페이지당 가지고 온 게시물수>> " + list.size());
        //views의 list3.jsp로 전달
        model.addAttribute("list", list);
        model.addAttribute("pages", pages);
        model.addAttribute("count", count);
    }

    @RequestMapping("/review_list33")
    public void list33(PageVo pageVO, Model model) {
        pageVO.setStartEnd();//start, end계산해주는 메서드
        System.out.println(pageVO);
        List<ReviewVO> list = reviewService.review_list3(pageVO);
        //전체 페이지수 구하기


        //모델로 views까지 페이지수를 넘겨야 페이지수 버튼을 만들 수 있음.
        System.out.println("페이지당 가지고 온 게시물수>> " + list.size());
        //views의 list1.jsp로 전달
        model.addAttribute("list", list);

    }

    @RequestMapping("/review_delete_move")
    public String delete2() {
        // BbsDAO dao = new BbsDAO();

        return "reviewboard/review_delete";
    }


    @RequestMapping("/review_delete")
    public String delete2(ReviewVO reviewVO, Model model) {
        // BbsDAO dao = new BbsDAO();
        int result = reviewService.delete(reviewVO);

        model.addAttribute("result", result);

        return "forward:/reviewboard/review_list3?page=1";
    }

    @RequestMapping("/review_one")
    public void one(ReviewVO reviewVO, Model model) throws Exception {
        // BbsDAO dao = new BbsDAO();
        System.out.println(reviewVO);
        ReviewVO reviewVO2 = reviewService.one(reviewVO);
        List<ReviewCommentVO> list = reviewCommentService.list(reviewVO.getReview_id());
        model.addAttribute("reviewVO", reviewVO2);
        model.addAttribute("list", list);

    }

    @RequestMapping("/review_search")
    public String listWithSearch(PageVo pageVO, Model model, @RequestParam(value = "keyword", required = false) String keyword) {
        int count = 0;
        pageVO.setStartEnd();
        List<ReviewVO> list;
        ReviewVO reviewVO = new ReviewVO();
        reviewVO.setKeyword(keyword);

        if (keyword != null && !keyword.isEmpty()) {
            list = reviewService.search(pageVO);
            count = reviewService.searchCount(pageVO);
        } else {
            list = reviewService.review_list3(pageVO);
            count = reviewService.count();
        }

        // 전체 게시물 수 및 페이지 계산
        // 전체 게시물 수
        int pages = count / 10;
        if (count % 10 != 0) {
            pages = count / 10 + 1;
        }
        System.out.println("count" + count);
        System.out.println("pages" + pages);

        // 모델에 데이터 전달
        model.addAttribute("list", list);
        model.addAttribute("pages", pages);
        model.addAttribute("count", count);
        model.addAttribute("keyword", keyword);


        System.out.println("list size" + list.size());

        return "reviewboard/review_list3";
    }
    @RequestMapping("/review_views")
    public String viewDetail(Model model, @RequestParam("seq") int seq) {
        // 리뷰 정보를 모델에 추가
        model.addAttribute("reviewboard", reviewService.increaseViews(seq));

        // 리뷰의 조회수를 증가시킴
        reviewService.increaseViews(seq);

        return "reviewboard/review_list3";
    }
}
