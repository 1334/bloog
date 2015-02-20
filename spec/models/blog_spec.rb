require 'spec_helper'
require 'ostruct'
require 'blog'

RSpec.describe Blog do
  let(:blog) { Blog.new }

 it "has no entries" do
   expect(blog.entries).to be_empty
 end

 describe "#add_entry" do
   it "adds the entry to the blog" do
     entry = Object.new
     blog.add_entry entry
     expect(blog.entries).to include entry
   end
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

   it "accepts and attribute hash on behalf of the post maker" do
     post_source = spy "post_source"
     blog.post_source = post_source
     blog.new_post(x: 42, y: 'z')

     expect(post_source).to have_received(:call).with({x: 42, y: 'z'})
   end
 end
end
