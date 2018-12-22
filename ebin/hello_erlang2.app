{application, 'hello_erlang2', [
	{description, "New project"},
	{vsn, "0.1.0"},
	{modules, ['hello_erlang2_app','hello_erlang2_sup','hello_handler','teller']},
	{registered, [hello_erlang2_sup]},
	{applications, [kernel,stdlib,cowboy]},
	{mod, {hello_erlang2_app, []}},
	{env, []}
]}.