<%@page import="com.hellosign.sdk.HelloSignException"%>
<%@page import="com.hellosign.sdk.resource.support.OauthData"%>
<%@page import="com.hellosign.sdk.HelloSignClient"%>
<%@page import="java.util.Properties"%>
<%
	String code = request.getParameter("code");
	if (code != null) {
		// Load authentication properties
		String apiKey = System.getProperty("hellosign.api.key");
		String clientId = System.getProperty("hellosign.client.id");
		String clientSecret = System.getProperty("hellosign.client.secret");

		try {

			// Instantiate a client
			HelloSignClient client = new HelloSignClient(apiKey);

			// Using the code sent by HelloSign, ask for an access token
			OauthData data = client.getOauthData(code, clientId, clientSecret, "demo", false);

			// Store the token to the user's session
			session.setAttribute("hellosign_oauth", data);

		} catch (HelloSignException ex) {
			out.write(ex.getMessage());
		}
	}
%>
<html>
    <head>
        <title>OAuth Callback Demo | HelloSign</title>
    </head>
    <body>
        <script type='text/javascript'>
            setTimeout(window.close, 5000);
        </script>
    </body>
</html>
