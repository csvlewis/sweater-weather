require 'rails_helper'

describe InternalService do
  it 'exists' do
    service = InternalService.new

    expect(service).to be_a(InternalService)
  end

  describe 'instance methods' do
    describe '#register' do
      it 'registers a user with given credentials' do
        service = InternalService.new
        email = SecureRandom.urlsafe_base64
        params = {
          email: email,
          password: "password",
          password_confirmation: "password"
        }
        response = service.register(params[:email],
                                    params[:password],
                                    params[:password_confirmation])
        expect(response.status).to eq(201)
      end
    end
  end
end
