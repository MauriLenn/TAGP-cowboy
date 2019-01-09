{application, 'hello_erlang2', [
	{description, "New project"},
	{vsn, "0.1.0"},
	{modules, ['connector','create_Installation','flowMeterInst','flowMeterTyp','fluidumInst','fluidumTyp','heatExchangeLink','heatExchangerInst','heatExchangerTyp','hello_erlang2_app','hello_erlang2_sup','hello_handler','hello_image_handler','hello_square_create_handler','location','msg','pipeInst','pipeTyp','pumpInst','pumpTyp','resource_instance','resource_type','survivor','survivor2']},
	{registered, [hello_erlang2_sup]},
	{applications, [kernel,stdlib,cowboy]},
	{mod, {hello_erlang2_app, []}},
	{env, []}
]}.