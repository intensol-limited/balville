Given /^I have no newevents$/ do
  Newevent.delete_all
end

Given /^I (only )?have newevents titled "?([^\"]*)"?$/ do |only, titles|
  Newevent.delete_all if only
  titles.split(', ').each do |title|
    Newevent.create(:title => title)
  end
end

Then /^I should have ([0-9]+) newevents?$/ do |count|
  Newevent.count.should == count.to_i
end
