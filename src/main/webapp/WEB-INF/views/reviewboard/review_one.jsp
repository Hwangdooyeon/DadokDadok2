<%@page import="com.multi.mini6.reviewboard.vo.ReviewCommentVO"%>
<%@page import="com.multi.mini6.reviewboard.vo.ReviewVO"%>
<%@page import="java.util.List"%>
<%@page import="com.multi.mini6.reviewboard.vo.ReviewVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
        	session.setAttribute("user", "1");
        %>
<!DOCTYPE html>
<html>
<head>
<!-- Bootstrap CSS 추가 -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
    $(function() {
        $(".btn-edit").click(function() {
            alert("edit");

            let cm_id = this.value;
            let content = $("#cm_content_" + cm_id).val();
            let member_id= $("#member_id_" + cm_id).val();

            alert(content);
            alert(member_id);

            $("#div_"+ cm_id).empty();
            $("#div_"+ cm_id).append(member_id + "<br />");
            $("#div_"+ cm_id).append("<input type='text' id='content_" + cm_id + "' value ='"+ content + "'>");
            $("#div_"+ cm_id).append("<button class='btn-update' value='" + cm_id + "'>완료</button>");
            $("#div_"+ cm_id).append("<input type='hidden' id='member_id_" + cm_id + "' value ='"+ member_id + "'>");
            //hidden 필드 만들기 member_id

        });

        $(document).on("click", ".btn-update", function() {
        alert("click")
            let cm_id = $(this).val();
            let updatedContent = $("#content_" + cm_id).val()
            let updatedWriter = $("#member_id_" + cm_id).val();

            $("#div_"+ cm_id).empty();
            $("#div_"+ cm_id).append(updatedWriter + "<br />" + updatedContent)
            console.log(cm_id)
            console.log("updatedContent : " + updatedContent)
            console.log("updatedWriter  : " + updatedWriter)


             $.ajax({
             url: "review_comment_update",
             data: {

             cm_id: cm_id,
             cm_content: updatedContent

             },
             success: function(response1) {
             alert(response1);
             $('#div_').append("<div class='card mb-2'><div class='card-body'>"  + response1 +"</div></div>" )


             alert("댓글 수정이 완료되었습니다." + response1)

             $(document).on("click", ".btn-delete", function() {
                 let cm_id = $(this).val();

                 $.ajax({
                     url: "review_comment_delete", // 삭제를 담당하는 컨트롤러 URL
                     data: {
                         cm_id: cm_id // 삭제할 댓글의 ID
                     },
                     success: function(response) {
                         $('#div_${cm_id}').parent().remove();
                         alert("댓글 삭제가 완료되었습니다.");
                     }
                 });
             });

             }
        });


    });
           $(function() {


                      })

                      $('#b1').click(function() {
                          console.log(${reviewVO.review_id})
                           console.log($('#review').val())
                            console.log(${user})


                          $.ajax({
                              url: "review_comment_insert",
                              data: {
                                  review_id : '${reviewVO.review_id}',
                                  cm_content : $('#review').val(),
                                  member_id : '${user}'

                              },
                              success: function(response) {
                               $('#result').append("<div class='card mb-2'><div class='card-body'>" + response +"</div></div>" )

                                  alert("댓글 작성이 완료되었습니다." + response)

                              }
                          })
                      })

                  })
</script>


    <style>
        body {
            padding-top: 50px;
        }

        .container {
            width: 80%;
            margin: 0 auto;
            text-align: center;
        }

        .comment-section {
            margin-top: 30px;
        }

        .comment-card {
            margin-bottom: 20px;
        }

        .comment-card .card-body {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
        }

        .comment-card .card-body .comment-content {
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
<div>
<div class="container mt-4">
    <h2>${reviewVO.review_title}</h2>
    <p>작성자: ${reviewVO.member_id}</p>
    <p>작성일자: ${reviewVO.review_createdAt}</p>
    <p>수정일자: ${reviewVO.review_updatedAt}</p>
    <p>조회수: ${reviewVO.review_views}</p>
    <hr>
    <div>
        <p>${reviewVO.review_content}</p>
    </div>
       <hr class="mt-4 mb-4">
        <div class="input-group mb-3">
            <input id="review" type="text" class="form-control" placeholder="댓글입력">
            <div class="input-group-append">
                <button id="b1" class="btn btn-primary" type="button">댓글 달기</button>
            </div>
        </div>
        <hr class="mt-4 mb-4">
         <!-- 댓글 목록 -->
         <div id="result">
             <%
             List<ReviewCommentVO> list = (List<ReviewCommentVO>) request.getAttribute("list");
             for (ReviewCommentVO dto : list) {
             %>
             <div class="card mb-2">
                 <div class="card-body">
                    <div id="div_<%=dto.getCm_id()%>">
                     <%=dto.getMember_id()%> <br />
                     <%=dto.getCm_content()%> <br />
                     <input type="hidden" id="cm_content_<%=dto.getCm_id()%>"  value="<%=dto.getCm_content()%>">
                     <input type="hidden" id="member_id_<%=dto.getCm_id()%>" value="<%=dto.getMember_id()%>">

                     <button class='btn-edit' id="btn_<%=dto.getCm_id()%>" value="<%=dto.getCm_id()%>">댓글수정</button>
                     <button class='btn-delete' value="<%=dto.getCm_id()%>">댓글삭제</button>
                    </div>
                 </div>
             </div>
             <% } %>
         </div>


</body>
</html>