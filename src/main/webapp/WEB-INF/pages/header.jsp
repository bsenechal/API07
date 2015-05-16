<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html lang="fr">
<head>
<title>FortKnox</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/theme/reset.css"
	type="text/css" media="all">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/theme/layout.css"
	type="text/css" media="all">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/theme/style.css"
	type="text/css" media="all">
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.validate.min.js"></script>
<LINK rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/bootstrap/css/bootstrap.min.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/css/bootstrap/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.validate.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/messages_fr.min.js"></script>
</head>
<body>
	<div class="header">
		<div class="container">

			<div class="nav">
				<ul>
					<li class="m1"><a href="${pageContext.request.contextPath}/"
						class="active"><span><b>Accueil</b></span></a></li>
					<sec:authorize
						access="hasAnyRole('ROLE_MEDECIN', 'ROLE_INFIRMIERE')">
						<li class="m2"><a
							href="${pageContext.request.contextPath}/dossier/list"><span><b>Dossiers</b></span></a></li>
					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_EMPLOYE')">
						<li class="m2"><a
							href="${pageContext.request.contextPath}/mine"><span><b>Mon
										dossier</b></span></a></li>
					</sec:authorize>
					<c:choose>
						<c:when test="${pageContext['request'].userPrincipal != null}">
							<li class="m2"><c:url var="logoutUrl"
									value="/j_spring_security_logout" />
								<form id="decoForm" action="${logoutUrl}" method="post">
									<a href="javascript:void()"
										onclick="document.getElementById('decoForm').submit();"><span><b>Deconnexion</b></span></a>

									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" />
								</form></li>
						</c:when>
						<c:otherwise>
							<li class="m2"><a
								href="${pageContext.request.contextPath}/login"><span><b>Connexion</b></span></a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</div>