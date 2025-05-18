<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Event</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .form-container {
            max-width: 600px;
            margin: 40px auto;
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }
        .event-card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }
        .preview-img {
            display: none;
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-radius: 10px;
            margin-bottom: 15px;
        }
        .btn-custom {
            width: 100%;
            border-radius: 25px;
            padding: 10px;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="form-container">
        <h3 class="text-center mb-3"><i class="bi bi-calendar-event"></i> Create an Event</h3>
        <form id="eventForm" action="<%= request.getContextPath() %>/createPost" method="post" enctype="multipart/form-data">
            <div class="mb-3">
                <label class="form-label"><i class="bi bi-pencil-square"></i> Event Title</label>
                <input type="text" class="form-control" id="eventTitle" name="eventName" placeholder="Enter event title" required>
            </div>
            <div class="mb-3">
                <label class="form-label"><i class="bi bi-clock"></i> Event Date & Time</label>
                <input type="datetime-local" class="form-control" name="eventDate" id="eventDate" required>
            </div>
            <div class="mb-3">
                <label class="form-label"><i class="bi bi-geo-alt"></i> Location</label>
                <input type="text" class="form-control" id="eventLocation" name="eventLocation" placeholder="Enter event location" required>
            </div>
            <div class="mb-3">
                <label class="form-label"><i class="bi bi-currency-dollar"></i> Price (LKR)</label>
                <input type="number" class="form-control" id="eventPrice" name="ticketPrice" placeholder="Enter ticket price" required>
            </div>
            <div class="mb-3">
                <label class="form-label"><i class="bi bi-file-earmark-image"></i> Upload Image</label>
                <input type="file" class="form-control" id="eventImage" name="eventImage" accept="image/*" required>
                <img id="imagePreview" class="preview-img mt-2" alt="Event Image Preview">
            </div>
            <button type="submit" class="btn btn-primary btn-custom"><i class="bi bi-check-circle"></i> Create Event</button>
        </form>
    </div>
</div>

<script>
    document.getElementById("eventImage").addEventListener("change", function(event) {
        let file = event.target.files[0];
        if (file) {
            let reader = new FileReader();
            reader.onload = function(e) {
                let preview = document.getElementById("imagePreview");
                preview.src = e.target.result;
                preview.style.display = "block";
            };
            reader.readAsDataURL(file);
        }
    });
</script>

</body>
</html>
