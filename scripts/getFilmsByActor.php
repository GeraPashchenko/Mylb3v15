<?php 
header("Content-Type: text/xml");
header("Cache-Control: no-cahe, must-revalidate");

include("dbConnect.php");
$name = $_GET['name'];

$stmt = $db->prepare("SELECT * FROM film WHERE ID_FILM IN (SELECT FID_FILM FROM FILM_ACTOR WHERE FID_Actor = (SELECT ID_Actor FROM Actor Where name = ?));");
$stmt->execute(array($name));


echo "<?xml version='1.0' encoding='utf-8'?>";
echo "<films>";

while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
    print "<film><name>".$row['name']."</name></film>";
}

echo "</films>";
?>
