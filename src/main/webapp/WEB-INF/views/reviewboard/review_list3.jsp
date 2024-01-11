<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.multi.mini6.reviewboard.vo.ReviewVO"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap JS (optional) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
<style>
    .row {
        display: flex;
        align-items: center;
        margin-bottom: 20px;
    }

    .row img {
        max-width: 200px;
        margin-right: 20px;
    }
</style>
<script type="text/javascript">
                        $(function() {
                            $('.btn').click(function() {
                                $.ajax({
                                    url: "review_list33",
                                    data: {
                                        page: $(this).text()
                },
                success: function(table) {
                    $('#result').html(table);
                } //success
            }) //ajax
        })
    })

</script>
</head>
<body bgcolor="yellow">
    <div class="container mt-4">
        <!-- 검색창과 버튼 -->
        <div class="row mb-3 justify-content-center">
            <!-- 검색창 -->
            <div class="col-md-6 text-center">
                <form action="review_search" class="d-flex justify-content-center" >
                    <input type = "hidden" name="page" value="1">
                    <input name="keyword" id ="keyword" class="form-control form-control-sm me-2" type="search" placeholder="검색어를 입력하세요"
                        aria-label="Search">

                    <button class="btn btn-outline-success btn-sm" type="submit">검색</button>

                </form>
            </div>

            <!-- Insert 버튼 -->
            <div class="col-md-6 text-end">
                <a href="review_insert_move" class="btn btn-primary">게시글 작성</a>
                 <a href="review_update_move" class="btn btn-primary">글 수정하기</a>
                     <a href="review_delete_move" class="btn btn-primary">글 삭제하기</a>
            </div>
        </div>

        <hr>

        <h3>독서후기게시판</h3>
        <div id="result">
            <%
                //jsp에서 자동 import : 클릭하고 ctrl + shiftl + m
                List<ReviewVO> list = (List<ReviewVO>) request.getAttribute("list");
            %>
            <div class="container mt-4">
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">id</th>
                            <th scope="col">제목</th>
                            <th scope="col">내용</th>
                            <th scope="col">작성일</th>
                            <th scope="col">수정일</th>
                            <th scope="col">조회수</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (ReviewVO review : list) {
                        %>
                        <tr>
                            <td><%=review.getReview_id()%></td>

                            <td><a href="review_one?review_id=<%=review.getReview_id()%>"><%=review.getReview_title()%></a>
                            </td>
                            <td><%=review.getReview_content()%></td>
                            <td><%=review.getReview_createdAt()%></td>
                            <td><%=review.getReview_updatedAt()%></td>
                            <td><%=review.getReview_views()%></td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>

        <hr color="red">
        <div class="text-center">
            전체 게시물 수 : ${count}개 <br>
            전체 페이지 수 : ${pages}개 <br>
            <div class="btn-group" role="group" aria-label="Basic example">
                <%
                    int pages = (int) request.getAttribute("pages");//int(작) <--- Object(큰)
                    for (int p = 1; p <= pages; p++) {
                %>
                <button class="btn btn-outline-secondary"><%= p %></button>
                <%
                    }
                %>
            </div>
        </div>
        <hr color="red">
    </div>
</body>

</html>