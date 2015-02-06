module CapybaraExtensions
  def flash_message(type, content)
    within ".alert-#{type}" do
      expect(page).to have_content(content)
    end
  end

  def page!
    save_and_open_page
  end
end