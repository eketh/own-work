README

Calculator of the pi number by using Monte Carlo method.
Written in Erlang because yes we can.

The following results were obtained when I ran the algorithm:

10 iterations - 3.2
100 iterations - 3.28
1000 iterations - 3.144
10000 iterations - 3.1188
100000 iterations - 3.14584
1000000 iterations - 3.141796

(yes, it's not deterministic and you can obtain different results)

HOW IT WORKS?

1. Starting with N parameter spawns N processes.
2. Each process has two random numbers between -1 and 1 as a parameter - these are its X and Y values.
3. If these values are "inside" the circle with center in (0,0) and radius equal to 1, an INCREMENT command is sent to the main loop. If not - IDLE command is sent. Process terminates after sending the command.
4. Each time loop receives INCREMENT or IDLE, it increments its counter of received commands. If it gets INCREMENT, it also increments its counter of X,Y points inside the circle.
5. If number of received commands is equal to the number of processes, main loop sends calculated pi number and terminates.
6. pi number equals N/Nmax*Field, where N=number of X,Y points inside the circle, Nmax- number of processes and Field=field of a square representing the range of generated points (in that case, points from (-1,-1) to (1,1) give field equal to 2*2=4).
