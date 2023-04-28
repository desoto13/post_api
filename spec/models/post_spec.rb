require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:new_post) { Post.new(name: 'This is my first post', description: 'I am happy')}

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_uniqueness_of(:title) }
  end

  describe '#CRUD_tests' do
  it 'should successfully create a new valid posts' do
    expect(new_post.save).to be_truthy
  end

  it 'should be successfully updated' do
    new_post.save
    new_post.update(name: 'online')
    expect(new_post.name).to eq('online')
  end

  it 'should be successfully deleted' do
    new_post.save
    new_post.destroy
    expect(Post.find_by(title: 'This is my first post')).to eq(nil)
  end
end
end
