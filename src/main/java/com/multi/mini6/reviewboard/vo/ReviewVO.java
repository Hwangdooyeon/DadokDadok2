package com.multi.mini6.reviewboard.vo;

import java.util.Date;

public class ReviewVO {

    private int review_id;
    private int member_id;

    private int book_id;

    private String review_title;
    private String review_content;
    private Date review_createdAt;
    private Date review_updatedAt;
    private int review_views;

    private String keyword;

    private int searchCount;

    private String search;

    public int getReview_id() {
        return review_id;
    }

    public void setReview_id(int review_id) {
        this.review_id = review_id;
    }

    public int getMember_id() {
        return member_id;
    }

    public void setMember_id(int member_id) {
        this.member_id = member_id;
    }

    public int getBook_id() {
        return book_id;
    }

    public void setBook_id(int book_id) {
        this.book_id = book_id;
    }

    public String getReview_title() {
        return review_title;
    }

    public void setReview_title(String review_title) {
        this.review_title = review_title;
    }

    public String getReview_content() {
        return review_content;
    }

    public void setReview_content(String review_content) {
        this.review_content = review_content;
    }

    public Date getReview_createdAt() {
        return review_createdAt;
    }

    public void setReview_createdAt(Date review_createdAt) {
        this.review_createdAt = review_createdAt;
    }

    public Date getReview_updatedAt() {
        return review_updatedAt;
    }

    public void setReview_updatedAt(Date review_updatedAt) {
        this.review_updatedAt = review_updatedAt;
    }

    public int getReview_views() {
        return review_views;
    }

    public void setReview_views(int review_views) {
        this.review_views = review_views;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public int getSearchCount() {
        return searchCount;
    }

    public void setSearchCount(int searchCount) {
        this.searchCount = searchCount;
    }

    public String getSearch() {
        return search;
    }

    public void setSearch(String search) {
        this.search = search;
    }

    @Override
    public String toString() {
        return "ReviewVO [review_id=" + review_id + ", member_id=" + member_id + ", book_id=" + book_id
                + ", review_title=" + review_title + ", review_content=" + review_content + ", review_views="
                + review_views + ", keyword=" + keyword + ", searchCount=" + searchCount + ", search=" + search + "]";
    }



}
