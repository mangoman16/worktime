# worktime

A single-file Bash task timer for the terminal. Log work as you go,
classify entries by type, edit fields after the fact, and export the
day/week/month as ICS or to email.

Logs live under `~/.task_timer/YYYY/MM/YYYY-MM-DD.csv`. Profile, hourly
rate, and SMTP settings live in `~/.task_timer/profile`.

## Run

```sh
./worktime
```

On first launch it walks you through a profile setup. Drop the file
somewhere on your `$PATH` (or symlink it) if you want to call it as
`worktime` from anywhere.

## Quick reference

```
LOGGING   <title>  <type> <title>  resume
VIEW      all  ls  stats  grep
EDIT      edit  title  desc  type  bill  rm
SCOPE     today  yesterday  tomorrow  goto  month  year  range  cal  scope
TOOLS     export  profile  migrate  clear  help  quit
```

Type `help` inside the timer for the compact summary, `help <command>`
for details on one command, or `help full` for everything on one
screen.

### Field-edit shortcuts

`title`, `desc`, `type`, and `bill` each edit one field of a task. With
no argument they target the last task you touched; with an id they
target that entry.

```
> title              # rename last task
> bill 42            # set billed hours on entry #42
> type               # change type of last task
```

`edit` (no args) re-prompts whatever field you last touched; `edit <id>`
runs the full walkthrough.

### Types

`task ticket project order appointment monitoring break` — any unique
prefix matches (e.g. `mo` -> `monitoring`). `#NNNNN` auto-detects as a
ticket; an 8+ digit standalone number auto-detects as an order.

### Startup flags

```
-d, --directory <dir>   recursively scope to a directory
-l, --log <file>        scope to a single log file
```

## License

MIT — see [LICENSE](LICENSE).
