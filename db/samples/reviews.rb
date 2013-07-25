Review.reset_column_information
3.times { FactoryGirl.create(:review) }
3.times { FactoryGirl.create(:filled_review) }
3.times { FactoryGirl.create(:moderated_review) }
3.times { FactoryGirl.create(:moderated_filled_review) }
