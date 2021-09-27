<%-- 
    Document   : index
    Created on : Sep 20, 2021, 2:04:14 PM
    Author     : Minh Khoa
--%>
<%@page import="java.util.List"%>
<%@page import="com.group5.event.EventDTO"%>
<%@page import="com.group5.event.EventDTO"%>
<%@page import="google.user.UserGoogleDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            UserGoogleDTO loginUser = (UserGoogleDTO) session.getAttribute("LOGIN_USER");
            List<EventDTO> list = (List<EventDTO>) request.getAttribute("LIST_EVENT_USERS");
        %>
        <h1>Hello User: <%=loginUser.getName()%></h1>
        <h3>ID: <%=loginUser.getId()%></h3>
        <h3>Email: <%=loginUser.getEmail()%></h3>
        <img src="<%=loginUser.getPicture()%>" alt="alternatetext">
        <%
            String search = request.getParameter("search");
            if (search == null) {
                search = "";
            }
        %>
        <form action="MainController">
            Search <input type="text" name="search" value="<%=search%>"/>
            <button type="submit" value="search" name="action">Search</button>
        </form></br>
        <%
            list = (List<EventDTO>) session.getAttribute("LIST_EVENT_USERS");
            if (list != null) {
                if (!list.isEmpty()) 

        %>
                <%                    
                    for (EventDTO event : list) {
                %>
            <form action="MainController">
                
                    <h1><%= event.getEventName()%></h1>
                    <h1><%= event.getEventDetail()%></h1>
                    <h1><img src="<%= event.getImage() %>" alt="<%= event.getEventName()%>" width="130" height="120"></h1>
                    <!--<td><%= event.getVideo()%></td>-->
                    
            </form>
            <%
                }
            %>
    <%  
        }
    %>
    </body>
</html>
