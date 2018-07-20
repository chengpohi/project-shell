# Project Shell

**Project Shell** template is used to customize/build a specific shell for your **project**. such as:

- write custom aliases
- write custom functions

# Usage

Add your project custom **aliases** and **functions** under `functions` directory.

And run `./run.sh`, so you can go to your custom shell.


For example, I have created a `go_to_github` & `go_to_my_project` aliases and  `getAllShellScripts` under `functions` directory.

After start by `./run.sh`, you can:

```bash
go_to_github
getAllShellScripts
```

Also you can add your custom properties in `env.projecties` file.


so it's helpful write a custom project shell for your project, and **share to other team member**.

## Auto Complete

You can add custom autocomplete into `functions.sh`, example:

```bash
_GET() {
    local state

    _arguments \
        '1: :->command' \
        '*: :->others'
    case $state in
        (command) _arguments '1:profiles:(foo bar hello world)' ;;
        (*) compadd "$@" v
    esac
}

function GET() {
    echo "$*"
}

compdef _GET GET
```

so when you input `GET` command, you can use **tab** to auto complete: `foo bar hello world`, after this, it can autocomplete `v`.


# Compatibility

For now it's usable in **ZSH**.
