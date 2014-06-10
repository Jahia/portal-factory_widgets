<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="widget" uri="http://www.jahia.org/tags/widgetLib" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>

<template:addResources type="javascript" resources="app/googleMapWidget.js"/>
<template:addResources type="css" resources="commonsWidget.css"/>

<div id="google-map-${currentNode.identifier}" ng-controller="google-map-edit-ctrl"
     ng-init="init('google-map-${currentNode.identifier}')" class="widget-edit">
    <h2>
        <fmt:message key="jnt_googleMapWidget"/>
    </h2>

    <div class="box-1">
        <form name="feed_form">
            <div class="row-fluid">
                <div class="span12">
                    <label>
                        <span><fmt:message key="title"/>:</span>
                        <input type="text" name="jcr:title" ng-model="map['jcr:title']"
                               ng-init="map['jcr:title'] = '${currentNode.displayableName}'"/>
                    </label>
                </div>
            </div>

            <div class="row-fluid">
                <div class="span12">
                    <label>
                        <span><fmt:message key="label.height"/> (px):</span>

                        <input type="number" name="j:height" ng-model="map['j:height']"
                               ng-init="map['j:height'] = ${currentNode.properties['j:height'].long}" required/>
                    </label>
                </div>
            </div>

            <div class="row-fluid">
                <div class="span12">
                    <label>
                        <span><fmt:message key="jnt_googleMapWidget.lat"/>:</span>

                        <input type="text" name="j:lat" ng-model="map['j:lat']"
                               ng-init="map['j:lat'] = ${currentNode.properties['j:lat'].double}" required/>
                    </label>
                </div>
            </div>

            <div class="row-fluid">
                <div class="span12">
                    <label>
                        <span><fmt:message key="jnt_googleMapWidget.lng"/>:</span>

                        <input type="text" name="j:lng" ng-model="map['j:lng']"
                               ng-init="map['j:lng'] = ${currentNode.properties['j:lng'].double}" required/>
                    </label>
                </div>
            </div>

            <div class="row-fluid">
                <div class="span12">
                    <button class="btn" ng-click="cancel()"><fmt:message key="cancel"/></button>
                    <button class="btn btn-primary" ng-click="update(map)">
                        <fmt:message key="save"/>
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>

<script type="text/javascript">
    // Boostrap app
    angular.bootstrap(document.getElementById("google-map-${currentNode.identifier}"),['googleMapWidgetApp']);
</script>