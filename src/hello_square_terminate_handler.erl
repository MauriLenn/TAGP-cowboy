-module(hello_square_terminate_handler).
-behavior(cowboy_handler).

-export([init/2]).

init(Req0, State) ->
    create_Installation:stop(),
    Req = cowboy_req:reply(303, #{<<"location">> => <<"/">>}, Req0),
    {ok, Req, State}.