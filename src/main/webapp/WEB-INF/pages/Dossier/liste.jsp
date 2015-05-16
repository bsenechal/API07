<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page session="true"%>


<jsp:include page="../header.jsp"/>

<LINK rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap/bootstrap-table.css">

<div class="content">
	<div class="wrap">
		<div class="single-page">
			<jsp:include page="../messages.jsp"/>
			
			<div class="container-fluid">
			<div class="page-header">
				<h1>Gestion des dossiers</h1>
			</div>	
			<sec:authorize access="hasAnyRole('ROLE_INFIRMIERE')">
				<ul class="list-group">
				  <li class="list-group-item"><a href="${pageContext.request.contextPath}/dossier/add"><span class="glyphicon glyphicon-plus"></span> Ajouter un dossier</a></li>
				</ul>	
			</sec:authorize>
			
			<c:if test="${!empty listeDossier}">
				<div class="table-responsive">
					<table data-toggle="table" data-query-params="queryParams" data-pagination="true" data-search="true" data-height="519">
						<thead>
							<tr>
								<sec:authorize access="hasAnyRole('ROLE_MEDECIN', 'ROLE_INFIRMIERE')"><th><b>Utilisateur</b></th></sec:authorize>
								<sec:authorize access="hasAnyRole('ROLE_MEDECIN', 'ROLE_INFIRMIERE')"><th><b>Etat Civil</b></th></sec:authorize>
								<sec:authorize access="hasAnyRole('ROLE_MEDECIN', 'ROLE_INFIRMIERE')"><th><b>Coordonnées</b></th></sec:authorize>
								<sec:authorize access="hasAnyRole('ROLE_MEDECIN')"><th><b>Antécédents Médicaux</b></th></sec:authorize>
								<sec:authorize access="hasAnyRole('ROLE_MEDECIN')"><th><b>Vaccinations</b></th></sec:authorize>
								<sec:authorize access="hasAnyRole('ROLE_MEDECIN', 'ROLE_INFIRMIERE')"><th></th></sec:authorize>
							</tr>
						</thead>
						<c:forEach items="${listeDossier}" var="dossier">
							<tr>
								<sec:authorize access="hasAnyRole('ROLE_MEDECIN', 'ROLE_INFIRMIERE')"><td>${dossier.fkUser.login}</td></sec:authorize>
								<sec:authorize access="hasAnyRole('ROLE_MEDECIN', 'ROLE_INFIRMIERE')"><td>${dossier.etatCivil}</td></sec:authorize>
								<sec:authorize access="hasAnyRole('ROLE_MEDECIN', 'ROLE_INFIRMIERE')"><td>${dossier.coordonnees}</td></sec:authorize>
								<sec:authorize access="hasAnyRole('ROLE_MEDECIN')"><td>${dossier.antecedents}</td></sec:authorize>
								<sec:authorize access="hasAnyRole('ROLE_MEDECIN')"><td>${dossier.vaccinations}</td></sec:authorize>
								<sec:authorize access="hasAnyRole('ROLE_MEDECIN', 'ROLE_INFIRMIERE')"><td><a href="<c:url value='/dossier/edit/${dossier.idDossier}' />" ><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a></td></sec:authorize>
							</tr>
						</c:forEach>
					</table>
				</div>
			</c:if>
		</div>
		</div>
		<jsp:include page="../footer.jsp"/>
	</div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/css/bootstrap/bootstrap-table.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/css/bootstrap/bootstrap-table-fr-FR.min.js"></script>