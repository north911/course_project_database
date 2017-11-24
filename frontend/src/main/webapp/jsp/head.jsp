<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Head of practice page</title>

    <link href="../resources/css/metisMenu.min.css" rel="stylesheet">

    <link href="../resources/css/sb-admin-2.css" rel="stylesheet">

    <link href="../resources/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <link href="../resources/css/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="../resources/css/dataTables.responsive.css" rel="stylesheet">


    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
</head>
<body>

<jsp:include page="/jsp/blocks/header.jsp"/>

<div id="wrapper">

    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">

        <div class="nav navbar-bot-links navbar-right" style="margin: 5px">

            <form action="/logout" method="post">
                <div class="form-group">
                    <input class="btn btn-xs btn-success btn-block" type="submit" value="logout">
                </div>
            </form>
        </div>

    </nav>



    <div class="col-lg-12">

        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Расписание школы</h1>
            </div>
            <div class="row">
                <div class="col-lg-4" >
                    <form action="/time" method="get">
                <div class="form-group input-group">
                    <input type="text" class="form-control" name="name">
                    <span class="input-group-btn">
                            <button class="btn btn-default" type="submit">search
                            </button>
                    </span>
                </div>
                    </form>
                </div>
                <div class="col-lg-4" >
                    <form action="/time2" method="get">
                        <div class="form-group input-group">
                            <input type="text" class="form-control" name="name">
                            <span class="input-group-btn">
                            <button class="btn btn-default" type="submit">search
                            </button>
                    </span>
                        </div>
                    </form>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Понедельник
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Предмет</th>
                                        <th>Учитель</th>
                                        <th>Кабинет</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${listTime1}" var="time" >
                                        <tr>
                                            <td>${time.numberOfLesson}</td>
                                            <td>${listSubjects.stream().filter(SubjectEntity -> SubjectEntity.getIdSubject()==time.getidSubject()).findFirst().get().getName()}</td>
                                            <td>${listTeachers.stream().filter(TeachersEntity -> TeachersEntity.getIdTeacher()==time.getidTeacher()).findFirst().get().getLastName()}</td>
                                            <td>${time.idCabinet}</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <div class="col-lg-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Вторник
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Предмет</th>
                                        <th>Учитель</th>
                                        <th>Кабинет</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${listTime2}" var="time" >
                                        <tr>
                                            <td>${time.numberOfLesson}</td>
                                            <td>${listSubjects.stream().filter(SubjectEntity -> SubjectEntity.getIdSubject()==time.getidSubject()).findFirst().get().getName()}</td>
                                            <td>${listTeachers.stream().filter(TeachersEntity -> TeachersEntity.getIdTeacher()==time.getidTeacher()).findFirst().get().getLastName()}</td>
                                            <td>${time.idCabinet}</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Среда
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Предмет</th>
                                        <th>Учитель</th>
                                        <th>Кабинет</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${listTime3}" var="time" >
                                        <tr>
                                            <td>${time.numberOfLesson}</td>
                                            <td>${listSubjects.stream().filter(SubjectEntity -> SubjectEntity.getIdSubject()==time.getidSubject()).findFirst().get().getName()}</td>
                                            <td>${listTeachers.stream().filter(TeachersEntity -> TeachersEntity.getIdTeacher()==time.getidTeacher()).findFirst().get().getLastName()}</td>
                                            <td>${time.idCabinet}</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <div class="col-lg-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Четверг
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Предмет</th>
                                        <th>Учитель</th>
                                        <th>Кабинет</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${listTime4}" var="time" >
                                        <tr>
                                            <td>${time.numberOfLesson}</td>
                                            <td>${listSubjects.stream().filter(SubjectEntity -> SubjectEntity.getIdSubject()==time.getidSubject()).findFirst().get().getName()}</td>
                                            <td>${listTeachers.stream().filter(TeachersEntity -> TeachersEntity.getIdTeacher()==time.getidTeacher()).findFirst().get().getLastName()}</td>
                                            <td>${time.idCabinet}</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Пятница
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Предмет</th>
                                        <th>Учитель</th>
                                        <th>Кабинет</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${listTime5}" var="time" >
                                        <tr>
                                            <td>${time.numberOfLesson}</td>
                                            <td>${listSubjects.stream().filter(SubjectEntity -> SubjectEntity.getIdSubject()==time.getidSubject()).findFirst().get().getName()}</td>
                                            <td>${listTeachers.stream().filter(TeachersEntity -> TeachersEntity.getIdTeacher()==time.getidTeacher()).findFirst().get().getLastName()}</td>
                                            <td>${time.idCabinet}</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>

            </div>
        </div>

    </div>
    <!-- /#page-wrapper -->

</div>

<script src="../resources/js/libs/jquery-3.2.1.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="../resources/js/libs/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="../resources/js/metisMenu.min.js"></script>

<script src="../resources/js/jquery.dataTables.min.js"></script>
<script src="../resources/js/dataTables.bootstrap.min.js"></script>
<script src="../resources/js/dataTables.responsive.js"></script>

<script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
            responsive: true
        });
    });
</script>

</body>
</html>
