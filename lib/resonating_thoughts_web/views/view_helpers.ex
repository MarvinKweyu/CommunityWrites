defmodule ResonatingThoughtsWeb.ViewHelpers do
  @moduledoc """
  Conveniences for rendering items onto templates.
  """

  def format_date(date_item) do
    Calendar.strftime(date_item, "%B %-d, %Y")
  end
end
