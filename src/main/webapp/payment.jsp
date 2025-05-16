<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Make Payment</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-[#003087] flex items-center justify-center min-h-screen">
    <div class="bg-gray-50 p-8 rounded-lg shadow-lg w-full max-w-md">
        <h2 class="text-2xl font-bold text-gray-700 mb-6 text-center">Make a Payment</h2>
        <form action="makePayment" method="post">
            <div class="mb-4">
                <label for="userId" class="block text-gray-700 font-medium mb-2">User ID</label>
                <input type="text" id="userId" name="userId" required
                       class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-[#0055b8]">
            </div>
            <div class="mb-4">
                <label for="amount" class="block text-gray-700 font-medium mb-2">Amount</label>
                <input type="number" step="0.01" id="amount" name="amount" required
                       class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-[#0055b8]">
            </div>
            <div class="mb-6">
                <label for="paymentMethod" class="block text-gray-700 font-medium mb-2">Payment Method</label>
                <select id="paymentMethod" name="paymentMethod"
                        class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-[#0055b8]">
                    <option value="card">Card Payment</option>
                    <option value="bank">Bank Transfer</option>
                </select>
            </div>
            <button type="submit"
                    class="w-full bg-[#0055b8] text-white py-2 rounded-lg hover:bg-[#004099] transition duration-200">
                Pay Now
            </button>
        </form>
    </div>
</body>
</html>