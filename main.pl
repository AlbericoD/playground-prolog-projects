clear :- format('~c~s~c~s', [0x1b, "[H", 0x1b, "[2J"]).

:- use_module(library(http/thread_httpd)).

:- use_module(library(http/http_dispatch)).
server(Port) :-
        http_server(http_dispatch, [port(Port)]).

:- http_handler(/, say_hi, []).

:- http_handler('/twinkly/elf/weenblat.xls', say_hi, []).
:- http_handler('/something/pleasant', my_handler_code(pleasant), []).
:- http_handler('/something/painful', my_handler_code(painful(normal)), []).
:- http_handler('/something/very/painful', my_handler_code(painful(very)), []).
:- http_handler('/something/incredibly/painful',
                my_handler_code(painful(incredibly)), []).

my_handler_code(_Request) :- painful(normal).



say_hi(_Request) :- format('Content-type: text/plain~n~n'),
format('renderizando ok!~n').
