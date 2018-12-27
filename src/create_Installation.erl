-module(create_Installation).
-export([start/0,stop/0]).

start() -> 
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

stop() ->
	survivor ! stop,
	{ok, stopped}.

    


