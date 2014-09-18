# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

PzzOption.create([
		{option_name: 'site_name', option_value: 'PZZ', autoload: 0},
		{option_name: 'site_description', option_value: 'PZZ是一个车主发布拼车和乘客寻找拼车的信息平台', autoload: 0},
		{option_name: 'sms_account', option_value: '', autoload: 0},
		{option_name: 'sms_password', option_value: '', autoload: 0},
		{option_name: 'sms_count', option_value: '1000', autoload: 0},
	])

Role.create([
		{name: "guest"},
		{name: "passenger"},
		{name: "driver"}
	])