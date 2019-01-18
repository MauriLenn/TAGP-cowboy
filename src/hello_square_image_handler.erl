-module(hello_square_image_handler).
-behavior(cowboy_handler).

-export([init/2]).

init(Req0, State) ->
   
    Req = cowboy_req:reply(200, #{<<"content-type">> => "image/png"}, {sendfile, 0, 12179, "image1.png"}, Req0),
    {ok, Req, State}.