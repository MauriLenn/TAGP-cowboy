-module(hello_square_p_f_e_create_handler).
-behavior(cowboy_handler).

-export([init/2]).

init(Req0, State) ->
    create_Installation:start_square_pipes_fluid_pump_flowmeter_heatexchanger(),
    Req = cowboy_req:reply(303, #{<<"location">> => <<"/square_installations/pipes_pump_flowmeter_heatexchanger">>}, Req0),
    {ok, Req, State}.