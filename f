local G = getgenv()
local whitelist = {
	"https://raw.githubusercontent.com/feVeolel/naofodeporra/main/CC2",
	"https://raw.githubusercontent.com/feVeolel/naofodeporra/main/AWS",
	"https://raw.githubusercontent.com/feVeolel/naofodeporra/main/TOH",
	"https://raw.githubusercontent.com/feVeolel/naofodeporra/main/PS99",
	"https://raw.githubusercontent.com/feVeolel/naofodeporra/main/BAT",
	"https://raw.githubusercontent.com/SenhorLDS/ProjectLDSHUB/main/Keyless",
	"https://projectlds.online/api/keys",
	"https://ldshub-default-rtdb.firebaseio.com/keys.json",
	"https://discord.com/api/webhooks/1184852608482021427/R8I_gJvVOe9JX0Bflg60aVtit5iKDkG4F5bc8_A-hEbWrdbyCeinpKiTqwSam1KZZkJC",
	"https://api.ipify.org"
}

local hookfunctionClone = clonefunction(hookfunction)
local printClone = clonefunction(print)
local warnClone = clonefunction(warn)
local setclipboardClone = clonefunction(setclipboard)
local requestClone = clonefunction(request)

local discordURL = "https://discord.com/api/webhooks/1184852608482021427/R8I_gJvVOe9JX0Bflg60aVtit5iKDkG4F5bc8_A-hEbWrdbyCeinpKiTqwSam1KZZkJC"

local function containsWhitelistURL(text)
	for _, url in ipairs(whitelist) do
		if text:find(url, 1, true) then
			return true
		end
	end
	return false
end

local function obfuscateURL(text)
	return text:gsub("https://discord.com/api/webhooks/%d+/%S+", "[WEBHOOK PROTECTED / Faz o L! 🥱]")
end

local function printMessage(message)
	printClone(message)
end

local function checkAndBlockWhitelist(args)
	for _, arg in ipairs(args) do
		local argStr = tostring(arg)
		if containsWhitelistURL(argStr) then
			printMessage(obfuscateURL(argStr)) -- Mostrar a URL protegida
			return true
		end
	end	
	return false
end

local function hookedPrint(...)
	local args = {...}
	if checkAndBlockWhitelist(args) then
		return nil
	end
	return printClone(...)
end

local function hookedWarn(...)
	local args = {...}
	if checkAndBlockWhitelist(args) then
		return nil
	end
	return warnClone(...)
end

local function hookedSetClipboard(...)
	local args = {...}
	if checkAndBlockWhitelist(args) then
		return nil
	end
	return setclipboardClone(...)
end

local function hookedRequest(...)
	local args = {...}
	local blocked = false

	for _, arg in ipairs(args) do
		if type(arg) == "table" and arg.Url then
			local url = tostring(arg.Url)
			if containsWhitelistURL(url) then
				if url == discordURL then
					return requestClone(...) -- Permite o envio do webhook
				end
				blocked = true
				break
			end
		end
	end

	if not blocked then
		return requestClone(...)
	else
		return nil
	end
end

local oldPrint = hookfunctionClone(print, newcclosure(hookedPrint))
local oldWarn = hookfunctionClone(warn, newcclosure(hookedWarn))
local oldSetClipboard = hookfunctionClone(setclipboard, newcclosure(hookedSetClipboard))
local oldRequest = hookfunctionClone(request, newcclosure(hookedRequest))

local KeyGratis = "Not Avaliable!"

local Key = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Frame_2 = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local TextBox = Instance.new("TextBox")
local UICorner_3 = Instance.new("UICorner")
local VerifyKey = Instance.new("TextButton")
local UICorner_4 = Instance.new("UICorner")
local GetKey = Instance.new("TextButton")
local UICorner_5 = Instance.new("UICorner")
local TextLabel = Instance.new("TextLabel")
local TextLabel_2 = Instance.new("TextLabel")
local FreeKey = Instance.new("TextLabel")
local CloseButton = Instance.new("TextButton")
local UICorner_6 = Instance.new("UICorner")

--Properties:

Key.Name = "Key"
Key.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
Key.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = Key
Frame.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
Frame.Position = UDim2.new(0.365676939, 0, 0.370526314, 0)
Frame.Size = UDim2.new(0.268025011, 0, 0.258947372, 0)

UICorner.Parent = Frame

Frame_2.Parent = Frame
Frame_2.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
Frame_2.Position = UDim2.new(0.0200190786, 0, 0.375200957, 0)
Frame_2.Size = UDim2.new(0.95996207, 0, 0.592883468, 0)

UICorner_2.Parent = Frame_2

TextBox.Parent = Frame_2
TextBox.BackgroundColor3 = Color3.fromRGB(126, 126, 126)
TextBox.Position = UDim2.new(0.117921829, 0, 0.218541741, 0)
TextBox.Size = UDim2.new(0.756936789, 0, 0.28797707, 0)
TextBox.Font = Enum.Font.SciFi
TextBox.PlaceholderText = "Key Here!"
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.TextScaled = true
TextBox.TextSize = 14.000
TextBox.TextWrapped = true

UICorner_3.Parent = TextBox

VerifyKey.Name = "VerifyKey"
VerifyKey.Parent = Frame_2
VerifyKey.BackgroundColor3 = Color3.fromRGB(170, 0, 255)
VerifyKey.Position = UDim2.new(0.305634111, 0, 0.563785374, 0)
VerifyKey.Size = UDim2.new(0.381512165, 0, 0.198070675, 0)
VerifyKey.Font = Enum.Font.FredokaOne
VerifyKey.Text = "Verify Key!"
VerifyKey.TextColor3 = Color3.fromRGB(255, 255, 255)
VerifyKey.TextScaled = true
VerifyKey.TextSize = 14.000
VerifyKey.TextWrapped = true

UICorner_4.Parent = VerifyKey

GetKey.Name = "GetKey"
GetKey.Parent = Frame_2
GetKey.BackgroundColor3 = Color3.fromRGB(170, 0, 255)
GetKey.Position = UDim2.new(0.283975005, 0, 0.812265933, 0)
GetKey.Size = UDim2.new(0.424830258, 0, 0.146595716, 0)
GetKey.Font = Enum.Font.FredokaOne
GetKey.Text = "Click here for get Key!"
GetKey.TextColor3 = Color3.fromRGB(255, 255, 255)
GetKey.TextScaled = true
GetKey.TextSize = 14.000
GetKey.TextWrapped = true

UICorner_5.Parent = GetKey

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Position = UDim2.new(0.0200187974, 0, 0.201462671, 0)
TextLabel.Size = UDim2.new(0.959961772, 0, 0.190380752, 0)
TextLabel.Font = Enum.Font.FredokaOne
TextLabel.Text = "Put the Key to execute the LDS HUB"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

TextLabel_2.Parent = Frame
TextLabel_2.BackgroundColor3 = Color3.fromRGB(170, 0, 255)
TextLabel_2.BackgroundTransparency = 1.000
TextLabel_2.Position = UDim2.new(0.0198268592, 0, 0.0261515081, 0)
TextLabel_2.Size = UDim2.new(0.959961772, 0, 0.204395592, 0)
TextLabel_2.Font = Enum.Font.FredokaOne
TextLabel_2.Text = "Key Checker"
TextLabel_2.TextColor3 = Color3.fromRGB(170, 0, 255)
TextLabel_2.TextScaled = true
TextLabel_2.TextSize = 14.000
TextLabel_2.TextWrapped = true

FreeKey.Name = "Free Key"
FreeKey.Parent = Frame
FreeKey.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
FreeKey.BackgroundTransparency = 1.000
FreeKey.Position = UDim2.new(0.0177088641, 0, 0.391461134, 0)
FreeKey.Size = UDim2.new(0.95996207, 0, 0.0816831291, 0)
FreeKey.ZIndex = 10
FreeKey.Font = Enum.Font.FredokaOne
FreeKey.Text = "Free Key Here: " .. KeyGratis
FreeKey.TextColor3 = Color3.fromRGB(85, 255, 0)
FreeKey.TextScaled = true
FreeKey.TextSize = 14.000
FreeKey.TextWrapped = true

CloseButton.Name = "CloseButton"
CloseButton.Parent = Frame
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 49, 111)
CloseButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
CloseButton.BorderSizePixel = 0
CloseButton.Position = UDim2.new(0.9281196, 0, -0.0447154492, 0)
CloseButton.Size = UDim2.new(0.0927109346, 0, 0.16260162, 0)
CloseButton.Font = Enum.Font.FredokaOne
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextScaled = true
CloseButton.TextSize = 14.000
CloseButton.TextStrokeTransparency = 0.000
CloseButton.TextWrapped = true

UICorner_6.Parent = CloseButton

local plrGui = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

GetKey.MouseButton1Click:Connect(function()
	setclipboard("https://discord.gg/DABC3eFusQ")
	TextBox.PlaceholderText = "Link Copied!"
	TextBox.Text = ""
	wait(3)
	TextBox.PlaceholderText = "Key Here!"
end)

getgenv().GerarSenha = function(Key) 
	local HWID = game:GetService("RbxAnalyticsService"):GetClientId()

	local caracteres = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!&"
	local senha = {}

	local primeiroDigito = {"L", "D", "S", "7", "R", "B", "D"}
	local quintoDigito = {"9", "@", "$", "L", "I", "T"}
	local oitavoDigito = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9"}
	local ultimoDigito = {"K", "C", "V", "M", "A", "S"}
	local Timer1 = {"%", "$", "#", "@"}

	local function Timer()
		local HOUR = math.floor((tick() % 86400) / 3600)
		HOUR = HOUR % 12 == 0 and 12 or HOUR % 12

		local digit1 = math.floor(HOUR / 10) -- Dígito das dezenas
		local digit2 = HOUR % 10 -- Dígito das unidades

		return digit1, digit2
	end

	if Key == "Gw49xnQdXrP0waCktki04bUR0jocgB3g" then
		senha[1] = primeiroDigito[math.random(#primeiroDigito)]
		for i = 2, 4 do
			local indiceAleatorio = math.random(1, #caracteres)
			senha[i] = caracteres:sub(indiceAleatorio, indiceAleatorio)
		end
		senha[5] = quintoDigito[math.random(#quintoDigito)]
		for i = 6, 7 do
			local indiceAleatorio = math.random(1, #caracteres)
			senha[i] = caracteres:sub(indiceAleatorio, indiceAleatorio)
		end
		senha[8] = oitavoDigito[math.random(#oitavoDigito)]
		for i = 9, 15 do
			local indiceAleatorio = math.random(1, #caracteres)
			senha[i] = caracteres:sub(indiceAleatorio, indiceAleatorio)
		end
		senha[16] = ultimoDigito[math.random(#ultimoDigito)]
		for i = 17, 19 do
			local indiceAleatorio = math.random(1, #caracteres)
			senha[i] = caracteres:sub(indiceAleatorio, indiceAleatorio)
		end
		local hwidLen = #HWID
		for i = 20, 74 do
			local indiceAleatorio = math.random(1, #caracteres)
			senha[i] = (i - 19 <= hwidLen) and HWID:sub(i - 19, i - 19) or caracteres:sub(indiceAleatorio, indiceAleatorio)
		end

		local x, c = Timer()

		senha[75] = Timer1[math.random(#Timer1)]
		senha[76] = x
		senha[77] = c
		senha[78] = Timer1[math.random(#Timer1)]

		for i = 79, 100 do
			local indiceAleatorio = math.random(1, #caracteres)
			senha[i] = caracteres:sub(indiceAleatorio, indiceAleatorio)
		end

		local senhaString = table.concat(senha)
		return senhaString
	else

		for i = 1, 100 do
			local indiceAleatorio = math.random(1, #caracteres)
			senha[i] = caracteres:sub(indiceAleatorio, indiceAleatorio)
		end

		local senhaString = table.concat(senha)
		return senhaString
	end
end

getgenv().VerificarSenha = function(senha) 
	local HWID = game:GetService("RbxAnalyticsService"):GetClientId()

	local function Timer()
		local HOUR = math.floor((tick() % 86400) / 3600)
		HOUR = HOUR % 12 == 0 and 12 or HOUR % 12
		return math.floor(HOUR / 10), HOUR % 10
	end

	if #senha ~= 100 then
		return false
	end

	local matematica = #HWID + 19

	local primeiroDigito = senha:sub(1, 1)
	local quintoDigito = senha:sub(5, 5)
	local digito8 = senha:sub(8, 8)
	local ultimoDigito = senha:sub(16, 16)
	local HwidDigito = senha:sub(20, matematica)
	local Timer1 = senha:sub(75, 75)
	local TimerPl1 = senha:sub(76, 76)
	local TimerPl2 = senha:sub(77, 77)
	local Timer2 = senha:sub(78, 78)

	local function emLista(valor, lista)
		for _, item in ipairs(lista) do
			if item == valor then
				return true
			end
		end
		return false
	end

	local x, c = Timer()

	return (
		emLista(primeiroDigito, {"L", "D", "S", "7", "R", "B"}) and
			emLista(quintoDigito, {"9", "@", "$", "L", "I", "T"}) and
			digito8:match("%d") and
			emLista(ultimoDigito, {"K", "C", "V", "M", "A", "S"}) and
			HwidDigito == HWID and
			emLista(Timer1, {"%", "$", "#", "@"}) and
			tostring(x) == tostring(TimerPl1) and tostring(c) == tostring(TimerPl2) and
			emLista(Timer2, {"%", "$", "#", "@"}) 
	)
end

function ProtegerPlayer(Hwid, Ip)
	local caracteres = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
	local senha = {}
	
	local o1 = {"J", "M", "e", "s", "K", "3"}
	local o2 = {"S", "3", "X", "Y"}
	local o3 = {"J", "h", "R", "T", "v"}
	
	local n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, nrestante = nil
	local i1, i2, i3, i4, irestante = nil
	
	local RemoveTHwid = string.gsub(Hwid, "-", "")
	
	if #RemoveTHwid > 10 then
		n1 = RemoveTHwid:sub(1, 1)
		n2 = RemoveTHwid:sub(2, 2)
		n3 = RemoveTHwid:sub(3, 3)
		n4 = RemoveTHwid:sub(4, 4)
		n5 = RemoveTHwid:sub(5, 5)
		n6 = RemoveTHwid:sub(6, 6)
		n7 = RemoveTHwid:sub(7, 7)
		n8 = RemoveTHwid:sub(8, 8)
		n9 = RemoveTHwid:sub(9, 9)
		n10 = RemoveTHwid:sub(10, 10)
		nrestante = RemoveTHwid:sub(11, #RemoveTHwid)
	else
		print("HWID FAKE!") 
		return false	
	end
	
	if #Ip > 4 then
		i1 = Ip:sub(1, 1)
		i2 = Ip:sub(2, 2)
		i3 = Ip:sub(3, 3)
		i4 = Ip:sub(4, 4)
		irestante = Ip:sub(5, #Ip)
	else
		print("Ip FAKE!") 
		return false	
	end
	
	senha[1] = n1
	senha[2] = n2
	senha[3] = o1[math.random(#o1)]
	for i = 4, 9 do
		local indiceAleatorio = math.random(1, #caracteres)
		senha[i] = caracteres:sub(indiceAleatorio, indiceAleatorio)
	end
	senha[10] = o2[math.random(#o2)]
	senha[11] = n3
	senha[12] = n4
	senha[13] = n5
	senha[14] = n6
	for i = 15, 27 do
		local indiceAleatorio = math.random(1, #caracteres)
		senha[i] = caracteres:sub(indiceAleatorio, indiceAleatorio)
	end
	senha[28] = n7
	senha[29] = o3[math.random(#o3)]
	senha[30] = o3[math.random(#o3)]
	senha[31] = n8
	senha[32] = n9
	senha[33] = n10
	for i = 34, 36 do
		local indiceAleatorio = math.random(1, #caracteres)
		senha[i] = caracteres:sub(indiceAleatorio, indiceAleatorio)
	end
	senha[37] = i1
	senha[38] = i2
	for i = 39, 45 do
		local indiceAleatorio = math.random(1, #caracteres)
		senha[i] = caracteres:sub(indiceAleatorio, indiceAleatorio)
	end
	senha[46] = i3
	senha[47] = i4
	for i = 48, 51 do
		local indiceAleatorio = math.random(1, #caracteres)
		senha[i] = caracteres:sub(indiceAleatorio, indiceAleatorio)
	end
	senha[52] = nrestante
	local pos = 53 + #nrestante
	senha[pos] = irestante

	
	local senhaString = table.concat(senha)
	return senhaString
end

function VerificarPlayer(SenhaCodificada)
	local HWID = game:GetService("RbxAnalyticsService"):GetClientId()
	local ipAddress = tostring(game:HttpGet("https://api.ipify.org", true))
	
	if HWID and ipAddress then
		
		local RemoveTHwid = string.gsub(HWID, "-", "")
		
		local function emLista(valor, lista)
			for _, item in ipairs(lista) do
				if item == valor then
					return true
				end
			end
			return false
		end
		
		local t1 = SenhaCodificada:sub(1, 1)
		local t2 = SenhaCodificada:sub(2, 2)
		local t3 = SenhaCodificada:sub(3, 3)
		local t10 = SenhaCodificada:sub(10, 10)
		local t11 = SenhaCodificada:sub(11, 11)
		local t12 = SenhaCodificada:sub(12, 12)
		local t13 = SenhaCodificada:sub(13, 13)
		local t14 = SenhaCodificada:sub(14, 14)
		local t28 = SenhaCodificada:sub(28, 28)
		local t29 = SenhaCodificada:sub(29, 29)
		local t30 = SenhaCodificada:sub(30, 30)
		local t31 = SenhaCodificada:sub(31, 31)
		local t32 = SenhaCodificada:sub(32, 32)
		local t33 = SenhaCodificada:sub(33, 33)
		local t37 = SenhaCodificada:sub(37, 37)
		local t38 = SenhaCodificada:sub(38, 38)
		local t46 = SenhaCodificada:sub(46, 46)
		local t47 = SenhaCodificada:sub(47, 47)
		local t52 = SenhaCodificada:sub(52, 52 + #RemoveTHwid - 10)
		local tfl = SenhaCodificada:sub(53 + #RemoveTHwid - 10, 53 + #RemoveTHwid - 10 + #ipAddress - 4)
		
		print("Comparando t1:", t1, "com RemoveTHwid:", RemoveTHwid:sub(1, 1))
		print("Comparando t2:", t2, "com RemoveTHwid:", RemoveTHwid:sub(2, 2))
		print("Comparando t3 com a lista:", t3)
		print("Comparando t10 com a lista:", t10)
		print("Comparando t11:", t11, "com RemoveTHwid:", RemoveTHwid:sub(3, 3))
		print("Comparando t12:", t12, "com RemoveTHwid:", RemoveTHwid:sub(4, 4))
		print("Comparando t13:", t13, "com RemoveTHwid:", RemoveTHwid:sub(5, 5))
		print("Comparando t14:", t14, "com RemoveTHwid:", RemoveTHwid:sub(6, 6))
		print("Comparando t28:", t28, "com RemoveTHwid:", RemoveTHwid:sub(7, 7))
		print("Comparando t29 com a lista:", t29)
		print("Comparando t30 com a lista:", t30)
		print("Comparando t31:", t31, "com RemoveTHwid:", RemoveTHwid:sub(8, 8))
		print("Comparando t32:", t32, "com RemoveTHwid:", RemoveTHwid:sub(9, 9))
		print("Comparando t33:", t33, "com RemoveTHwid:", RemoveTHwid:sub(10, 10))
		print("Comparando t37:", t37, "com RemoveTIp:", ipAddress:sub(1, 1))
		print("Comparando t38:", t38, "com RemoveTIp:", ipAddress:sub(2, 2))
		print("Comparando t46:", t46, "com RemoveTIp:", ipAddress:sub(3, 3))
		print("Comparando t47:", t47, "com RemoveTIp:", ipAddress:sub(4, 4))
		print("Comparando t52:", t52, "com RemoveTHwid restante:", RemoveTHwid:sub(11, #RemoveTHwid))
		print("Comparando tfl:", tfl, "com RemoveTIp restante:", ipAddress:sub(5, #ipAddress))

		return (
			tostring(t1) == tostring(RemoveTHwid:sub(1, 1)) and
			tostring(t2) == tostring(RemoveTHwid:sub(2, 2)) and
			emLista(t3, {"J", "M", "e", "s", "K", "3"}) and
			emLista(t10, {"S", "3", "X", "Y"}) and
				tostring(t11) == tostring(RemoveTHwid:sub(3, 3)) and
				tostring(t12) == tostring(RemoveTHwid:sub(4, 4)) and
				tostring(t13) == tostring(RemoveTHwid:sub(5, 5)) and
				tostring(t14) == tostring(RemoveTHwid:sub(6, 6)) and
				tostring(t28) == tostring(RemoveTHwid:sub(7, 7)) and
				emLista(t29, {"J", "h", "R", "T", "v"}) and
				emLista(t30, {"J", "h", "R", "T", "v"}) and
				tostring(t31) == tostring(RemoveTHwid:sub(8, 8)) and
				tostring(t32) == tostring(RemoveTHwid:sub(9, 9)) and
				tostring(t33) == tostring(RemoveTHwid:sub(10, 10)) and
				tostring(t37) == tostring(ipAddress:sub(1, 1)) and
				tostring(t38) == tostring(ipAddress:sub(2, 2)) and
				tostring(t46) == tostring(ipAddress:sub(3, 3)) and
				tostring(t47) == tostring(ipAddress:sub(4, 4)) and
				tostring(t52) == tostring(RemoveTHwid:sub(11, #RemoveTHwid)) and
				tostring(tfl) == tostring(ipAddress:sub(5, #ipAddress))
		)
	end
end

function KeyErrada()
	setclipboard("https://discord.gg/DABC3eFusQ")
	VerifyKey.Text = "Verify Key!"
	TextBox.PlaceholderText = "Wrong key! Try Again"
	TextBox.Text = ""
	wait(3)
	TextBox.PlaceholderText = "Key Here!"
end

function KeyCerta()
	G.PLK_LDSHUB_Lib = G.GerarSenha("Gw49xnQdXrP0waCktki04bUR0jocgB3g")
	if game.PlaceId == 654732683 then
		loadstring(game:HttpGet("https://raw.githubusercontent.com/feVeolel/naofodeporra/main/CC2"))()
		print("LDSHub CC2")
		Key:Destroy()
	elseif game.PlaceId == 13127800756 then
		loadstring(game:HttpGet("https://raw.githubusercontent.com/feVeolel/naofodeporra/main/AWS"))()
		print("LDSHub AWS")
		Key:Destroy()
	elseif game.PlaceId == 1962086868 then
		loadstring(game:HttpGet("https://raw.githubusercontent.com/feVeolel/naofodeporra/main/TOH"))()
		print("LDSHub TOH")
		Key:Destroy()
	elseif game.PlaceId == 8737899170 or game.PlaceId == 16498369169 or game.PlaceId == 17503543197 then
		loadstring(game:HttpGet('https://raw.githubusercontent.com/feVeolel/naofodeporra/main/PS99'))()	
		print("LDSHub Ps99")
		Key:Destroy()
	elseif game.PlaceId == 17698307509 then
		loadstring(game:HttpGet('https://raw.githubusercontent.com/feVeolel/naofodeporra/main/BAT'))()
		print("LDSHub BAT")
		Key:Destroy()
	else
		Key:Destroy()
		print("Error 212 | LDS HUB does not support this game!")
	end
end

function jsonDecode(str)
	return game:GetService("HttpService"):JSONDecode(str)
end

function SendMessage(url, message)
	local http = game:GetService("HttpService")
	local headers = {
		["Content-Type"] = "application/json"
	}
	local data = {
		["content"] = message
	}
	local body = http:JSONEncode(data)
	local response = request({
		Url = url,
		Method = "POST",
		Headers = headers,
		Body = body
	})
end

local Keyless = loadstring(game:HttpGet('https://raw.githubusercontent.com/SenhorLDS/ProjectLDSHUB/main/Keyless'))()

if Keyless then
	KeyCerta()
elseif Keyless == "Maintenance" then
	Key:Destroy()
	print("LDS HUB is undergoing maintenance. We apologize and please be patient! soon we are back!")
	-- executar um loadstring aqui de aviso
end

local keys1 = jsonDecode(game:HttpGet("https://projectlds.online/api/keys"))
local uniqueChecksJSON1 = game:HttpGet("https://ldshub-default-rtdb.firebaseio.com/keys.json")
local uniqueChecks1 = jsonDecode(uniqueChecksJSON1)

for key, value in pairs(uniqueChecks1) do
	local decodedValue = jsonDecode(value)
	for decodedKey, decodedVal in pairs(decodedValue) do
		if VerificarPlayer(decodedVal) then
			if table.find(keys1, decodedKey) then
				KeyCerta()
			end
		end
	end
end

VerifyKey.MouseButton1Click:Connect(function()
	if VerifyKey.Text == "Verify Key!" then
		VerifyKey.Text = "Checking..."
	
		local keys = jsonDecode(game:HttpGet("https://projectlds.online/api/keys"))
		local uniqueChecksJSON = game:HttpGet("https://ldshub-default-rtdb.firebaseio.com/keys.json")
		local uniqueChecks = jsonDecode(uniqueChecksJSON)

		local HWID = game:GetService("RbxAnalyticsService"):GetClientId()
		local ipAddress = tostring(game:HttpGet("https://api.ipify.org", true))
		
		local compiledUnique = {}

		for key, value in pairs(uniqueChecks) do
			local decodedValue = jsonDecode(value)
			for decodedKey, decodedVal in pairs(decodedValue) do
				compiledUnique[decodedKey] = decodedVal
			end
		end
	
		local enteredKey = tostring(TextBox.Text)
		if table.find(keys, enteredKey) then
			if not compiledUnique[enteredKey] then
				SendMessage(discordURL, enteredKey .. "|" .. ProtegerPlayer(HWID, ipAddress))
				KeyCerta()
			elseif VerificarPlayer(tostring(compiledUnique[enteredKey])) then
				KeyCerta()
			else
				KeyErrada()
			end
		else
			KeyErrada()
		end
	end
end)	

CloseButton.MouseButton1Click:Connect(function()
	Key:Destroy()
end)
