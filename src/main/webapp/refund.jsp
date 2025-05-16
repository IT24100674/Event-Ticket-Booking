<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Refund/Cancel Payment</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-[#003087] flex items-center justify-center min-h-screen">
    <div class="bg-gray-50 p-8 rounded-lg shadow-lg w-full max-w-md">
        <h2 class="text-2xl font-bold text-gray-700 mb-6 text-center">Refund/Cancel Payment</h2>
        <form action="refundPayment" method="post">
            <div class="mb-4">
                <label for="paymentId" class="block text-gray-700 font-medium mb-2">Payment ID</label>
                <input type="text" id="paymentId" name="paymentId" required
                       class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-red-600">
            </div>
            <div class="mb-6">
                <label for="userId" class="block text-gray-700 font-medium mb-2">User ID</label>
                <input type="text" id="userId" name="userId" required
                       class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-red-600">
            </div>
            <button type="submit"
                    class="w-full bg-red-600 text-white py-2 rounded-lg hover:bg-red-500 transition duration-200">
                Refund/Cancel
            </button>
        </form>
    </div>
</body>
</html>