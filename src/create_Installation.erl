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

    {ok, [pip1con1, pip1con2]} = resource_instance:list_connectors(pipeInstPID1),
    {ok, [pip2con1, pip2con2]} = resource_instance:list_connectors(pipeInstPID2),
    {ok, [pip3con1, pip3con2]} = resource_instance:list_connectors(pipeInstPID3),
    {ok, [pip4con1, pip4con2]} = resource_instance:list_connectors(pipeInstPID4),
    Cons = [[pip1con1, pip1con2], [pip2con1, pip2con2], [pip3con1, pip3con2], [pip4con1, pip4con2]],

    connector:connect(pip1con2, pip2con1),
    connector:connect(pip2con2, pip3con1),
    connector:connect(pip3con2, pip4con1),
    connector:connect(pip4con2, pip1con1),

    {ok, [Location1]} = resource_instance:list_locations(pipeInstPID1),
    {ok, [Location2]} = resource_instance:list_locations(pipeInstPID2),
    {ok, [Location3]} = resource_instance:list_locations(pipeInstPID3),
    {ok, [Location4]} = resource_instance:list_locations(pipeInstPID4),
    Locations = [Location1, Location2, Location3, Location4],

    {ok, {PipeTypPID, Pipes, Cons, Locations}}.

stop() ->
	survivor ! stop,
	{ok, stopped}.

    


