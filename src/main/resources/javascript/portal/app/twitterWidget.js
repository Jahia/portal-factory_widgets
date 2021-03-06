var twitterWidget = angular.module('twitterWidgetApp', ['colorpicker.module']);

twitterWidget.controller('twitter-view-ctrl', ['$scope', function ($scope) {
    $scope.widget = {};

    $scope.init = function (widgetId) {

        $scope.widget = portal.getCurrentWidget(widgetId);

        // do not load it twice
        if (typeof twttr === 'undefined') {
            /* START: Twitter provided code */
            !function (d, s, id) {
                var js, fjs = d.getElementsByTagName(s)[0];
                if (!d.getElementById(id)) {
                    js = d.createElement(s);
                    js.id = id;
                    js.src = "//platform.twitter.com/widgets.js";
                    fjs.parentNode.insertBefore(js, fjs);
                }
            }(document, "script", "twitter-wjs");
            /* END: Twitter provided code */
        }


        // Hack to handle blank iframe, just reload the current widget every time this one is moved
        function twitterWidgetReloadHack() {
            $scope.widget.load("", function () {
                twttr.widgets.load();
            });
        }

        $scope.widget.getjQueryWidget().on("moveSucceeded", twitterWidgetReloadHack);
        $scope.widget.getjQueryWidget().on("moveFailed", twitterWidgetReloadHack);
        $scope.widget.getjQueryWidget().on("moveCanceled", twitterWidgetReloadHack);


        if (!(typeof twttr === 'undefined')) {
            twttr.widgets.load();
        }
    }
}]);

twitterWidget.controller('twitter-edit-ctrl', ['$scope', function($scope) {
    $scope.widget = {};
    $scope.twitter = {};

    $scope.init = function(widgetId){
        $scope.twitter = scope[widgetId].twitter;
        $scope.widget = portal.getCurrentWidget(widgetId);
        angular.element('[data-toggle="tooltip"]').tooltip({
            container: "body"
        });
    };

    $scope.update = function(){
        $scope.widget.performUpdate($("#"+ $scope.widget._id + " form").serializeArray(), function (data) {
            $scope.widget.load();
        });
    };

    $scope.cancel = function(){
        $scope.widget.load();
    };
}]);
