<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
function getAllCourses(){
	alert("inside getAllCourses")
}


</script>
</head>
<body>
<h1>STUDENT DETAILS</h1>
First Name	: <input type="text" value="" id="student_first_name">
</br>
</br>
Last Name	: <input type="text" value="" id="student_first_name">
</br>
</br>
Course		: <button onClick = "getAllCourses()">GET ALL COURSES</button> <div id="coursesDropdown"></div>
<hr>
<button onClick = "studentActions('D')">ADD</button>
&nbsp;&nbsp;
<button onClick = "studentActions('D')">DELETE</button>
&nbsp;&nbsp;
<button onClick = "studentActions('U')">UPDATE</button>
&nbsp;&nbsp;
<button onClick = "studentActions('A')">VIEW ALL</button>
</body>
</html>