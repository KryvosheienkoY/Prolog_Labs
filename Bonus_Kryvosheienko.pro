leftHouse(A,B) :- rightHouse(B,A).
rightHouse(A,B) :- A is B+1.
neighbour(A,B) :- rightHouse(A,B).
neighbour(A,B) :- leftHouse(A,B).


findFishOwner(X,Res):-findPerson(X,Nationality, Color, Drink, fish, Cigarette), Res=Nationality.

findPerson(X,Nationality, Color, Drink, Pet, Cigarette) :-
    X=[person(1,Nationality1 , Color1, Drink1, Pet1, Cigarette1),
    person(2, Nationality2, Color2, Drink2, Pet2, Cigarette2),
    person(3, Nationality3, Color3, Drink3, Pet3, Cigarette3),
    person(4, Nationality4, Color4, Drink4, Pet4, Cigarette4),
    person(5, Nationality5, Color5, Drink5, Pet5, Cigarette5)],

    % Англієць живе в червоному будинку
    member(person(_, england, red, _, _, _), X),
    % Швед тримає собаку
    member(person(_, sweden, _, _, dog, _), X),
    % Датчанин пє чай
    member(person(_, dutch, _, tea, _, _), X),
    % Зелений будинок стоїть зліва від білого (вважайте, що ці два будинки стоять поруч
    member(person(Y1, _, green, _, _, _), X), member(person(Y2, _, white, _, _, _), X), leftHouse(Y1, Y2),
    % Мешканець зеленого дома пє каву
    member(person(_, _, green, coffee, _, _), X),
    % Людина, яка палить Pall Mall, тримає пташку
    member(person(_, _, _, _, bird, pall_mall), X),
    % Мешканець з середнього будинку пє молоко
    member(person(3, _, _, milk, _, _), X),
    % Мешканець з жовтого будинку палить Dunhill
    member(person(_, _, yellow, _, _, dunhill), X),
    % Норвежець живе в першому будинку
    member(person(1, norway, _, _, _, _), X),
    % Курець Marlboro живе біля того, хто тримає кицьку
    member(person(Q1, _, _, _, _, marlboro), X), member(person(Q2, _, _, _, cat, _), X), neighbour(Q1, Q2),
    % Людина, яка тримає коня, живе біля того, хто курить Dunhill
    member(person(W1, _, _, _, horse, _), X), member(person(W2, _, _, _, _, dunhill), X), neighbour(W1, W2),
    % Курець цигарок Winfield пє пиво
    member(person(_, _, _, wine, _, winfield), X),
    % Норвежець живе біля блакитного будинку
    member(person(E1, norway, _, _, _, _), X), member(person(E2, _, blue, _, _, _), X), neighbour(E1, E2),
    % Німець палить Rothmans
    member(person(_, germany, _, _, _, rothmans), X),
    % Курець Marlboro - сусіда людини, яка пє воду
    member(person(R1, _, _, _, _, marlboro), X), member(person(R2, _, _, water, _, _), X), neighbour(R1, R2),

    % знайти людину за параметрами
    member(person(_, Nationality,Color, Drink, Pet, Cigarette), X).