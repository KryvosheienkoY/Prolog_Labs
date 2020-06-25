%1.Ділення з остачею (лише для додатніх цілих чисел)- ціла частина та остача від ділення (не використувати вбудовані функції!). Hint: Використовувати оператори віднімання

mydiv(Dilene, Dilnik,Zile1, Dilene, Zile1):- Dilnik>Dilene,!.								 
mydiv(Dilene, Dilnik, Zile,Ostacha,Temp):- 	 Dilene1 is Dilene-Dilnik,
											 Zile1 is Temp+1, 
											 mydiv(Dilene1,Dilnik,Zile, Ostacha, Zile1).
									 
mydiv(Dilene, Dilnik, Zile, Ostacha):-mydiv(Dilene, Dilnik, Zile, Ostacha,0).

%2.Піднесення до степеню (лінійне та логарифмічне) Hint: Використовувати оператори (*, +, -, mod)

powerLineal(X,N,Z) :- powerLineal(X,N,1,Z).

powerLineal(_,0,A,Z) :- Z is A.
powerLineal(X,N,A,Z) :- N1 is N - 1,
						A1 is A*X,
						powerLineal(X,N1,A1,Z).
						 
powerLogaryphmic(_,0,R):-	R is 1 .
powerLogaryphmic(X,N,R):-	(N mod 2)==0,
							N1 is N/2,
							powerLineal(X, N1, Temp),
							R is Temp*Temp;
							
							N1 is N-1, 
							powerLineal(X, N1, Temp),
							R is Temp*X.						 
							
%3.Числа Фібоначі (класична рекурсія, ітеративна) Hint: (+)		
	
fibRec(0, 0) :- !.
fibRec(1, 1) :- !.
fibRec(N, R) :- N1 is N - 1,
				N2 is N - 2,
				fibRec(N1, R1),
				fibRec(N2, R2),
				R is R1 + R2.

fibIter(Pos, R):-fibIter(Pos, R, 0, 1, 1).
fibIter(Pos, Prev, Prep, Prev, Pos).
fibIter(Pos, R, Prep, Prev, PosR):-	Res is Prep+Prev,
									P is PosR+1, 
									fibIter(Pos, R, Prev, Res, P).


%4.Розклад числа на прості множники (виведення всії простих множників числа)		

rozklad(Num):-rozklad(Num,2,R).

rozklad(Num,N,R):- 
					Num<2,
					!;
					Num<N,
					!;
					
					N=2,
					(Num mod N)=\=0,
					rozklad(Num,3,R);
					
					N=2,
					write('N is '),write(N),nl,
					Num1 is div(Num,N),
					rozklad(Num1,3,R);
					
					(Num mod N)=\=0,
					N1 is N+2,
					rozklad(Num,N1,R);
					
					write('N is '),write(N),nl,
					Num1 is div(Num,N),
					N1 is N+2,
					rozklad(Num1,N1,R);
					!.	



%5.Обрахувати сумму 1/1! + 1/2! + 1/3! + ... 1/n! за допомогою рекурентних співвідношень		

rowSum(N,R):-rowSum(N,1,1,0,R).
rowSum(N,Ncur,Prev,Res,R):-	
							N > 0,
							Ncur < N+1,
							Prev1 is Prev/Ncur,
							Res1 is Res + Prev1,
							Ncur1 is Ncur + 1,
							rowSum(N,Ncur1, Prev1, Res1,R);
							
							R is Res.			