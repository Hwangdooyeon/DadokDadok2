<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 수정</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <form action="reviewboard/review_comment_update" method="post">
            <h3 class="mb-4">댓글 수정</h3>
            <div class="row g-3">
                <div class="col-md-6">
                    <label for="cm_id" class="form-label">cm_id</label>
                    <input type="text" class="form-control" id="cm_id" name="cm_id">
                <div class="col-12">
                    <label for="cm_content" class="form-label">cm_content</label>
                    <input type="text" class="form-control" id="cm_content" name="cm_content">
                </div>
                <div class="col-12 mt-3">
                    <button type="submit" class="btn btn-primary">댓글 수정 요청</button>
                </div>
            </div>
        </form>
    </div>
</body>
</html>