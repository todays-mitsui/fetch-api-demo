<?php

require_once(__DIR__."/../vendor/autoload.php");


$app = new \Slim\App;

$app->get("/", function ($request, $response) {
    $tpl = file_get_contents("index.tpl");

    return $response->write($tpl);
});

$app->get("/api/200", function ($request, $response) {
    $data = [
        "status"  => "OK",
        "message" => "リクエストは正常に処理されました",
    ];

    return $response->withJson($data, 200, JSON_PRETTY_PRINT|JSON_UNESCAPED_UNICODE);
});

$app->get("/api/200/invalid", function ($request, $response) {
    // わざと不正な JSON を書く
    // この JSON には区切りのカンマが足りない
    $data = <<< EOD
{
    "status": "OK. but..."
    "message": "リクエストは正常に処理されました。でも、この JSON には構文エラーがある？"
}
EOD;

    return $response->withHeader('Content-type', 'application/json;charset=utf-8')
                    ->write($data);
});

$app->get("/api/400", function ($request, $response) {
    $data = [
        "status"  => "Bad Request",
        "message" => "不正なリクエストです",
    ];

    return $response->withJson($data, 400, JSON_PRETTY_PRINT|JSON_UNESCAPED_UNICODE);
});

$app->get("/api/500", function ($request, $response) {
    $data = [
        "status"  => "Internal Server Error",
        "message" => "リクエストの処理中にエラーが起きました",
    ];

    return $response->withJson($data, 500, JSON_PRETTY_PRINT|JSON_UNESCAPED_UNICODE);
});

$app->run();
