
/*  1Написати програму обходу AVL-дерева(1).*/
%task1(X,t(t(nil/0,2,t(nil/0,4,nil/0)/1)/2,6,t(t(nil/0,7,nil/0)/1,8,t(nil/0,9,nil/0)/1)/2)/3).
task1(A, t(_, A, _)/_).
task1(Res, t(_, _, R)/_):- task1(Res, R).
task1(Res, t(L, _, _)/_):- task1(Res, L).


/*  2Написати програму пошуку заданого елемента в AVL-дереві(1)*/
%task2(7,t(t(nil/0,2,t(nil/0,4,nil/0)/1)/2,6,t(t(nil/0,7,nil/0)/1,8,t(nil/0,9,nil/0)/1)/2)/3).
%task2(17,t(t(nil/0,2,t(nil/0,4,nil/0)/1)/2,6,t(t(nil/0,7,nil/0)/1,8,t(nil/0,9,nil/0)/1)/2)/3).

task2(N,T):- task1(N, T).

/*  3Написати програму, яка перевірить чи є заданий об'єкт(1)
        AVL-деревом*/
		
%task3(t(t(nil/0,2,t(nil/0,4,nil/0)/1)/2,6,t(t(nil/0,7,nil/0)/1,8,t(nil/0,9,nil/0)/1)/2)/3).
%task3(t(t(nil/0,2,t(nil/0,4,nil/0)/1)/2,6,t(t(nil/0,7,nil/0)/1,18,t(nil/0,9,nil/0)/1)/2)/3).
		
		
task3(nil/0).
task3(t(nil/0,A,nil/0)/Depth). 
task3(t(nil/0,A,R)/Depth):-	(t(D,E,F)/K)=R,
							1>=K,
							A=<E.
task3(t(L,A,nil/0)/Depth):-	(t(D,E,F)/K)=L,
							1>=K,
							A>=E. 						
							
task3(t(L,A,R)/Depth):-	(t(L1,A1,R1)/D1)=L,
						(t(L2,A2,R2)/D2)=R,
						(D1==D2;1>=(D1-D2);1=<(D2-D1)),
						A>=A1,
						A=<A2,
						task3(L), 
						task3(R).		
	

/*  4Написати програму видалення заданого вузла з дерева, не порушуючи його структуру: бінарне сортуюче дерево (2).*/
%task4(t(t(nil/0,2,t(nil/0,4,nil/0)/1)/2,6,t(t(nil/0,7,nil/0)/1,8,t(nil/0,9,nil/0)/1)/2)/3,2,X).
	


task4(Tr, Elem, X):-	findall(X,
						removeNode(Tr, Elem, X), Y),
						last(Y, X).

removeNode(t(nil/0,X,R)/D,X,R).
removeNode(t(L,X,R)/D,X,L).
removeNode(t(L,X,R)/D,X,t(L,Y,R1)/D):-	deleteF(R,Y,R1).
removeNode(t(L,Y,R)/D,X,t(L1,Y,R)/D):-	Y > X,
										removeNode(L,X,L1);
										X > Y,
										removeNode(R,X,R1). 

deleteF(t(nil/0,Y,R)/D,Y,R).
deleteF(t(L,X,R)/D,Y,t(L1,X,R1)/D):- deleteF(L,Y,L1).

