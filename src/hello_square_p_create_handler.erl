-module(hello_square_p_create_handler).
-behavior(cowboy_handler).

-export([init/2]).

init(Req0, State) ->
    create_Installation:start_square_pipes_fluid_pump(),
    Req = cowboy_req:reply(303, #{<<"location">> => <<"/square_installations/pipes_pump">>}, Req0),
    {ok, Req, State}.