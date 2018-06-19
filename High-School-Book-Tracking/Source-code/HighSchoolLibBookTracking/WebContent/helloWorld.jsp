<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hello World</title>
<script>

function getinfo() {

var liftType = document.getElementById('liftType');
var liftSelect = liftType.options[liftType.selectedIndex].value;

if (liftSelect == 1) {

<? include ('helloWorld.jsp')?>
}else {
console.log('not the best choice')
}
}
</script>
</head>
<body>
<h1>Hello Java world!!</h1>
<form>
<label for="liftType">Lift Type: </label>
<select name="liftType" id="liftType" onchange="getinfo()">
<option></option>
<option value="1">Straight</option>
<option value="2">Curved</option>
<option value="3">Straight Rail Config</option>
</select>
<noscript><input type="submit" value="Submit" onchange="getinfo()"></noscript>
</form>
<br><br>
</body>
</html>