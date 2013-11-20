# the generated code:
# require 'spec_helper'

# describe "StaticPages" do
#   describe "GET /static_paths" do
#     it "works! (now write some real specs)" do
#       # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
#       get static_paths_index_path
#       response.status.should be(200)
#     end
#   end
# end



require 'spec_helper'

describe "Static pages" do

  subject { page }

  shared_examples_for "all static pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_title(full_title(page_title)) }
  end

  describe "Home page" do
    before { visit root_path }

    let(:heading)    { 'Sample App' }
    let(:page_title) { '' }

    it_should_behave_like "all static pages"
    it { should_not have_title('| Home') }
  end

  describe "Help page" do
    before { visit help_path }

    it { should have_title(full_title('Help'))}
    it { should have_content('Help')}
  end

  describe "About page" do
    before { visit about_path }

    it { should have_title(full_title('About'))}
    it { should have_content('About Us')}
  end

  describe "Contact page" do
    before { visit contact_path }

    it { should have_title(full_title('Contact'))}
    it { should have_selector('h1', text: 'Contact') }
  end


  # test navigational links.
  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    expect(page).to have_title(full_title('About Us'))
    click_link "Help"
    expect(page).to have_title(full_title('Help'))
    click_link "Contact"
    expect(page).to have_title(full_title('Contact'))
    click_link "Home"
    click_link "Sign up now!"
    expect(page).to have_title(full_title('Sign Up'))
    click_link "sample app"
    expect(page).to have_title(full_title('Sample App'))
  end

end



