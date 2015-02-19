require 'spec_helper'
require 'blog'

RSpec.describe Blog do
  let(:blog) { Blog.new }

 it "has no entries" do
   expect(blog.entries).to be_empty
 end
end
