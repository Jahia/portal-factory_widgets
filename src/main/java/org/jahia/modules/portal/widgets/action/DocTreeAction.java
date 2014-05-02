package org.jahia.modules.portal.widgets.action;

import org.jahia.bin.Action;
import org.jahia.bin.ActionResult;
import org.jahia.services.content.JCRContentUtils;
import org.jahia.services.content.JCRNodeIteratorWrapper;
import org.jahia.services.content.JCRNodeWrapper;
import org.jahia.services.content.JCRSessionWrapper;
import org.jahia.services.render.RenderContext;
import org.jahia.services.render.Resource;
import org.jahia.services.render.URLResolver;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.jcr.PathNotFoundException;
import javax.jcr.RepositoryException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

/**
 * Created by kevan on 31/01/14.
 */
public class DocTreeAction extends Action{
	private static Logger logger = LoggerFactory.getLogger(DocTreeAction.class);

	@Override
	public ActionResult doExecute(HttpServletRequest req, RenderContext renderContext, Resource resource, JCRSessionWrapper session, Map<String, List<String>> parameters, URLResolver urlResolver) throws Exception {
		String path = "";
		if (parameters.containsKey("path")) {
			path = parameters.get("path").get(0);
            return new ActionResult(HttpServletResponse.SC_OK, null, buildTree(session.getNode(path), true));
		}else {
            return new ActionResult(HttpServletResponse.SC_OK, null, buildRoot(session));
        }
	}

    private JSONObject buildRoot(JCRSessionWrapper sessionWrapper) throws JSONException, RepositoryException {
        JSONObject item = new JSONObject();
        item.put("title", "/");
        item.put("nodeType", "/");
        item.put("url", "");
        item.put("path", "/");

        JSONArray itemChilds = new JSONArray();
        itemChilds.put(buildTree(sessionWrapper.getNode("/sites"), false));
        itemChilds.put(buildTree(sessionWrapper.getNode("/mounts"), false));
        item.put("childs", itemChilds);
        return item;
    }

	private JSONObject buildTree(JCRNodeWrapper node, boolean recursive) throws JSONException, RepositoryException {
		JSONObject item = new JSONObject();
		item.put("title", node.getDisplayableName());
		item.put("nodeType", node.getPrimaryNodeTypeName());
		item.put("url", node.getUrl());
		item.put("path", node.getPath());

		JSONArray itemChilds = new JSONArray();
        if(recursive){
            JCRNodeIteratorWrapper childs = node.getNodes();
            while (childs.hasNext()){
                JCRNodeWrapper child = (JCRNodeWrapper) childs.next();
                if((child.isNodeType("jnt:virtualsite") && !child.getName().equals("systemsite")) || child.isNodeType("jnt:folder") || child.isNodeType("jnt:file")){
                    itemChilds.put(buildTree(child, false));
                }
            }
        }
		item.put("childs", itemChilds);
		return item;
	}
}
