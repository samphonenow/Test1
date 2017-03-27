c:- ['New.pro'].

reverse(X,A):-  last(X,I), chop(X,Result),reverse(Result,[I|A]).  
reverse([],[]). 

last([_|Xs],Result):- last(Xs,Result).
last([X],X). 

chop([X|Xs],[X|List]):-chop(Xs,List).
chop([_],[]).