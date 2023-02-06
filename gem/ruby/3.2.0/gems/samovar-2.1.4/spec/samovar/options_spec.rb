# Copyright, 2019, by Samuel G. D. Williams. <http://www.codeotaku.com>
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

RSpec.describe Samovar::Options do
	subject(:options) do
		described_class.parse do
			option '-x <value>', "The x factor", default: 2
			option '-y <value>', "The y factor"
			
			option '--symbol <value>', "A symbol", type: Symbol
		end
	end
	
	it "should set defaults" do
		values = options.parse([], nil, nil)
		expect(values).to be == {x: 2}
	end
	
	it "should preserve current values" do
		values = options.parse([], nil, {x: 1, y: 2, z: 3})
		expect(values).to be == {x: 1, y: 2, z: 3}
	end
	
	it "should update specified values" do
		values = options.parse(['-x', 10], nil, {x: 1, y: 2, z: 3})
		expect(values).to be == {x: 10, y: 2, z: 3}
	end
	
	it "converts to symbol" do
		values = options.parse(['--symbol', 'thing'], {})
		expect(values[:symbol]).to eq :thing
	end
end
