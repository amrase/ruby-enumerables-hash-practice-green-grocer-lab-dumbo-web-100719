def consolidate_cart(item)
  final = Hash.new 0 
  count = :count
  item.each do |hash|
    hash.each do |food, description|
      if final.has_key?(food) == false
         final[food] = description
         final[food][count] = 1
      elsif final.has_key?(food)
            final[food][:count] +=1
      end
    end
  end
final
end

def apply_coupons(cart, coupon)
   coupon.each do |item|
     name_of_item = item[:item]
    if cart.has_key?(name_of_item) == true && cart[name_of_item][:count] >= item[:num]
      cart[name_of_item][:count] = cart[name_of_item][:count] - item[:num]
       new_item = name_of_item + (" W/COUPON")
       puts cart.has_key?(new_item)
       if cart.has_key?(new_item) == false
         cart[new_item] = {:price => item[:cost], :clearance => cart[name_of_item][:clearance], :count => 1}
      else 
         cart[new_item][:count] += 1
       end
     end
   end
   cart
 end


def apply_clearance(cart)
  # code here
  discount = 0.20
  cart.each do |item, details|
    if cart[item][:clearance] == true
      cart[item][:price] = (cart[item][:price]*discount).round(1)
    end
  end
  cart
end


