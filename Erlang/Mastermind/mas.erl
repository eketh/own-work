-module (mas).
-export([loop/2,start/0,reply/2,init/0,stop/0,call/1,match/1,match/4]).

start()-> register(mas, spawn(mas,init,[])).

init()->
%TODO losowanie bez zwracania
loop([random:uniform(7), random:uniform(7), random:uniform(7), random:uniform(7)],1).

match(Seq)->call(Seq).

stop()->call(stop).

call(Message) ->
mas ! {self(),Message},
receive
{reply,won} ->
io:format("You won! ~n",[]);
{reply, stop} ->
io:format("Server stopped... ~n",[]);
{reply,badarg} ->
io:format("Bad argument ~n",[]);
{reply, Reply} -> Reply
end.

reply(Pid, Reply) ->
Pid ! {reply, Reply}.

loop(S,X) when X<13 ->
io:format("ROUND ~w ~n",[X]),

receive
{Pid,P} when (erlang:is_list(P) andalso length(P)==4) ->
Result=match(P,S,S,[]),
case lists:all(fun(W)->W=={red} end, Result) of
true ->
reply(Pid,won);
false ->
reply(Pid,Result),
loop(S,X+1)
end;

{Pid,P} when P == stop ->
reply(Pid,stop);
 
{Pid,P}->
reply(Pid,badarg),
loop(S,X)
end;

loop(S,X) when X==13->
io:format("You lost!~n",[]),
true.


match([HP|HT],S,[SH|ST],Acc)->
case lists:member(HP,S) of
true when HP==SH ->
match(HT,S,ST,[{red}|Acc]);
true ->
match(HT,S,ST,[{white}|Acc]);
false ->
match(HT,S,ST,[{nope}|Acc])
end;
match([],S,[],Acc)->
Acc.