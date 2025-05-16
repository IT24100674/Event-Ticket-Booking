<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Payment History</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-[#003087] min-h-screen p-6">
    <div class="container mx-auto max-w-4xl bg-gray-50 p-6 rounded-lg shadow-lg">
        <h2 class="text-2xl font-bold text-gray-700 mb-6 text-center">Payment History</h2>
        <div class="overflow-x-auto">
            <table class="w-full text-left border-collapse">
                <thead>
                    <tr class="bg-gray-100">
                        <th class="p-3 text-gray-700 font-semibold">Payment ID</th>
                        <th class="p-3 text-gray-700 font-semibold">Amount</th>
                        <th class="p-3 text-gray-700 font-semibold">Status</th>
                        <th class="p-3 text-gray-700 font-semibold">Date</th>
                        <th class="p-3 text-gray-700 font-semibold">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:if test="${empty payments}">
                        <tr>
                            <td colspan="5" class="p-3 text-center text-gray-700">No payments found for this user.</td>
                        </tr>
                    </c:if>
                    <c:forEach var="payment" items="${payments}">
                        <tr class="border-b hover:bg-gray-100">
                            <td class="p-3">${payment.paymentId}</td>
                            <td class="p-3">$${payment.amount}</td>
                            <td class="p-3">${payment.status}</td>
                            <td class="p-3">${payment.date}</td>
                            <td class="p-3">
                                <form action="refundPayment" method="post" class="inline">
                                    <input type="hidden" name="paymentId" value="${payment.paymentId}">
                                    <input type="hidden" name="userId" value="${userId}">
                                    <button type="submit"
                                            class="bg-red-600 text-white px-3 py-1 rounded-lg hover:bg-red-500 transition duration-200">
                                        Refund/Cancel
                                    </button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="mt-6 text-center">
            <a href="payment.jsp"
               class="inline-block bg-[#0055b8] text-white px-4 py-2 rounded-lg hover:bg-[#004099] transition duration-200">
                Make New Payment
            </a>
        </div>
    </div>
</body>
</html>