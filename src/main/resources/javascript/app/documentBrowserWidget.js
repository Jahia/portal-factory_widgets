var documentBrowserWidget = angular.module('documentBrowserWidgetApp', []);

documentBrowserWidget.controller('document-browser-ctrl', ['$scope', function($scope) {
	$scope.htmlId = "";
    $scope.root = [];

	$scope.getIcon = function(item){
		var nodetype = item.nodeType;
		if(nodetype == "jnt:virtualsitesFolder"){
			return "icon-home";
		}else if(nodetype == "jnt:virtualsite"){
			return "icon-globe";
		}else if(nodetype == "jnt:folder"){
            if(item.displayed){
                return "icon-folder-open";
            } else {
                return "icon-folder-close";
            }
		}else if(nodetype == "jnt:file"){
			return "icon-file";
		}else {
            return "icon-home";
        }
	};

	$scope.isFile = function(item){
		return item.nodeType == "jnt:file";
	};

    $scope.load = function(item) {
        if(item.nodeType != "jnt:file"){
            if(item.childs.length > 0){
                item.displayed = !item.displayed;
            }else {
                $.ajax({
                    type: "GET",
                    dataType: "json",
                    url: $scope.url + ".docTree.do?path=" + item.path
                }).done(function (data) {
                    $scope.$apply(function () {
                        item.childs = data.childs;
                        item.displayed = true;
                    });
                });
            }
        }
    };

    $scope.init = function (widgetId, url, path) {
        $scope.widget = portal.getCurrentWidget(widgetId);
        $scope.url = url;

        $.ajax({
            type: "GET",
            dataType: "json",
            url: url + ".docTree.do?path=" + path
        }).done(function (data) {
            $scope.$apply(function () {
                $scope.root = data;
                $scope.root.displayed = false;
            });
        });
    };
}]);

documentBrowserWidget.controller('document-browser-edit-ctrl', ['$scope', function($scope) {
	$scope.root = [];
	$scope.doc = {};
	$scope.widget = {};

    $scope.getIcon = function(item){
        var nodetype = item.nodeType;
        if(nodetype == "jnt:virtualsitesFolder"){
            return "icon-home";
        }else if(nodetype == "jnt:virtualsite"){
            return "icon-globe";
        }else if(nodetype == "jnt:folder"){
            if(item.displayed){
                return "icon-folder-open";
            } else {
                return "icon-folder-close";
            }
        }else if(nodetype == "jnt:file"){
            return "icon-file";
        }else {
            return "icon-home";
        }
    };

	$scope.isFile = function(item){
		return item.nodeType == "jnt:file";
	};

    $scope.isSelected = function(item) {
        return item.path == $scope.doc.rootPath;
    };

    $scope.load = function(item) {
        if(item.nodeType != "jnt:file"){
            if(item.nodeType != "/"){
                $scope.doc.rootPath = item.path;
            }
            if(item.childs.length > 0){
                item.displayed = !item.displayed;
            }else {
                $.ajax({
                    type: "GET",
                    dataType: "json",
                    url: $scope.url + ".docTree.do?path=" + item.path
                }).done(function (data) {
                    $scope.$apply(function () {
                        item.childs = data.childs;
                        item.displayed = true;
                    });
                });
            }
        }
    };

    $scope.init = function (widgetId, url) {
        $scope.widget = portal.getCurrentWidget(widgetId);
        $scope.url = url;

        $.ajax({
            type: "GET",
            dataType: "json",
            url: url + ".docTree.do"
        }).done(function (data) {
            $scope.$apply(function () {
                $scope.root = data;
                $scope.root.displayed = false;
            });
        });
    };

	$scope.update = function () {
		$scope.widget.performUpdate($("#"+ $scope.widget._id + " form").serializeArray(), function (data) {
			$scope.widget.load();
		});
	};

	$scope.cancel = function () {
		$scope.widget.load();
	};
}]);
