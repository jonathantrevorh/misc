<?php
$domain = "http://www.thefremontproject.com";
$start = "/rabbithole/next/68443e5eee15ab334bf56b061c510a2fa9060ec9.html";
// hint: answer is http://www.thefremontproject.com/rabbithole/next/e1603f73fdfb94b3d5ee4ff3fd7c43852d37f21f.html

$next = "";
$wrap = array('id="next-link" href="', '">click here');

while (true) {
    $start = $domain . $start;
    $page = file_get_contents($start);
    $found = preg_match("/" . $wrap[0] . '(.*)' . $wrap[1] . "/", $page, $next);
    $next = $next[1];
    if ($start == $next || !$found) {
        echo "found\n";
        echo $page;
        break;
    }
    $start = $next;
    var_dump($start);
    //usleep(500000);
}

?>
