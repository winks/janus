<?php
require __DIR__ . '/ExpressionParser.php';

$parser = new ExpressionParser();


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
    echo $ex->getTraceAsString().PHP_EOL;
}
