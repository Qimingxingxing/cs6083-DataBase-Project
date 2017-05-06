<?php


//$dbc = mysqli_connect("localhost","root","","db_project");
////$query = "select max(pid) as pid from Project";
//$tmp = mysqli_query($dbc, "select max(pid) as pid from Project");
//$row = $tmp->fetch_assoc();
//$pid = $row['pid'] + 1;
//echo $row['pid'];
//echo $pid;
//while($row = $result->fetch_assoc()) {
//    echo $row['pid'];

$dbc = mysqli_connect("localhost","root","","db_project");
$pid = 2;
//echo $pid;


if(isset($_POST['rate_button'])){
    echo "this is good";
    unset($_POST['rate_star']);
}

?>


<form role ="form" class="form-inline" action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post">
    <div class ="modal-body">
        Rate the project from 1 to 5 stars<br/>
            <input id="input-21e" name="rate_star" value="1" type="number" class="rating" min=1 max=5 step=1 data-size="xs" >
            <br/>
        </div>
        <div class ="modal-footer">
            <button class="btn btn-default" data-dismiss="modal">Close</button>
<!--            <button type="submit" class="btn btn-success" name="rate_button" >Rate</button>-->
            <input type="submit" name="rate_button" value="Rate Project" class="btn btn-success">
        </div>
</form>



<div class="tab-content tabs">
    <br role="tabpanel" class="tab-pane fade in active" id="Section1">
    <?php
    foreach($text_upload as $value){
        echo $value.'<br>';
    }
    ?>
    <?php
    function foo($movie) {
        echo"
                                        <div class='col-md-6'>
                                            <div class='entry clearfix'>
                                                <div class='entry-image'>
                                                    <iframe src = $movie frameborder='0' width='500' height='281' webkitallowfullscreen  allowfullscreen></iframe>
                                                </div>
                                            </div>
                                        </div>";
    }
    $movie_upload =array('http://player.vimeo.com/video/87701971', 'https://www.youtube.com/watch?v=WkM2Tqy-_OY','https://www.youtube.com/watch?v=zDJfLjUTapA');
    foreach($movie_upload as $movie) {
        $a = $movie;
        foo($a);
        break;
    }
    ?>
    <br></br><br></br><br></br><br></br><br></br><br></br><br></br>
    <div class="form-group">
        <label for="comment">Text:</label>
        <textarea class="form-control" rows="1" id="comment"></textarea>
    </div>
</div>





<!--                                <form class="form-inline" action="/action_page.php">-->
<!--                                    <div class="col-xs-12">-->
<!--                                    <div class="form-group">-->
<!--                                        <label for="comment">Text:</label>-->
<!--                                        <textarea class="form-control" rows="1" id="comment"></textarea>-->
<!--                                    </div>-->
<!--                                </div>-->
<!--                                    <input type="button" class="btn btn-info" value="Input Button">-->
<!--                                <br></br><br></br>-->


<!--                                <form class="form-horizontal" action='/Crowdfunding/Code/project.php?projectID=1'>-->
<!--                                        <div class="col-xs-12">-->
<!--                                            <div class="form-group">-->
<!--<!--                                                <label for="comment">Text:</label>-->-->
<!--<!--                                                <input name="submit_comment" class="form-control" tows = "1" placeholder="Enter your thoughts!" >-->-->
<!--<!--                                                <input type="submit" name="add_comment" value="Add comment" class="btn btn-success" />-->-->
<!---->
<!---->
<!--                                            </div>-->
<!--                                        </div>-->
<!--<!--                                        <button type="submit" class="btn btn-default">Updates!</button>-->-->
<!--                                        <div class="form-group">-->
<!--                                            <input type="submit" name="add_comment" value="--><?php //echo $projectID?><!--" class="btn btn-success" />-->
<!--                                        </div>-->

<!--                                </form>-->