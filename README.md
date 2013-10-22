# Exlydtl

This is an Elixir Mix task for precompiling [erlydtl](https://github.com/evanmiller/erlydtl) templates in your 
Elixir library. 

```elixir
  def project do
    [ app: :my_app,
      version: "0.1.2",
      elixir: "~> 0.10.3",
      deps: deps,
      erlydtl: [template_path: 'templates',
                template_namespace: "my_app_templates",
                template_out_dir: "ebin"]]
    # ...
    defp deps do
        [{:exlydtl, path: "../exlydtl"}]
    end

```
Then:
```
shell$ mix erlydtl
```

The above configuration is the default.

## TODO
 * allow separate template compilation (one .beam per template)
