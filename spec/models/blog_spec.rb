require 'spec_helper'
require 'ostruct'
require 'blog'

RSpec.describe Blog do
  let(:blog) { Blog.new }

 it "has no entries" do
   expect(blog.entries).to be_empty
 end

 describe "#new_post" do
   let(:new_post) { OpenStruct.new }

   before do
     blog.post_source = -> { new_post }
   end

   it "returns a new post" do
     expect(blog.new_post).to eq new_post
   end

   it "sets the post's blog reference to itself" do
     expect(blog.new_post.blog).to eq blog
   end
 end
end
