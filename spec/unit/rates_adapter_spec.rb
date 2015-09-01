require 'spec_helper'
require 'unit/shared_examples/rates_adapter_example'

describe App::Adapters::RatesAdapter do
  include_examples 'rates adapter example'
  
  before do
    #puts rates_composite
  end
    
  it 'shall create a composite structure' do
    expect(rates_composite).to be_truthy
    expect(rates_composite.to_h[:rates]).to be_truthy
    expect(rates_composite.to_h[:rates][:sun]).to be_truthy
    expect(rates_composite.to_h[:rates][:sun][:times]).to be_truthy
    expect(rates_composite.to_h[:rates][:sun][:times].length).to eq(2)
    expect(rates_composite.to_h[:rates][:sun][:times][0][:start_hour]).to eq(9)
    expect(rates_composite.to_h[:rates][:sun][:times][0][:end_hour]).to eq(21)
    expect(rates_composite.to_h[:rates][:sun][:times][0][:price]).to eq(2000)
    expect(rates_composite.to_h[:rates][:sun][:times][1][:start_hour]).to eq(1) 
    expect(rates_composite.to_h[:rates][:sun][:times][1][:end_hour]).to eq(7) 
    expect(rates_composite.to_h[:rates][:sun][:times][1][:price]).to eq(925)    
  end
end
