class PagesController < ApplicationController
  def home
    set_page_subtitle "Home"
    @posts = Blog.all
    @skills = Skill.all
  end

  def about
    set_page_subtitle "About"
  end

  def contact
    set_page_subtitle "Contact"
  end

  def resume
    set_page_subtitle "Resume"
  end
end
