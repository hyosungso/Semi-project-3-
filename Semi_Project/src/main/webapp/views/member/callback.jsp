<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String clientId = "FutmSJFgSoacokH2aZwQ";
    String clientSecret = "EFlrfDUSeQ";
    String code = request.getParameter("code");
    String state = request.getParameter("state");
    String redirectURI = URLEncoder.encode("http://localhost:8888/HealthLife/views/member/callback.jsp", "UTF-8");
    String apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code"
            + "&client_id=" + clientId
            + "&client_secret=" + clientSecret
            + "&redirect_uri=" + redirectURI
            + "&code=" + code
            + "&state=" + state;

    String accessToken = "";
    String refreshToken = "";

    try {
        URL url = new URL(apiURL);
        HttpURLConnection con = (HttpURLConnection) url.openConnection();
        con.setRequestMethod("GET");
        int responseCode = con.getResponseCode();
        BufferedReader br;
        if (responseCode == 200) {
            br = new BufferedReader(new InputStreamReader(con.getInputStream()));
        } else {
            br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
        }

        String inputLine;
        StringBuilder res = new StringBuilder();
        while ((inputLine = br.readLine()) != null) {
            res.append(inputLine);
        }
        br.close();

        if (responseCode == 200) {
            // 응답 데이터에서 액세스 토큰과 리프레시 토큰 추출
            String[] tokens = res.toString().split("&");
            for (String token : tokens) {
                if (token.startsWith("access_token=")) {
                    accessToken = token.substring("access_token=".length());
                } else if (token.startsWith("refresh_token=")) {
                    refreshToken = token.substring("refresh_token=".length());
                }
            }

            // 추출한 토큰 정보를 세션에 저장
            session.setAttribute("accessToken", accessToken);
            session.setAttribute("refreshToken", refreshToken);

            // 필요한 경우 백엔드로 전송하여 인증된 요청 수행
            // ...

            // 사용자를 적절한 페이지로 리다이렉트
            response.sendRedirect("http://localhost:8888/HealthLife/views/common/menubar.jsp");
        }
    } catch (Exception e) {
        // 예외 처리
        e.printStackTrace();
    }
%>