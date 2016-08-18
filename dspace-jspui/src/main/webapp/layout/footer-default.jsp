<%--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

--%>
<%--
  - Footer for home page
  --%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page contentType="text/html;charset=UTF-8" %>

<%@ page import="java.net.URLEncoder" %>
<%@ page import="org.dspace.app.webui.util.UIUtil" %>

<%
    String sidebar = (String) request.getAttribute("dspace.layout.sidebar");
%>

            <%-- Right-hand side bar if appropriate --%>
<%
    if (sidebar != null)
    {
%>
	</div>
	<div class="col-md-3">
                    <%= sidebar %>
    </div>
    </div>       
<%
    }
%>
</div>
</main>
            <%-- Page footer --%>
             <footer class="navbar navbar-inverse navbar-bottom">
<div id="designedby" class="container text-muted">
                <img class="footer-logo" src="/image/logo_goriz_rus_eng_224.svg" alt=""/>
                <div class="copy">
                   <span>Самарский университет &copy; 2016 </span>
                   <a href="http://www.ssau.ru">www.ssau.ru</a>
                   | <a href="mailto:ssau@ssau.ru">ssau@ssau.ru</a>
                   | <a target="_blank" href="/jspui//feedback">Обратная связь</a>
                </div>

			<!--<div id="footer_feedback" class="pull-right">                                    -->
                                <!--<p class="text-muted"><a href="http://ssau.ru/">Самарский университет</a> © 2016&nbsp;- -->
                                <!--<a target="_blank" href="/jspui/feedback">Обратная связь </a>-->
                                <!--<a href="htmlmap.html"></a></p>-->
          <!--</div>-->

			</div>
    </footer>
    </body>
</html>
