Feature: Reviews

  Scenario: Go to the reviews page
    Given there is a review with the first_name "Milne" that is moderated
    And there is a review with the first_name "Frankenstein"
    And I go to the reviews page
    And I should see "Milne"
    And I should not see "Frankenstein"

@javascript
  Scenario: Add new review
    Given I am on the reviews page
    And I should not see "Имя"
    When I follow "Оставить отзыв"
    And I fill in "Имя" with "Jolly"
    And I fill in "Фамилия" with "Roger"
    And I press "Отправить"
    Then I should see "не может быть пустым"
    When I fill in "Сообщение" with "I hang you on the yardarm!"
    And I press "Отправить"
    Then I should see "Ваш отзыв отправлен на модерацию"
