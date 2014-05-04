module Admin
  module AdminHelper
    def nav_tab_li(label, link_opts)
      opts = {}
      opts[:class] = 'active' if controller.class.name =~ /#{label}/i
      capture_haml do
        haml_tag("li", opts) do
          haml_tag("a", href: url_for(link_opts)) do
            haml_tag("span", label)
          end
        end
      end
    end

    def formatted(date)
      if date
        date.to_formatted_s(:long)
      else
        "N/A"
      end
    end
  end
end
