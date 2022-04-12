local game                              = game;
local GetService                        = game.GetService;

local HttpService                       = GetService(game, "HttpService");

if syn then
  syn.request({
    Url = "http://127.0.0.1:6463/rpc?v=1", Method = "POST", Headers = {["Content-Type"] = "application/json", ["Origin"] = "https://discord.com"},
    Body = HttpService:JSONEncode({cmd = "INVITE_BROWSER", args = {code = "d2CjXDhEwj"}, nonce = HttpService:GenerateGUID(false)}),
  })
else
  setclipboard("https://discord.gg/d2CjXDhEwj")
end
