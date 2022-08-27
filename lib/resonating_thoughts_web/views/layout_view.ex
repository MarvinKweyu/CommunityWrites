defmodule ResonatingThoughtsWeb.LayoutView do
  use ResonatingThoughtsWeb, :view

  # Phoenix LiveDashboard is available only in development by default,
  # so we instruct Elixir to not warn if the dashboard route is missing.
  @compile {:no_warn_undefined, {Routes, :live_dashboard_path, 2}}

  def alert_type_class(type) do
    case type do
      "error" ->
        "danger"

      # for the rest looks like the css class maps to the flash name
      _ ->
        type
    end
  end

  def alert_type_icon(type) do
    case type do
      "danger" -> "times-circle"
      "success" -> "check-circle"
      _ -> "info-circle"
    end
  end

  # def active_class(conn, path, opts \\ []) do
  #   fun = if Keyword.get(opts, :exact, false), do: &Kernel.==/2, else: &Kernel.=~/2

  #   if fun.(conn.request_path, path) do
  #     "active"
  #   end
  # end

  def live_flash_classes(level) do
    case level do
      :info -> "bg-teal-100 border-t-4 border-teal-500 rounded-b text-teal-900"
      :warning -> "bg-orange-100 border-t-4 border-orange-500 rounded-b text-orange-900"
      :error -> "bg-red-100 border-t-4 border-red-500 rounded-b text-red-900"
    end
  end

  def live_flash_icon_classes(level) do
    case level do
      :info -> "text-teal-500"
      :warning -> "text-orange-500"
      :error -> "text-red-500"
    end
  end

  def meta_tag(attrs) do
    tag(:meta, Enum.into(attrs, []))
  end
end
