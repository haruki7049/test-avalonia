# test-avalonia

https://funcui.avaloniaui.net/

# The initialization process of this repo

- `nix-shell --run "dotnet new console --language=F#"`

- Run the following
```sh
nix-shell

# In the nix-shell
dotnet add package Avalonia.Desktop --version 11.1.0
dotnet add package Avalonia.Themes.Fluent --version 11.1.0
dotnet add package Avalonia.FuncUI --version 1.5.1
```

- Append https://funcui.avaloniaui.net/#step-3-add-code-to-program.fs to `/Program.fs`

- `dotnet run`
```sh
nix-shell --run "dotnet run"
```
