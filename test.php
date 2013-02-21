<?php
require __DIR__ . '/simple.php';

$lookup = array(
    'f2o2o3o' => 2.14,
    'foo23'   => 3.24,
    'foobar'  => 3.34,
);

$parser = new ExprParser($lookup);


if (!isset($argv[1])) {
    echo "Usage: {$argv[0]} path/to/file";
    exit(1);
}

$input = rtrim(file_get_contents($argv[1]));

try {
    $ret = $parser->parse($input);
    echo ":RESULT:";
    var_dump($input, $ret);
} catch (Exception $ex) {
    echo $ex->getTraceAsString();
}
