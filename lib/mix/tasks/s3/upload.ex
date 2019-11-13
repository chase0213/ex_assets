defmodule Mix.Tasks.S3.Upload do
  use Mix.Task
  alias ExAws.S3

  @shortdoc "Upload assets to S3"
  def run(_) do
    {:ok, _} = Application.ensure_all_started(:ex_aws)

    bucket = Application.get_env(:ex_assets, :bucket)
    local_path = Application.get_env(:ex_assets, :local_path)
    remote_path = Application.get_env(:ex_assets, :remote_path)
    upload(bucket, local_path, remote_path)
  end

  def upload(bucket, local_path, remote_path) do
    local_path
    |> Path.wildcard()
    |> Enum.each(fn file -> upload_file(bucket, file, remote_path))
  end

  def upload_file(bucket, file, remote_path) do
    file
    |> S3.Upload.stream_file
    |> S3.upload(bucket, path)
    |> ExAws.request!
  end
end