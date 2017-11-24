<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <jsp:include page="/jsp/blocks/header.jsp"/>

    <title>Admin page</title>

    <link href="../resources/css/metisMenu.min.css" rel="stylesheet">

    <link href="../resources/css/sb-admin-2.css" rel="stylesheet">

    <link href="../resources/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <link href="../resources/css/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="../resources/css/dataTables.responsive.css" rel="stylesheet">

    <link href="../resources/css/datepicker.css">

    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>

    <script>

        $(function () {
            $('#subjects1').on('change', function () {
                refreshTeachers(this.value, 0);
            })
        });

        function refreshTeachers(id, val) {
            $.ajax({
                url: 'getTeachersBySubjectId/' + id,
                dataType: 'json',
                success: function (data) {
                    $('#teachers').find('option').remove();
                    var options = "";
                    $.each(data, function (index, value) {
                        options += '<option value="' + value.idTeacher + '">' + value.lastName + '</option>';
                    });
                    $('#teachers').html(options);
                    if (val) {
                        $('#teachers').val(val);
                    }

                }
            });

        }

        function init() {
            $('#cabinet_add').ajaxForm({
                dataType: 'json',
                success: function (data) {

                }
            });
           /* $('#cabinet_edit').ajaxForm({
                dataType: 'json',
                success: function (data) {

                }
            });*/

            $('#teacher_add').ajaxForm({
                dataType: 'json',
                success: function (data) {

                }
            });
            $('#time_add').ajaxForm({
                dataType: 'json',
                success: function (data) {

                }
            });

            $('#class_add').ajaxForm({
                dataType: 'json',
                success: function (data) {

                }
            });
            $('#pupel_add').ajaxForm({
                dataType: 'json',
                success: function (data) {

                }
            });

            $('#subject_add').ajaxForm({
                dataType: 'json',
                success: function (data) {

                }
            });

            function myFunction() {
                location.reload(true);
            }

            $('#subjects1').val(data.idSubject);
            refreshTeachers(data.idSubject, data.idTeacher);
        }



        function edit(id, floor) {
            var modal = $('#myModal44');
            modal.modal();
            modal.find('#namecabinet1').val(id);
            modal.find('#floor1').val(floor);

        }

    </script>


</head>
<body onload="init()">


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



    <div class="col-md-12">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">DIRECTOR PAGE</h1>
            </div>
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <button class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                            Add pupil
                        </button>
                        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                        <h4 class="modal-title" id="myModalLabel">add pupil</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="container-fluid">
                                            <form action="/addpupel" id="pupel_add" method="post" role="form">
                                            <div class="row">
                                                <div class="col-md-4"><label>First name</label></div>
                                                <div class="col-md-4"><label>Last name</label></div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4"><label><input type="text" name="firstname"></label></div>
                                                <div class="col-md-4"><label><input type="text" name="lastname"></label></div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-8"><label>Class</label></div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6"><select id="listClasses" name="classId" class="form-control">
                                                    <c:forEach items="${listClasses}" var="clss">
                                                        <option value="${clss.idClass}">${clss.className}</option>
                                                    </c:forEach>
                                                </select></div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-3 "><label>Sex</label></div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4"><select class="form-control" name="sex">
                                                    <option>male</option>
                                                    <option>female</option>
                                                </select></div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6"><label>date of birth</label></div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6"><div class="input-group date">
                                                    <div class="input-group-addon">
                                                        <i class="fa fa-calendar"></i>
                                                    </div>
                                                    <input type="text" class="form-control pull-right" id="datepicker1" name="date">
                                                </div></div>
                                            </div>
                                                <div class="row">
                                                <button type="submit" class="btn btn-primary">Create</button>
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="modal-footer">

                                    </div>
                                </div>
                                <!-- /.modal-content -->
                            </div>
                            <!-- /.modal-dialog -->
                        </div>
                        <button class="btn btn-primary" data-toggle="modal" data-target="#myModal1">
                            Add teacher
                        </button>
                        <div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                        <h4 class="modal-title" id="myModalLabel1">Add new teacher</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="container-fluid">
                                            <form action="/addt" id="teacher_add" method="post" role="form">
                                            <div class="row">
                                                <div class="col-md-5"><label>First name</label></div>
                                                <div class="col-md-5"><label>Last name</label></div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-5"><input class="form-control" name="fname"></div>
                                                <div class="col-md-5"><input class="form-control" name="lname"></div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6"><label>Subject</label></div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6"><select id="listSubjects" name="idS" class="form-control">
                                                    <c:forEach items="${listSubjects}" var="subject">
                                                        <option value="${subject.idSubject}">${subject.name}</option>
                                                    </c:forEach>
                                                </select></div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-3"><label>qualification</label></div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-3"><input class="form-control" name="qual"></div>
                                            </div>
                                                <div class="row">
                                                <button type="submit" class="btn btn-primary"  onclick="myFunction()">Create</button>
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                    </div>
                                </div>
                                <!-- /.modal-content -->
                            </div>
                            <!-- /.modal-dialog -->
                        </div>
                        <button class="btn btn-primary" data-toggle="modal" data-target="#myModal2">
                            Create class
                        </button>
                        <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                        <h4 class="modal-title" id="myModalLabel2">Create new class</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="container-fluid">
                                            <form action="/addclass" id="class_add" method="post" role="form">
                                            <div class="row">
                                                <div class="col-md-4"><label>номер класса</label></div>
                                                <div class="col-md-4"><label>староста</label></div>
                                                <div class="col-md-4"><label>кол-во учеников</label></div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4"><input name="className"></div>
                                                <div class="col-md-4"><input name="manager"></div>
                                                <div class="col-md-4"><input name="size"></div>
                                            </div>
                                                <div class="row">
                                                <button type="submit" class="btn btn-primary" onClick="window.location.reload()">Create</button>
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                    </div>
                                      </div>
                                <!-- /.modal-content -->
                            </div>
                            <!-- /.modal-dialog -->
                        </div>

                        <button class="btn btn-primary" data-toggle="modal" data-target="#myModal3">new lesson in timetable</button>
                        <div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                        <h4 class="modal-title" id="myModalLabel3">Add lesson in tt</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="container-fluid">
                                            <form action="/addtime" id="time_add" method="post" role="form">
                                            <div class="row">
                                                <div class="col-md-4"><label>number of class</label></div>
                                                <div class="col-md-4"><label>number of subject</label></div>
                                                <div class="col-md-4"><label>day of the week</label></div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4"><select id="listClasses1" name="classId" class="form-control">
                                                    <c:forEach items="${listClasses}" var="clss">
                                                        <option value="${clss.idClass}">${clss.className}</option>
                                                    </c:forEach>
                                                </select></div>
                                                <div class="col-md-4"><select class="form-control" name="numberLesson">
                                                    <option>1</option>
                                                    <option>2</option>
                                                    <option>3</option>
                                                    <option>4</option>
                                                    <option>5</option>
                                                    <option>6</option>
                                                    <option>7</option>
                                                    <option>8</option>
                                                </select></div>
                                                <div class="col-md-4"><select class="form-control" name="numberDay">
                                                    <option>1</option>
                                                    <option>2</option>
                                                    <option>3</option>
                                                    <option>4</option>
                                                    <option>5</option>
                                                </select></div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-5"><label>subjects</label></div>
                                                <div class="col-md-5"><label>teacher</label></div>
                                                <div class="col-md-5"><label>cabinet</label></div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4"><select id="subjects1" name="idSubj" class="form-control">
                                                    <c:forEach items="${listSubjects}" var="subject">
                                                        <option value="${subject.idSubject}">${subject.name}</option>
                                                    </c:forEach>
                                                </select></div>
                                                <div class="col-md-4"><select id="teachers" name="idTeach" class="form-control">
                                                </select></div>
                                                <div class="col-md-4"><select id="listCabinets" name="idCab" class="form-control">
                                                    <c:forEach items="${listCabinets}" var="cabinet">
                                                        <option value="${cabinet.idCabinet}">${cabinet.idCabinet}</option>
                                                    </c:forEach>
                                                </select></div>
                                            </div>
                                                <div class="row">
                                                    <button type="submit" class="btn btn-primary">Create</button>
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                    </div>
                                </div>
                                <!-- /.modal-content -->
                            </div>
                            <!-- /.modal-dialog -->
                        </div>

                        <button class="btn btn-primary" data-toggle="modal" data-target="#myModal4">
                            add cabinet
                        </button>
                        <div class="modal fade" id="myModal4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                        <h4 class="modal-title" id="myModalLabel4">create new cabinet</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="container-fluid">
                                            <form action="/addcab" id="cabinet_add" method="post" role="form">
                                                <div class="row">
                                                    <label>number of cabinet</label>
                                                    <input id="namecabinet" class="form-control"  name="idC" autofocus>
                                                </div>
                                                <div class="row">
                                                    <label>floor of cabinet</label>
                                                    <input id="floor" class="form-control" name="fl">
                                                </div>
                                                <div class="form-group">
                                                    <button type="submit" class="btn btn-primary"  onclick="myFunction()">Create</button>
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                </div>
                                            </form>
                                </div>
                                <!-- /.modal-content -->
                            </div>
                            <!-- /.modal-dialog -->
                        </div>
                    </div>
                </div>

                        <button class="btn btn-primary" data-toggle="modal" data-target="#myModal6">
                            create new subject
                        </button>
                        <div class="modal fade" id="myModal6" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                        <h4 class="modal-title" id="myModalLabel6">create new subject</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="container-fluid">
                                            <form action="/addsubject" id="subject_add" method="post" role="form">
                                                <div class="row">
                                                    <div class="col-md-4"><label>subject name</label></div>
                                                    <div class="col-md-4"><label><input type="text" name ="subName"></label></div>
                                                </div>
                                                <button type="submit" class="btn btn-primary">Create</button>
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="modal-footer">

                                    </div>
                                </div>
                                <!-- /.modal-content -->
                            </div>
                            <!-- /.modal-dialog -->
                        </div>
            </div>
        </div>
        <!-- /.row -->
        <div class="panel-body">

            <!-- Nav tabs -->
            <ul class="nav nav-tabs">
                <li class="active"><a href="#home" data-toggle="tab" aria-expanded="true">Pupels</a>
                </li>
                <li class=""><a href="#profile" data-toggle="tab" aria-expanded="false">Teachers</a>
                </li>
                <li class=""><a href="#cabinets" data-toggle="tab" aria-expanded="false">Cabinets</a>
                </li>
                <li class=""><a href="#subjects" data-toggle="tab" aria-expanded="false">Subjects</a>
                </li>
                <li class=""><a href="#classes" data-toggle="tab" aria-expanded="false">Classes</a>
                </li>
            </ul>

            <!-- Tab panes -->
            <div class="tab-content">
                <div class="tab-pane fade active in" id="home">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="panel panel-default">
                                <!-- /.panel-heading -->
                                <div class="panel-body">
                                    <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                        <thead>
                                        <tr>
                                            <th>First name</th>
                                            <th>Last name</th>
                                            <th>Class</th>
                                            <th>date of birth</th>
                                            <th>-//-</th>
                                            <th>-//-</th>

                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${listPupels}" var="pupel" >
                                            <tr>
                                                <td>${pupel.firstName}</td>
                                                <td>${pupel.lastName}</td>
                                                <td>${listClasses.stream().filter(ClazzEntity -> ClazzEntity.getIdClass()==pupel.getIdClass()).findFirst().get().getClassName()}</td>
                                                <td>${pupel.dateOfBirth}</td>
                                                <td><a href="<c:url value='/removePupel/${pupel.idPuple}'/>">Delete</a></td>
                                                <td><button>edit</button></td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                    <!-- /.table-responsive -->

                                </div>
                                <!-- /.panel-body -->
                            </div>
                            <!-- /.panel -->
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                </div>
                <div class="tab-pane fade" id="profile">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    Table of the students
                                </div>
                                <!-- /.panel-heading -->
                                <div class="panel-body">
                                    <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example1">
                                        <thead>
                                        <tr>
                                            <th>First name</th>
                                            <th>Last name</th>
                                            <th>Qualification</th>
                                            <th>Subjects</th>
                                            <th>-//-</th>
                                            <th>-//-</th>

                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${listTeachers}" var="teacher" >
                                            <tr>
                                                <td>${teacher.firstName}</td>
                                                <td>${teacher.lastName}</td>
                                                <td>${teacher.qualification}</td>
                                                <td>${listSubjects.stream().filter(SubjectEntity -> SubjectEntity.getIdSubject()==teacher.getIdSubject()).findFirst().get().getName()}</td>
                                                <td><a href="<c:url value='/removeTeacher/${teacher.idTeacher}'/>">Delete</a></td>
                                                <td><button>edit</button></td>

                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                    <!-- /.table-responsive -->

                                </div>
                                <!-- /.panel-body -->
                            </div>
                            <!-- /.panel -->
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                </div>
                <div class="tab-pane fade" id="cabinets">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    Table of the available cabinets
                                </div>
                                <!-- /.panel-heading -->
                                <div class="panel-body">
                                    <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example2">
                                        <thead>
                                        <tr>
                                            <th>number</th>
                                            <th>floor</th>
                                            <th>-//-</th>
                                            <th>-//-</th>
                                        </tr>

                                        </thead>
                                        <tbody>
                                        <c:forEach items="${listCabinets}" var="cabinet" >
                                            <tr>
                                                <td>${cabinet.idCabinet}</td>
                                                <td>${cabinet.floor}</td>
                                                <td><a href="<c:url value='/removeCabinet/${cabinet.idCabinet}'/>">Delete</a>
                                                <td>  <button onclick="edit(${cabinet.idCabinet}, ${cabinet.floor})">Edit</button></td>
                                                </td>

                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                    <!-- /.table-responsive -->

                                </div>

                                <!-- /.panel-body -->
                            </div>
                            <!-- /.panel -->
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                </div>
                <div class="tab-pane fade" id="subjects">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    Table of the available cabinets
                                </div>
                                <!-- /.panel-heading -->
                                <div class="panel-body">
                                    <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example3">
                                        <thead>
                                        <tr>
                                            <th>name</th>
                                            <th>-//-</th>
                                            <th>-//-</th>
                                        </tr>

                                        </thead>
                                        <tbody>
                                        <c:forEach items="${listSubjects}" var="subject" >
                                            <tr>
                                                <td>${subject.name}</td>
                                                <td><a href="<c:url value='/removeSubject/${subject.idSubject}'/>">Delete</a></td>
                                                <td><button>edit</button></td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                    <!-- /.table-responsive -->

                                </div>

                                <!-- /.panel-body -->
                            </div>
                            <!-- /.panel -->
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                </div>
                <div class="tab-pane fade" id="classes">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    Table of the available cabinets
                                </div>
                                <!-- /.panel-heading -->
                                <div class="panel-body">
                                    <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example4">
                                        <thead>
                                        <tr>
                                            <th>name</th>
                                            <th>starosta</th>
                                            <th>razmer</th>
                                            <th>-//-</th>
                                            <th>-//-</th>
                                        </tr>

                                        </thead>
                                        <tbody>
                                        <c:forEach items="${listClasses}" var="class1" >
                                            <tr>
                                                <td>${class1.className}</td>
                                                <td>${class1.classManager}</td>
                                                <td>${class1.size}</td>
                                                <td><a href="<c:url value='/removeClass/${class1.idClass}'/>">Delete</a></td>
                                                <td><button>edit</button></td>

                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                    <!-- /.table-responsive -->

                                </div>

                                <!-- /.panel-body -->
                            </div>
                            <!-- /.panel -->
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                </div>
            </div>
        </div>

                <div class="modal fade" id="myModal44" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                <h4 class="modal-title" id="myModalLabel44">Create new class</h4>
                            </div>
                            <div class="modal-body">
                                <div class="container-fluid">
                                    <form action="/editCabinet" id="cabinet_edit" method="post" role="form">
                                        <div class="row">
                                            <label>number</label>
                                            <input id="namecabinet1" class="form-control"  name="idCab" disabled="true" autofocus>
                                        </div>
                                        <div class="row">
                                            <label>floor of cabinet</label>
                                            <input id="floor1" class="form-control" name="floor">
                                        </div>
                                        <div class="form-group">
                                            <button type="submit" class="btn btn-primary"  onclick="myFunction()">Edit</button>
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                        </div>
                                    </form>
                                </div>
                                <!-- /.modal-content -->
                            </div>
                            <!-- /.modal-dialog -->
                        </div>
                    </div>
                </div>
        <!-- /.row -->
    </div>
    <!-- /#page-wrapper -->

</div>
    </div>
<!-- /#wrapper -->
    </div>
<!-- jQuery -->
<!-- jQuery -->

<script src="../resources/js/jquery.dataTables.min.js"></script>
<script src="../resources/js/dataTables.bootstrap.min.js"></script>
<script src="../resources/js/dataTables.responsive.js"></script>
<script src="../resources/js/datepicker.js"></script>
<%--<script src="../resources/js/datepicker.js"></script>--%>

<!-- Page-Level Demo Scripts - Tables - Use for reference -->
<script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
            responsive: true
        });
        $('#dataTables-example1').DataTable({
            responsive: true
        });
        $('#dataTables-example2').DataTable({
            responsive: true
        });
        $('#dataTables-example3').DataTable({
            responsive: true
        });
        $('#dataTables-example4').DataTable({
            responsive: true
        });
    });




    $('#datepicker1').datepicker({
        autoclose: true
    })


</script>



</body>
</html>
