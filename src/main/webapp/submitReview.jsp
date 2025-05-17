
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Submit Review</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        :root {
            --bs-primary: #1E40AF;
        }
        .navbar-custom {
            background-color: var(--bs-primary);
        }
    </style>
</head>
<body class="bg-light">
<nav class="navbar navbar-expand-lg navbar-dark navbar-custom">
    <div class="container">
        <a class="navbar-brand" href="#">Feedback</a>
    </div>
</nav>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card shadow-lg">
                <div class="card-header text-white" style="background-color: var(--bs-primary);">
                    <h4 class="mb-0">Submit Your Review</h4>
                </div>
                <div class="card-body">
                    <form action="<%=request.getContextPath()%>/submitReview" method="post">
                        <div class="mb-3">
                            <label class="form-label">Name</label>
                            <input type="text" name="name" class="form-control" required placeholder="Enter your name">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Your Review</label>
                            <textarea name="text" rows="5" class="form-control" required placeholder="Write something..."></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary">Submit Review</button>
                        <a href="<%=request.getContextPath()%>/displayReview" class="btn btn-link">View All Reviews</a>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>

