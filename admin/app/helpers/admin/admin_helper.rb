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

    def header_with_add_button(header, button_label, path)
      capture_haml do
        haml_tag(:row) do
          haml_tag(:div, class: 'col-md-10') do
            haml_tag(:h2, header)
          end
          haml_tag(:div, class: 'col-md-2') do
            haml_tag(:h2) do
              haml_tag(:a, href: path, class: 'btn btn-primary') do
                haml_tag(:span, button_label)
              end
            end
          end
        end
      end
    end
  end
end
