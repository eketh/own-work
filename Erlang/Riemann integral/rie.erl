-module(rie).
-export([rie/4]).

%Riemann integral.
%Input arguments: function, lower value, upper value, number of intervals.
%The bigger number of intervals, the more precised integral value.

rie(Fun, Xmin, Xmax, Intervals) when Xmin>Xmax -> {error,badarg};
rie(Fun, Xmin, Xmax, Intervals) ->

IntLen=(Xmax-Xmin)/Intervals,
rie(Fun,Xmin,IntLen,Intervals,1,0).

rie(Fun,Xmin,IntLen,Intervals,Acc,Sum) when Acc > Intervals -> Sum;
rie(Fun,Xmin,IntLen,Intervals,Acc,Sum) when Acc =< Intervals -> 
rie(Fun,Xmin,IntLen,Intervals,Acc+1,(Sum+(Fun(IntLen*Acc))*IntLen)).

