require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    described_class.new(name: 'John Doe', email: 'john_doe@mail.com', password: 'password')
  end

  before { subject.save }

  it 'name should not be nil' do
    subject.name = nil
    expect(subject).not_to be_valid
  end

  it 'valids the name' do
    subject.name = 'John Doe'
    expect(subject).to be_valid
  end

  it 'email should not be nil' do
    subject.email = nil
    expect(subject).not_to be_valid
  end

  it 'valids the email' do
    subject.email = 'john_doe@mail.com'
    expect(subject).to be_valid
  end
end
