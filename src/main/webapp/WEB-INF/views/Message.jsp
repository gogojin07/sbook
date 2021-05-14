<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
	<th:block th:if="${#strings.length(data.message) != 0}">
		<script>
			top.alert("[[${data.message}]]");
		</script>
	</th:block>
	<th:block th:if="${#strings.length(data.href) != 0}">
		<script>
			top.location.href = '[[${data.href}]]';
		</script>
	</th:block>
</head>
</html>