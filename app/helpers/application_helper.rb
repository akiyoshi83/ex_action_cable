module ApplicationHelper
  def i18n_view_scope
    controller_name = "#{controller.controller_path.split('/').join('_')}"
    "#{controller_name}.#{controller.action_name}"
  end
end
