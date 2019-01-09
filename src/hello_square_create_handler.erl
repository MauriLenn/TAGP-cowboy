-module(hello_square_create_handler).
-behavior(cowboy_handler).

-export([init/2]).

init(Req0, State) ->
    create_Installation:start(),
    Req = cowboy_req:reply(303, #{<<"location">> => <<"/square_installations/pipes">>}, Req0),
    {ok, Req, State}.