<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0">

<title>Fetch API Demo</title>

<link rel="stylesheet" href="/css/skyblue.min.css">
<link rel="stylesheet" href="/css/arta.css">
<link rel="stylesheet" href="/css/style.css">

</head>

<body>

<div class="container">

  <h1>JSON API</h1>

  <section>
    <h2>2xx 正常終了</h2>

    <section>
      <p class="api-link"><a href="/api/200" target="_blank"/>/api/200</a></p>

      <dl>
        <dt>リクエスト</dt>
        <dd>
<pre><code class="http">GET /api/200 HTTP/1.1
  Host: example.com</code></pre>
        </dd>

        <dt>レスポンス</dt>
        <dd>
<pre><code class="http">HTTP/1.1 200 OK
Host: example.com
Content-Type: application/json;charset=utf-8
Content-Length: 89

{
    "status": "OK",
    "message": "リクエストは正常に処理されました"
}</code></pre>
        </dd>
      </dl>
    </section>

    <section>
      <h3>壊れたAPI (不正なJSONを返す)</h3>

      <p class="api-link"><a href="/api/200/invalid" target="_blank"/>/api/200/invalid</a></p>

      <dl>
        <dt>リクエスト</dt>
        <dd>
<pre><code class="http">GET /api/200/invalid HTTP/1.1
Host: example.com</code></pre>
        </dd>

        <dt>レスポンス</dt>
        <dd>
<pre><code class="http">
HTTP/1.1 200 OK
Host: example.com
Content-type: application/json;charset=utf-8
Content-Length: 156

{
    "status": "OK. but..."
    "message": "リクエストは正常に処理されました。でも、この JSON には構文エラーがある？"
}</code></pre>
        </dd>
      </dl>
    </section>
  </section>

  <section>
    <h2>4xx クライアントエラー</h2>

    <p class="api-link"><a href="/api/400" target="_blank"/>/api/400</a></p>

    <dl>
      <dt>リクエスト</dt>
      <dd>
<pre><code class="http">GET /api/400 HTTP/1.1
Host: example.com</code></pre>
      </dd>

      <dt>レスポンス</dt>
      <dd>
<pre><code class="http">HTTP/1.1 400 Bad Request
Host: example.com
Content-Type: application/json;charset=utf-8
Content-Length: 80

{
    "status": "Bad Request",
    "message": "不正なリクエストです"
}</code></pre>
      </dd>
    </dl>
  </section>

  <section>
    <h2>5xx サーバーエラー</h2>

    <p class="api-link"><a href="/api/500" target="_blank"/>/api/500</a></p>

    <dl>
      <dt>リクエスト</dt>
      <dd>
<pre><code class="http">GET /api/500 HTTP/1.1
Host: example.com</code></pre>
      </dd>

      <dt>レスポンス</dt>
      <dd>
<pre><code class="http">HTTP/1.1 500 Internal Server Error
Host: example.com
Content-Type: application/json;charset=utf-8
Content-Length: 117

{
    "status": "Internal Server Error",
    "message": "リクエストの処理中にエラーが起きました"
}</code></pre>
      </dd>
    </dl>
  </section>
</div><!-- /.container -->

<script src="/js/highlight.pack.js"></script>
<script>hljs.initHighlightingOnLoad();</script>

</body>
</html>
