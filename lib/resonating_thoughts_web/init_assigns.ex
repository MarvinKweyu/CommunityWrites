defmodule ResonatingThoughtsWeb.InitAssigns do
  @moduledoc """
  Ensures common `assigns` are applied to all LiveViews attaching this hook.
  """

  # import Phoenix.LiveView

  # alias ResonatingThoughtsWeb.Router.Helpers, as: Routes
  # alias ResonatingThoughtsWeb.{Accounts}

  def on_mount(:current_user, _params, session, socket) do
    _session_id = Map.get(session, "phauxth_session_id")

    # session_id = case Map.get(session, "phauxth_session_id") do
    #   nil -> nil
    #   item -> Accounts.get_by(%{"session_id" => item})
    # end

    # case session_id do
    #   nil ->
    #     {:halt, redirect(socket, to: Routes.session_path(socket, :new))}

    #   _ ->
    #     {:cont,
    #      assign_new(socket, :current_user, fn ->
    #        Accounts.get_by(%{"session_id" => session_id})
    #      end)}
    # end
  end
end
