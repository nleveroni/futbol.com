<!DOCTYPE html>
<html>
  <head>
    <title> </title>
  </head>
  <body>
    <form method="post" action="write.php">
      Nombre: <input type="text" name="jugador" /> 
      <input type="submit" name="submit" value="Jugar!" />
      <br>
    </form>


  </body>

</html>
<?php
/*
Instructions to connect to the database
*/
$host = "localhost";
$user = "root";
$pass = "goldenbear";
$database = "games";
$connect = mysql_connect($host, $user, $pass)
or die (mysql_error()); /*this connects to the database*/
mysql_select_db($database, $connect); /*selects the correct database*/
$player_name = $_POST['jugador'];
$sql_query = "INSERT INTO game1(PlayerName) VALUES('".$player_name."')";
mysql_query($sql_query, $connect);
$sql_query2 = "SELECT * FROM game1";
$results = mysql_query($sql_query2, $connect);
while($row = mysql_fetch_array($results)){
  $username = $row['PlayerName'];
  $idNumber = $row['id'];
  echo $idNumber . " | " . $username . "<br>";
}


?>
