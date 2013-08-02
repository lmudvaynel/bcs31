# encoding: utf-8

Then /^(?:|I )should can visit each of base pages$/ do
  # Should be screened out by parent_id later
  base_pages = Page.visible.without(:slug, :index)
  base_pages.each do |base_page|
    step %Q(I follow "#{base_page.name}")
    current_path.sub('/', '').should == base_page.slug
    # Confirm that the page will display
    step %Q(I should see "Главная")
  end
end

And /^the page "(.*?)" has child "(.*?)"$/ do |parent_name, child_name|
  parent = Page.find_by_name(parent_name)
  if parent
    child = Page.create!(slug: 'hedgehog', name: child_name)
    child.parent = parent
    child.save
  end
end

And /^I select link "(.*?)" from menu$/ do |name|
  p = Page.find_by_name(name)
  page.driver.browser.execute_script %Q{
  	$("a[href='/#{p.slug}']").trigger('mouseover');
  }
end
