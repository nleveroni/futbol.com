<?php
//Database Connection Constants
define('DB_HOST','localhost');
define('DB_USER','root');
define('DB_PASSWORD','goldenbear');
define('DB_SCHEMA','users');
define('DB_TBL_PREFIX', 'KV_');
//establish a connection to the database
if(!$GLOBALS['DB'] = mysql_connect(DB_HOST, DB_USER, DB_PASSWORD)){
		   die('Error:Unable to stablish a connection');
}
if(!mysql_select_db(DB_SCHEMA, $GLOBALS['DB'])){
			       mysql_close($GLOBALS['DB']);
			       die('Error: Unable to select database schema');
}
?>