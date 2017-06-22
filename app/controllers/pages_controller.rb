class PagesController < ApplicationController
  def home
    @blogs = Blog.all
    @skills = Skill.all
    print @blogs.as_json
    
  end

  def about
  end

  def contact
  end
end
