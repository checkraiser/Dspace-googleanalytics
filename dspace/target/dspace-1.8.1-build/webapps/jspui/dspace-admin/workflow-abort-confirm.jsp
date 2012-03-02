<%--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

--%>
<%--
  - Confirm abort of a workflow
  -
  - Attributes:
  -    workflow   - WorkflowItem representing the workflow in question
  --%>

<%@ page contentType="text/html;charset=UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"
    prefix="fmt" %>

<%@ page import="org.dspace.app.webui.servlet.admin.WorkflowAbortServlet" %>
<%@ page import="org.dspace.workflow.WorkflowItem" %>
<%@ page import="org.dspace.workflow.WorkflowManager" %>

<%@ taglib uri="http://www.dspace.org/dspace-tags.tld" prefix="dspace" %>

<%
    WorkflowItem workflow = (WorkflowItem) request.getAttribute("workflow");
    request.setAttribute("LanguageSwitch", "hide");
%>

<dspace:layout titlekey="jsp.dspace-admin.workflow-abort-confirm.title"
               navbar="admin"
               locbar="link"
               parenttitlekey="jsp.administer"
               parentlink="/dspace-admin">

    <%-- <h1>Delete Workflow: <%= workflow.getID() %></h1> --%>
    
<h1><fmt:message key="jsp.dspace-admin.workflow-abort-confirm.heading">
    <fmt:param><%= workflow.getID() %></fmt:param>
</fmt:message></h1>   
    <%-- <p>Are you sure you want to abort this workflow?  It will return to the user's personal workspace</p> --%>
    <p><fmt:message key="jsp.dspace-admin.workflow-abort-confirm.warning"/></p>
    <ul>
        <%-- <li>Collection: <%= workflow.getCollection().getMetadata("name") %></li> --%>
        <li><fmt:message key="jsp.dspace-admin.workflow-abort-confirm.collection">
            <fmt:param><%= workflow.getCollection().getMetadata("name") %></fmt:param>
        </fmt:message></li>
        <%-- <li>Submitter: <%= WorkflowManager.getSubmitterName(workflow) %></li> --%>
        <li><fmt:message key="jsp.dspace-admin.workflow-abort-confirm.submitter">
            <fmt:param><%= WorkflowManager.getSubmitterName(workflow) %></fmt:param>
        </fmt:message></li>
        <%-- <li>Title: <%= WorkflowManager.getItemTitle(workflow) %></li> --%>
        <li><fmt:message key="jsp.dspace-admin.workflow-abort-confirm.item-title">
            <fmt:param><%= WorkflowManager.getItemTitle(workflow) %></fmt:param>
        </fmt:message></li>
    </ul>
    <form method="post" action="">
        <input type="hidden" name="workflow_id" value="<%= workflow.getID() %>"/> 
        <center>
            <table width="70%">
                <tr>
                    <td align="left">
                        <%-- <input type="submit" name="submit_abort_confirm" value="Abort"/> --%>
                        <input type="submit" name="submit_abort_confirm" value="<fmt:message key="jsp.dspace-admin.workflow-abort-confirm.button"/>" />
                    </td>
                    <td align="right">
                        <%-- <input type="submit" name="submit_cancel" value="Cancel"/> --%>
                        <input type="submit" name="submit_cancel" value="<fmt:message key="jsp.dspace-admin.general.cancel"/>" />
                    </td>
                </tr>
            </table>
        </center>
    </form>
</dspace:layout>

