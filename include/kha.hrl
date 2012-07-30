-type project_id() :: integer().
-type time() :: {int(), int(), int()}.
-type tag() :: string().
-type command() :: string().

-record(notification,
        {type          :: atom(), %% kha_notification_[type].erl
         params        :: proplists:proplist()
        }).

-record(project,
        {id            :: project_id(),
         name          :: string(),
         local         :: filename:filename(), %% git clone remote local
         remote        :: string(),
         build         :: list(command()),
         notifications :: list(#notification())
        }).

-record(build,
        {id            :: {integer(), project_id()},
         project       :: project_id(),
         title         :: string() | 'undefined',
         branch        :: string(),
         revision      :: string(),
         author        :: string(),
         start         :: time(),
         stop          :: time(),
         exit          :: integer(),
         output        :: list(string()),
         tags          :: list(tag())
        }).