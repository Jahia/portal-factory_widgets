Jahia = Jahia || [];
Jahia.Portal = Jahia.Portal || [];

Jahia.Portal.AdvancedWidgetWrapper = function (widgetIdentifier, editable, haveFullView) {
    var instance = this;
    this._minimize = true;
    this.widgetIdentifier = widgetIdentifier;
    this.widget = {};
    this.$widget = {};
    this.editable = editable;
    this.haveFullView = haveFullView;


    $(document).ready(function(){
        instance.init("w" + widgetIdentifier);
    });
};

Jahia.Portal.AdvancedWidgetWrapper.prototype = {
    init: function (widgetId) {
        var instance = this;
        instance.widget = portal.getCurrentWidget(widgetId);
        instance.$widget = instance.widget.getjQueryWidget();
        if(instance.editable){
            instance.switchEditViewListener();
            instance.deleteListener();
        }
        if(instance.widget._portal.fullTemplate){
            instance.switchFullStateListener();
        }
        instance.minimizeListener();
    },

    switchEditViewListener: function() {
        var instance = this;
        instance.$widget.find(".edit_switch").on("click", function(){
            if (instance.widget._currentView != "portal.edit") {
                instance.widget.load("portal.edit");
            } else {
                instance.widget.load();
            }
        });
    },

    switchFullStateListener: function() {
        var instance = this;
        var resizeSwitch = instance.$widget.find(".resize_switch");

        if(instance.widget._state == "full"){
            resizeSwitch.addClass("icon-resize-small");
        }else {
            resizeSwitch.addClass("icon-resize-full");
        }

        resizeSwitch.on("click", function(){
            if(instance.widget._state != "full"){
                portal.loadInCurrentTab(instance.widget._jcrIdentifier, instance.haveFullView ? "portal.full" : "portal.view", "full", true, instance.widget._portal.fullTemplate);
            }else {
                portal.loadInCurrentTab();
            }
        });
    },

    deleteListener: function () {
        var instance = this;
        instance.$widget.find(".delete_action").on("click", function(){
            portal.deleteWidget(instance.widget);
        });
    },

    minimizeListener: function () {
        var instance = this;
        instance.$widget.find(".minimize_action").on("click", function(){
            instance._minimize = !instance._minimize;
            if(instance._minimize){
                $(this).removeClass("icon-minus");
                $(this).addClass("icon-plus");
            }else {
                $(this).removeClass("icon-plus");
                $(this).addClass("icon-minus");
            }
            instance.$widget.find(".widget-content").toggle();
        });
    }
};


