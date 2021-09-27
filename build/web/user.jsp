<%-- 
    Document   : user
    Created on : Sep 27, 2021, 2:59:29 PM
    Author     : DELL
--%>

<%@page import="java.util.List"%>
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
            String search = request.getParameter("search");
            if (search == null) {
                search = "";
            }
        %>
        <form action="MainController">
            Search Car<input type="text" name="search" value="<%= search%>"/>
            <button type="submit" value="search" name="action">Search</button>
        </form></br>
        <%
            List<EventDTO> list = (List<EventDTO>) session.getAttribute("LIST_EVENT_USERS");
            if (list != null) {
                if (!list.isEmpty())

        %>
                <%                    for (EventDTO event : list) {
                %>
            <form action="MainController">
                        <img src="<%= event.getImage()%>" alt="<%= event.getEventName()%>" width="130" height="120">
                    <h1><%= event.getEventName()%></h1>
                    <h1><%= event.getEventDetail()%></h1>
                    <h1><%= event.getStartTime()%></h1>
                    <h1><%= event.getEndTime()%></h1>
                    <h1><%= event.getImage()%></h1>
                <video width="320" height="240" controls>
                    <source src="<%= event.getVideo()%>">
                </video> 
            </form>
            <%
                }
            %>
        </tbody>
    </table>
    <%
        }
    %>
</body>
</html>
