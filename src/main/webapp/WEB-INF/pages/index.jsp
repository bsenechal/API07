<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html lang="fr">
<jsp:include page="header.jsp" />

<!---start-content---->

<div class="content">
	<div class="wrap">
		<div id="main" role="main">

			<jsp:include page="messages.jsp" />
			<br/>
			<div class="container">
				<!-- aside -->
				<div class="aside">
					<div class="inside">
						<h2>Medical News</h2>
						<ul class="news">
							<li><a href="#">16 Mai 2015</a><br>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi nec urna vitae arcu gravida mattis sit amet eu leo. Donec porttitor at ipsum non scelerisque</li>
							<li><a href="#">15 Mai 2015</a><br>Quisque nisi erat, condimentum vel erat non, vulputate congue turpis. Sed scelerisque semper tempus. Donec in purus congue.</li>
							<li><a href="#">12 Mai 2015</a><br>Enean metus magna, mollis pulvinar nulla ac, tincidunt commodo mauris. Ut viverra dictum quam, in malesuada ante vehicula sed. Pellentesque placerat mattis fringilla.</li>
						</ul>
					</div>
				</div>
				<!-- content -->
				<div class="section" id="content">
					<div class="wrapper">
						<div class="article col-1">
							<h2>Patient Quotes</h2>
							<img src="${pageContext.request.contextPath}/resources/images/1page-img.jpg" class="imgb" alt="" />
							<p class="p1">
								Phasellus blandit sed dui id facilisis. Pellentesque id tristique quam. Etiam sodales iaculis dolor nec luctus. Praesent ut dolor quis nunc consectetur tempor. Vivamus facilisis, leo a elementum sagittis, sapien mi luctus tellus, quis malesuada massa ipsum non nisi.
							</p>
							<p class="p0">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum eleifend erat sed odio tempor elementum. Proin fermentum efficitur ligula eget tristique. Suspendisse mattis consequat sodales. Aliquam nisi turpis, porttitor id sem in, convallis blandit erat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae.</p>
						</div>
						<div class="article col-2">
							<h2>Recent Articles</h2>
							<ul class="list">
								<li><strong>Aenean metus magna</strong>
									Aenean metus magna, mollis pulvinar nulla ac, tincidunt commodo mauris. Ut viverra dictum quam, in malesuada ante vehicula sed. Pellentesque placerat mattis fringilla. Quisque rhoncus mi ac erat ornare pulvinar. Aliquam erat volutpat. Sed ac odio feugiat</li>
								<li><strong>Lorem ipsum dolor</strong>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi nec urna vitae arcu gravida mattis sit amet eu leo. Donec porttitor</li>
								
								<li><strong>Uspendisse congue in felis quis molestie</strong>Uspendisse congue in felis quis molestie. Proin ut leo enim. Integer auctor hendrerit mauris, in sodales leo commodo vitae.</li>
								
								<li><strong>Nullam ac diam nisl</strong>Nullam ac diam nisl, a
									consequat orci. Nunc faucibus diam ut mi sollicitudin a
									convallis nunc cursus. Cras adipiscing ligula vel orci
									convallis congue.</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="footer.jsp" />
</body>
</html>