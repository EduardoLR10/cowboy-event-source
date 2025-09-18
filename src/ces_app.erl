%% Feel free to use, reuse and abuse the code in this file.

%% @private
-module(ces_app).
-behaviour(application).

%% API.
-export([start/2]).
-export([stop/1]).

%% API.

start(_Type, _Args) ->
	Dispatch = cowboy_router:compile([
		{'_', [{"/", ces, []}
		]}
	]),
	{ok, _} = cowboy:start_clear(http, [{port, 8080}], #{
		env => #{dispatch => Dispatch}
	}),
	ces_sup:start_link().

stop(_State) ->
	ok = cowboy:stop_listener(http).

