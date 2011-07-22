Factory.define :shop do |s|
  s.domain "example.com"
end

Factory.define :sale do |s|
  s.starts_at 1.hour.ago
  s.ends_at 1.hour.from_now
  s.amount_type "fixed"
end