# encoding: UTF-8
module Helpers
  def self.included(receiver)
    receiver.let(:current_user) do
      create(:web_admin_user_with_permissions)
    end
  end

  def sign_in(options={})
    visit web_admin.root_path
    fill_in 'Email', with: current_user.email
    fill_in 'Senha', with: current_user.password

    click_button 'Entrar'
  end

  def navigate(path)
    first, second = path.split(/ > /, 2)

    click_link first

    return unless second

    within :xpath, ".//a[contains(., '#{first}')]/following-sibling::ul" do
      navigate second
    end
  end

  def within_records
    within '.records' do
      yield
    end
  end

  def fill_with_autocomplete(locator, options)
    within_autocomplete(locator, options) do
      within '.ui-menu-item' do
        page.find("a", :text => options.fetch(:with)).click
      end
    end
  end

  def within_autocomplete(locator, options)
    expect(page).to have_field locator

    field = page.find_field locator
    # Focus to enable the autocomplete
    page.execute_script %{ $('##{field[:id]}').focus() }
    # queries the source to get the efective records
    page.execute_script %{ $('##{field[:id]}').autocomplete("search", "#{options.fetch(:with)}") }
    # gets the widget and append to the view, since the plugin does not hide the menu anymore
    page.execute_script %{ $('##{field[:id]}').autocomplete("widget").show().appendTo( $('##{field[:id]}').parent() ) }
    expect(page).to have_css '.ui-autocomplete'

    within '.ui-autocomplete' do
      yield
    end
  end

  def fill_in_ckeditor(locator, opts)
    browser = page.driver.browser
    content = opts.fetch(:with).to_json
    page.execute_script <<-SCRIPT
      CKEDITOR.instances['#{locator}'].setData(#{content});
      $('textarea##{locator}').text(#{content});
    SCRIPT
  end

  def within_tab(locator)
    within ".nav-tabs" do
      click_link locator
    end

    within ".tab-pane.active" do
      yield
    end
  end
end

RSpec.configure do |config|
  config.include Helpers, :type => :feature
end
