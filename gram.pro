c:-['gram.pro'].

% DCG  (Definite CLause Grammars)

% a0-->a1,a2,...an.
% a(S0,Sn):-a1(S0,S1),a2(S1,S2),...,an(Sn-1,Sn).

sent(T)-->ng(X),vg([V|Xs]),{T=..[V,X|Xs]}.
ng(T)-->art(A),noun(B),{T=..[A,B]}.
ng(P)-->pnoun(P).

vg([V])-->v(V).
vg([V,A,B])-->vt3(V),ng(A),[to],ng(B).

pnoun(donald)-->['Donald'].
pnoun(hilary)-->['Hillary'].

vt(asks)-->['asks'].
vt3(gives)-->['gives'].

v(walks)-->[walks].

art(a)-->[a].
art(the)-->[the].

noun(dog)-->[dog].
noun(book)-->[book].
noun(money)-->[money].

make_db:-
    sent(Tree,_,[]),
    assert(db(Tree)),fail
; writeln(done)


