# lib/node.rb

Node = Struct.new(:data, :next) do

  def append(other)
    raise ArgumentError unless other.instance_of? Node 

    other.next = self
    other
  end

end

