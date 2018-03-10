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


# Compatibility

For now it's usable in **ZSH**.
