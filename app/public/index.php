<?php

// function to discover current branch
function get_branch() {
	$domain = '.sample.testcode.work';
	$host = getenv('HTTP_HOST');
	$branch = preg_replace('#'.$domain.'$#', '', $host);
	return $branch;
}

echo "<h1>Hellow world!</h1>";
echo "<p>I am branch <strong>".get_branch()."</strong></p>";
