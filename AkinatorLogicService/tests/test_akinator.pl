:- begin_tests(akinator).

test(next_question) :-
    next_question(_, Question),
    string(Question).

test(process_answer) :-
    process_answer(yes, Result),
    member(Result, [question, object_found, no_matches]).

test(add_object) :-
    add_object(test_object, [yes, no, yes], Result),
    Result = success.

:- end_tests(akinator). 