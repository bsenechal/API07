<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page session="true"%>

<jsp:include page="../header.jsp"/>

<div class="content">
	<div class="wrap">
		<div class="single-page">
			<jsp:include page="../messages.jsp"/>
			
			<div class="page-header">
				<h1>
					<c:choose>
						<c:when test="${dossier.idDossier == 0}">Ajout d'un livre</c:when>
						<c:otherwise>Modification d'un livre</c:otherwise>
					</c:choose>
				</h1>	
			</div>	

			<div class="container-fluid">
				<form:form commandName="dossier" id="dossier-form" class="form-horizontal" role="form" method="post" action="${pageContext.request.contextPath}/dossier/save">
					<sec:authorize access="hasAnyRole('ROLE_INFIRMIERE')">
						<div id="userDiv" class="form-group">
							<label for="labelUser" class="col-sm-2 control-label">Utilisateur</label>
							<div class="col-sm-10">
								<select name="idUser" class="form-control">
									<c:forEach items="${listUser}" var="user">
										<c:choose>
											<c:when test="${user.idUser == dossier.fkUser.idUser}"><option value="${user.idUser}" selected>${user.login}</option></c:when>
											<c:otherwise><option value="${user.idUser}">${user.login}</option></c:otherwise>
										</c:choose>
											
									</c:forEach>
								</select>
							</div>
						</div>	
					</sec:authorize>
					
					<sec:authorize access="hasAnyRole('ROLE_INFIRMIERE')">
						<div id="etatCivilDiv" class="form-group">
							<label for="title" class="col-sm-2 control-label">Etat Civil</label>
							<div class="col-sm-10">
								<form:input path="etatCivil" type="text" class="form-control" id="etatCivil" placeholder="${dossier.etatCivil}"/>
							    <form:errors path="etatCivil" cssClass="error"/>
							</div>
						</div>
					</sec:authorize>
					<sec:authorize access="hasAnyRole('ROLE_INFIRMIERE')">
						<div id="coordonneesDiv" class="form-group">			    
							<label  for="autor" class="col-sm-2 control-label">Coordonnées</label>
							<div class="col-sm-10">
								<form:input path="coordonnees" type="text" class="form-control" id="coordonnees" placeholder="${dossier.coordonnees}"/>
								<form:errors path="coordonnees" cssClass="error"/>
							</div>
						</div>
					</sec:authorize>
					<sec:authorize access="hasAnyRole('ROLE_MEDECIN')">
						<div id="antecedentsDiv" class="form-group">			    
							<label for="type" class="col-sm-2 control-label">Antécédents Médicaux</label>
							<div class="col-sm-10">
								<form:input path="antecedents" type="text" class="form-control" id="antecedents" placeholder="${dossier.antecedents}"/>
								<form:errors path="antecedents" cssClass="error"/>
							</div>
						</div>
					</sec:authorize>
					<sec:authorize access="hasAnyRole('ROLE_MEDECIN')">
						<div id="vaccinationsDiv" class="form-group">			    
							<label for="type" class="col-sm-2 control-label">Vaccinations</label>
							<div class="col-sm-10">
								<form:input path="vaccinations" type="text" class="form-control" id="vaccinations" placeholder="${dossier.vaccinations}"/>
								<form:errors path="vaccinations" cssClass="error"/>
							</div>
						</div>
					</sec:authorize>
					<form:input path="idDossier" type="hidden" name="idDossier" value="${dossier.idDossier}" />
					<sec:authorize access="hasAnyRole('ROLE_MEDECIN', 'ROLE_INFIRMIERE')">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-primary">
								<c:choose>
									<c:when test="${dossier.idDossier == 0}">Ajouter</c:when>
									<c:otherwise>Sauvegarder</c:otherwise>
								</c:choose>
							</button>
						</div>
					</sec:authorize>
				</form:form>
			</div>
			<nav>
			  <ul class="pager">
			    <li><a href="${pageContext.request.contextPath}/dossier/list">Précédent</a></li>
			  </ul>
			</nav>
		</div>
		<jsp:include page="../footer.jsp"/>
	</div>
</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/editDossier.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap-filestyle.min.js"></script>
</html>