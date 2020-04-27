<%@ page import="com.util.Const" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<doctype html!>
<html>
	<head>
		<title>Gallery</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="keywords" content="Play-Offs Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
		<script type="application/x-javascript"> addEventListener("load", function() {setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
		<meta charset utf="8">
		<!--fonts-->
		
        
		<!--fonts-->
		<!--link css-->
		<link rel="stylesheet" type="text/css" href="<%=Const.ROOT%>css/normalize.css" />
		<link rel="stylesheet" type="text/css" href="<%=Const.ROOT%>css/demo.css" />
		<!--bootstrap-->
			<link href="<%=Const.ROOT%>css/bootstrap.min.css" rel="stylesheet" type="text/css">
		<!--coustom css-->
			<link href="<%=Const.ROOT%>css/style.css" rel="stylesheet" type="text/css"/>
		<!--default-js-->
			<script src="<%=Const.ROOT%>js/jquery-2.1.4.min.js"></script>
		<!--bootstrap-js-->
			<script src="<%=Const.ROOT%>js/bootstrap.min.js"></script>
		<!--script-->
        <script src="<%=Const.ROOT%>js/jquery.circlechart.js"></script>
	</head>
    <body>
     <!--header-->
     <%@include file="/top.jsp"%>
    <!--header nav-->
        <div class="gallery">
            <div class="container">
                <h3>图片展示</h3>
                <div class="gallery-grids">
                    <div class="col-md-4 work-grid">
                        <div id="nivo-lightbox-demo">			
                            <a  href="images/g1.jpg" data-lightbox-gallery="gallery1" id="nivo-lightbox-demo">			   
                                <img src="images/g1.jpg" class="img-responsive" alt=""/>
                                <div class="rotate">
                                    <span class="glyphicon glyphicon-search gl-icn" aria-hidden="true"></span>	
                                </div>				
                             </a> 
                        </div>
                    </div>			
                    <div class="col-md-4 work-grid">
                        <div id="nivo-lightbox-demo">			
                            <a  href="images/g2.jpg" data-lightbox-gallery="gallery1" id="nivo-lightbox-demo">			   
                                <img src="images/g2.jpg" class="img-responsive" alt=""/>
                                <div class="rotate">
                                    <span class="glyphicon glyphicon-search gl-icn" aria-hidden="true"></span>	
                                </div>				
                             </a> 
                        </div>
                    </div>
                    <div class="col-md-4 work-grid">	
                        <div id="nivo-lightbox-demo">			
                            <a  href="images/g3.jpg" data-lightbox-gallery="gallery1" id="nivo-lightbox-demo">			   
                                <img src="images/g3.jpg" class="img-responsive " alt=""/>
                                <div class="rotate">
                                    <span class="glyphicon glyphicon-search gl-icn" aria-hidden="true"></span>	
                                </div>				
                             </a> 
                        </div>	
                    </div>	
                    <div class="col-md-4 work-grid">
                        <div id="nivo-lightbox-demo">			
                            <a  href="images/g4.jpg" data-lightbox-gallery="gallery1" id="nivo-lightbox-demo">			   
                                <img src="images/g4.jpg" class="img-responsive " alt=""/>
                                <div class="rotate">
                                    <span class="glyphicon glyphicon-search gl-icn" aria-hidden="true"></span>	
                                </div>				
                             </a> 
                        </div>
                    </div>	
                    <div class="col-md-4 work-grid">
                        <div id="nivo-lightbox-demo">			
                            <a  href="images/g5.jpg" data-lightbox-gallery="gallery1" id="nivo-lightbox-demo">			   
                                <img src="images/g5.jpg" class="img-responsive " alt=""/>
                                <div class="rotate">
                                    <span class="glyphicon glyphicon-search gl-icn" aria-hidden="true"></span>	
                                </div>				
                             </a> 
                        </div>
                    </div>	
                    <div class="col-md-4 work-grid">
                        <div id="nivo-lightbox-demo">			
                            <a  href="images/g6.jpg" data-lightbox-gallery="gallery1" id="nivo-lightbox-demo">			   
                                <img src="images/g6.jpg" class="img-responsive " alt=""/>
                                <div class="rotate">
                                    <span class="glyphicon glyphicon-search gl-icn" aria-hidden="true"></span>	
                                </div>				
                             </a> 
                        </div>
                    </div>
                    <div class="col-md-4 work-grid">
                        <div id="nivo-lightbox-demo">			
                            <a  href="images/g7.jpg" data-lightbox-gallery="gallery1" id="nivo-lightbox-demo">			   
                                <img src="images/g7.jpg" class="img-responsive " alt=""/>
                                <div class="rotate">
                                    <span class="glyphicon glyphicon-search gl-icn" aria-hidden="true"></span>	
                                </div>				
                             </a> 
                        </div>
                    </div>			
                    <div class="col-md-4 work-grid">
                        <div id="nivo-lightbox-demo">			
                            <a  href="images/g8.jpg" data-lightbox-gallery="gallery1" id="nivo-lightbox-demo">			   
                                <img src="images/g8.jpg" class="img-responsive " alt=""/>
                                <div class="rotate">
                                    <span class="glyphicon glyphicon-search gl-icn" aria-hidden="true"></span>	
                                </div>				
                             </a> 
                        </div>
                    </div>
                    <div class="col-md-4 work-grid">	
                        <div id="nivo-lightbox-demo">			
                            <a  href="images/g10.jpg" data-lightbox-gallery="gallery1" id="nivo-lightbox-demo">			   
                                <img src="images/g10.jpg" class="img-responsive " alt=""/>
                                <div class="rotate">
                                    <span class="glyphicon glyphicon-search gl-icn" aria-hidden="true"></span>	
                                </div>				
                             </a> 
                        </div>	
                    </div>	
                    <div class="col-md-4 work-grid">
                        <div id="nivo-lightbox-demo">			
                            <a  href="images/g17.jpg" data-lightbox-gallery="gallery1" id="nivo-lightbox-demo">			   
                                <img src="images/g17.jpg" class="img-responsive " alt=""/>
                                <div class="rotate">
                                    <span class="glyphicon glyphicon-search gl-icn" aria-hidden="true"></span>	
                                </div>				
                             </a> 
                        </div>
                    </div>	
                    <div class="col-md-4 work-grid">
                        <div id="nivo-lightbox-demo">			
                            <a  href="images/g11.jpg" data-lightbox-gallery="gallery1" id="nivo-lightbox-demo">			   
                                <img src="images/g11.jpg" class="img-responsive " alt=""/>
                                <div class="rotate">
                                    <span class="glyphicon glyphicon-search gl-icn" aria-hidden="true"></span>	
                                </div>				
                             </a> 
                        </div>
                    </div>	
                    <div class="col-md-4 work-grid">
                        <div id="nivo-lightbox-demo">			
                            <a  href="images/g12.jpg" data-lightbox-gallery="gallery1" id="nivo-lightbox-demo">			   
                                <img src="images/g12.jpg" class="img-responsive " alt=""/>
                                <div class="rotate">
                                    <span class="glyphicon glyphicon-search gl-icn" aria-hidden="true"></span>	
                                </div>				
                             </a> 
                        </div>
                    </div>
                    <div class="col-md-4 work-grid">
                        <div id="nivo-lightbox-demo">			
                            <a  href="images/g116.jpg" data-lightbox-gallery="gallery1" id="nivo-lightbox-demo">			   
                                <img src="images/g116.jpg" class="img-responsive " alt=""/>
                                <div class="rotate">
                                    <span class="glyphicon glyphicon-search gl-icn" aria-hidden="true"></span>	
                                </div>				
                             </a> 
                        </div>
                    </div>	
                    <div class="col-md-4 work-grid">
                        <div id="nivo-lightbox-demo">			
                            <a  href="images/g14.jpg" data-lightbox-gallery="gallery1" id="nivo-lightbox-demo">			   
                                <img src="images/g14.jpg" class="img-responsive " alt=""/>
                                <div class="rotate">
                                    <span class="glyphicon glyphicon-search gl-icn" aria-hidden="true"></span>	
                                </div>				
                             </a> 
                        </div>
                    </div>	
                    <div class="col-md-4 work-grid">
                        <div id="nivo-lightbox-demo">			
                            <a  href="images/g15.jpg" data-lightbox-gallery="gallery1" id="nivo-lightbox-demo">			   
                                <img src="images/g15.jpg" class="img-responsive " alt=""/>
                                <div class="rotate">
                                    <span class="glyphicon glyphicon-search gl-icn" aria-hidden="true"></span>	
                                </div>				
                             </a> 
                        </div>
                    </div>
                </div>
            </div>
            <link rel="stylesheet" type="text/css" href="<%=Const.ROOT%>css/magnific-popup.css">
			<script type="text/javascript" src="<%=Const.ROOT%>js/nivo-lightbox.min.js"></script>
				<script type="text/javascript">
                    $(document).ready(function(){
                        $('#nivo-lightbox-demo a').nivoLightbox({ effect: 'fade' });
                    });
				</script>
			<!---->
        </div>
        <!--footer-->
     <%@include file="/footer.jsp"%>
    </body>
</html>
