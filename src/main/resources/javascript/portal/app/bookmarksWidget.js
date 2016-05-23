var bookmarksWidget = angular.module('bookmarksWidgetApp', []);

bookmarksWidget.controller('bookmarks-ctrl', ['$scope', function($scope) {
    $scope.widget = {};

    $scope.init = function (widgetId) {
        $scope.widget = portal.getCurrentWidget(widgetId);
    };

    $scope.deleteBookmark = function(source) {
        $.post(source, {"jcrMethodToCall":"delete"},
            function() {
                $scope.widget.load();
            },'json');
    }
}]);

bookmarksWidget.controller('bookmarks-edit-ctrl', ['$scope', function ($scope) {
    $scope.widget = {};
    $scope.bookmark = {};

    $scope.init = function (widgetId) {
        $scope.widget = portal.getCurrentWidget(widgetId);
    };

    $scope.update = function () {
        $scope.widget.performUpdate($("#" + $scope.widget._id + " form").serializeArray(), function (data) {
            $scope.widget.load();
        });
    };

    $scope.cancel = function () {
        $scope.widget.load();
    };
}]);
