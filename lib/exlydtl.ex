defmodule Mix.Tasks.Erlydtl do
  use Mix.Task

  @shortdoc "Precompiles erlydtl templates."

  @moduledoc """
  Precompiles erlydtl templates. By default, uses compiler_dir and compiles all templates into a single beam
  with a top level namespace. Assuming a 'templates' directory in the top level of your project with the files
  one.dtl and two.dtl, and the following in your mix.exs ...

    def project do
      [ app: :my_app,
        version: "0.1.2",
        elixir: "~> 0.10.3",
        deps: deps,
        erlydtl: [template_path: 'templates',
                  template_namespace: "my_app_templates",
                  template_out_dir: "ebin"]]
 
  ... and then run
    
     shell$ mix erlydtl

  you would end up with ebin/my_app_templates.beam, and each template could then be called in Elixir code like

  :my_app_templates.one([some_var: "foo"])

  Defaults:
   * template_path - a directory named 'templates' in the project's top level
   * template_namespace - the app name with "_templates" appended
   * template_out_dir - the ebin directory in the project's top level
  """

  def run(_) do
    IO.puts "Compiling erlydtl templates"
    File.mkdir_p!(template_out_dir)
    :erlydtl_compiler.compile_dir(template_path, template_namespace, [out_dir: template_out_dir])
  end

  defp template_path do
    (Mix.project[:erlydtl][:template_path] || 'templates')
  end

  defp template_namespace do
    ns = (Mix.project[:erlydtl][:template_namespace] || atom_to_binary(Mix.project[:app]) <> "_template")
    case is_atom(ns) do
      true -> ns
      _ -> binary_to_atom(ns)
    end

  end

  defp template_out_dir do
    (Mix.project[:erlydtl][:template_out_dir] || "ebin/")
  end
end
