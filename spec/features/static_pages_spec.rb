require "rails_helper"

feature "Homepage" do
  context "not logged in user" do
    scenario "visits root path" do
      visit root_path

      expect(page).to have_content "Twittery Board"
      expect(page).to have_link "Sign in with Twitter", href: user_omniauth_authorize_path(:twitter)
    end
  end

  context "logged in user" do
    let(:user) { Fabricate(:user) }

    before do
      login_as user
    end

    scenario "visits root path" do
      visit root_path

      expect(page).to have_content "Twittery Board"
      expect(page).not_to have_link "Sign in with Twitter"
      expect(page).to have_link "Sign Out", href: destroy_user_session_path

      expect(page).to have_link "Events", href: events_path
    end
  end
end
