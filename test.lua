local _G.Key = LicenseKey
local apiKey = "d4b7a5a1-8c6d-4e19-bebc-e7fffbf80d08"
local website = "wl.thebandoning.com"

local http_request = syn.request;
local body = http_request({Url = 'https://httpbin.org/get'; Method = 'GET'}).Body;
local decoded = game:GetService('HttpService'):JSONDecode(body)
local fp = decoded.headers["Syn-User-Identifier"]

local rString = "http://".. website.. ":3352/api/check?key="

local Response = syn.request({
    Url = rString.. apiKey.. "&license=".. LicenseKey.. "&device=".. fp.. "&extra=".. "Syn",
    Method = "GET"
})

if Response.Body == '{"success":true}' then
  print("VALIDATED")
else
  print("KEY INVALID")
end
