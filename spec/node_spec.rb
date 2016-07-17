# lib/node_spec.rb
require 'node'

describe Node do

  describe '#initialize' do

    context 'when no arguments are passed' do
      it 'sets data to nil' do
        expect(Node.new.data).to eq(nil)
      end

      it 'sets next to nil' do
        expect(Node.new.next).to eq(nil)
      end
    end

    context 'when only one argument is passed' do
      it 'sets data to that argument' do
        expect(Node.new(1).data).to eq(1)
      end

      it 'sets next to nil' do
        expect(Node.new.next).to eq(nil)
      end
    end

    context 'when another Node object is appended' do
      let(:node1) { Node.new(1) }
      let(:node2) { Node.new(2) }

      it 'the next of that Node object is set to this node' do
        expect(node1.append(node2).next).to eq(node1)  
      end
    end

    context 'when a non-Node object is appended' do
      it 'raises ArgumentError' do
        expect { Node.new(1).append(2) }.to raise_error ArgumentError 
      end
    end
     
  end
end

