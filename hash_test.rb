hashTest = Module.new do

  def test_merge
    a = {"a" => 1, "b" => 2}
    b = {"b" => 1}
    c = a.merge(b)

    puts c
  end
end

Class.extend(hashTest).test_merge