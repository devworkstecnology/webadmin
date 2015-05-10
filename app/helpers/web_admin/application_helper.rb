module WebAdmin
  module ApplicationHelper
    def menu_link(text, icon, link, route)
      recognized = Engine.routes.recognize_path(link)
      if recognized[:controller] == params[:controller] && recognized[:action] == params[:action]
        content_tag(:li, :class => "active") do
          link_to(route) do
            content_tag(:i,"", :class => "#{icon} icon-xlarge") + content_tag(:span, text)
          end
        end
      else
        content_tag(:li) do
          link_to(route) do
            content_tag(:i,"", :class => "#{icon} icon-xlarge") + content_tag(:span, text)
          end
        end
      end
    end
  end
end
