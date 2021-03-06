

# Module nuk_user_session_store_server #
* [Description](#description)
* [Function Index](#index)
* [Function Details](#functions)

`nuk_user_session_store_server` module.

__Behaviours:__ [`nuk_user_session_storage`](nuk_user_session_storage.md).

<a name="description"></a>

## Description ##
This is an implementation of [`nuk_user_session_storage`](nuk_user_session_storage.md) behavior. It
is meant for testing and proof of concept purposes only.<a name="index"></a>

## Function Index ##


<table width="100%" border="1" cellspacing="0" cellpadding="2" summary="function index"><tr><td valign="top"><a href="#delete-1">delete/1</a></td><td>Delete a session ID mapping.</td></tr><tr><td valign="top"><a href="#get_pid-1">get_pid/1</a></td><td>Get game session process ID.</td></tr><tr><td valign="top"><a href="#list-0">list/0</a></td><td>List all sessions.</td></tr><tr><td valign="top"><a href="#put-1">put/1</a></td><td>Create a new user session identifier.</td></tr></table>


<a name="functions"></a>

## Function Details ##

<a name="delete-1"></a>

### delete/1 ###

<pre><code>
delete(SessionId::string()) -&gt; ok
</code></pre>
<br />

Delete a session ID mapping

Given a session identifier string, deletes its mapping to the user session
process ID, so that next call to [`nuk_user_session_store_server:get/1`](nuk_user_session_store_server.md#get-1)
results in `game_session_not_found` response.

<a name="get_pid-1"></a>

### get_pid/1 ###

<pre><code>
get_pid(SessionId::string()) -&gt; {ok, pid()} | {error, user_session_not_found, Extra::string()}
</code></pre>
<br />

Get game session process ID

Given the session identifier string, returns the game session `pid()` which
then can be used to interface with [`nuk_user_server`](nuk_user_server.md) functions.

<a name="list-0"></a>

### list/0 ###

<pre><code>
list() -&gt; [<a href="nuk_user_session.md#type-session">nuk_user_session:session()</a>]
</code></pre>
<br />

List all sessions

Returns a list of all user sessions. Used in tests.

<a name="put-1"></a>

### put/1 ###

<pre><code>
put(Pid::pid()) -&gt; SessionId::string()
</code></pre>
<br />

Create a new user session identifier

Given a user session process ID, creates a new session identifier string.

