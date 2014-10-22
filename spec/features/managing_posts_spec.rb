require 'rails_helper'

def create_meetup
  Post.create!(
    subject: 'Test',
    body: 'Post',
  )
end

def create_post
  Post.create!(
    subject: 'aaa',
    body: 'bbb',
  )
end

feature "Manage Posts" do

  scenario "Use index to see if blogs are not there" do
    visit posts_path
    expect(page).to have_content(/No Posts Available/)
  end

  scenario "Use index to see if blogs are there" do
    visit posts_path
    expect(page).to have_content(/Posts/)
  end

  scenario "Click on New Post link direct user to a new page form" do
    visit posts_path
    click_on 'New Post'
    expect(current_path).to eq(new_post_path)
  end

  scenario "Add info in the New Post, click submit and see new post on index page" do
      visit new_post_path

      fill_in 'Subject', with: 'RailsGirls'
      fill_in 'Body', with: 'GitHub Intro'
      click_on 'Create Post'
      expect(current_path).to eq(post_path(Post.last)) #goes to show page
      click_on 'Back'
      expect(current_path).to eq(posts_path)
      # expect(page.find('post.subject')).to have_content(/RailsGirls/)
      # expect(page.find('post.body')).to have_content(/GitHub Intro/)
    end

  scenario "Edit a particular post, be redirected and see the updated post on the index page" do
      meetup = create_meetup
      visit edit_post_path(meetup)

      fill_in 'Subject', with: 'RailsBoys'
      fill_in 'Body', with: 'GitHub Adv'
      click_on 'Update Post'
      #update #show page
      expect(current_path).to eq(post_path(meetup))

    end

  scenario "Delete a post and redirect to welcome" do
    post = create_post

    visit post_path(post)
    click_on 'Destroy'
    expect(current_path).to eq(posts_path)
    expect(post_path).to_not have_content(/Test Post/)
    end

end
