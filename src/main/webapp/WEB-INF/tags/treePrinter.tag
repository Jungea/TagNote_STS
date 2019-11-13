<%@ tag description="pagination" pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ attribute name="paths" type="java.util.List" required="true"%>
<%@ attribute name="index" type="java.lang.Integer" required="true"%>

<c:set var="path" value="${paths.get(index).getPath()}" />
<c:if test="${index!=paths.size()}">
	<div class="item">
		<i class="bookmark yellow icon"></i>
		<div class="content">
			<div class="description" data-url="listByBookmark?path=${path}">
				<c:out value="${paths.get(index).getTag().getTagName()}" />
			</div>
			<c:if test="${index!=paths.size()-1}">
				<c:set var="nextPath" value="${paths.get(index+1).getPath()}" />
				<c:if test="${nextPath.startsWith(path)}">
					<div class="list">
						<my:treePrinter index="${index+1}" paths="${paths}" />
				</c:if>
				<c:if test="${!nextPath.startsWith(path)}">
					<c:set var="pathSize" value='${fn:length(path.split("/"))-1}' />
					<c:set var="nextPathSize"
						value='${fn:length(nextPath.split("/"))-1}' />
					<c:set var="closeCount" value='${pathSize-nextPathSize}' />
		</div>
	</div>
	<c:forEach var="i" begin="1" end="${closeCount}" step="1">
		</div>
		</div>
		</div>
	</c:forEach>

	<my:treePrinter index="${index+1}" paths="${paths}" />
</c:if>
</c:if>
</c:if>

<c:if test="${index==paths.size()-1}">
	<c:set var="lastSize" value='${fn:length(path.split("/"))-1}' />
	<c:forEach var="i" begin="1" end="${lastSize}" step="1">
		</div>
		</div>
	</c:forEach>
	</div>
	</div>
</c:if>
