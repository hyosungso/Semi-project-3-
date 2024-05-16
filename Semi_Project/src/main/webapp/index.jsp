<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HEALTHLIFE</title>
</head>
<body>
	<%@ include file="/views/common/menubar.jsp" %>

	
    <div>
    

            
            <table border="1" align="center">
                <tr id="pic" >
                    <td>
                        <img width=420 height=600
                        src="https://qi-o.qoo10cdn.com/goods_image_big/8/7/8/6/8531128786_l.jpg">
                    </td>
                    <td>
                        <img width=420 height=600
                        src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0zL2gkxeYEnH4GWjkF7CFmtGONvlTywmNyg&usqp=CAU">
                        
                    </td>
                    <td>
                        <img width=420 height=600
                        src="https://i.namu.wiki/i/Bd2ylwd4Lho5SqGM6XyAmwoyJtEnspKNAVDP1jd7EmViHckUSNcEm4JMyuePE56jP98WASRF8wDpg58l6tB0vQ.webp">
                    </td>
                </tr>
                
            </table>
            
            
        </div>

        <br><br>
        


        <div align="center">
            <!-- 바디 게시판-->
            <div class="bodyboard">
                <table border="1">
                    <tr align="center">
                        <td width="600">정보게시판</td>
                        <td width="600">자유게시판</td>
                    </tr>

                    <tr align="center">
                        <td height="400">인기있는 글 </td>
                        <td height="400">인기있는 글 </td>
                    </tr>
                </table>

            </div>
    
    
        </div>

    </body>





	<script>
    
    const staticImg= "<%=contextPath%>/resources/icons/icons-cart-static.png"
    const gifImg= "<%=contextPath%>/resources/icons/icons-cart.gif" 
    
    const image = document.querySelector('.image');

    image.src = staticImg;

    image.addEventListener("mouseenter", function() {
      image.src = gifImg;
    });
    image.addEventListener("mouseleave", function() {
      image.src = staticImg;
    });
    
    const staticImg2= "<%=contextPath%>/resources/icons/img.icons-normal.png"
        const gifImg2= "<%=contextPath%>/resources/icons/img.icons-hover.gif" 
        
        const image2 = document.querySelector('.image2');

        image2.src = staticImg2;

        image2.addEventListener("mouseenter", function() {
          image2.src = gifImg2;
        });
        image2.addEventListener("mouseleave", function() {
          image2.src = staticImg2;
        });
    
    </script>
	
	
	
</body>
</html>