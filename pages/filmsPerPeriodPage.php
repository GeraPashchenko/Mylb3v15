<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Films</title>
  <script>
const ajax = new XMLHttpRequest();

function get(){
    let yearStart = document.getElementById("yearStart").value;
    let yearEnd = document.getElementById("yearEnd").value;
    ajax.onreadystatechange = update;
    ajax.open("GET", "../scripts/getFilmsByYears.php?yearStart="+ yearStart +"&yearEnd=" + yearEnd);
    
    ajax.send(null);
}

  function update(){
    if(ajax.readyState === 4){
      if(ajax.status === 200){
        var text = document.getElementById('text');
        text.innerHTML = ajax.responseText;
      }
    }
  }
</script>
</head>
<body>
<?php

// устанавливаем первый и последний год диапазона
$yearArray = range(2000, 2050);
echo '<form id="formA" method="GET">';

echo "<select id= 'yearStart'><option> Начальный год </option>";

  foreach ($yearArray as $year) {
    echo '<option '.$year.' value="'.$year.'">'.$year.'</option>';
  }
    echo "</select>";

echo "<select id='yearEnd'><option> Конечный год </option>";

    foreach ($yearArray as $year) {
        echo '<option '.$year.' value="'.$year.'">'.$year.'</option>';
    }
    echo "</select>";
echo '<input type="button" onclick = "get()" value="ОК"><br>';
echo '</form>';
?>

<table style="border: 1px solid"><tr><th>Film</th></tr>
<tbody id = "text"></tbody>

</body>
</html>