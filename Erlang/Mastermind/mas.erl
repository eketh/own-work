-module (mas).
-export([loop/2,start/0,reply/2,init/0,stop/0,call/1,match/1,match/4]).

%MASTERMIND with colors represented as numbers from 1 to 8.

%START - register process and start in INIT function.
start()-> register(mas, spawn(mas,init,[])).

%INIT - start the game with 4 random numbers from 1 to 8. Mark the round as 1,
init()->
loop([random:uniform(8), random:uniform(8), random:uniform(8), random:uniform(8)],1).

%CALL - interpret messages sent by server.
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

match(Seq)->call(Seq).
stop()->call(stop).

reply(Pid, Reply) ->
Pid ! {reply, Reply}.

%MAIN loop:
% 1. Print current round.
% 2. Check whether proper arguments were given (4-element list of integers), otherwise send
% a message that given argument is bad.
% 3. Do the matching recursively and interpret the tuple returned by matching function.
% 4. If player scored four reds, send a message that he/she won.
% 5. If player hasn't won for 12 rounds, send a message that he lost.

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

%MATCH: recursive matching.
% If n-th guessed element is the same as n-th element of the draw - RED sign
% if guessed element is just present in the draw - WHITE sign
% if there is no guessed element in the draw - NOPE sign
% As a result, tuple with 4 atoms is returned.
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