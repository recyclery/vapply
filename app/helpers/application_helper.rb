module ApplicationHelper
  def link_to_caseworker(cw)
    link_to(cw.name, cw) if cw
  end

  def link_to_client(client)
    link_to(client.name, client) if client
  end
end
