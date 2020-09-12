defmodule AngioWeb.LventricleView do
  use AngioWeb, :view

  def render("scripts.show.html", assigns) do
    entry_path = Routes.static_path(assigns.conn, "/js/draw_lv.js")
    raw("<script>
    var tag = document.createElement(\"script\");
    tag.src = \"#{entry_path}\" ;
    document.getElementsByTagName(\"head\")[0].appendChild(tag);
    </script>")
  end
end
