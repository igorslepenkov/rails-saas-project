module ApplicationHelper
  def get_organization_url
    URI::Generic.build(host: "#{current_organization.subdomain}.#{ENV['CURRENT_HOST']}",
                       port: ENV['CURRENT_PORT'], path: '/').to_s.sub(/\/\//, '')
  end
end
