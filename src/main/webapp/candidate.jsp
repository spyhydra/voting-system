<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Participant Signup</title>
</head>
<body>
<h2>Participant Signup</h2>

<form action="addParticipant" method="post">
    Name: <input type="text" name="name" required><br>
    <label for="competition">Choose a competition:</label>
    <select id="competition" name="competition">
        <option value="dance">Dance</option>
        <option value="ramewalk">Ramwalk</option>
        <option value="presentation">Presentation</option>
    </select>
    <input type="submit" value="Add">
</form>
</body>
</html>
