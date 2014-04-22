
-module(mcarlo).
-export([start/1,main_loop/3,calc/3]). 

start(Max) -> start(Max,Max).

start(N,Max) when N>0 -> 
  Pid= spawn(mcarlo,calc, [self(), (random:uniform()*2-1), (random:uniform()*2-1)]),
  start(N-1,Max);
  start(N,Max) when N==0 ->
  main_loop(0,0,Max).

main_loop(Ite,Num,Max) when Ite==Max -> 
io:format("Result: ~w ~n",[(Num/Max)*4]),
true;
main_loop(Ite, Num,Max) ->
  receive
   {Pid,A} when A==increment ->
    main_loop(Ite+1,Num+1,Max);
    {Pid,A} when A==idle ->
     main_loop(Ite+1,Num,Max);
   {Pid,A} ->
     io:format("Unknown command ~n",[]),
     main_loop(Ite,Num,Max);
    _ ->
    io:format("Unknown message! ~n", []),
    main_loop(Ite,Num,Max)
  end.

calc(Pid,ResultX,ResultY) when (ResultY*ResultY + ResultX*ResultX) =< 1 ->
Pid ! {self(),increment};
calc(Pid,ResultX,ResultY) ->
Pid! {self(),idle},
true.


