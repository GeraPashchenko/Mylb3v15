<?php 
include("dbConnect.php");
date_default_timezone_set('UTC');
$string1 = $_GET['yearStart'];
$string1 .= '-01-01';
$string2 = $_GET['yearEnd'];
$string2 .= '-01-01';

$stmt = $db->prepare("SELECT * FROM `film` WHERE `date` >= ? AND `date` <= ?;");
$stmt->execute(array($string1, $string2));

while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
    echo "<tr><td style = 'border: 1px solid'>".$row['name']."</td></tr>";
}
?>