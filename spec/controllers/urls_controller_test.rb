require 'rails_helper'

describe UrlsController, :type => :controller do

  describe "Test URL Controller" do

    context 'test create/show and top methods' do
      it 'should create shortened URL' do
        url = "http://netflix.com"
        post :create, params: {"original_url"=> url}
        expect(assigns(:url).shortened_url.present?).to be true
      end

      it 'should return shortened url' do
        url = FactoryBot.create(:url)
        get :show, params: {"shortened_url"=> url.shortened_url}
        expect(response.body.include? url.original_url).to be true
      end

      it 'should return url based on count - desc' do
        [1,2,3].each do |i|
          FactoryBot.create(:url, count: i)
        end
        get :top_urls, params: {}
        url1 = Url.find_by(count:3)
        url2 = Url.find_by(count:2)
        url3 = Url.find_by(count:1)
        array = response.body.split('http')
        expect(array.second.include? url1.original_url )
        expect(array.third.include? url2.original_url )
        expect(array.fourth.include? url3.original_url )
      end


    end


  end

end