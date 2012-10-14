require 'spec_helper'

describe "Static pages" do

	describe "Home page" do

		it "should have the h1 'Skradu'" do

			visit '/static_pages/home'
			page.should have_selector('h1', :text => 'Skradu.is')
		end

		it "should have the right title" do
			visit '/static_pages/home'
			page.should have_selector('title', 
							:text => "Skradu.is | Home")			
		end
	end

	describe "Help page" do

		it "should have the h1 'Help'" do
			visit '/static_pages/help'
			page.should have_selector('h1', :text => 'Help')
		end

		it "should have the right title" do
			visit '/static_pages/help'
			page.should have_selector('title', 
							:text => "Skradu.is | Help")			
		end		
	end	

	describe "About page" do

		it "should have the h1 'Um Skradu.is'" do
			visit '/static_pages/about'
			page.should have_selector('h1', :text => 'Um Skradu.is')
		end

		it "should have the right title" do
			visit '/static_pages/about'
			page.should have_selector('title', 
							:text => "Skradu.is | About")			
		end		
	end		

	describe "Contact page" do

		it "should have the h1 'Um Skradu.is'" do
			visit '/static_pages/contact'
			page.should have_selector('h1', :text => 'Hafa samband við Skradu.is')
		end

		it "should have the right title" do
			visit '/static_pages/contact'
			page.should have_selector('title', 
							:text => "Skradu.is | Contact")			
		end		
	end		
end
