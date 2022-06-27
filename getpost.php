<?php
include_once "configmutah.php";



if ($_SERVER['REQUEST_METHOD'] == 'POST'){



    $Course_name =  $_POST['Course_name'];
    $sql = "SELECT * FROM `post` WHERE Course like '$Course_name' " ;
    $res= mysqli_query($conn, $sql);

    $num_row= mysqli_num_rows($res);
   
   
    while($row = mysqli_fetch_assoc($res)) {

      $data[]=$row;
    
    }
    
  
   if($num_row  > 0)
{
 
 echo json_encode($data);

}

elseif($num_row == 0)
{     
 echo json_encode("false");
 
}


    
}



?>