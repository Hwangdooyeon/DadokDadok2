package com.multi.mini6.reviewboard.mapper;

import com.multi.mini6.reviewboard.vo.PageVo;
import com.multi.mini6.reviewboard.vo.ReviewVO;
import org.apache.ibatis.reflection.SystemMetaObject;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public class ReviewDAO {

    @Autowired
    SqlSessionTemplate my;

    public int insert(ReviewVO reviewVO) {
       return my.insert("reviewInsert", reviewVO);
    }

    public int update(ReviewVO reviewVO) {
        return my.update("reviewupdate", reviewVO);
    }

    public int delete(ReviewVO reviewVO) {
        return my.delete("delete", reviewVO);
    }
    public List<ReviewVO> list(PageVo pageVO) {
        return my.selectList("reviewlist", pageVO);
    }
    public ReviewVO one(ReviewVO reviewVO) throws Exception {
        // 3.SQL문 결정/생성
        ReviewVO dto = my.selectOne("one", reviewVO);

        return dto;
    }

    public List<ReviewVO> list1(PageVo pageVO) {
        return my.selectList("list2", pageVO); //==>bbs.html에 있는 bbs를 호출
    }
    public int count() {
        return my.selectOne("reviewcount");
    }
    public List<ReviewVO> search(String keyword) {
        return my.selectList("search", keyword);
    }
    public int searchCount(String keyword) {
        return my.selectOne("searchCount",keyword);
    }
}
