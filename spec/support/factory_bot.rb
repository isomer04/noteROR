RSpec.factory do |config|
    config.include factoryBot::Syntax::Methods

    config.before(:suite) do
        FactoryBot.find_definitions
    end
end