<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 작성 페이지</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-4">
        <form action="review_insert" method="post">
            <div class="form-group">
                <label for="review_title">게시글 제목:</label>
                <input type="text" class="form-control" name="review_title" id="review_title">
            </div>

            <div class="form-group">
                <label for="images">이미지 파일 추가:</label>
                <input type="file" class="form-control-file" name="images" id="images" multiple>
                <!-- 'multiple' 속성을 통해 여러 이미지를 선택할 수 있도록 합니다. -->
            </div>
            <div class="form-group">
                <label for="more_images">추가 이미지 파일:</label>
                <input type="file" class="form-control-file" name="more_images" id="more_images" multiple>
                <!-- 'multiple' 속성을 통해 여러 이미지를 선택할 수 있도록 합니다. -->
            </div>
            <div class="form-group">
                <label for="extra_images">여분의 이미지 파일:</label>
                <input type="file" class="form-control-file" name="extra_images" id="extra_images" multiple>
                <!-- 'multiple' 속성을 통해 여러 이미지를 선택할 수 있도록 합니다. -->
            </div>
            <div class="form-group">
                <label for="review_content">리뷰 내용:</label>
                <textarea class="form-control" name="review_content" id="review_content" rows="5"></textarea>
            </div>
            <button type="submit" class="btn btn-primary">게시글 작성</button>
        </form>
    </div>

    <!-- jQuery 추가 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <!-- Bootstrap JS 추가 -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>