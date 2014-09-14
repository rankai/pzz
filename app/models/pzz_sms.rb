require 'net/http'
require 'uri'
class PzzSms < ActiveRecord::Base

	public 
	# send sms
	# not include template
	def self.send_sms(user, mobile, content)

		# get sms sent url
		url = get_sms_sent_url(mobile, content) 

		# rails net http
		# sent
		url = URI.parse(url)
		req = Net::HTTP::Get.new(url.to_s)
		res = Net::HTTP.start(url.host, url.port) {|http|
					http.request(req)
				}

		# check response
		hashes = res.body.split("&")
		status_code = hashes[1].split("=")[1].to_i
		message = URI.encode(hashes[2].split("=")[1].to_s, "utf8")

		# 100 发送成功
		# 101 验证失败
		# 102 短信不足
		# 103 操作失败
		# 104 非法字符
		# 105 内容过多
		# 106 号码过多
		# 107 频率过快
		# 108 号码内容空
		# 110 禁止频繁单条发送
		# 112 号码错误
		# 113 定时时间格式不对
		# 114 账号被锁
		# 116 禁止接口发送
		# 117 绑定IP不正确
		# 120 系统升级

		# reduce user sms count
		# record sms history
		if status_code != 100
			new_sms_count = user.user_msg_count.to_i - 1
			user.update_attributes(user_msg_count: new_sms_count)
			PzzSmsHistory.record(user.id, mobile, content, 
				PzzSmsHistory.sms_statuses[:failed])
			return false
		else
			PzzSmsHistory.record(user.id, mobile, content, 
				PzzSmsHistory.sms_statuses[:success])
			return true
		end

	end


	# sms top-up

	# receive sms report

	private

	# get sms url
	def self.get_sms_sent_url(mobile, content)
		uid = PzzOption.find_by(option_name: "sms_account").option_value.to_s
		pwd = PzzOption.find_by(option_name: "sms_password").option_value.to_s
		hex_pwd = Digest::MD5.hexdigest("#{uid}#{pwd}")
		url = "http://api.sms.cn/mt/?uid=#{uid}&pwd=#{hex_pwd}&mobile=#{mobile}&content=#{URI.encode(content)}&encode=utf8"
		return url
	end

	# get left sms count url
	#http://api.sms.cn/mm/?uid=用户账号&pwd=MD5位32密码

end
