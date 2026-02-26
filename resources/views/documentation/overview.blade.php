<x-layout>

    <body>

        <div class="container-fluid">
            <div class="row" style="padding-left:0px; background-color: #fafafa;">
                <div class="col-sm-1" style="padding-left:0px; padding-top: 100px">

                </div>
                <div class="col-sm-10" style="padding-left:300px; padding-top: 100px">
                    <?php
                    
                    $username = 'admin';
                    $password = 'HTY2tb67Lfpv3YevzmhX';
                    $servername = 'database-confluence-instance-1-us-east-2c.csewql4qdzl4.us-east-2.rds.amazonaws.com';
                    
                    $db = 'dbulum1pidfbxd';
                    
                    // Create connection
                    $conn = new mysqli($servername, $username, $password, $db);
                    
                    $sqlQuery = "SELECT `COLUMN_NAME` FROM `INFORMATION_SCHEMA`.`COLUMNS` WHERE `TABLE_SCHEMA`='dbulum1pidfbxd' AND `TABLE_NAME`='Contacts' ORDER BY `COLUMN_NAME` ASC";
                    $result = mysqli_query($conn, $sqlQuery);
                    $row = mysqli_fetch_all($result, MYSQLI_ASSOC);
                    $j = 0;
                    echo "<title-text>Contact's Fields: </title-text>";
                    
                    if (count($row2) > 0) {
                        echo '<ul class="list-group list-group-flush">';
                    }
                    while ($j < count($row)) {
                        if (!strpos($row[$j]['COLUMN_NAME'], '_')) {
                            echo '<li class="list-group-item">';
                            echo $row[$j]['COLUMN_NAME'] . ' ';
                            echo '</li>';
                        }
                        $j++;
                    }
                    if (count($row) > 0) {
                        echo '</ul>';
                    }
                    
                    echo '<br><br>';
                    echo "<title-text>Coupling's Fields: </title-text>";
                    $sqlQuery2 = "SELECT `COLUMN_NAME` FROM `INFORMATION_SCHEMA`.`COLUMNS` WHERE `TABLE_SCHEMA`='dbulum1pidfbxd' AND `TABLE_NAME`='Coupling' AND `COLUMN_NAME` NOT IN (SELECT `COLUMN_NAME` FROM `INFORMATION_SCHEMA`.`COLUMNS` WHERE `TABLE_SCHEMA`='dbulum1pidfbxd' AND `TABLE_NAME`='Contacts') ORDER BY `COLUMN_NAME` ASC";
                    $result2 = mysqli_query($conn, $sqlQuery2);
                    $row2 = mysqli_fetch_all($result2, MYSQLI_ASSOC);
                    $i = 0;
                    
                    if (count($row2) > 0) {
                        echo '<ul class="list-group list-group-flush">';
                    }
                    while ($i < count($row2)) {
                        if (!strpos($row2[$i]['COLUMN_NAME'], '_')) {
                            echo '<li class="list-group-item">';
                            echo $row2[$i]['COLUMN_NAME'] . ' ';
                            echo '</li>';
                        }
                        $i++;
                    }
                    if (count($row2) > 0) {
                        echo '</ul>';
                    }
                    mysqli_close($conn);
                    
                    ?>
                </div>
            </div>
        </div>

    </body>

</x-layout>
