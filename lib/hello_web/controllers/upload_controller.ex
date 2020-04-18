defmodule HelloWeb.UploadController do
  use HelloWeb, :controller

  @spec index(Plug.Conn.t(), any) :: Plug.Conn.t()
  def index(conn, _params) do
    render(conn, "index.html")
  end

  def create(conn, %{"upload" => upload}) do
    path_upload = upload["docfile"]

    IO.inspect path_upload.filename, label: "Photo upload information"
    File.cp(path_upload.path, Path.absname("uploads/#{path_upload.filename}"))

    json(conn, "Uploaded #{path_upload.path} to a temporary directory")
  end

end
