var googleFeedWidget = angular.module('googleFeedWidgetApp', []);


googleFeedWidget.controller('google-feed-view-ctrl', ['$scope', function($scope) {
    $scope.feedId = "";
    $scope.url = "";
    $scope.nbEntries = 10;

    $scope.init = function (feedId) {
        $scope.feedId = feedId;

        function initFeed(){
            if($scope.url){
                var feedControl = new google.feeds.FeedControl();
                feedControl.addFeed($scope.url);
                feedControl.setNumEntries($scope.nbEntries);
                feedControl.draw($("#" + $scope.feedId).find(".feeds").get(0));
            }
        }

        // Do not load the scripts twice
        if((typeof google === 'undefined') || (typeof google.feeds === 'undefined')){
            $.getScript("https://www.google.com/jsapi").done(function () {
                google.load("feeds", "1", {'callback': initFeed});
            });
        }else {
            initFeed();
        }

    };
}]);

googleFeedWidget.controller('google-feed-edit-ctrl', ['$scope', function($scope) {
    $scope.widget = {};
    $scope.feed = {};

    $scope.init = function(widgetId){
        $scope.widget = portal.getCurrentWidget(widgetId);
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
