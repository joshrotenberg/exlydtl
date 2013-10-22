defmodule ExlydtlTest do
  defmodule ExlydtlTest.Mixfile do
    use Mix.Project

    def project do
      [app: :exlydtl_unit_test,
       erlydtl: [
         template_path: 'test/templates',
         template_namespace: :test_namespace,
         template_out_dir: "test/ebin"]]
    end
  end

  use ExUnit.Case


  test "template compilation" do
    Mix.Task.run("erlydtl.compile", [])
    assert :test_namespace.first([first: "first"]) == ["first", " works!\n"]
    assert :test_namespace.second([second: "second"]) == ["second", " works, too!\n"]
  end
end
