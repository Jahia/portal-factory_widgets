package org.jahia.modules.portal.widgets.tags;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.util.Map;

/**
 * Created by kevan on 10/06/14.
 */
@Component
public class WidgetFunctions {
    private static Map<String, String> widgetsProperties;

    @Value("#{portalFactoryWidgetsProperties}")
    public void setWidgetsProperties(Map<String, String> widgetsProperties) {
        WidgetFunctions.widgetsProperties = widgetsProperties;
    }

    public static String getWidgetProperty(String key){
        return widgetsProperties != null ? widgetsProperties.get(key) : null;
    }
}
