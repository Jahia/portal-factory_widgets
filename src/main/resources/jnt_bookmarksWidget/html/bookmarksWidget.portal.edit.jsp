<%@ page import="org.jahia.modules.portal.PortalConstants" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="portal" uri="http://www.jahia.org/tags/portalLib" %>
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

<template:addResources type="css" resources="commonsWidget.css"/>

<div class="widget-edit">
    <h2>
        Edit: ${currentNode.displayableName}
    </h2>

    <div class="box-1">
        <form action="<c:url value="${url.base}${currentNode.path}"/>" method="POST">
            <input type="hidden" name="jcrRedirectTo" value="<c:url value="${url.base}${portalTabNode.path}"/>">
            <input type="hidden" name="jcrNodeType" value="${currentNode.primaryNodeTypeName}"/>

            <div class="row-fluid">
                <div class="span12">
                    <label>
                        <span><fmt:message key="title"/>:</span>
                        <input type="text" name="jcr:title" value="${currentNode.displayableName}"/>
                    </label>
                </div>
            </div>

            <div class="row-fluid">
                <div class="span12">
                    <label>
                        <span>nb of entries:</span>
                        <input type="number" name="numberOfBookmarksPerPage" value="${currentNode.properties['numberOfBookmarksPerPage'].string}"/>
                    </label>
                </div>
            </div>

            <div class="row-fluid">
                <div class="span12">
                    <button class="btn btn-primary" type="submit">
                        <fmt:message key="save"/>
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>