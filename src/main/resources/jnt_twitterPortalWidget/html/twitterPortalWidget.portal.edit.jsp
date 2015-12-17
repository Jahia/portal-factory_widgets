<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>

<template:addResources type="javascript" resources="angular-bootstrap-colorpicker.js"/>
<template:addResources type="javascript" resources="app/twitterWidget.js"/>
<template:addResources type="css" resources="twitterWidget.css"/>
<template:addResources type="css" resources="commonsWidget.css"/>
<template:addResources type="css" resources="colorpicker.css"/>

<c:set var="properties" value="${currentNode.properties}"/>

<div id="twitter-widget-${currentNode.identifier}" ng-controller="twitter-edit-ctrl"
     ng-init="init('twitter-widget-${currentNode.identifier}')" class="widget-edit">

<h2>
    <fmt:message key="jnt_twitterWidget"/>
    <a href="#" class="twitter-tooltip" data-placement="right" data-toggle="tooltip"
       title="<fmt:message key="jnt_twitterWidget_description"/>">
        <i class="icon-info-sign"></i>
    </a>
</h2>

<div class="box-1">
<form name="twitter_form" class="simple-form">

<div class="row-fluid">
    <div class="span12">
        <label>
            <span><fmt:message key="title"/>:</span>

            <input type="text" required name="jcr:title" ng-model="twitter['jcr:title']" />
        </label>
    </div>
</div>

<div class="row-fluid">
    <div class="span12">
        <label>
            <span><fmt:message key="jnt_twitterWidget.widgetId"/>:</span>

            <input type="text" required name="widgetId" ng-model="twitter.widgetId"
                    />

            <a href="#" class="twitter-tooltip" data-placement="right" data-toggle="tooltip"
               title="<fmt:message key="jnt_twitterWidget.widgetId.ui.tooltip"/>">
                <i class="icon-info-sign"></i>
            </a>
        </label>

        <div ng-show="twitter_form.widgetId.$invalid">Invalid:
            <span ng-show="twitter_form.widgetId.$error.required">Tell us your widgetId.</span>
        </div>
    </div>
</div>

<div class="row-fluid">
    <div class="span12">
        <label>
            <span><fmt:message key="jnt_twitterWidget.theme"/>:</span>

            <select name="theme">
                <option value="dark" <c:if test="${properties.theme.string eq 'dark'}">selected="selected"</c:if>>dark</option>
                <option value="light" <c:if test="${properties.theme.string eq 'light'}">selected="selected"</c:if>>light</option>
            </select>

            <a href="#" class="twitter-tooltip" data-placement="right" data-toggle="tooltip"
               title="<fmt:message key="jnt_twitterWidget.theme.ui.tooltip"/>">
                <i class="icon-info-sign"></i>
            </a>
        </label>
    </div>
</div>

<div class="row-fluid">
    <div class="span12">
        <label>
            <span><fmt:message key="jnt_twitterWidget.height"/>:</span>
            <input type="number" name="height" ng-model="twitter.height" />
        </label>
    </div>
</div>

<div class="row-fluid">
    <div class="span12">
        <label>
            <span><fmt:message key="jnt_twitterWidget.linkcolor"/>:</span>
            <input colorpicker type="text" name="linkcolor" ng-model="twitter.linkcolor"
                    />

            <a href="#" class="twitter-tooltip" data-placement="right" data-toggle="tooltip"
               title="<fmt:message key="jnt_twitterWidget.linkcolor.ui.tooltip"/>">
                <i class="icon-info-sign"></i>
            </a>
        </label>
    </div>
</div>

<div class="row-fluid">
    <div class="span12">
        <label>
            <span><fmt:message key="jnt_twitterWidget.bordercolor"/>:</span>
            <input colorpicker type="text" name="bordercolor" ng-model="twitter.bordercolor"
                    />

            <a href="#" class="twitter-tooltip" data-placement="right" data-toggle="tooltip"
               title="<fmt:message key="jnt_twitterWidget.bordercolor.ui.tooltip"/>">
                <i class="icon-info-sign"></i>
            </a>
        </label>
    </div>
</div>

<div class="row-fluid">
    <div class="span12">
        <label>
            <span><fmt:message key="jnt_twitterWidget.noheader"/>:</span>
            <input type="checkbox" name="noheader" ng-model="twitter.noheader" value="true" value="true"
                    />

            <a href="#" class="twitter-tooltip" data-placement="right" data-toggle="tooltip"
               title="<fmt:message key="jnt_twitterWidget.noheader.ui.tooltip"/>">
                <i class="icon-info-sign"></i>
            </a>
        </label>
    </div>
</div>

<div class="row-fluid">
    <div class="span12">
        <label>
            <span><fmt:message key="jnt_twitterWidget.nofooter"/>:</span>
            <input type="checkbox" name="nofooter" ng-model="twitter.nofooter" value="true" value="true"
                    />

            <a href="#" class="twitter-tooltip" data-placement="right" data-toggle="tooltip"
               title="<fmt:message key="jnt_twitterWidget.nofooter.ui.tooltip"/>">
                <i class="icon-info-sign"></i>
            </a>
        </label>
    </div>
</div>

<div class="row-fluid">
    <div class="span12">
        <label>
            <span><fmt:message key="jnt_twitterWidget.noborders"/>:</span>
            <input type="checkbox" name="noborders" ng-model="twitter.noborders" value="true" />

            <a href="#" class="twitter-tooltip" data-placement="right" data-toggle="tooltip"
               title="<fmt:message key="jnt_twitterWidget.noborders.ui.tooltip"/>">
                <i class="icon-info-sign"></i>
            </a>
        </label>
    </div>
</div>

<div class="row-fluid">
    <div class="span12">
        <label>
            <span><fmt:message key="jnt_twitterWidget.noscrollbar"/>:</span>
            <input type="checkbox" name="noscrollbar" ng-model="twitter.noscrollbar" value="true" />

            <a href="#" class="twitter-tooltip" data-placement="right" data-toggle="tooltip"
               title="<fmt:message key="jnt_twitterWidget.noscrollbar.ui.tooltip"/>">
                <i class="icon-info-sign"></i>
            </a>
        </label>
    </div>
</div>

<div class="row-fluid">
    <div class="span12">
        <label>
            <span><fmt:message key="jnt_twitterWidget.transparant"/>:</span>
            <input type="checkbox" name="transparent" ng-model="twitter.transparent" value="true" />

            <a href="#" class="twitter-tooltip" data-placement="right" data-toggle="tooltip"
               title="<fmt:message key="jnt_twitterWidget.transparant.ui.tooltip"/>">
                <i class="icon-info-sign"></i>
            </a>
        </label>
    </div>
</div>

<div class="row-fluid">
    <div class="span12">
        <label>
            <span><fmt:message key="jnt_twitterWidget.language"/>:</span>
            <input type="text" name="language" ng-model="twitter.language" />

            <a href="#" class="twitter-tooltip" data-placement="right" data-toggle="tooltip"
               title="<fmt:message key="jnt_twitterWidget.language.ui.tooltip"/>">
                <i class="icon-info-sign"></i>
            </a>
        </label>
    </div>
</div>

<div class="row-fluid">
    <div class="span12">
        <label>
            <span><fmt:message key="jnt_twitterWidget.related"/>:</span>
            <input type="text" name="related" ng-model="twitter.related" />

            <a href="#" class="twitter-tooltip" data-placement="right" data-toggle="tooltip"
               title="<fmt:message key="jnt_twitterWidget.related.ui.tooltip"/>">
                <i class="icon-info-sign"></i>
            </a>
        </label>
    </div>
</div>

<div class="row-fluid">
    <div class="span12">
        <label>
            <span><fmt:message key="jnt_twitterWidget.tweetlimit"/>:</span>
            <input type="number" name="tweetlimit" ng-model="twitter.tweetlimit" min="1" max="20"/>

            <a href="#" class="twitter-tooltip" data-placement="right" data-toggle="tooltip"
               title="<fmt:message key="jnt_twitterWidget.tweetlimit.ui.tooltip"/>">
                <i class="icon-info-sign"></i>
            </a>
        </label>
    </div>
</div>

<div class="row-fluid">
    <div class="span12">
        <label>
            <span><fmt:message key="jnt_twitterWidget.ariapolite"/>:</span>
            <select name="ariapolite">
                <option value="assertive" <c:if test="${properties.ariapolite.string eq 'assertive'}">selected="selected"</c:if>>assertive</option>
                <option value="polite" <c:if test="${properties.ariapolite.string eq 'polite'}">selected="selected"</c:if>>polite</option>
            </select>

            <a href="#" class="twitter-tooltip" data-placement="right" data-toggle="tooltip"
               title="<fmt:message key="jnt_twitterWidget.ariapolite.ui.tooltip"/>">
                <i class="icon-info-sign"></i>
            </a>
        </label>
    </div>
</div>

<div class="row-fluid">
    <div class="span12">
        <button class="btn" ng-click="cancel()"><fmt:message key="cancel"/></button>
        <button class="btn btn-primary" ng-disabled="twitter_form.$invalid" ng-click="update()">
            <fmt:message key="save"/>
        </button>
    </div>
</div>
</form>
</div>
</div>
<script type="text/javascript">
    if (typeof scope == 'undefined') {
        var scope = { };
    }
    scope['twitter-widget-${currentNode.identifier}'] = {};
    scope['twitter-widget-${currentNode.identifier}'].twitter = {};
    scope['twitter-widget-${currentNode.identifier}'].twitter['jcr:title'] = '${functions:escapeJavaScript(currentNode.displayableName)}';
    <c:if test="${not empty properties.widgetId}">
    scope['twitter-widget-${currentNode.identifier}'].twitter.widgetId = '${functions:escapeJavaScript(properties.widgetId.string)}';
    </c:if>
    <c:if test="${not empty properties.height}">
    scope['twitter-widget-${currentNode.identifier}'].twitter.height = ${properties.height.long}
    </c:if>
    <c:if test="${not empty properties.linkcolor}">
    scope['twitter-widget-${currentNode.identifier}'].twitter.linkcolor = '${functions:escapeJavaScript(properties.linkcolor.string)}'
    </c:if>
    <c:if test="${not empty properties.bordercolor}">
    scope['twitter-widget-${currentNode.identifier}'].twitter.bordercolor = '${functions:escapeJavaScript(properties.bordercolor.string)}'
    </c:if>
    <c:if test="${not empty properties.noheader}">
    scope['twitter-widget-${currentNode.identifier}'].twitter.noheader = ${properties.noheader.boolean}
    </c:if>
    <c:if test="${not empty properties.nofooter}">
    scope['twitter-widget-${currentNode.identifier}'].twitter.nofooter = ${properties.nofooter.boolean}
    </c:if>
    <c:if test="${not empty properties.noborders}">
    scope['twitter-widget-${currentNode.identifier}'].twitter.noborders = ${properties.noborders.boolean}
    </c:if>
    <c:if test="${not empty properties.noscrollbar}">
    scope['twitter-widget-${currentNode.identifier}'].twitter.noscrollbar = ${properties.noscrollbar.boolean}
    </c:if>
    <c:if test="${not empty properties.transparent}">
    scope['twitter-widget-${currentNode.identifier}'].twitter.transparent = ${properties.transparent.boolean}
    </c:if>
    <c:if test="${not empty properties.language}">
    scope['twitter-widget-${currentNode.identifier}'].twitter.language = '${functions:escapeJavaScript(properties.language.string)}'
    </c:if>
    <c:if test="${not empty properties.tweetlimit}">
    scope['twitter-widget-${currentNode.identifier}'].twitter.tweetlimit = ${properties.tweetlimit.long}
    </c:if>
    <c:if test="${not empty properties.related}">
    scope['twitter-widget-${currentNode.identifier}'].twitter.related = '${functions:escapeJavaScript(properties.related.string)}'
    </c:if>

    // Boostrap app
    $(document).ready(function () {
        angular.bootstrap(document.getElementById("twitter-widget-${currentNode.identifier}"), ['twitterWidgetApp']);
    });
</script>
