<?php

$accounts = mysql_connect("localhost", "root", "goldenbear")
or die (mysql_error());

mysql_select_db("users", $accounts);

$sql = "
INSERT INTO users2db(Username, Password, First, Last) VALUES('nleveroni','nicolas82', 'Nicolas','Leveroni')
";

mysql_query($sql, $accounts);

?>
