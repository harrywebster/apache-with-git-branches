<?php

// function to discover current branch
function get_branch() {
	$domain = '.development.thirstytuesday.com';
	$host = getenv('HTTP_HOST');
	$branch = preg_replace('#'.$domain.'$#', '', $host);
	return $branch;
}

echo "<pre>";
echo "Hello world! - I am branch ".get_branch();
echo "</pre>";