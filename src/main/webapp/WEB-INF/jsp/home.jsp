<%@ taglib prefix="app-tags" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<app-tags:header />

<div class="container">

    <div class="row">
        <div class="col-xs-12">
            <h1>React Tests</h1>
            <p>Testing out React.js with Spring Boot.</p>
        </div>
    </div>


    <div class="row">

        <!-- Test 1 -->
        <div class="col-xs-12">
            <h3>Test 1</h3>
            <div id="test-1"></div>
        </div>

        <script type="text/babel">

          ReactDOM.render(
              <h4>Hello, world!</h4>,
              document.getElementById('test-1')
          );

        </script> <!-- /Test 1 -->

        <div class="col-xs-12"><hr></div>

        <!-- Test 2 -->
        <div class="col-xs-12">
            <h3>Test 2</h3>
            <div id="test-2"></div>
        </div>

        <script type="text/babel">

          function formatGene(gene) {
            return gene.symbol + " (" + gene.id + ")";
          }

          const gene = {
            symbol: "AKT3",
            id: 10000
          };

          const element = (
              <h4>
                Gene: {formatGene(gene)}
              </h4>
          );

          ReactDOM.render(
              element,
              document.getElementById("test-2")
          );

        </script> <!-- /Test 2 -->

        <div class="col-xs-12"><hr></div>

    </div>




</div>

<app-tags:footer />

