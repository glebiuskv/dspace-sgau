<%--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

--%>
<%--
  - Profile editing page
  -
  - Attributes to pass in:
  -
  -   eperson          - the EPerson who's editing their profile
  -   missing.fields   - if a Boolean true, the user hasn't entered enough
  -                      information on the form during a previous attempt
  -   password.problem - if a Boolean true, there's a problem with password
  --%>

<%@ page contentType="text/html;charset=UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"
           prefix="fmt" %>


<%@ taglib uri="http://www.dspace.org/dspace-tags.tld" prefix="dspace" %>

<%@ page import="javax.servlet.jsp.jstl.fmt.LocaleSupport" %>

<%@ page import="org.dspace.eperson.EPerson, org.dspace.core.ConfigurationManager" %>
<%@ page import="org.dspace.core.Utils" %>
<%@ page import="org.dspace.storage.rdbms.TableRowIterator" %>
<%@ page import="org.dspace.storage.rdbms.TableRow" %>
<%@ page import="java.text.DateFormat "%>
<%@ page import="java.text.ParseException" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>

<%

Integer colVisits  = (Integer) request.getAttribute("colVisitsRow");
Integer comVisits  = (Integer) request.getAttribute("comVisitsRow");
Integer userLogins  = (Integer) request.getAttribute("userLoginsRow");
Integer itemsOverall  = (Integer) request.getAttribute("itemsOverall");
Integer itemVisits  = (Integer) request.getAttribute("itemVisits");
Integer searchesDone  = (Integer) request.getAttribute("searchesDone");
Integer itemsUploaded  = (Integer) request.getAttribute("itemsUploaded");
String error = (String) request.getAttribute("error");

String dates = (String) request.getAttribute("dates");
if(error != null){
%>
    <b><%=error%></b>
    <br>
    <br>
<%
}

Date startDate = new Date(2016, 3, 1);
Date endDate = new Date();
int m1 = startDate.getMonth();
int m2 = endDate.getMonth();
int months = m2 - m1 + 1;
for(int i = 0; i < months; i++){
 if(i == 0){ %>
<a href="/reports?dateStart=2016-04-01&dateEnd=2016-04-30">Апрель 2016</a> 
<% } %>
<% if(i == 1){ %>
<a href="/reports?dateStart=2016-05-01&dateEnd=2016-05-30">Май 2016</a> 
<% } %>
<% if(i == 2){ %>
<a href="/reports?dateStart=2016-06-01&dateEnd=2016-06-30">Июнь 2016</a> 
<% } %>
<% if(i == 3){ %>
<a href="/reports?dateStart=2016-07-01&dateEnd=2016-07-30">Июль 2016</a> 
<% } %>
<% if(i == 4){ %>
<a href="/reports?dateStart=2016-08-01&dateEnd=2016-08-30">Август 2016</a> 
<% } %>
<% if(i == 5){ %>
<a href="/reports?dateStart=2016-09-01&dateEnd=2016-09-30">Сентябрь 2016</a> 
<% } %>
<% if(i == 6){ %>
<a href="/reports?dateStart=2016-10-01&dateEnd=2016-10-30">Октябрь 2016</a> 
<% } %>
<% if(i == 7){ %>
<a href="/reports?dateStart=2016-11-01&dateEnd=2016-11-30">Ноябрь 2016</a> 
<% } %>
<% if(i == 8){ %>
<a href="/reports?dateStart=2016-12-01&dateEnd=2016-12-30">Декабрь 2016</a> 
<% } %>
<% if(i != months - 1){ %>
- 
<% } %>
<% }
%> <br><br>

<style type="text/css">body { font-family: Arial, Helvetica, sans-serif }.reportTitle { width: 100%; clear: both; text-align: center; font-weight: bold; font-size: 200%;  }.reportTitleSmall { width: 100%; clear: both; text-align: center; font-weight: bold; font-size: 150%;  }.reportSection { width: 100%; clear: both; font-weight: bold; font-size: 160%; margin: 10px; text-align: center; margin-top: 30px; }.reportBlock { border: 1px solid #000000; margin: 10px; }.reportOddRow { background: #dddddd; }.reportEvenRow { background: #bbbbbb; }.reportExplanation { font-style: italic; text-align: center; }.reportDate { font-style: italic; text-align: center; font-size: 120% }.reportFloor { text-align: center; }.rightAlign { text-align: right; }.reportNavigation { text-align: center; }</style><div class="reportTitle"><a name="top">Статистика</a></div><br>
<div class="reportTitleSmall"><a name="top">Общий обзор</a></div><br>
<% if(dates != null){
%>
    <div align="center"><%=dates%></div>
    <br>
    <br>
<%
} else {
%>
<div align="center"><b>Отчет за все время</b></div>
    <br>
    <br>
<% } %>
<form action="/reports" method="post" name="edit_metadata" id="edit_metadata" onkeydown="return disableEnterKey(event);">
<table>
  <tr><td>
    C: <input class="form-control" id="dateMask1" type="text" name="dateStart" readonly="true" placeholder="Дата начала" size="23" value=""/>
</td></tr>
  <tr><td>
    По: <input class="form-control" id="dateMask2" type="text" name="dateEnd" readonly="true" placeholder="Дата окончания" size="23" value=""/>
  </td></tr>
    <tr><td><input  id="send_dates"  type="submit" name="submit" value="Отчет"></td></tr></table>
  </form>

<dspace:layout navbar="admin"  style="submission" titlekey="jsp.register.edit-profile.title" nocache="true">
<table align="center" class="reportBlock" cellpadding="5">
<tr class="reportEvenRow">    <td>      Коллекций просмотрено   </td>   <td class="rightAlign">     <%= colVisits %>    </td> </tr>
<tr class="reportOddRow">   <td>      Разделов просмотрено    </td>   <td class="rightAlign">     <%= comVisits %>    </td> </tr>
<tr class="reportEvenRow">    <td>      Количество аутентификаций пользователей   </td>   <td class="rightAlign">     <%= userLogins %>   </td> </tr>
<tr class="reportOddRow">   <td>      Ресурсов просмотрено    </td>   <td class="rightAlign">     <%= itemVisits %>   </td> </tr>
<tr class="reportEvenRow">    <td>      Ресурсов загружено    </td>   <td class="rightAlign">     <%= itemsUploaded %>    </td> </tr>
<tr class="reportOddRow">   <td>      Выполнено поисков   </td>   <td class="rightAlign">     <%= searchesDone %>   </td> </tr>
</table>

<br>
<br>
<div class="reportTitle"><a name="top">Информация о архиве</a></div><br>
<div align="center"><b>Отчет на текущий момент времени</b></div><br>
<table align="center" class="reportBlock" cellpadding="5">
<tr class="reportOddRow">   <td>      Ресурсов всего    </td>   <td class="rightAlign">     <%= itemsOverall %>   </td> </tr>
</table>

<br><a href="<%= request.getContextPath() %>/statistics">Другие отчеты</a>


</dspace:layout>