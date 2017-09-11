<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Goal</title>
</head>
<body>
<div class="box-typical box-typical-padding">
	<form>
		<div class="form-group row">
			<label class="col-sm-2 form-control-label">대주제</label>
			<div class="col-sm-10">
				<p class="form-control-static"><input type="text" class="form-control" id="inputPassword" placeholder="Text"></p>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2 form-control-label">작성자</label>
			<div class="col-sm-10">
				<p class="form-control-static"><input type="text" readonly class="form-control" id="inputPassword" placeholder="Text Readonly"></p>
			</div>
		</div>
		<div class="btn-group" role="group" aria-label="Basic example">
			<label class="col-sm-2 form-control-label">Type</label>
			<button type="button" class="btn btn-default-outline">Single</button>
			<!-- <button type="button" class="btn btn-default-outline">Middle</button> -->
			<button type="button" class="btn btn-default-outline">Multi</button>
		</div>
		
		
		<div class="btn-group" role="group" aria-label="Basic example">
			<label class="col-sm-2 form-control-label">공개여부</label>
			<button type="button" class="btn btn-default-outline">공개</button>
			<!-- <button type="button" class="btn btn-default-outline">Middle</button> -->
			<button type="button" class="btn btn-default-outline">비공개</button>
		</div>
	</form>
</div>
</body>
</html>