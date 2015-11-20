%%%-------------------------------------------------------------------
%% @doc nuk games
%% @end
%%%-------------------------------------------------------------------

-module(nuk_games).

%% API
-export([register/1, unregister/1, get/1, list/0]).
-export([create/2, join/2]).

%%====================================================================
%% Game registration
%%====================================================================

-spec register(Game :: nuk_game:game()) -> ok.
register(Game) ->
    ok = nuk_game_store_server:put(Game).

-spec unregister(GameName :: string()) -> ok.
unregister(GameName) ->
    ok = nuk_game_store_server:delete(GameName).

-spec get(GameName :: string()) ->
    {ok, nuk_game:game()} |
    {error, game_not_found, string()}.
get(GameName) ->
    nuk_game_store_server:get(GameName).

-spec list() -> [nuk_game:game()].
list() ->
    nuk_game_store_server:list().

%%====================================================================
%% Game flow
%%====================================================================

-spec create(UserSessionId :: string(), GameName :: string()) ->
    {ok, GameSessionId :: string()} |
    {error, invalid_user_session, Extra :: string()} |
    {error, invalid_game_name, Extra :: string()}.
create(UserSessionId, GameName) ->
    nuk_game_server:create(UserSessionId, GameName).

-spec join(GameSessionId :: string(), UserSessionId :: string()) ->
    ok |
    {error, game_session_not_found, Extra :: string()} |
    {error, user_session_not_found, Extra :: string()} |
    {error, user_already_joined, Extra :: string()} |
    {error, max_users_reached, Extra :: string()}.
join(GameSessionId, UserSessionId) ->
    case nuk_game_sessions:get_pid(GameSessionId) of
        {error, game_session_not_found, Reason} ->
            {error, game_session_not_found, Reason};
        {ok, GamePid} ->
            nuk_game_server:join(GamePid, UserSessionId)
    end.
