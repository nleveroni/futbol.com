<?php
$host = "localhost";
$user = "root";
$pass = "goldenbear";
$db = "users";


mysql_connect($host, $user, $pass) or die("unable to connect");
mysql_select_db($db);
if (isset($_POST['username'])){
  $username = $_POST['username'];
  $password = $_POST['password'];
  $sql = "SELECT * FROM userstb WHERE username='".$username."' AND password='".$password."' LIMIT 1";

  $res = mysql_query($sql);
  if (mysql_num_rows($res) == 1) {
    header("Location:http://ec2-54-201-171-215.us-west-2.compute.amazonaws.com/write.php");
    echo "You have succesfully logged in.";
    exit();
  } else {
    echo "Invalid login information. Please return to the previous page";
    exit();
  }
}
?>


<!DOCTYPE html>
<html>
  <head>
    <title>PHP Login</title>
  </head>
  <body>
    <form method="post" action="login.php">
      Username: <input type="text" name="username" /> <br/>
      Password: <input type="password" name="password" /> <br/>
      <input type="submit" name="submit" value="Log in" />
    </form>
    
  </body>
</html>
