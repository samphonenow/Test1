% This is my first prolog file

c :- ['last.pro'].

% Facts

male('Abraham').
male('Zimran').
male('Jokshan').
male('Medan').
male('Median').
male('Ishbak').
male('Shuah').
male('Isaac').
male('Ishmael').
male('Jacob').
male('Esau').
male(gad).
male('Ashe').
male('Rueben').
male('Simeon').
male('Levi').
male('Judah').
male('Issachar').
male('Zebulan').
male('Joseph').
male('Benjamin').
male('Dan').
male('Naphtali').
male('Pharez').
male('Zarah').
male('Ephraim').
male('Manasseh').

female('Keturah').
female('Sarah').
female('Hagar').
female('Rebekah').
female('Zilpah').
female('Leah').
female('Rachel').
female('Bilhah').
female('Dinah').
female('Tamar').
female('Asenath').

parent_of('Abraham','Zimran').
parent_of('Abraham','Jokshan').
parent_of('Abraham','Medan').
parent_of('Abraham','Median').
parent_of('Abraham','Ishbak').
parent_of('Abraham','Shuah').
parent_of('Abraham','Isaac').
parent_of('Abraham','Ishmael').
parent_of('Keturah','Zimran').
parent_of('Keturah','Jokshan').
parent_of('Keturah','Medan').
parent_of('Keturah','Median').
parent_of('Keturah','Ishbak').
parent_of('Keturah','Shuah').
parent_of('Sarah','Isaac').
parent_of('Hagar','Ishmael').

parent_of('Isaac','Jacob').
parent_of('Rebekah','Jacob').
parent_of('Isaac','Esau').
parent_of('Rebekah','Esau').

parent_of('Jacob',gad).
parent_of('Zilpah',gad).
parent_of('Jacob','Ashe').
parent_of('Zilpah','Ashe').
parent_of('Jacob','Dinah').
parent_of('Leah','Dinah').
parent_of('Jacob','Rueben').
parent_of('Leah','Rueben').
parent_of('Jacob','Simeon').
parent_of('Leah','Simeon').
parent_of('Jacob','Levi').
parent_of('Leah','Levi').
parent_of('Jacob','Judah').
parent_of('Leah','Judah').
parent_of('Jacob','Issachar').
parent_of('Leah','Issachar').
parent_of('Jacob','Zebulan').
parent_of('Leah','Zebulan').
parent_of('Jacob','Joseph').
parent_of('Rachel','Joseph').
parent_of('Jacob','Benjamin').
parent_of('Rachel','Benjamin').
parent_of('Jacob','Dan').
parent_of('Bilhah','Dan').
parent_of('Jacob','Naphtali').
parent_of('Bilhah','Naphtali').

parent_of('Judah','Pharez').
parent_of('Tamar','Pharez').
parent_of('Judah','Zarah').
parent_of('Tamar','Zarah').
parent_of('Joseph','Ephraim').
parent_of('Asenath','Ephraim').
parent_of('Joseph','Manasseh').
parent_of('Asenath','Manasseh').

% Rules

child_of(C,X):-parent_of(X,C).

sibling_of(S,X):- father_of(F,S), father_of(F,X), mother_of(M,S), mother_of(M,X), X\==S.

grand_parent(G,X):- parent_of(P,X),parent_of(G,P).

wife_of(W,X):- child_of(C,W),child_of(C,X),female(W), W\=X  .

brother_of(B,X):- sibling_of(B,X), male(B).

sister_of(S,X):- sibling_of(S,X), female(S).

mother_of(M,X):- parent_of(M,X), female(M).

father_of(F,X):- parent_of(F,X), male(F).

cousin_of(C,X):- grand_parent(G,C), grand_parent(G,X), X\==C, not(sibling_of(C,X)).