require 'spec_helper'

describe Checkout do
  before(:each) do
    subject { FactoryGirl.build(:checkout) }
  end

  after(:each) do
    subject.destroy
  end

  it { should be_valid }

  it { should respond_to :bike }
  it { should respond_to :biker }
  it { should respond_to :location }
  it { should respond_to :staffer }

  it 'should not be able to be checked out when bike offline' do
    subject.bike.condition = 'offline'
    subject.should_not be_valid
    subject.error.should eq 'Bike cannot be checked out because it is offline.'
  end

  it 'should not be able to be checked out when already checked out' do
    subject.save
    old_checkout = FactoryGirl.create(:checkout, bike: subject.bike)
    subject.should_not be_valid
    subject.error.should eq "Bike already checked out to #{subject.bike.checked_out_to}"
  end

  context 'with helmet' do
    before(:each) { subject.helmet_requested = true }

    it 'should decrement number of helmets at location' do
      orig_count = subject.location.num_helmets
      subject.save
      subject.location.num_helmets.should eq orig_count - 1
    end

    it 'should increment helmets when checked back in' do
      subject.save
      orig_count = subject.location.num_helmets
      subject.checkin
      subject.location.num_helmets.should eq orig_count + 1
    end
  end

  context 'without helmet' do
    before(:all) { subject.helmet_requested = false }

    it 'should not decrement number of helmets at location' do
      orig_count = subject.location.num_helmets
      subject.save
      subject.location.num_helmets.should eq orig_count
    end

    it 'should not increment helmets when checked back in' do
      subject.save
      orig_count = subject.location.num_helmets
      subject.checkin
      subject.location.num_helmets.should eq orig_count
    end
  end

end
