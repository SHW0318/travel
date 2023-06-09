<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script>
        function confirmCancellation(reservationId, accomcode) {
            if (confirm("정말로 예약을 취소하시겠습니까?")) {
                window.location.href = "delete?resnum=" + reservationId + "&accomcode=" + accomcode;
            }
        }
    </script>
</head>
<body>
<%@  include file= "include/header.jsp" %><br><br>
<h3>숙소 예약 정보</h3>
<c:forEach var="reservationDto" items="${reservationList}">
    <table border="0" cellspacing="20" width="75%" >
        <tr>
            <td>숙소 코드</td>
            <td>${reservationDto.accomcode }</td>
        </tr>
        <tr>
            <td>예약 번호</td>
            <td><a href="reserview?resnum=${reservationDto.resnum}&accomcode=${reservationDto.accomcode}">${reservationDto.resnum}</a></td>
        </tr>
        <tr>
            <td>체크인</td>
            <td>${fn:substring(reservationDto.checkindate, 0, 10)}</td>
        </tr>
        <tr>
            <td>체크아웃</td>
            <td>${fn:substring(reservationDto.checkoutdate, 0, 10)}</td>
        </tr>
        <tr>
            <td>가격</td>
            <td>${reservationDto.resprice}</td>
        </tr>
    </table> 
    <input type="button" value="예약 취소하기" onclick="confirmCancellation(${reservationDto.resnum}, '${reservationDto.accomcode}')">&nbsp;&nbsp;
</c:forEach>
</body>
</html>