-module(hello_erlang2_app).
-behaviour(application).

-export([start/2]).
-export([stop/1]).


start(_Type, _Args) ->
	Dispatch = cowboy_router:compile([ {'_', [
                                                % {" URL ", cowboy_static, {priv_file, hello_erlang2, " FILE PATH ", [{mimetypes, cow_mimetypes, all}]}}
                                                {"/", cowboy_static, {priv_file, hello_erlang2, "main.html", [{mimetypes, cow_mimetypes, all}]}},

                                                %{"/index", cowboy_static, {priv_file, hello_erlang2, "index.html"}},

                                                %pipes
                                                {"/square_installations/pipes", cowboy_static, {priv_file, hello_erlang2, "square_installations/pipes/pipes.html", [{mimetypes, cow_mimetypes, all}]}},
                                                {"/square_installations/pipes/image", hello_image_handler, []},
                                                {"/square_installations/pipes/create", hello_square_create_handler, []},
                                                {"/square_installations/pipes/terminate", hello_square_terminate_handler, []},

                                                %pipes_pump
                                                {"/square_installations/pipes_pump", cowboy_static, {priv_file, hello_erlang2, "square_installations/pipes_pump/pipes_pump.html", [{mimetypes, cow_mimetypes, all}]}},

                                                %pipes_pump_flowmeter
                                                {"/square_installations/pipes_pump_flowmeter", cowboy_static, {priv_file, hello_erlang2, "square_installations/pipes_pump_flowmeter/pipes_pump_flowmeter.html", [{mimetypes, cow_mimetypes, all}]}},

                                                %pipes_pump_flowmeter_heatexchanger
                                                {"/square_installations/pipes_pump_flowmeter_heatexchanger", cowboy_static, {priv_file, hello_erlang2, "square_installations/pipes_pump_flowmeter_heatexchanger/pipes_pump_flowmeter_heatexchanger.html", [{mimetypes, cow_mimetypes, all}]}}
                                        ]}
                                    ]),
    
    %Dispatch = cowboy_router:compile([ {'_', [{"/", hello_handler, []}]}]),
    {ok, _} = cowboy:start_clear(my_http_listener,
       [{port, 8080}],
       #{env => #{dispatch => Dispatch}}
    ),
    hello_erlang2_sup:start_link().

stop(_State) ->
	ok.
