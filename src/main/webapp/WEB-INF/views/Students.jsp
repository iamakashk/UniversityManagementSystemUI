<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	function getAllCourses() {
		alert("inside getAllCourses");
		var tableString = "<table>";
		var tableStr = "<table><th>FIRST NAME</th><th>LAST NAME</th><th>STUDENT NAME</th>	<th>	STUDENT NAME	</th><tr>	</tr>	</table>";
		$
				.ajax({
					url : "http://localhost:9966/management/getAllCourses",
					contentType : "application/json",
					dataType : 'json',
					success : function(result) {

						var data = result;
						var coursesDetails = "";
						for (var i = 0; i < data.length; i++) {

							coursesDetails += "<option value='"+ data[i].course_id + "'>"
									+ data[i].course_name + "</option>";
						}

						document.getElementById("coursesDropdown").innerHTML = "<select id='courses'>"
								+ coursesDetails + "</select>";
					}
				})

	}
	function studentActions(action) {
		//alert(action);
		var studentName = "";
		var studentLastName = "";
		var studentCourse = "";
		if (document.getElementById("student_first_name").value.trim() != "") {
			studentName = document.getElementById("student_first_name").value;
		} else {
			alert("enter first name");
			return false;
		}
		if (document.getElementById("student_last_name").value.trim() != "") {
			studentLastName = document.getElementById("student_last_name").value;
		} else {
			alert("enter last name");
			return false;
		}

		var courses = document.getElementById("courses");
		var courseValue = courses.options[courses.selectedIndex].value;
		var studentString = '{' + '"uc_id":' + courseValue + ','
				+ '"student_first_name": " ' + studentName + '"' + ','
				+ '"student_last_name":' + studentLastName + '"' + '}';
		//alert(studentString)
		if(action.trim() === "A"){
			$.ajax({
				url : 'http://localhost:9966/management/addStudent',
				type : 'POST',
				contentType : 'application/json',
				data : JSON.stringify({
					student_first_name : studentName,
					student_last_name : studentLastName,
					uc_id : courseValue

				}),
				dataType : 'json',
				success:function(data){
					alert("data has been successfully inserted.")
				}
			});			
		}

	}
</script>
</head>
<body>
	<h1>STUDENT DETAILS</h1>
	First Name :
	<input type="text" value="" id="student_first_name">
	</br>
	</br> Last Name :
	<input type="text" value="" id="student_last_name">
	</br>
	</br> Course :
	<div>
		<button onClick="getAllCourses()">GET ALL COURSES</button>
		<div id="coursesDropdown"></div>
	</div>
	<hr>
	<button onclick="studentActions('A');">ADD</button>
	&nbsp;&nbsp;
	<button onclick="studentActions('D');">DELETE</button>
	&nbsp;&nbsp;
	<button onclick="studentActions('U');">UPDATE</button>
	&nbsp;&nbsp;
	<button onclick="studentActions('A');">VIEW ALL</button>
</body>
</html>