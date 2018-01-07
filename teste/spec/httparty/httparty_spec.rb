describe 'HTTParty' do
    # it '#content_type' do
        #mockando request com WEBMOCK
        # stub_request(:get, "https://jsonplaceholder.typicode.com/posts/2").
        #  to_return(status: 200, body: "", headers: {'content-type': 'application/json'})

        #UTILIZANDO VCR para mockar os dados de json - sem a integracao rspec na config do VCR
        # VCR.use_cassette("jsonplaceholder/posts") do
        #     response = HTTParty.get('https://jsonplaceholder.typicode.com/posts/2')
        #     content_type = response.headers['content-type']
        #     expect(content_type).to match(/application\/json/)
        # end
    #end

    # it 'content_type', vcr: { cassette_name: 'jsonplaceholder/posts', match_requests_on: [:body]} do
    #         response = HTTParty.get('https://jsonplaceholder.typicode.com/posts/4')
    #         content_type = response.headers['content-type']
    #         expect(content_type).to match(/application\/json/)
    # end 

    it 'content_type', vcr: { cassette_name: 'jsonplaceholder/posts', :record => :new_episodes} do
        response = HTTParty.get('https://jsonplaceholder.typicode.com/posts/4')
        content_type = response.headers['content-type']
        expect(content_type).to match(/application\/json/)
end 
end