Given /^I have no newsblogs$/ do
  Newsblog.delete_all
end

Given /^I (only )?have newsblogs titled "?([^\"]*)"?$/ do |only, titles|
  Newsblog.delete_all if only
  titles.split(', ').each do |title|
    Newsblog.create(:title => title)
  end
end

Then /^I should have ([0-9]+) newsblogs?$/ do |count|
  Newsblog.count.should == count.to_i
end
