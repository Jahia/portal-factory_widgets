<%@ page import="org.jahia.modules.portal.PortalConstants" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>
<%--@elvariable id="skin" type="org.jahia.services.render.View"--%>

<c:set var="portalTabNT" value="<%= PortalConstants.JNT_PORTAL_TAB %>"/>
<c:set var="portalTabNode" value="${jcr:getParentOfType(currentNode, portalTabNT)}"/>

<template:addResources type="javascript" resources="app/bookmarksWidget.js" />
<template:addResources type="css" resources="commonsWidget.css"/>

<div class="widget-edit" id="bookmarks-${currentNode.identifier}" ng-controller="bookmarks-edit-ctrl"
         ng-init="init('bookmarks-${currentNode.identifier}')">
    <h2>
        <fmt:message key="jnt_bookmarksWidget"/>
    </h2>

    <div class="box-1">
        <form name="bookarm_form">
            <div class="row-fluid">
                <div class="span12">
                    <label>
                        <span><fmt:message key="title"/>:</span>
                        <input type="text" name="jcr:title" ng-model="bookmark['jcr:title']"
                               ng-init="bookmark['jcr:title'] = '${currentNode.displayableName}'"/>
                    </label>
                </div>
            </div>

            <div class="row-fluid">
                <div class="span12">
                    <label>
                        <span><fmt:message key="jnt_googleFeedWidget.nbEntries"/>:</span>

                        <input type="number" name="numberOfBookmarksPerPage" ng-model="bookmark.numberOfBookmarksPerPage"
                               ng-init="bookmark.numberOfBookmarksPerPage = ${currentNode.properties['numberOfBookmarksPerPage'].long}" required/>
                    </label>
                </div>
            </div>

            <div class="row-fluid">
                <div class="span12">
                    <button class="btn" ng-click="cancel()"><fmt:message key="cancel"/></button>
                    <button class="btn btn-primary" ng-disabled="bookarm_form.$invalid" ng-click="update()">
                        <fmt:message key="save"/>
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>

<script type="text/javascript">
    // Boostrap app
    $(document).ready(function(){
        angular.bootstrap(document.getElementById("bookmarks-${currentNode.identifier}"), ['bookmarksWidgetApp']);
    });
</script>