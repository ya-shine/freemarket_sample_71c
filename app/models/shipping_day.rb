class ShippingDay < ActiveHash::Base
  self.data = [
    {id: 1, name: '１〜2日で発送'},{id: 2, name: '2〜3日で発送'},{id: 3, name: '4〜7日で発送'}
  ]
end