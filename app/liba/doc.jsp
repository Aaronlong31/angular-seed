<%@ page session="false" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML>
<html lang="zh">
<head>
<meta charset="UTF-8">
<title>Liba API Doc</title>
<link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
<script src="js/jquery-1.8.0.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/doc.js"></script>
<style type="text/css">
    hr{margin:0}
    .get{background-color: #00cc99}
    .post{background-color: #0099CC}
    .put{background-color: #FFCC66}
    .delete{background-color: #CC3366}
    .request-method{
        height: 100px;
        text-align: center;
        line-height: 100px;
        font-size: 15px;
        font-weight: bold;
    }
    .path{
        height: 50px;
        font-weight: bold;
        font-family: Courier New;
        padding-top: 10px;
        word-wrap:break-word;
    }
    .description{
        height: 50px;
    }
    .card{
        margin:10px;
        -webkit-border-radius: 0;
        -moz-border-radius: 0;
        border-radius: 0;
        -webkit-box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
        -moz-box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
        -webkit-background-clip: padding-box;
        -moz-background-clip: padding;
        background-clip: padding-box;
    }
    a.key,a.request-method{
        color:#000000;
    }
    div.request-method, div.description{
        cursor: pointer;
    }

    .frontend{
    }

    .detail {
        display: none;

    }

</style>
</head>
<body>
	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				<a class="brand" href="#">LIBA API DOCUMENT</a>
				<form action="" class="navbar-search pull-left">
					<input id="search" class="search-query input-xxlarge" type="text" placeholder="search path/description">
				</form>
			</div>
		</div>
	</div>	
	<div></div>
	<div style="height:60px"></div>
	<div class="container-fluid">
		<div>
			<c:forEach items="${infoList}" var="doc">
                <div class="span7 card">
                    <div class="row-fluid">
                        <div class="span3 request-method">${doc.requestMethod}</div>
                        <div class="span9 path">${doc.path} </div>
                        <div class="span9 description">${doc.description}
                        </div>
                        <div class="detail">
                            <hr />
                            <c:if test="${doc.paramInfos.size() ne 0}">
                            <dl class="dl-horizontal">
                                <c:if test='${doc.params ne "[]"}' >
                                    <dt>params</dt>
                                    <dd>${doc.params}</dd>
                                </c:if>
                                <c:if test='${doc.header ne "[]"}' >
                                    <dt>Header</dt>
                                    <dd>${doc.header}</dd>
                                </c:if>
                                <c:if test='${doc.consume ne "[]"}' >
                                    <dt>Consume</dt>
                                    <dd>${doc.consume}</dd>
                                </c:if>
                                <c:if test='${doc.produce ne "[]"}' >
                                    <dt>Produce</dt>
                                    <dd>${doc.produce}</dd>
                                </c:if>
                                <c:if test='${doc.auth ne null}' >
                                    <dt>Authorization</dt>
                                    <dd>${doc.auth}&nbsp;</dd>
                                </c:if>
                            </dl>
                            </c:if>
                            <c:if test="${doc.paramInfos.size() ne 0}">
                                <h4>Parameter</h4>
                                <hr />
                                <table class="table">
                                    <tr>
                                        <th>Name</th>
                                        <th>Required</th>
                                    </tr>
                                    <c:forEach items="${doc.paramInfos}" var="p">
                                        <tr>
                                            <td>${p.name}</td>
                                            <td>${p.required}</td>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </c:if>
                            <c:if test="${doc.pageInfo ne null}">
                                <h4>Page Param Descript</h4>
                                <table class="table">
                                    <tr>
                                        <td>Default PageSize</td>
                                        <td>${doc.pageInfo.defaultPageSize()}</td>
                                    </tr>
                                    <tr>
                                        <td>Default Page No</td>
                                        <td>${doc.pageInfo.defaultPageNo()}</td>
                                    </tr>
                                    <tr>
                                        <td>Default OrderBy</td>
                                        <td>${doc.pageInfo.defaultOrderBy()}</td>
                                    </tr>
                                    <tr>
                                        <td>Default OrderBy Sort</td>
                                        <td>${doc.pageInfo.defaultOrderSort()}</td>
                                    </tr>
                                    <tr>
                                        <td>Supported OrderBy</td>
                                        <td>
                                            <c:forEach items="${doc.pageInfo.supportedOrderBy()}" var="s"> ${s}, </c:forEach>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Max PageSize</td>
                                        <td>${doc.pageInfo.maxPageSize() }</td>
                                    </tr>
                                </table>
                            </c:if>
                            <h4>Return</h4>
                            <hr />
                            <dt>SuccessStatus</dt>
                            <dd>${doc.successStatus}</dd>
                            <c:if test="${doc.exceptionInfos.size() ne 0}">
                                <table class="table">
                                    <caption>Exception</caption>
                                    <tr>
                                        <th>Http Status</th>
                                        <th>Error Code</th>
                                        <th>Error Message</th>
                                    </tr>
                                    <c:forEach items="${doc.exceptionInfos}" var="e">
                                        <tr>
                                            <td>${e.httpStatus}</td>
                                            <td>${e.code}</td>
                                            <td>${e.message}</td>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </c:if>
                            <h4>Method</h4>
                            <pre class="prettyprint java-method">${doc.method}</pre>
                        </div>
                    </div>
                </div>
			</c:forEach>
		</div>
	</div>
	<footer class="footer">
		<div class="container">
			<p class="pull-right">
				<a href="#">Back To Top</a>
			</p>
		</div>
	</footer>
</body>