require "rails_helper"

feature "Events page" do
  before do
    login_as Fabricate(:user)
  end

  context "when there are some events" do
    let!(:event) { Fabricate(:event, title: "Test Event", description: "Carry on") }

    before do
      Fabricate.times(2, :event)
    end

    scenario "user visits index page" do
      visit events_path

      within "ul.events" do
        expect(page).to have_selector "li", count: 3
        expect(page).to have_content "Test Event"
        expect(page).to have_content "Carry on"
      end

      expect(page).to have_link "Create event", href: new_event_path
    end

    scenario "user creates new event" do
      visit new_event_path

      fill_in "Title", with: ""
      fill_in "Description", with: "With fine description"
      click_on "Create Event"

      expect(page).to have_content "can't be blank"

      fill_in "Title", with: "Fine event"
      click_on "Create Event"

      expect(page).to have_content "Event successfully created"
      expect(page).to have_content "Fine event"
    end

    context "when uploading succeeds" do
      scenario "user uploads event to Twitter", :vcr do
        visit event_path(event)

        expect(page).to have_content "Test Event"
        expect(page).to have_content "Carry on"

        expect(page).to have_link "Edit", edit_event_path(event)
        expect(page).to have_link "Upload", upload_event_path(event)
        expect(page).to have_link "Remove", event_path(event)

        click_on "Upload"

        expect(page).not_to have_link "Edit"
        expect(page).not_to have_link "Upload"
        expect(page).to have_content "Uploaded"
        expect(page).to have_content "Event successfully uploaded to Twitter"
      end
    end

    context "when uploading fails" do
      before do
        uploader = double
        allow(uploader).to receive(:upload).with(event).and_return(false)
        allow(Twitter::EventUploader).to receive(:new).and_return(uploader)
      end

      scenario "user uploads event to Twitter", :vcr do
        visit event_path(event)

        click_on "Upload"

        expect(page).to have_link "Edit"
        expect(page).to have_link "Upload"
        expect(page).not_to have_content "Uploaded"
        expect(page).to have_content "Failed to upload event to Twitter"
      end
    end

    scenario "user deletes event" do
      visit event_path(event)

      click_on "Remove"

      within "ul.events" do
        expect(page).to have_selector "li", count: 2
        expect(page).not_to have_content "Test Event"
        expect(page).not_to have_content "Carry on"
      end
    end

    scenario "user edits event" do
      visit event_path(event)
      click_on "Edit"

      fill_in "Title", with: ""
      fill_in "Description", with: "New times"

      click_on "Update Event"

      expect(page).to have_content "can't be blank"
      expect(page).to have_content "New times"

      fill_in "Title", with: "New rules"

      click_on "Update Event"

      expect(page).to have_content "Event successfully updated"
    end
  end
end
