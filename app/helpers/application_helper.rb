module ApplicationHelper
  def convert_kansuji(text)
    text.tr('0123456789', '〇一二三四五六七八九')
  end
end
