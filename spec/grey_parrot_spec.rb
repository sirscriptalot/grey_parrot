require_relative "../lib/grey_parrot"

RSpec.describe GreyParrot do
  it do
    a = GreyParrot.new

    expect(a.match(String)).to eq(true)
    expect(a.value).to eq(String)

    expect(a.match("a")).to eq(true)
    expect(a.value).to eq("a")

    expect(a.match("b")).to eq(false)
    expect(a.value).to eq("a")

    expect(a.match!("a")).to eq(true)
    expect(a.value).to eq("a")

    expect { a.match!("b") }.to raise_error(GreyParrot::MatchError)
    expect(a.value).to eq("a")
  end
end
