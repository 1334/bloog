class Blog
  attr_reader :entries
  attr_writer :post_source

  def initialize
    @entries = []
  end

  def title
    "Watching Paint Dry"
  end

  def subtitle
    "The trusted source for drying paint news & opinion"
  end

  def add_entry entry
    entries << entry
  end

  def new_post *args
    post = post_source.call *args
    post.blog = self
    post
  end

  private

  def post_source
    @post_source ||= Post.public_method :new
  end
end
