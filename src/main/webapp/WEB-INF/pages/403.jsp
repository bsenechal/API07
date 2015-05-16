<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="fr">
<jsp:include page="header.jsp" />

<!---start-content---->

<div class="content">
	<div class="wrap">
		<div id="main" role="main">

			<jsp:include page="messages.jsp" />

			<div class="container">
				<br /> <br />
				<c:choose>
					<c:when test="${empty username}">
						<center>
							<h2>Vous n'avez pas le droit d'accéder à cette page !</h2>
						</center>
					</c:when>
					<c:otherwise>
						<h2>
							${username} <br />Vous n'avez pas le droit d'accéder à cette
							page !
						</h2>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</div>
</body>
</html>