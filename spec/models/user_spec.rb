require 'rails_helper'

#RSpec.describe User, type: :model do
 # pending "add some examples to (or delete) #{__FILE__}"

describe User do
  let(:user) { FactoryGirl.create(:user) }
  subject { user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password) } # virtual attribute
  it { should respond_to(:password_digest) }
  it { should respond_to(:authenticate) }

  it { should be_valid }
  it { should_not be_admin }

  describe "empty name" do
	  before { user.name = '' }

	  it { should_not be_valid }
  end

  describe "blank name" do
	  before { user.name = ' ' }

  	it { should_not be_valid }
  end

  describe "empty email" do
	  before { user.email = '' }

	  it { should_not be_valid }
  end

  describe "blank email" do
  	before { user.email = ' ' }

	  it { should_not be_valid }
  end

  describe "empty password" do
    let (:unsaved_user) { FactoryGirl.build(:user, password: '') }

	  specify { expect(unsaved_user).not_to be_valid }
  end

  describe "blank password" do
    let (:unsaved_user) { FactoryGirl.build(:user, password: ' ') }

	  specify { expect(unsaved_user).not_to be_valid }
  end

  describe "long name" do
	  before { user.name = 'a' * 51 }

    it { should_not be_valid }
  end

  describe "duplicate name" do
  	let(:duplicate) do
      d = user.dup
      d.email = 'duplicate@example.com'
      d
	  end

  	it "is not allowed" do
      expect(duplicate).not_to be_valid
  	end
  end

  describe "duplicate email" do
  	let(:duplicate) do
       d = user.dup
	     d.name = 'Jane Doe'
	      d
	  end

	  it "is not allowed" do
	    expect(duplicate).not_to be_valid
	  end
	  
	  describe "administrator account" do
	    let (:admin) { FactoryGirl.create(:admin) }
	    
	    specify { expect(admin).to be_admin }
	  end
  end
end
