<?php

// load composer
require('/var/www/vendor/autoload.php');

// function to discover current branch
function get_branch() {
	$domain = '.localhost.testmy.cloud';
	$host = getenv('HTTP_HOST');
	$branch = preg_replace('#'.$domain.'$#', '', $host);
	return $branch;
}

// debug, print which branch we're in currently.
echo "<h1>Hello world!</h1>";
echo "<p>I am branch <strong>".get_branch()."</strong></p>";
