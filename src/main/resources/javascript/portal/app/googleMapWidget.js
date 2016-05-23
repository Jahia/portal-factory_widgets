
var googleMapWidget = angular.module('googleMapWidgetApp', []);

function mapApiLoaded(){
    window.map_api_loaded = true;
}

googleMapWidget.controller('google-map-view-ctrl', ['$scope', function($scope) {
    $scope.widget = [];

    $scope.init = function (widgetId, canvasId, mapKey, lat, lng) {
        $scope.widget = portal.getCurrentWidget(widgetId);

        // Do not load the scripts twice
        $(document).ready(function(){

            // Hack to be able to load only one time the google map API
            (function wait() {
                if ((typeof window.map_api_loaded !== 'undefined') && window.map_api_loaded) {
                    new google.maps.Map(document.getElementById(canvasId), {
                        zoom: 8,
                        center: new google.maps.LatLng(lat, lng)
                    });
                } else {
                    if((typeof window.map_api_loading === 'undefined')){
                        var scriptUrl = "http://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false";
                        if(mapKey){
                            scriptUrl += "&key=" + mapKey
                        }
                        scriptUrl += "&callback=mapApiLoaded"
                        $.getScript(scriptUrl);
                    }
                    window.map_api_loading = true;
                    setTimeout( wait, 1000 );
                }
            })();

        });

    }
}]);

googleMapWidget.controller('google-map-edit-ctrl', ['$scope', function($scope) {
    $scope.widget = {};
    $scope.map = {};

    $scope.init = function(widgetId){
        $scope.map = scope[widgetId].map;
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