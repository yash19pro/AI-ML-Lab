 slice([X|_], 1, 1, [X]).
slice([X|TAIL], 1, CURRENT_INDEX, [X|REM_TAIL]) :- CURRENT_INDEX > 1,
NEXT_INDEX is CURRENT_INDEX - 1, slice(TAIL, 1, NEXT_INDEX, REM_TAIL).
slice([_|TAIL], I, CURRENT_INDEX, OUTPUT) :- I > 1, I1 is I - 1, NEXT_INDEX is CURRENT_INDEX - 1, slice(TAIL, I1, NEXT_INDEX, OUTPUT).