# coding: utf-8

puts 'Seeding the database...'

[
  { pt: 'Charity Activities', en: 'Charity Activities' },
  { pt: 'construções', en: 'Constructions' },
  { pt: 'pão de cada dia', en: 'Daily Bread' },
  { pt: 'educação', en: 'Education' },
  { pt: 'Handicapped', en: 'Handicapped' },
  { pt: 'sem casa', en: 'Homeless' },
  { pt: 'endividado', en: 'Indebted' },
  { pt: 'Jobless', en: 'Jobless' },
  { pt: 'Livelihood', en: 'Livelihood' },
  { pt: 'assistência médica', en: 'Medical Aid' },
  { pt: 'Public Welfare', en: 'Public Welfare' },
  { pt: 'religioso', en: 'Religious' },
  { pt: 'others', en: 'Others' }
].each do |name|
   category = Category.find_or_initialize_by(name_pt: name[:pt])
   category.update_attributes({
     name_en: name[:en]
   })
 end

{
  company_name: 'SilverAlms.com',
  company_logo: 'http://localhost:3000/assets/catarse_bootstrap/logo_icon_catarse.png',
  host: 'localhost:3000',
  base_url: "http://localhost:3000",

  email_contact: 'contact@support.silveralms.com',
  email_payments: 'payments@support.silveralms.com',
  email_projects: 'projects@support.silveralms.com',
  email_system: 'system@support.silveralms.com',
  email_no_reply: 'no-reply@support.silveralms.com',
  facebook_url: "https://www.facebook.com/pages/SilverAlmsCom/1432743666987583",
  facebook_app_id: '686963018037797',
  twitter_url: 'http://twitter.com/silveralms',
  twitter_username: "silveralms",
  mailchimp_url: "http://ownmanager.us8.list-manage1.com/subscribe?u=9f171110a102fc24feed06f24&id=1df03ad4dd",
  mailchimp_api_key: '0fc042d8ac466115a48e779e04770258-us8',
  catarse_fee: '0.10',
  support_forum: 'http://blog.silveralms.com',
  base_domain: 'localhost:3000',
  paypal_username: 'jtmsss_api1.yahoo.com',
  paypal_password: 'FCUBSHJJ9HBWTY2L',
  paypal_signature: 'A.A-8UOGDek6uyXy2N.a3h8WjyuHAaDBxo0OjvTdG5.1IMGIyaoxHJJf',
  uservoice_secret_gadget: 't4YVh1DqPV4t99sFoAUv9wL2XY137LRjbD6gfyN0CtA',
  uservoice_key: 'CFL6GwuDuCmFpfAQhe8AA',
  faq_url: 'http://blog.silveralms.com',
  feedback_url: 'http://blog.silveralms.com/feedback',
  terms_url: 'http://blog.silveralms.com/terms',
  privacy_url: 'http://blog.silveralms.com/privacy',
  about_channel_url: 'http://blog.silveralms.com/channel',
  instagram_url: 'http://instagram.com/slveralms',
  blog_url: "http://blog.silveralms.com",
  github_url: 'http://github.com/jinutm',
  contato_url: 'http://blog.silveralms.com/contactus'
}.each do |name, value|
   conf = CatarseSettings.find_or_initialize_by(name: name)
   conf.update_attributes({
     value: value
   }) if conf.new_record?
end


Channel.find_or_create_by!(name: "Channel name") do |c|
  c.permalink = "sample-permalink"
  c.description = "Lorem Ipsum"
end


OauthProvider.find_or_create_by!(name: 'facebook') do |o|
  o.key = '686963018037797'
  o.secret = 'aafec836b6d5493ce8ab61af0d63d5a1'
  o.path = 'facebook'
end

puts
puts '============================================='
puts ' Showing all Authentication Providers'
puts '---------------------------------------------'

OauthProvider.all.each do |conf|
  a = conf.attributes
  puts "  name #{a['name']}"
  puts "     key: #{a['key']}"
  puts "     secret: #{a['secret']}"
  puts "     path: #{a['path']}"
  puts
end


puts
puts '============================================='
puts ' Showing all entries in Configuration Table...'
puts '---------------------------------------------'

CatarseSettings.all.each do |conf|
  a = conf.attributes
  puts "  #{a['name']}: #{a['value']}"
end

puts '---------------------------------------------'
puts 'Done!'
