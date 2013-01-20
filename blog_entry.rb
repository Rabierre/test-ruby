class BlogEntry

  attr_accessor :title, :fulltext, :time, :mood

  def initialize title, fulltext, mood
    @time = Time.now
    @title, @fulltext, @mood = title, fulltext, mood
  end
end

blog = BlogEntry.new("Sad Book", "Cry~", :sad)
print blog.title, blog.time, blog.mood, blog.fulltext
