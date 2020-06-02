<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<body>
	<%@ include file="common/head.jsp"%>

	<div id="cate_box">
		<div id="cateline"
			style="position: relative; width: 1200px; margin-left: auto; margin-right: auto; top: 0px; z-index: 1000; left: 0px; background: rgb(255, 255, 255);">
			<div class="box_1200">
				<div id="category"
					class="xans-element- xans-layout xans-layout-category">
					<div class="position">
						<ul>
							<c:forEach var="list" items="${list}">
								<li class="xans-record-"><a href="" class='${list.bc_code}' >${list.bc_name}</a></li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>