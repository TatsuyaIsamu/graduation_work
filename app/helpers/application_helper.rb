module ApplicationHelper
  def convert_kansuji(text)
    text.tr('0123456789', '〇一二三四五六七八九')
  end

  def worship_choose_new_or_edit
    if action_name == 'new'
      confirm_worships_path
    elsif action_name == 'edit'
      worship_path
    end
  end
end
