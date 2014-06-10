<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%@ taglib prefix="search" uri="http://www.jahia.org/tags/search" %>
<%@ taglib prefix="uiComponents" uri="http://www.jahia.org/tags/uiComponentsLib" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="propertyDefinition" type="org.jahia.services.content.nodetypes.ExtendedPropertyDefinition"--%>
<%--@elvariable id="type" type="org.jahia.services.content.nodetypes.ExtendedNodeType"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>
<template:include view="hidden.header"/>
<template:addResources type="css" resources="bookmarks.css"/>
<template:addResources type="javascript" resources="app/bookmarksWidget.js" />
<jcr:node var="user" path="${renderContext.user.localPath}"/>

<div id="bookmarks-${currentNode.identifier}" ng-controller="bookmarks-ctrl"
     ng-init="init('bookmarks-${currentNode.identifier}')">

    <div id="bookmarkList${user.identifier}">
        <template:initPager totalSize="${moduleMap.end}" pageSize="${currentNode.properties['numberOfBookmarksPerPage'].string}" id="${renderContext.mainResource.node.identifier}"/>
        <template:displayPagination id="${renderContext.mainResource.node.identifier}"/>


            <c:if test="${moduleMap.listTotalSize eq 0}">
                <fmt:message key="bookmark.emptyResults"/>
            </c:if>
            <c:if test="${moduleMap.listTotalSize ne 0}">
                <ul class="userMyBookmarksList" id="${currentNode.UUID}">
                    <c:forEach items="${moduleMap.currentList}" var="bookmark" varStatus="status" begin="${moduleMap.begin}" end="${moduleMap.end}">
                        <li>
                            <jcr:nodeProperty node="${bookmark}" name="jcr:title" var="title"/>
                            <jcr:node var="myNode" path="${bookmark.path}"/>
                            <a class="userMyBookmarksListIcon" href="${bookmark.properties['url'].string}">${bookmark.properties['jcr:title'].string}</a>
                            &nbsp;<span class="small">&nbsp;<fmt:formatDate
                                value="${bookmark.properties['date'].date.time}" dateStyle="short" type="both"/></span>
                            <div class="floatright">
                                &nbsp;<button ng-click="deleteBookmark('<c:url value="${url.base}${bookmark.path}"/>')">
                                <span class="icon-contribute icon-delete"></span><fmt:message key="label.delete"/></button>
                            </div>
                            <div class="clear"></div>
                        </li>
                    </c:forEach>
                </ul>
            </c:if>
    </div>
</div>

<script type="text/javascript">
    // Boostrap app
    $(document).ready(function(){
        angular.bootstrap(document.getElementById("bookmarks-${currentNode.identifier}"), ['bookmarksWidgetApp']);
    });
</script>