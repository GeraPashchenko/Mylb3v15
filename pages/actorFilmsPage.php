<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Films</title>
  <script>
const ajax = new XMLHttpRequest();

function get(){
    let name = document.getElementById("name").value;
    ajax.open("GET", "../scripts/getFilmsByActor.php?name="+ name, false);
    
    ajax.send();

    if(ajax.status === 200){
        var text = document.getElementById('text');
        var res = "";
        let films = ajax.responseXML.firstChild.children;
        for(var i = 0; i < films.length; i++){
          res += "<tr>";
          res += "<td>" + films[i].children[0].textContent + "</td>";
          res += "<tr>";
        }
        text.innerHTML = res;
      }
}
</script>
</head>
<body>
<?php
include("../scripts/dbConnect.php");

$actorSql = 'SELECT `name` FROM `actor`';

echo '<form method="get">';

echo "<select id ='name'><option> Выбрать актера </option>";

foreach($db->query($actorSql) as $row) {
    echo "<option value='" . $row['name'] . "'>" . $row['name'] . "</option>";
}

echo "</select>";
echo '<input type="button" onclick="get()" value="ОК"><br>';
echo "</form>";
?>
<table style="border: 1px solid"><tr><th> Film </th></tr>
<tbody id = "text"></tbody>

</body>
</html>



