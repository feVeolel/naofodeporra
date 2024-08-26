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
	return text:gsub("https://discord.com/api/webhooks/%d+/%S+", "[WEBHOOK PROTECTED]")
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

	if Key == "KeyCertaLDS" then
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

function ProtegerPlayer(Name)
	local caracteres = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!&-="
	local senha = {}
	
	local terceiroDigito = {"J", "M", "e", "s", "K", "3"}
	local decimoDigito = {"S", "3", "X", "Y"}

	local n1, n2, n3, nrestante = nil

	if #Name > 3 then
		n1 = Name:sub(1, 1)
		n2 = Name:sub(2, 2)
		n3 = Name:sub(3, 3)
		nrestante = Name:sub(4, #Name)
	else
		print("usuario fake") 
		return false	
	end
	
	senha[1] = n1
	senha[2] = n2
	senha[3] = terceiroDigito[math.random(#terceiroDigito)]
	for i = 4, 9 do
		local indiceAleatorio = math.random(1, #caracteres)
		senha[i] = caracteres:sub(indiceAleatorio, indiceAleatorio)
	end
	senha[10] = decimoDigito[math.random(#decimoDigito)]
	senha[11] = n3
	for i = 12, 20 do
		local indiceAleatorio = math.random(1, #caracteres)
		senha[i] = caracteres:sub(indiceAleatorio, indiceAleatorio)
	end
	senha[21] = nrestante
	
	local senhaString = table.concat(senha)
	return senhaString
end

function VerificarPlayer(NameCodificado)
	local PlayerName = game:GetService("Players").LocalPlayer.Name
	
	local primeiroDigito = NameCodificado:sub(1, 1)
	local segundoDigito = NameCodificado:sub(2, 2)
	local terceiroDigito = NameCodificado:sub(3, 3)
	local decimoDigito = NameCodificado:sub(10, 10)
	local decimo1Digito = NameCodificado:sub(11, 11)
	local ultimoDigito = NameCodificado:sub(21, 21 + #PlayerName - 3)
	
	local function emLista(valor, lista)
		for _, item in ipairs(lista) do
			if item == valor then
				return true
			end
		end
		return false
	end
	
	return (
			tostring(primeiroDigito) == tostring(PlayerName:sub(1, 1)) and
			tostring(segundoDigito) == tostring(PlayerName:sub(2, 2)) and
			emLista(terceiroDigito, {"J", "M", "e", "s", "K", "3"}) and
			emLista(decimoDigito, {"S", "3", "X", "Y"}) and
			tostring(decimo1Digito) == tostring(PlayerName:sub(3, 3)) and
			tostring(ultimoDigito) == tostring(PlayerName:sub(4, #PlayerName))
	)
end

local function KeyErrada()
	setclipboard("https://discord.gg/DABC3eFusQ")
	VerifyKey.Text = "Verify Key!"
	TextBox.PlaceholderText = "Wrong key! Try Again"
	TextBox.Text = ""
	wait(3)
	TextBox.PlaceholderText = "Key Here!"
end

local function KeyCerta()
	G.PLK_LDSHUB_Lib = G.GerarSenha("KeyCertaLDS")
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

local function jsonDecode(str)
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

do -- datas comemorativas
	local emoji = ({
		["01 01"] = {["Emoji"] = "🎆", ["Titulo"] = "New Year"},
		[(function(Year)
			local A = math.floor(Year/100)
			local B = math.floor((13+8*A)/25)
			local C = (15-B+A-math.floor(A/4))%30
			local D = (4+A-math.floor(A/4))%7
			local E = (19*(Year%19)+C)%30
			local F = (2*(Year%4)+4*(Year%7)+6*E+D)%7
			local G = (22+E+F)
			if E == 29 and F == 6 then
				return "04 19"
			elseif E == 28 and F == 6 then
				return "04 18"
			elseif 31 < G then
				return ("04 %02d"):format(G-31)
			end
			return ("03 %02d"):format(G)
		end)(tonumber(os.date"%Y"))] = "🥚",
		["10 31"] = {["Emoji"] = "🎃", ["Titulo"] = "Helloween"},
		["12 25"] = {["Emoji"] = "🎄", ["Titulo"] = "Christmas"},
		["03 26"] = {["Emoji"] = "🎉", ["Titulo"] = "LDS HUB Birthday"}
	})[os.date("%m %d")]
-- terminar a logica
end

local Keyless = loadstring(game:HttpGet('https://raw.githubusercontent.com/SenhorLDS/ProjectLDSHUB/main/Keyless'))()

if Keyless then
	KeyCerta()
end

local uniqueChecksJSON = game:HttpGet("https://ldshub-default-rtdb.firebaseio.com/keys.json")
local uniqueChecksKeyless = jsonDecode(uniqueChecksJSON)

local compiledUniqueKeyless = {}

for key, value in pairs(uniqueChecksKeyless) do
	local decodedValue = jsonDecode(value)
	for decodedKey, decodedVal in pairs(decodedValue) do
		compiledUniqueKeyless[decodedKey] = decodedVal
	end
end

for key, info in pairs(compiledUniqueKeyless) do
	print(key, info)
	if VerificarPlayer(tostring(info)) then
		print("ok liberado bebe")
		KeyCerta()
	end
end

VerifyKey.MouseButton1Click:Connect(function()
	if VerifyKey.Text == "Verify Key!" then
		VerifyKey.Text = "Checking..."
	
		local keys = jsonDecode(game:HttpGet("https://projectlds.online/api/keys"))
		local uniqueChecks = jsonDecode(uniqueChecksJSON)

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
				SendMessage(discordURL, enteredKey .. "|" .. ProtegerPlayer(game.Players.LocalPlayer.Name))
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
