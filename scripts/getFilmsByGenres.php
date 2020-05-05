<?php 
include("dbConnect.php");
$name = $_GET['name'];

$stmt = $db->prepare("SELECT * from `FILM` where `ID_FILM` IN (SELECT `FID_FILM` from `FILM_GENRE` where `FID_Genre` = (SELECT `ID_Genre` FROM `genre` WHERE `title` = ?));");
$stmt->execute(array($name));

$result = [];
while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
    array_push ($result, $row['name']);
}

echo json_encode($result);
?>