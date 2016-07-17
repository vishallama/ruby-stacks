# spec/stack_spec.rb
require 'stack'
require 'node'

describe Stack do

  describe '#initialize' do
    it 'creates an empty stack' do
      expect(Stack.new.empty?).to be true
    end
  end

  describe '#pop' do
    context 'When stack is empty' do
      let(:node1) { Node.new(1) }

      it 'raises RuntimeError' do
        expect { Stack.new.pop }.to raise_error RuntimeError, "empty stack"
      end

      it 'pushing a Node object and popping it returns the same object' do
        expect(Stack.new.push(node1).pop).to eq(node1)
      end
    end
  end

  describe '#push' do
    let(:node1) { Node.new(1) }
    let(:node2) { Node.new(2) }
    let(:empty_stack) { Stack.new }

    context 'When a node object is pushed onto an empty' do
      it 'the stack is empty when the node object is immediately popped' do
        empty_stack.push(node1).pop
        expect(empty_stack.empty?).to be true
      end
    end

    context 'When two nodes are pushed onto an empty stack' do
      it 'the second node is returned when the stack is popped' do
        empty_stack.push(node1).push(node2)
        expect(empty_stack.pop).to eq(node2)
      end

      it 'the first node is returned when the stack is popped twice' do
        empty_stack.push(node1).push(node2)
        empty_stack.pop
        expect(empty_stack.pop).to eq(node1)
      end

      it 'raises RunstimeError when the stack is popped thrice' do
        empty_stack.push(node1).push(node2)
        empty_stack.pop
        empty_stack.pop
        expect { empty_stack.pop }.to raise_error RuntimeError, "empty stack"
      end
    end
  end
end

