restaurant(dinners, id345).
restaurant(sunny,id51).
employees(id345,5).
employees(id51,2).
owns(peter, id345).
owns(ann, id345).
owns(mark, id51).
works(id345,sara, cooker,8000).
works(id345,george, cooker,8000).
works(id345,john, waiter,7000).
works(id345,marry, waiter,7000).
works(id345,vika, administrator,12000).
works(id51,mark, manager,9000).
works(id51,susan, cooker,7000).
vacation(marry,14).
vacation(george,7).
vacation(susan,7).
gavePremium(ann,john,1000).
gavePremium(peter,marry,1000).
gavePremium(mark,john,100).
workerOfMonth(marry).
workerOfMonth(mark).
%1) Find current jobs in a restaurant(X-restaurant id, Z-job)
workers(X,Z):-restaurant(_,X),works(X,_,Z,_).
%2) Find workers in vacation, working in a restaurant (X-restaurant id, Z- worker`s name)
workersInVacation(X,Z):-restaurant(_,X),works(X,Z,_,_), vacation(Z,_).
%3) Find workers of the month in a restaurant(X-restaurant id, Z- worker`s name)
bestWorkers(X,Z):-restaurant(_,X),works(X,Z,_,_), workerOfMonth(Z).
%4) Find owners of a restaurant(X-restaurant id, Z-name)
owners(X,Z):-restaurant(_,X),owns(X,Z).
%5) Find workers in a restaurant with a salary bigger than Y number(X-restaurant id, N- worker`s name, Z-job, Y - number)
wellPaidWorkers(X,N,Z,Y):-restaurant(_,X),works(X,N,Z,S),S>Y.