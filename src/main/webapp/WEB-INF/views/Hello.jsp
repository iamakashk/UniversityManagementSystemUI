<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	
	var tableString = "<table>";
	var tableStr = "<table><th>FIRST NAME</th><th>LAST NAME</th><th>STUDENT NAME</th>	<th>	STUDENT NAME	</th><tr>	</tr>	</table>";
	 $.ajax({
        url: "http://localhost:9966/management/getAllCourses",
        contentType: "application/json",
        dataType: 'json',
        success: function(result){
           
            var data = result;
            var courseName ="";
            for(var i = 0 ; i < data.length; i++){
            	
            	//tableHeader = "<tr><td>"+ data[i].course_id+"</td>+<td>"+ data[i].course_name+"</td></tr>"
            	courseName += "<tr><td>COURSE NAME : "+ data[i].course_name+ "</td></tr>";
            	var student = data[i].student;
            	courseName += "<tr><td>ID</td> <td>NAME</td></tr>";
            	courseName += "<tr><td>Student Details </td></tr>";
            	for(var j = 0 ; j < student.length; j++){
            		
            		courseName += "<tr><td>"+student[j].student_id+"</td><td>" +student[j].student_first_name +" "+ student[j].student_last_name + "</td></tr>";	
            	}
            	courseName += "<tr><td>Faculty Details</td></tr>"
            		var faculty = data[i].faculty;
            	for(var k = 0 ; k < faculty.length; k++){
                		
                		courseName += "<tr><td>"+faculty[k].faculty_id+"</td><td>" +faculty[k].faculty_first_name +" "+ faculty[k].faculty_last_name + "</td></tr>";	
                	}
            	
				            	
            }
           
            document.getElementById("myDynamicTable").innerHTML ="<table>"+ courseName+ "</table>";
            //console.log(data[0].student_id,"-------------------")
        }
    }) 
	

	});
	

</script>
<body>
<H1>UNIVERSITY MANAGEMENT SYSTEM</H1>
<hr>
<a href="/SystemUI/getStudents">Go to Students Page</a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="/SystemUI/getCourses">Go to Courses Page</a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="/SystemUI/getFaculty">Go to Faculty Page</a>
<hr>
</br>

<div id="myDynamicTable"></div>
</body>
</html>