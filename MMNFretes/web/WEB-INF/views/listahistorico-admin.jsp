<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:forEach var="historico" items="${list_historico}">
    <tr>
        <th>${historico.id}</th>
        <th>${historico.usuarios.nome}</th>
        <th>${historico.transportadoras.nome}</th>
        <th>
            <fmt:formatDate value="${historico.data}"
                            pattern="dd/MM/yyyy"/>
        </th>
        <th>${historico.token_consulta}</th>
        <th>
            <fmt:formatNumber value="${historico.valor}"
                              maxFractionDigits="2"
                              minFractionDigits="2"
                              type="currency"/>

        </th>

        <th>
            <c:if test="${historico.status_repasse eq 0}">
                R$ 0,00
            </c:if>

            <c:if test="${historico.status_repasse eq 1}">
                <fmt:formatNumber value="${historico.valor / 100 * 40}"
                                  maxFractionDigits="2"
                                  minFractionDigits="2"
                                  type="currency" />
            </c:if>

            <c:if test="${historico.status_repasse eq 2}">
                <fmt:formatNumber value="${historico.valor}"
                                  maxFractionDigits="2"
                                  minFractionDigits="2"
                                  type="currency" />
            </c:if>
        </th>

        <th>
            <c:if test="${historico.status_repasse eq 0}">
                <fmt:formatNumber value="${historico.valor}"
                                  maxFractionDigits="2"
                                  minFractionDigits="2"
                                  type="currency" />
            </c:if>

            <c:if test="${historico.status_repasse eq 1}">
                <fmt:formatNumber value="${historico.valor - historico.valor / 100 * 40}"
                                  maxFractionDigits="2"
                                  minFractionDigits="2"
                                  type="currency" />
            </c:if>

            <c:if test="${historico.status_repasse eq 2}">
                0,00
            </c:if>

        </th>

        <th>
            <c:if test="${historico.status_repasse eq 0}">
                <button onclick="efatuarRepasse(${historico.id})" class="btn btn-xs col-xs-12 btn-warning">Repasse 40%</button>
            </c:if>

            <c:if test="${historico.status_repasse eq 1}">
                <button onclick="efatuarRepasse(${historico.id})" class="btn btn-xs col-xs-12 btn-success">Repasse 60%</button>
            </c:if>

            <c:if test="${historico.status_repasse eq 2}">
                <button class="btn btn-xs col-xs-12 btn-default disabled" >Repassado</button>
            </c:if>
        </th>
    </tr>
</c:forEach>