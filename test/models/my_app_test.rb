require 'test_helper'

class MyAppTest < ActiveSupport::TestCase
  
  #The key "by" is required, else it returns an error
  test "request without by parameter results in error" do 
    assert_equal(MyApp.search(start: 10, end: 50), {:success=>false, :message=>"by is required"})
  end

  #The only values for the key "by" is either "id" or "name", else it returns an error
  test "request for something other than name or id for by parameter results in error" do 
    assert_equal(MyApp.search(by: "iddd", start: 10), {:success=>false, :message=>"Only id and name are permitted for by"})
  end

  #Both the "start" and "end" identifiers can be omitted, in which case the start identifier is assumed to be the first in the data set. "Max" page size default is 50.
  test "when id has no start, end, or max params, it returns the default max of 50" do
    assert_equal(MyApp.search(by: "id"), 
      [my_apps(:app1), my_apps(:app2), my_apps(:app3), my_apps(:app4), my_apps(:app5), my_apps(:app6), my_apps(:app7), my_apps(:app8), my_apps(:app9), my_apps(:app10),
       my_apps(:app11), my_apps(:app12), my_apps(:app13), my_apps(:app14), my_apps(:app15), my_apps(:app16), my_apps(:app17), my_apps(:app18), my_apps(:app19), my_apps(:app20),
       my_apps(:app21), my_apps(:app22), my_apps(:app23), my_apps(:app24), my_apps(:app25), my_apps(:app26), my_apps(:app27), my_apps(:app28), my_apps(:app29), my_apps(:app30),
       my_apps(:app31), my_apps(:app32), my_apps(:app33), my_apps(:app34), my_apps(:app35), my_apps(:app36), my_apps(:app37), my_apps(:app38), my_apps(:app39), my_apps(:app40),
       my_apps(:app41), my_apps(:app42), my_apps(:app43), my_apps(:app44), my_apps(:app45), my_apps(:app46), my_apps(:app47), my_apps(:app48), my_apps(:app49), my_apps(:app50)
      ] 
    )
  end

  test "when name has no start, end, or max params, it returns the default max of 50" do
    assert_equal(MyApp.search(by: "name"), 
    [my_apps(:app1), my_apps(:app2), my_apps(:app3), my_apps(:app4), my_apps(:app5), my_apps(:app6), my_apps(:app7), my_apps(:app8), my_apps(:app9), my_apps(:app10),
      my_apps(:app11), my_apps(:app12), my_apps(:app13), my_apps(:app14), my_apps(:app15), my_apps(:app16), my_apps(:app17), my_apps(:app18), my_apps(:app19), my_apps(:app20),
      my_apps(:app21), my_apps(:app22), my_apps(:app23), my_apps(:app24), my_apps(:app25), my_apps(:app26), my_apps(:app27), my_apps(:app28), my_apps(:app29), my_apps(:app30),
      my_apps(:app31), my_apps(:app32), my_apps(:app33), my_apps(:app34), my_apps(:app35), my_apps(:app36), my_apps(:app37), my_apps(:app38), my_apps(:app39), my_apps(:app40),
      my_apps(:app41), my_apps(:app42), my_apps(:app43), my_apps(:app44), my_apps(:app45), my_apps(:app46), my_apps(:app47), my_apps(:app48), my_apps(:app49), my_apps(:app50)
     ] 
    )
  end

  #Even if the "start" identifier is included, the "end" identifier can be omitted, in which case the program queries with no ending bound, but will still return results for default "max" page size (50)
  test "when id has no end or max params, it returns the default max of 50" do
    assert_equal(MyApp.search(by: "id", start: 2), 
      [my_apps(:app2), my_apps(:app3), my_apps(:app4), my_apps(:app5), my_apps(:app6), my_apps(:app7), my_apps(:app8), my_apps(:app9), my_apps(:app10),
       my_apps(:app11), my_apps(:app12), my_apps(:app13), my_apps(:app14), my_apps(:app15), my_apps(:app16), my_apps(:app17), my_apps(:app18), my_apps(:app19), my_apps(:app20),
       my_apps(:app21), my_apps(:app22), my_apps(:app23), my_apps(:app24), my_apps(:app25), my_apps(:app26), my_apps(:app27), my_apps(:app28), my_apps(:app29), my_apps(:app30),
       my_apps(:app31), my_apps(:app32), my_apps(:app33), my_apps(:app34), my_apps(:app35), my_apps(:app36), my_apps(:app37), my_apps(:app38), my_apps(:app39), my_apps(:app40),
       my_apps(:app41), my_apps(:app42), my_apps(:app43), my_apps(:app44), my_apps(:app45), my_apps(:app46), my_apps(:app47), my_apps(:app48), my_apps(:app49), my_apps(:app50), my_apps(:app51)
      ] 
    )
  end

  test "when name has no end or max params, it returns the default max of 50" do
    assert_equal(MyApp.search(by: "name", start: 2), 
      [my_apps(:app2), my_apps(:app3), my_apps(:app4), my_apps(:app5), my_apps(:app6), my_apps(:app7), my_apps(:app8), my_apps(:app9), my_apps(:app10),
       my_apps(:app11), my_apps(:app12), my_apps(:app13), my_apps(:app14), my_apps(:app15), my_apps(:app16), my_apps(:app17), my_apps(:app18), my_apps(:app19), my_apps(:app20),
       my_apps(:app21), my_apps(:app22), my_apps(:app23), my_apps(:app24), my_apps(:app25), my_apps(:app26), my_apps(:app27), my_apps(:app28), my_apps(:app29), my_apps(:app30),
       my_apps(:app31), my_apps(:app32), my_apps(:app33), my_apps(:app34), my_apps(:app35), my_apps(:app36), my_apps(:app37), my_apps(:app38), my_apps(:app39), my_apps(:app40),
       my_apps(:app41), my_apps(:app42), my_apps(:app43), my_apps(:app44), my_apps(:app45), my_apps(:app46), my_apps(:app47), my_apps(:app48), my_apps(:app49), my_apps(:app50), my_apps(:app51)
      ] 
    )
  end

  #Even if the "start" identifier is included, the "end" identifier can be omitted, in which case the program queries with no ending bound, but will still return results for a given "max" page size
  test "when id has no end or max params, it returns the given max" do
    assert_equal(MyApp.search(by: "id", start: 2, max: 5), 
      [my_apps(:app2), my_apps(:app3), my_apps(:app4), my_apps(:app5), my_apps(:app6)] 
    )
  end

  test "when name has no end or max params, it returns the given max" do
    assert_equal(MyApp.search(by: "name", start: 2, max: 5), 
      [my_apps(:app2), my_apps(:app3), my_apps(:app4), my_apps(:app5), my_apps(:app6)] 
    )
  end

  #When both the "start" and "end" values are included, they return the correct range of results
  test "id ranging start 1 to end 1 returns only the first id" do
    assert_equal(MyApp.search(by: "id", start: 1, end: 1), [my_apps(:app1)] )
  end

  test "name ranging start 1 to end 1 returns only the first id" do
    assert_equal(MyApp.search(by: "name", start: 1, end: 1), [my_apps(:app1)] )
  end


  #When only the "end" value is included, they return the correct range of results
  test "id with only an end parameter of 2 returns the first two items" do
    assert_equal(MyApp.search(by: "id", end: 2), [my_apps(:app1), my_apps(:app2)] )
  end

  test "name with only an end parameter of 2 returns the first two items" do
    assert_equal(MyApp.search(by: "name", end: 2), [my_apps(:app1), my_apps(:app2)] )
  end

  #When the "end" identifier is less than the default "max" of 50, it returns from the start to the end.
  test "when id has an end less than the default max, it returns a list up to the end" do
    assert_equal(MyApp.search(by: "id", end: 20), 
      [my_apps(:app1), my_apps(:app2), my_apps(:app3), my_apps(:app4), my_apps(:app5), my_apps(:app6), my_apps(:app7), my_apps(:app8), my_apps(:app9), my_apps(:app10),
       my_apps(:app11), my_apps(:app12), my_apps(:app13), my_apps(:app14), my_apps(:app15), my_apps(:app16), my_apps(:app17), my_apps(:app18), my_apps(:app19), my_apps(:app20),
      ] 
    )
  end

  test "when name has an end less than the default max, it returns a list up to the end" do
    assert_equal(MyApp.search(by: "name", end: 20), 
      [my_apps(:app1), my_apps(:app2), my_apps(:app3), my_apps(:app4), my_apps(:app5), my_apps(:app6), my_apps(:app7), my_apps(:app8), my_apps(:app9), my_apps(:app10),
       my_apps(:app11), my_apps(:app12), my_apps(:app13), my_apps(:app14), my_apps(:app15), my_apps(:app16), my_apps(:app17), my_apps(:app18), my_apps(:app19), my_apps(:app20),
      ] 
    )
  end

  #When the "end" identifier is greater than the "max", it returns from the start to the max.
  test "when id has an end greater than the max, it returns a list up to the page max" do
    assert_equal(MyApp.search(by: "id", end: 30, max: 20), 
      [my_apps(:app1), my_apps(:app2), my_apps(:app3), my_apps(:app4), my_apps(:app5), my_apps(:app6), my_apps(:app7), my_apps(:app8), my_apps(:app9), my_apps(:app10),
       my_apps(:app11), my_apps(:app12), my_apps(:app13), my_apps(:app14), my_apps(:app15), my_apps(:app16), my_apps(:app17), my_apps(:app18), my_apps(:app19), my_apps(:app20),
      ] 
    )
  end

  test "when name has an end greater than the max, it returns a list up to the page max" do
    assert_equal(MyApp.search(by: "name", end: 30, max: 20), 
      [my_apps(:app1), my_apps(:app2), my_apps(:app3), my_apps(:app4), my_apps(:app5), my_apps(:app6), my_apps(:app7), my_apps(:app8), my_apps(:app9), my_apps(:app10),
       my_apps(:app11), my_apps(:app12), my_apps(:app13), my_apps(:app14), my_apps(:app15), my_apps(:app16), my_apps(:app17), my_apps(:app18), my_apps(:app19), my_apps(:app20),
      ] 
    )
  end

  #Setting the order parameter to "desc" returns the results in descending order
  test "setting the order parameter to desc for id returns the results in descending order" do
    assert_equal(MyApp.search(by: "id", order: "desc", start: 1, end: 5), [my_apps(:app60), my_apps(:app59), my_apps(:app58), my_apps(:app57), my_apps(:app56)] )
  end

  test "setting the order parameter to desc for name returns the results in descending order" do
    assert_equal(MyApp.search(by: "name", order: "desc", start: 1, end: 5), [my_apps(:app60), my_apps(:app59), my_apps(:app58), my_apps(:app57), my_apps(:app56)] )
  end

  #If the "end" identifier is a number lower than the "start" identifier, it returns an error
  test "request by id parameter with end lower than start results in error" do 
    assert_equal(MyApp.search(by: "id", start: 20, end: 10), {:success=>false, :message=>"The end parameter must be higher than the start parameter"})
  end

  test "request by name parameter with end lower than start results in error" do 
    assert_equal(MyApp.search(by: "name", start: 20, end: 10), {:success=>false, :message=>"The end parameter must be higher than the start parameter"})
  end

end
