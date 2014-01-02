<?php
$accounts = mysql_connect("localhost", "root", "goldenbear")
or die(mysql_error());

mysql_select_db("users", $accounts);
$sql ="
SELECT * FROM users2db
";

$result = mysql_query($sql, $accounts);
while($row = mysql_fetch_array($result)){
$username = $row['Username'];

echo $username . "<br>";

}

?>
