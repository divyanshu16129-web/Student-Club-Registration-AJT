<%@ include file="header.jsp" %>
    <h1>System Message</h1>
    <div class="card">
        <% 
            String msg = (String) request.getAttribute("message");
            String type = (String) request.getAttribute("type");
            if (msg != null) {
                if ("error".equals(type)) {
                    out.print("<div class='alert alert-error'>" + msg + "</div>");
                } else {
                    out.print("<div class='alert'>" + msg + "</div>");
                }
            } else {
                out.print("<div class='alert alert-error'>No message provided.</div>");
            }
        %>
        <br><br>
        <a href="index.jsp" class="btn" style="text-decoration: none;">Back to Dashboard</a>
    </div>
<%@ include file="footer.jsp" %>