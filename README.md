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
                template_namespace: :my_app_templates,
                template_out_dir: "ebin"]]
    # add exlydtl to your deps. it already depends on erlydtl so you
    # shouldn't need both, but you can add it with 'override: true' if 
    # you want to call it out explicitly.
    defp deps do
        [{:exlydtl, path: "../exlydtl"}]
    end

```
Then:
```
shell$ mix erlydtl.compile
```

The above configuration is the default.

## TODO
 * allow separate template compilation (one .beam per template)
