<%--@elvariable id="forbiden" type="java.lang.Boolean"--%>

<%@ page contentType="text/html;charset=UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"
           prefix="fmt" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.dspace.org/dspace-tags.tld" prefix="dspace" %>

<%
    String collection_id = (String) request.getAttribute("collection_id");
    String community_id = (String) request.getAttribute("community_id");
%>

<dspace:layout navbar="admin" style="submission" titlekey="jsp.register.edit-profile.title" nocache="true">
	<c:choose>
		<c:when test="${forbiden}">
			<b>Импорт для данной коллекции запрещен</b><br>
			Для данной коллекции назначен воркфлоу. Просим завести новый ресурс через отправку в архиве ресурсов.
		</c:when>
		<c:otherwise>
			<b>Поиск по идентификатору</b><br>
			<form action="/import-item" method="post" name="edit_metadata" id="edit_metadata"
			      onkeydown="return disableEnterKey(event);">
			<span class="col-md-5">
			<input class="form-control" type="text" id="metadata_import_val" name="uuid_search"
			       placeholder="Идентификатор" size="23" value=""/>
			</span>
				<input type="hidden" name="collection_id" value="<%=collection_id %>"/>
				<input type="hidden" name="community_id" value="<%=community_id %>"/>
				<br>
				<br>
				<input class="btn btn-primary pull-left col-md-3" id="metadata_import_omg" type="submit" name="submit"
				       value="Найти">
			</form>

			<br>
			<br>
			<b>Поиск по имени и заголовку</b><br>
			<form action="/import-item" method="post" name="edit_metadata" id="edit_metadata"
			      onkeydown="return disableEnterKey(event);">
			<span class="col-md-5">
			<input class="form-control" type="text" name="name" id="author_name" placeholder="Имя автора" size="23"
			       value=""/>
			</span>
				<span class="col-md-5">
			<input class="form-control" type="text" name="title" id="import_name" placeholder="Наименование" size="23"
			       value=""/>
			</span>
				<input type="hidden" name="collection_id" value="<%=collection_id %>"/>
				<input type="hidden" name="community_id" value="<%=community_id %>"/>
				<input type="hidden" name="action" value="search"/>
				<br>
				<br>
				<input class="btn btn-primary pull-left col-md-3" id="metadata_import_name_omg" type="submit"
				       name="submit" value="Найти">
			</form>
		</c:otherwise>
	</c:choose>
</dspace:layout>
