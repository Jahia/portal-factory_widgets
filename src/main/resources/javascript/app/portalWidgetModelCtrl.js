Jahia = Jahia || [];
Jahia.Portal = Jahia.Portal || [];

Jahia.Portal.WidgetModelCtrl = function (widgetIdentifier) {
    var instance = this;
    this.widget = {};
    this.$widget = {};

    $(document).ready(function(){
        instance.init("w" + widgetIdentifier);
    });
};

Jahia.Portal.WidgetModelCtrl.prototype = {
    init: function (widgetId) {
        var instance = this;
        instance.widget = portal.getCurrentWidget(widgetId);
        instance.$widget = instance.widget.getjQueryWidget();

        instance.formSubmitListener();
    },

    formSubmitListener: function() {
        var instance = this;

        instance.$widget.find(".widgetModelForm .submit").on("click", function(e){
            JCRRestUtils.standardCall(JCRRestUtils.buildURL("","","",instance.widget._jcrIdentifier), "PUT",
                JSON.stringify({properties: JCRRestUtils.arrayToDataProperties(instance.$widget.find(".widgetModelForm").serializeArray(), true)}),
                function (data) {
                    instance.widget.load("portal.model", function(){
                        $(".model-saved-message").show();
                    });
                });
            return false;
        });

        instance.$widget.find(".widgetModelForm .cancel").on("click", function (e) {
            instance.widget.load("portal.view");
            return false;
        });
    }
};


