-module(create_Installation).
-export([stop/0]).
-export([start_square_pipes/0, start_square_pipes_fluid/0]).
-export([start_square_pipes_fluid_pump/0, start_square_pipes_fluid_pump_flowmeter/0]).
-export([start_square_pipes_fluid_pump_flowmeter_heatexchanger/0]).

start_square_pipes() -> 
    survivor:start(),

    {ok, PipeTypPID} = resource_type:create(pipeTyp,[]),

    {ok, PipeInstPID1} = resource_instance:create(pipeInst, [self(), PipeTypPID]),
    {ok, PipeInstPID2} = resource_instance:create(pipeInst, [self(), PipeTypPID]),
    {ok, PipeInstPID3} = resource_instance:create(pipeInst, [self(), PipeTypPID]),
    {ok, PipeInstPID4} = resource_instance:create(pipeInst, [self(), PipeTypPID]),
    Pipes = [PipeInstPID1, PipeInstPID2, PipeInstPID3, PipeInstPID4],

    {ok, [Pip1con1, Pip1con2]} = resource_instance:list_connectors(PipeInstPID1),
    {ok, [Pip2con1, Pip2con2]} = resource_instance:list_connectors(PipeInstPID2),
    {ok, [Pip3con1, Pip3con2]} = resource_instance:list_connectors(PipeInstPID3),
    {ok, [Pip4con1, Pip4con2]} = resource_instance:list_connectors(PipeInstPID4),
    Cons = [[Pip1con1, Pip1con2], [Pip2con1, Pip2con2], [Pip3con1, Pip3con2], [Pip4con1, Pip4con2]],

    connector:connect(Pip1con2, Pip2con1),
    connector:connect(Pip2con2, Pip3con1),
    connector:connect(Pip3con2, Pip4con1),
    connector:connect(Pip4con2, Pip1con1),

    {ok, [Location1]} = resource_instance:list_locations(PipeInstPID1),
    {ok, [Location2]} = resource_instance:list_locations(PipeInstPID2),
    {ok, [Location3]} = resource_instance:list_locations(PipeInstPID3),
    {ok, [Location4]} = resource_instance:list_locations(PipeInstPID4),
    Locations = [Location1, Location2, Location3, Location4],

    {ok, {PipeTypPID, Pipes, Cons, Locations}}.

start_square_pipes_fluid() -> 
    survivor:start(),

    {ok, PipeTypPID} = resource_type:create(pipeTyp,[]),

    {ok, PipeInstPID1} = resource_instance:create(pipeInst, [self(), PipeTypPID]),
    {ok, PipeInstPID2} = resource_instance:create(pipeInst, [self(), PipeTypPID]),
    {ok, PipeInstPID3} = resource_instance:create(pipeInst, [self(), PipeTypPID]),
    {ok, PipeInstPID4} = resource_instance:create(pipeInst, [self(), PipeTypPID]),
    Pipes = [PipeInstPID1, PipeInstPID2, PipeInstPID3, PipeInstPID4],

    {ok, [Pip1con1, Pip1con2]} = resource_instance:list_connectors(PipeInstPID1),
    {ok, [Pip2con1, Pip2con2]} = resource_instance:list_connectors(PipeInstPID2),
    {ok, [Pip3con1, Pip3con2]} = resource_instance:list_connectors(PipeInstPID3),
    {ok, [Pip4con1, Pip4con2]} = resource_instance:list_connectors(PipeInstPID4),
    Cons = [[Pip1con1, Pip1con2], [Pip2con1, Pip2con2], [Pip3con1, Pip3con2], [Pip4con1, Pip4con2]],

    connector:connect(Pip1con2, Pip2con1),
    connector:connect(Pip2con2, Pip3con1),
    connector:connect(Pip3con2, Pip4con1),
    connector:connect(Pip4con2, Pip1con1),

    {ok, [Location1]} = resource_instance:list_locations(PipeInstPID1),
    {ok, [Location2]} = resource_instance:list_locations(PipeInstPID2),
    {ok, [Location3]} = resource_instance:list_locations(PipeInstPID3),
    {ok, [Location4]} = resource_instance:list_locations(PipeInstPID4),
    Locations = [Location1, Location2, Location3, Location4],

    FluidTyp = fluidumTyp:create(),
    {ok, Fluid} = fluidumInst:create(Pip1con1, FluidTyp),
    location:arrival(Location1,Fluid),
	location:arrival(Location2,Fluid),
	location:arrival(Location3,Fluid),
    location:arrival(Location4,Fluid),

    {ok, {PipeTypPID, Pipes, Cons, Locations, FluidTyp, Fluid}}.

start_square_pipes_fluid_pump() -> 
    survivor:start(),

    {ok, PipeTypPID} = resource_type:create(pipeTyp,[]),

    {ok, PipeInstPID1} = resource_instance:create(pipeInst, [self(), PipeTypPID]),
    {ok, PipeInstPID2} = resource_instance:create(pipeInst, [self(), PipeTypPID]),
    {ok, PipeInstPID3} = resource_instance:create(pipeInst, [self(), PipeTypPID]),
    {ok, PipeInstPID4} = resource_instance:create(pipeInst, [self(), PipeTypPID]),
    Pipes = [PipeInstPID1, PipeInstPID2, PipeInstPID3, PipeInstPID4],

    {ok, [Pip1con1, Pip1con2]} = resource_instance:list_connectors(PipeInstPID1),
    {ok, [Pip2con1, Pip2con2]} = resource_instance:list_connectors(PipeInstPID2),
    {ok, [Pip3con1, Pip3con2]} = resource_instance:list_connectors(PipeInstPID3),
    {ok, [Pip4con1, Pip4con2]} = resource_instance:list_connectors(PipeInstPID4),
    Cons = [[Pip1con1, Pip1con2], [Pip2con1, Pip2con2], [Pip3con1, Pip3con2], [Pip4con1, Pip4con2]],

    connector:connect(Pip1con2, Pip2con1),
    connector:connect(Pip2con2, Pip3con1),
    connector:connect(Pip3con2, Pip4con1),
    connector:connect(Pip4con2, Pip1con1),

    {ok, [Location1]} = resource_instance:list_locations(PipeInstPID1),
    {ok, [Location2]} = resource_instance:list_locations(PipeInstPID2),
    {ok, [Location3]} = resource_instance:list_locations(PipeInstPID3),
    {ok, [Location4]} = resource_instance:list_locations(PipeInstPID4),
    Locations = [Location1, Location2, Location3, Location4],

    FluidTyp = fluidumTyp:create(),
    {ok, Fluid} = fluidumInst:create(Pip1con1, FluidTyp),
    location:arrival(Location1,Fluid),
	location:arrival(Location2,Fluid),
	location:arrival(Location3,Fluid),
    location:arrival(Location4,Fluid),

    {ok, PumpTypPID} = pumpTyp:create(),
    RealWorldCmdFn = fun(on) ->
                                {ok,on};
                        (off) ->
                                {ok,off}
                    end,
    {ok, PumpInstPID} = pumpInst:create(self(), PumpTypPID, PipeInstPID1,RealWorldCmdFn),

    {ok, {PipeTypPID, Pipes, Cons, Locations, FluidTyp, Fluid, PumpTypPID, PumpInstPID}}.

start_square_pipes_fluid_pump_flowmeter() -> 
    survivor:start(),

    {ok, PipeTypPID} = resource_type:create(pipeTyp,[]),

    {ok, PipeInstPID1} = resource_instance:create(pipeInst, [self(), PipeTypPID]),
    {ok, PipeInstPID2} = resource_instance:create(pipeInst, [self(), PipeTypPID]),
    {ok, PipeInstPID3} = resource_instance:create(pipeInst, [self(), PipeTypPID]),
    {ok, PipeInstPID4} = resource_instance:create(pipeInst, [self(), PipeTypPID]),
    Pipes = [PipeInstPID1, PipeInstPID2, PipeInstPID3, PipeInstPID4],

    {ok, [Pip1con1, Pip1con2]} = resource_instance:list_connectors(PipeInstPID1),
    {ok, [Pip2con1, Pip2con2]} = resource_instance:list_connectors(PipeInstPID2),
    {ok, [Pip3con1, Pip3con2]} = resource_instance:list_connectors(PipeInstPID3),
    {ok, [Pip4con1, Pip4con2]} = resource_instance:list_connectors(PipeInstPID4),
    Cons = [[Pip1con1, Pip1con2], [Pip2con1, Pip2con2], [Pip3con1, Pip3con2], [Pip4con1, Pip4con2]],

    connector:connect(Pip1con2, Pip2con1),
    connector:connect(Pip2con2, Pip3con1),
    connector:connect(Pip3con2, Pip4con1),
    connector:connect(Pip4con2, Pip1con1),

    {ok, [Location1]} = resource_instance:list_locations(PipeInstPID1),
    {ok, [Location2]} = resource_instance:list_locations(PipeInstPID2),
    {ok, [Location3]} = resource_instance:list_locations(PipeInstPID3),
    {ok, [Location4]} = resource_instance:list_locations(PipeInstPID4),
    Locations = [Location1, Location2, Location3, Location4],

    FluidTyp = fluidumTyp:create(),
    {ok, Fluid} = fluidumInst:create(Pip1con1, FluidTyp),
    location:arrival(Location1,Fluid),
	location:arrival(Location2,Fluid),
	location:arrival(Location3,Fluid),
    location:arrival(Location4,Fluid),

    

    {ok, PumpTypPID} = pumpTyp:create(),
    RealWorldCmdFn = fun(on) ->
                                {ok,on};
                        (off) ->
                                {ok,off}
                    end,
    {ok, PumpInstPID} = pumpInst:create(self(), PumpTypPID, PipeInstPID1,RealWorldCmdFn),

    {ok, FlowmeterTypPID} = flowMeterTyp:create(),
    RealWorldCmdFnFlow = fun() ->
                                    {ok, flow}
                                end,
    {ok, FlowmeterInstPID} = flowMeterInst:create(self(), FlowmeterTypPID, PipeInstPID2, RealWorldCmdFnFlow),

    {ok, {PipeTypPID, Pipes, Cons, Locations, FluidTyp, Fluid, PumpTypPID, PumpInstPID, FlowmeterInstPID, FlowmeterTypPID}}.

start_square_pipes_fluid_pump_flowmeter_heatexchanger() -> 
    survivor:start(),

    {ok, PipeTypPID} = resource_type:create(pipeTyp,[]),

    {ok, PipeInstPID1} = resource_instance:create(pipeInst, [self(), PipeTypPID]),
    {ok, PipeInstPID2} = resource_instance:create(pipeInst, [self(), PipeTypPID]),
    {ok, PipeInstPID3} = resource_instance:create(pipeInst, [self(), PipeTypPID]),
    {ok, PipeInstPID4} = resource_instance:create(pipeInst, [self(), PipeTypPID]),
    Pipes = [PipeInstPID1, PipeInstPID2, PipeInstPID3, PipeInstPID4],

    {ok, [Pip1con1, Pip1con2]} = resource_instance:list_connectors(PipeInstPID1),
    {ok, [Pip2con1, Pip2con2]} = resource_instance:list_connectors(PipeInstPID2),
    {ok, [Pip3con1, Pip3con2]} = resource_instance:list_connectors(PipeInstPID3),
    {ok, [Pip4con1, Pip4con2]} = resource_instance:list_connectors(PipeInstPID4),
    Cons = [[Pip1con1, Pip1con2], [Pip2con1, Pip2con2], [Pip3con1, Pip3con2], [Pip4con1, Pip4con2]],

    connector:connect(Pip1con2, Pip2con1),
    connector:connect(Pip2con2, Pip3con1),
    connector:connect(Pip3con2, Pip4con1),
    connector:connect(Pip4con2, Pip1con1),

    {ok, [Location1]} = resource_instance:list_locations(PipeInstPID1),
    {ok, [Location2]} = resource_instance:list_locations(PipeInstPID2),
    {ok, [Location3]} = resource_instance:list_locations(PipeInstPID3),
    {ok, [Location4]} = resource_instance:list_locations(PipeInstPID4),
    Locations = [Location1, Location2, Location3, Location4],

    FluidTyp = fluidumTyp:create(),
    {ok, Fluid} = fluidumInst:create(Pip1con1, FluidTyp),
    location:arrival(Location1,Fluid),
	location:arrival(Location2,Fluid),
	location:arrival(Location3,Fluid),
    location:arrival(Location4,Fluid),


    {ok, PumpTypPID} = pumpTyp:create(),
    RealWorldCmdFn = fun(on) ->
                                {ok,on};
                        (off) ->
                                {ok,off}
                    end,
    {ok, PumpInstPID} = pumpInst:create(self(), PumpTypPID, PipeInstPID1,RealWorldCmdFn),

    {ok, FlowmeterTypPID} = flowMeterTyp:create(),
    RealWorldCmdFnFlow = fun() ->
                                    {ok, flow}
                                end,
    {ok, FlowmeterInstPID} = flowMeterInst:create(self(), FlowmeterTypPID, PipeInstPID2, RealWorldCmdFnFlow),

    {ok, HeatexchangerTypPID} = heatExchangerTyp:create(),
    Difference = 0.5,
    HE_link_spec = #{delta => Difference},
    {ok, HeatexchangerInstPID} = heatExchangerInst:create(self(), HeatexchangerTypPID, PipeInstPID3, HE_link_spec),

    {ok, {PipeTypPID, Pipes, Cons, Locations, FluidTyp, Fluid, PumpTypPID, PumpInstPID, FlowmeterInstPID, FlowmeterTypPID, HeatexchangerInstPID, HeatexchangerTypPID}}.


stop() ->
	survivor ! stop,
	{ok, stopped}.

    


