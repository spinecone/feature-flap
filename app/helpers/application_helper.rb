module ApplicationHelper
  def feature_flag(feature, &block)
    feature_flipper = Flipper::Rails.flipper[feature.to_sym]

    feature_flipper.enable_group(:admins) if feature_flipper.state == :off

    return unless feature_flipper.enabled? current_user

    content = capture(&block)
    content_tag :div, content, class: "feature_flag #{feature}"
  end

  def feature_enabled?(feature)
    Flipper::Rails.flipper[feature.to_sym].enabled? current_user
  end

  def is_admin?
    current_user && current_user.admin?
  end
end
