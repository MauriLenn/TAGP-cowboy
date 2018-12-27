-module(hello_handler).
-behavior(cowboy_handler).

-export([init/2]).

init(Req0, State) ->
    Body = [<<"<html>
<head>
        <meta charset=\"utf-8\">
        <title>Teller!</title>
</head>
<body>
  <h1>Teller</h1>
  <p>De tellerwaarde is </p>
  <p>Herlaad om de nieuwe waarde van de teller te zien.</p>
</body>
</html>">>],
    Req = cowboy_req:reply(200, #{<<"content-type">> => <<"text/html">>}, Body, Req0),
    {ok, Req, State}.