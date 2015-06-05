require_relative '../test_helper'

module PagarMe
  class RecipientTest < Test::Unit::TestCase

	should 'be able to create a recipient with bank_account_id' do
	  
	  bank_account = test_bank_account
	  bank_account.create

	  recipient = test_recipient
	  recipient.bank_account_id = bank_account.id
	  recipient.create

	  assert recipient.id
	  assert recipient.bank_account.id == bank_account.id

	end

	should 'be able to create a recipient without a bank_account_id' do
	  
	  recipient = test_recipient
	  recipient.bank_account = test_bank_account
	  recipient.create

	  assert recipient.id
	  assert recipient.bank_account.bank_code == test_bank_account.bank_code

	end

	should 'be able to get many recipients' do

	  recipients = PagarMe::Recipient.all()
	  assert recipients.length >= 1

  end

	should 'be able to get 5 recipients' do

	  recipients = PagarMe::Recipient.all(1, 5)
	  assert recipients.length == 5

  end

  end
end