<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <!-- MetisMenu CSS -->
    <link href="../resources/css/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../resources/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../resources/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <link href="../resources/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>


    <title>Login page</title>
</head>
<body>
<jsp:include page="/jsp/blocks/header.jsp"/>

<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="login-panel panel panel-default" style="margin-top: 50%">
                <div class="panel-heading">
                    <h3 class="panel-title">Please Sign In</h3>
                </div>
                <div class="panel-body">
                    <form action="/login" method="post">
                        <div class="form-group has-feedback">
                            <input class="form-control" placeholder="E-mail" name="email" type="email" autofocus>
                        </div>
                        <div class="form-group">
                            <input class="form-control" placeholder="Password" name="password" type="password" value="">
                        </div>
                        <div class="checkbox">
                            <label>
                                <input name="remember" type="checkbox" value="Remember Me">Remember me
                            </label>
                        </div>
                        <div class="form-group">
                            <input class="btn btn-lg btn-success btn-block" type="submit" value="Login">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- jQuery -->
<script src="../resources/js/libs/jquery-3.2.1.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="../resources/js/libs/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="../resources/js/metisMenu.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="../resources/js/sb-admin-2.js"></script>

</body>
</html>