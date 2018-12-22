-module(hello_erlang2_app).
-behaviour(application).

-export([start/2]).
-export([stop/1]).

% clear TCP listener + secure TLS listener in comment
% Clients connecting to Cowboy on the clear listener port are expected to use either HTTP/1.1 or HTTP/2

% API

start(_Type, _Args) ->
	 Dispatch = cowboy_router:compile([
        {"/", cowboy_static, {priv_file, hello_erlang2_app, "index.html"}}
    ]),
    {ok, _} = cowboy:start_clear(my_http_listener,
       [{port, 8080}],
       #{env => #{dispatch => Dispatch}}
    ),
    %{ok, _} = cowboy:start_tls(my_http_listener,
    %    [
    %        {port, 8443},
    %        {certfile, "/path/to/certfile"},
    %        {keyfile, "/path/to/keyfile"}
    %    ],
    %    #{env => #{dispatch => Dispatch}}),
    hello_erlang2_sup:start_link().

stop(_State) ->
	ok.


%% internal functions
