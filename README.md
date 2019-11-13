# ExAssets

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `ex_assets` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ex_assets, github: "chase0213/ex_assets"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/ex_assets](https://hexdocs.pm/ex_assets).


## Configuration

Since ExAssets depends on [ex_aws](https://github.com/ex-aws/ex_aws), you need to set config of it in `mix.exs` like:

```elixir
# => Load keys from environment variables
config :ex_aws,
  access_key_id: [{:system, "AWS_ACCESS_KEY_ID"}, :instance_role],
  secret_access_key: [{:system, "AWS_SECRET_ACCESS_KEY"}, :instance_role]

config :ex_aws,
  region: [{:system, "AWS_S3_REGION"}]
```

Then, set ExAssets config like:

```elixir
config :ex_assets,
  bucket: "example_buckets",
  local_path: "priv/static/",
  remote_path: "assets/"
```

## Upload Assets

Run the following command:

```bash
$ mix assets.s3.upload
```
