
/*   1 Написати програму, яка здійснює обхід бінарного дерева зліва-направо.*/
%task1(X, tree(tree(nil,2,nil), 3, tree(tree(nil,4,nil), 5, tree(nil,6,nil)))).
%

task1(X, tree(_,X,_)).
task1(X, tree(L,_,_)):- task1(X,L).
task1(X, tree(_,_,R)):- task1(X,R).

/*   2 Написати програму, яка б визначала кількість вершин-листків в бінарному дереві.*/
%task2(tree(tree(nil,2,nil), 3, tree(tree(nil,4,nil), 5, tree(nil,6,nil))),Х).

task2(nil,0).
task2(tree(nil, _, nil),1).
task2(tree(L, _, R), Num) :-task2(L, L1),
							task2(R, R1), 
							Num is L1 + R1.

 /*   3Написати програму, яка знаходила б висоту бінарного дерева. Висота бінарного дерева Т визначається так:
        висота порожнього дерева Т рівна H(T)=0;
        висота непорожнього бінарного дерева Т з коренем к і піддеревами Т1 і Т2 дорівнює H(T)=1+max(H(T1), H(T2)).*/
%task3(tree(tree(nil,2,nil), 3, tree(tree(nil,4,nil), 5, tree(nil,6,nil))),X).
		
task3( nil, 0 ).        
task3( tree(L,_,R), H ) :- 	task3(L, LH),       
							task3(R, RH),      
							H is 1 + max(LH, RH).   
		
		
		
 /*   4Написати програму, яка визначає кількість вузлів у бінарному дереві.*/
 %task4(tree(tree(nil,2,nil), 3, tree(tree(nil,4,nil), 5, tree(nil,6,nil))),X).

task4(nil,0).
task4(tree(L, _, R1), RES):-	task4(L, Ls), 
								task4(R1, Rs), 
								RES is 1 + Ls + Rs.
 
 
 /*   5Написати програму обходу 2-3-дерева(1).*/
 
% task5(X, v2(v2(l(5),7,l(7)),8,v2(l(8),13,l(13)))).

task5(X, l(X)).
task5(X, v2(T1, _, _)) :- task5(X, T1).
task5(X, v2(_, _, T2)) :- task5(X, T2).
task5(X, v3(T1, _, _, _, _)) :- task5(X, T1).
task5(X, v3(_, _, T2, _, _)) :- task5(X,T2).
task5(X, v3(_, _, _, _, T3)) :- task5(X, T3). 
 
 
/*    6Написати програму пошуку заданого елемента в 2-3-дереві(1) */
% task6(10, v2(v2(l(5),7,l(7)),8,v2(l(8),13,l(13)))).
% task6(5, v2(v2(l(5),7,l(7)),8,v2(l(8),13,l(13)))).

task6(X,v2(T1,M,T2)):-	M==X;
						task6(X,T1);
						task6(X,T2).
task6(X,v3(T1,M2,T2,M3,T3)):-	M2==X;
								M3==X;
								task6(X,T1);
								task6(X,T2);
								task6(X,T3).
									
									
/*    7Написати програму, яка перевірить чи є заданий об'єкт(1)
        бінарним деревом
        2-3 деревом*/
%task7isBinaryTree(tree(tree(nil,2,nil), 3, tree(tree(nil,4,nil), 5, tree(nil,6,nil)))).		
%task7isBinaryTree(tree(tree(nil,2,nil), 3, tree( 5, tree(nil,6,nil)))).		
%task7is23Tree(v2(v2(l(5),7,l(7)),8,v2(l(8),13,l(13)))).		
%task7is23Tree(v2(v2(l(5),7,l(7)),8,v2(l(8),l(13)))).		
	
task7isBinaryTree(nil):- !.
task7isBinaryTree(tree(L, _, R)):-	task7isBinaryTree(L),
									task7isBinaryTree(R).		

task7is23Tree(nil):- !.									
task7is23Tree(l(_)):- !.
task7is23Tree(v2(T1, _, T2)):-	task7is23Tree(T1),
								task7is23Tree(T2).
task7is23Tree(v3(T1, _, T2, _, T3)):-	task7is23Tree(T1), 
										task7is23Tree(T2), 
										task7is23Tree(T3).