local uri_args=ngx.var.uri
local phoneId=string.sub(uri_args,7)

local cache_ngx=ngx.shared.my_cache
local phoneKey="sku:"..phoneId..":info"

local phoneCache=cache_ngx:get(phoneKey)
local url="http://192.168.0.102:8084"
local path1="/phone/findSpecsByPhoneId/"..phoneId
local wanzheng=url..path1
--ngx.say(wanzheng)
if phoneCache == "" or phoneCache == nil then
	local http = require("resty.http")
	local httpc = http.new()
	local resp,err = httpc:request_uri(url,{
			method = "GET",
			path=path1
	})
--	local resp = ngx.location.capture(wanzheng,{
--		method = ngx.HTTP_GET
--	}
--	)
	phoneCache=resp.body

	cache_ngx:set(phoneKey,phoneCache,10*60)
end
--ngx.say(http)
--ngx.say(type(http))
--ngx.say(httpc)
--ngx.say(type(httpc))
--ngx.say(phoneCache)
local cjson =require("cjson")
local phoneCacheJSON=cjson.decode(phoneCache)
local context = {
	phoneId = phoneCacheJSON.phoneId,
	phoneName=phoneCacheJSON.phoneName,
	phonePrice=phoneCacheJSON.phonePrice,
	phoneDescription=phoneCacheJSON.phoneDescription,
	phoneStock=phoneCacheJSON.phoneStock,
	phoneIcon=phoneCacheJSON.phoneIcon,
	categoryType=phoneCacheJSON.categoryType,
	phoneTag=phoneCacheJSON.phoneTag,
	createTime=phoneCacheJSON.createTime,
	updateTime=phoneCacheJSON.updateTime

}

local template = require("resty.template")

template.render("phone.html",context)
