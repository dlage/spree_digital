Deface::Override.new(:virtual_path => "spree/shared/_order_details",
                     :name => "add_digital_downloads_to_invoice",
                     :insert_bottom => "td[data-hook='order_item_description']",
                     :text => %q{
<% if order.payment_state == 'paid' and item.variant.digital? %>
  <%= content_tag(:p, :class => 'download_links') do %>
    <% item.digital_links.each do |digital_link| %>
    <% format = File.extname(digital_link.digital.attachment.path).downcase %>
      <%= link_to Spree.t(:digital_download, :type => Spree.t("digital_format#{format}")), digital_url(:host => Spree::Config.get(:site_url), :secret => digital_link.secret), :class => "btn #{format}" %>
    <% end %>
  <% end %>
<% end %>
                      },
                     :disabled => false)
