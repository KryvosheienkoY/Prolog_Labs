/*1. Напишіть предикат, який перетворює вихідний список у список позицій від'ємних елементів.*/
%task1([2,-5,1,-3,-3,2,-9], RES).
task1(Array, RES):-task1(Array, 0,[],RES).
task1([], INDEX, AnswerAr,RES):-RES = AnswerAr,!.
task1([H|T], INDEX, AnswerAr,RES):-	H < 0,
									NEXT is INDEX + 1,
									append(AnswerAr,[INDEX],Z),
									task1(T, NEXT, Z,RES).
									
task1([H|T], INDEX, AnswerAr,RES):-	H >= 0,
									NEXT is INDEX + 1,
									task1(T,NEXT,AnswerAr,RES).

/*2. Напишіть предикат, що замінює всі входження заданого елемента на символ change_done.*/
%task2(a,[s,d,a,a,f,g,a,a], RES).

task2(Symbol, Array, RES):-	task2(Symbol, change_done, Array, RES).
task2(_, _, [], []).
task2(Symbol, NewSymbol, [Symbol|T1], [REPL|T2]):-	task2(Symbol, NewSymbol, T1, T2).
task2(Symbol, NewSymbol, [H|T1], [H|T2]):- 	H \= Symbol,
											task2(Symbol, NewSymbol, T1, T2).

/*3. Напишіть предикат, що перетворює будь-який список арабських чисел (від 1 до 50) у список відповідних їм римських чисел.

Наприклад:

?- s3([1,12,15,121,52], RESult).

RESult = ["XLXII", "XLXLXLI", "XV", "XII", "I"].*/
%task3([1,12,15,9,32], RES).
task3(Ar, RES):-task3(Ar, [], RES).
task3([], T, RES):- reverse(T, RES).
task3([X|Ar], T, RES):-toRomanNum(X,Y), T1=[Y|T], task3(Ar, T1, RES).
toRomanNum(0, '').
toRomanNum(N, X) :- N < 4, N1 is N - 1, toRomanNum(N1, X1), atom_concat( X1, 'I',X).
toRomanNum(N, X) :- N = 4, N1 is N - 4, toRomanNum(N1, X1), atom_concat( X1,'IV', X).
toRomanNum(N, X) :- N = 5, N1 is N - 5, toRomanNum(N1, X1), atom_concat( X1,'V', X).
toRomanNum(N, X) :- N < 9, N1 is N - 5, toRomanNum(N1, X1), atom_concat( X1, 'V',X).
toRomanNum(N, X) :- N = 9, N1 is N - 9, toRomanNum(N1, X1), atom_concat( X1, 'IX',X).
toRomanNum(N, X) :- N < 40, N1 is N - 10, toRomanNum(N1, X1), atom_concat( 'X',X1, X).
toRomanNum(N, X) :- N < 50, N1 is N - 40, toRomanNum(N1, X1), atom_concat( 'XL', X1,X).

/*4. Напишіть предикат, що здійснює циклічний зсув елементів списку на один вправо.*/
%task4([1,2,3,4,5], RESult).
task4(X,RES):- task4(X, [], RES).
task4([H|[]], Temp, RES):- 	RES=[H|Temp].
task4([H|T], Temp, RES):-	append(Temp,[H], X),
							task4(T,X,RES).



/*5. Напишіть предикат, що реалізує множення матриці (список списків) на вектор.

Напишіть приклади списків до кожного завдання*/
%task5([[1,2,3],[4,5,6],[7,8,9]], [10,11,12], Res).

task5(N1atrix, Vector, RES):- task5(N1atrix, Vector, [], RES).
task5([], Vector, Temp, RES):- reverse(Temp, RES).
task5([X|N1atrix], Vector, Temp, RES):-	multiplyRow(X, Vector, 0, R),
										task5(N1atrix, Vector, [R|Temp], RES).
multiplyRow([], [], T, RES):- RES=T.
multiplyRow([X|Row], [Y|Vector], T, RES):- T1 is (X*Y)+T,
										   multiplyRow(Row, Vector, T1, RES).





