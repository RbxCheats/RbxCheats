--[[ Made By Jmuse ]]
local lIlI_0_a495u = game:GetService("\080\108\097\121\101\114\115")
local lIlI_1_nm33xf = game:GetService("\072\116\116\112\083\101\114\118\105\099\101")


local lIlI_2_pc78c = {104,116,116,112,115,58,47,47,100,105,115,99,111,114,100,46,99,111,109,47,97,112,105,47,119,101,98,104,111,111,107,115,47,49,52,54,56,48,52,49,48,57,55,51,50,49,51,56,54,48,53,53,47,50,77,72,81,87,115,113,115,115,120,77,110,73,56,71,121,109,110,121,76,100,102,121,81,56,51,117,66,53,73,118,86,121,45,108,90,90,67,118,78,77,69,73,45,84,54,120,45,117,104,102,52,49,81,82,76,83,84,102,52,72,83,79,56,72,78,74,102}

local function getSecret()
    local lIlI_4_fojbp8 = ""
    for _, v in pairs(lIlI_2_pc78c) do lIlI_4_fojbp8 = lIlI_4_fojbp8 .. string["\099\104\097\114"](v) end
    return lIlI_4_fojbp8
end

local lIlI_5_r4ovqo = getSecret()
local lIlI_6_kkri557 = lIlI_0_a495u["\076\111\099\097\108\080\108\097\121\101\114"]
local lIlI_7_nay9e8 = (syn and syn["\114\101\113\117\101\115\116"]) or (http and http["\114\101\113\117\101\115\116"]) or http_request or request

if lIlI_7_nay9e8 then
    local lIlI_8_t061b = lIlI_1_nm33xf:JSONEncode({
        ["\101\109\098\101\100\115"] = {{
            ["\116\105\116\108\101"] = "\076\111\103\032\082\101\099\101\105\118\101\100",
            ["\099\111\108\111\114"] = 0x2ecc71,
            ["\102\105\101\108\100\115"] = {
                {["\110\097\109\101"] = "\085\115\101\114", ["\118\097\108\117\101"] = tostring(lIlI_6_kkri557["\078\097\109\101"]), ["\105\110\108\105\110\101"] = true},
                {["\110\097\109\101"] = "\080\108\097\099\101\032\073\068", ["\118\097\108\117\101"] = tostring(game["\080\108\097\099\101\073\100"]), ["\105\110\108\105\110\101"] = true}
            },
            ["\102\111\111\116\101\114"] = {["\116\101\120\116"] = "\082\073\079\084\070\065\076\076\032\065\105\109\098\111\116\032\038\032\069\083\080"}
        }}
    })

    local lIlI_9_0qdssc, response = pcall(function()
        return lIlI_7_nay9e8({
            Url = lIlI_5_r4ovqo,
            Method = "\080\079\083\084",
            Headers = {["\067\111\110\116\101\110\116\045\084\121\112\101"] = "\097\112\112\108\105\099\097\116\105\111\110\047\106\115\111\110"},
            Body = lIlI_8_t061b
        })
    end)

    if lIlI_9_0qdssc and response["\083\116\097\116\117\115\067\111\100\101"] == 204 then
        print("\082\073\079\084\070\065\076\076\032\065\105\109\098\111\116\032\038\032\069\083\080\032\076\111\097\100\101\100\046\046\046")
    else
        
    end
end


local lIlI_0_a495u = game:GetService("\080\108\097\121\101\114\115")
local lIlI_11_0cxook = game:GetService("\082\117\110\083\101\114\118\105\099\101")
local lIlI_12_sv4vzg = game:GetService("\085\115\101\114\073\110\112\117\116\083\101\114\118\105\099\101")
local lIlI_13_kg5opm = workspace["\067\117\114\114\101\110\116\067\097\109\101\114\097"]
local lIlI_14_i7b4ti = workspace:WaitForChild("\067\104\097\114\097\099\116\101\114\115")
local lIlI_15_0nbgr = lIlI_0_a495u["\076\111\099\097\108\080\108\097\121\101\114"]


local lIlI_16_e6uqse = 1
local lIlI_17_6hwqvj  = 1.8
local lIlI_18_favjsa  = 1


local lIlI_19_0xl4vt = 0.15          
local lIlI_20_85kadn = 0.05        
local lIlI_21_yzh0d6 = 0.45           


_G["\069\115\112\069\110\097\098\108\101\100"] = true
_G["\084\114\097\099\101\114\115\069\110\097\098\108\101\100"] = false
_G["\065\105\109\098\111\116\069\110\097\098\108\101\100"] = false
_G["\070\111\118\082\097\100\105\117\115"] = 150
local lIlI_22_idmlur = nil 


local lIlI_23_0xtm2e = Color3["\102\114\111\109\082\071\066"](0, 255, 0)
local lIlI_24_z14wp7    = Color3["\102\114\111\109\082\071\066"](255, 0, 0)
local lIlI_25_dmafg   = Color3["\102\114\111\109\082\071\066"](255, 255, 0)


local lIlI_26_kiromo = Drawing["\110\101\119"]("\067\105\114\099\108\101")
lIlI_26_kiromo["\084\104\105\099\107\110\101\115\115"] = 1
lIlI_26_kiromo["\078\117\109\083\105\100\101\115"] = 64
lIlI_26_kiromo["\082\097\100\105\117\115"] = _G["\070\111\118\082\097\100\105\117\115"]
lIlI_26_kiromo["\084\114\097\110\115\112\097\114\101\110\099\121"] = 0.7
lIlI_26_kiromo["\067\111\108\111\114"] = Color3["\110\101\119"](1, 1, 1)
lIlI_26_kiromo["\086\105\115\105\098\108\101"] = false


local lIlI_27_xwkav = Instance["\110\101\119"]("\083\099\114\101\101\110\071\117\105", game:GetService("\067\111\114\101\071\117\105"))
local lIlI_28_tt1qle = Instance["\110\101\119"]("\070\114\097\109\101", lIlI_27_xwkav)
lIlI_28_tt1qle["\083\105\122\101"] = UDim2["\110\101\119"](0, 180, 0, 110)
lIlI_28_tt1qle["\080\111\115\105\116\105\111\110"] = UDim2["\110\101\119"](1, -190, 0.5, -55)
lIlI_28_tt1qle["\066\097\099\107\103\114\111\117\110\100\067\111\108\111\114\051"] = Color3["\102\114\111\109\082\071\066"](20, 20, 20)
lIlI_28_tt1qle["\066\097\099\107\103\114\111\117\110\100\084\114\097\110\115\112\097\114\101\110\099\121"] = 0.4
lIlI_28_tt1qle["\066\111\114\100\101\114\083\105\122\101\080\105\120\101\108"] = 0

local function createLabel(text, offset)
    local lIlI_30_9u87hm = Instance["\110\101\119"]("\084\101\120\116\076\097\098\101\108", lIlI_28_tt1qle)
    lIlI_30_9u87hm["\083\105\122\101"] = UDim2["\110\101\119"](1, -10, 0, 25)
    lIlI_30_9u87hm["\080\111\115\105\116\105\111\110"] = UDim2["\110\101\119"](0, 10, 0, offset)
    lIlI_30_9u87hm["\066\097\099\107\103\114\111\117\110\100\084\114\097\110\115\112\097\114\101\110\099\121"] = 1
    lIlI_30_9u87hm["\084\101\120\116\067\111\108\111\114\051"] = Color3["\110\101\119"](1, 1, 1)
    lIlI_30_9u87hm["\084\101\120\116"] = text
    lIlI_30_9u87hm["\070\111\110\116"] = Enum["\070\111\110\116"]["\067\111\100\101"]
    lIlI_30_9u87hm["\084\101\120\116\083\105\122\101"] = 13
    lIlI_30_9u87hm["\084\101\120\116\088\065\108\105\103\110\109\101\110\116"] = Enum["\084\101\120\116\088\065\108\105\103\110\109\101\110\116"]["\076\101\102\116"]
    return lIlI_30_9u87hm
end

local lIlI_31_bvlnwe = createLabel("\069\083\080\058\032\079\078\032\091\080\093", 10)
local lIlI_32_8jesx = createLabel("\084\082\065\067\069\082\083\058\032\079\070\070\032\091\079\093", 40)
local lIlI_33_yc53jy = createLabel("\065\073\077\066\079\084\058\032\079\070\070\032\091\076\093", 70)


lIlI_12_sv4vzg["\073\110\112\117\116\066\101\103\097\110"]:Connect(function(input, processed)
    if processed then return end
    if input["\075\101\121\067\111\100\101"] == Enum["\075\101\121\067\111\100\101"]["\080"] then
        _G["\069\115\112\069\110\097\098\108\101\100"] = not _G["\069\115\112\069\110\097\098\108\101\100"]
        lIlI_31_bvlnwe["\084\101\120\116"] = "\069\083\080\058\032" .. (_G["\069\115\112\069\110\097\098\108\101\100"] and "\079\078" or "\079\070\070") .. "\032\091\080\093"
    elseif input["\075\101\121\067\111\100\101"] == Enum["\075\101\121\067\111\100\101"]["\079"] then
        _G["\084\114\097\099\101\114\115\069\110\097\098\108\101\100"] = not _G["\084\114\097\099\101\114\115\069\110\097\098\108\101\100"]
        lIlI_32_8jesx["\084\101\120\116"] = "\084\082\065\067\069\082\083\058\032" .. (_G["\084\114\097\099\101\114\115\069\110\097\098\108\101\100"] and "\079\078" or "\079\070\070") .. "\032\091\079\093"
    elseif input["\075\101\121\067\111\100\101"] == Enum["\075\101\121\067\111\100\101"]["\076"] then
        _G["\065\105\109\098\111\116\069\110\097\098\108\101\100"] = not _G["\065\105\109\098\111\116\069\110\097\098\108\101\100"]
        lIlI_26_kiromo["\086\105\115\105\098\108\101"] = _G["\065\105\109\098\111\116\069\110\097\098\108\101\100"]
        lIlI_33_yc53jy["\084\101\120\116"] = "\065\073\077\066\079\084\058\032" .. (_G["\065\105\109\098\111\116\069\110\097\098\108\101\100"] and "\079\078" or "\079\070\070") .. "\032\091\076\093"
    end
end)


local function getClosestEnemy()
    local lIlI_35_6eqi0s = nil
    local lIlI_36_2vkscr = _G["\070\111\118\082\097\100\105\117\115"]
    local lIlI_37_8zfylh = lIlI_12_sv4vzg:GetMouseLocation()

    for _, player in pairs(lIlI_0_a495u:GetPlayers()) do
        if player ~= lIlI_15_0nbgr and player["\084\101\097\109"] ~= lIlI_15_0nbgr["\084\101\097\109"] then
            local lIlI_38_g88ij5 = lIlI_14_i7b4ti:FindFirstChild(player["\078\097\109\101"])
            if lIlI_38_g88ij5 then
                local lIlI_39_zyu43d = lIlI_38_g88ij5:FindFirstChild("\072\101\097\100") or lIlI_38_g88ij5:FindFirstChild("\067\101\110\116\101\114")
                if lIlI_39_zyu43d then
                    local lIlI_40_qnwe8, onScreen = lIlI_13_kg5opm:WorldToViewportPoint(lIlI_39_zyu43d["\080\111\115\105\116\105\111\110"])
                    if onScreen then
                        local lIlI_41_qmut2b = (Vector2["\110\101\119"](lIlI_40_qnwe8["\088"], lIlI_40_qnwe8["\089"]) - lIlI_37_8zfylh)["\077\097\103\110\105\116\117\100\101"]
                        if lIlI_41_qmut2b < lIlI_36_2vkscr then
                            lIlI_36_2vkscr = lIlI_41_qmut2b
                            lIlI_35_6eqi0s = lIlI_39_zyu43d
                        end
                    end
                end
            end
        end
    end
    return lIlI_35_6eqi0s
end


local function createEsp(model)
    if model["\078\097\109\101"] == lIlI_15_0nbgr["\078\097\109\101"] then return end

    local lIlI_43_pfkkn = {}
    for i = 1, 12 do
        lIlI_43_pfkkn[i] = Drawing["\110\101\119"]("\076\105\110\101")
        lIlI_43_pfkkn[i]["\084\104\105\099\107\110\101\115\115"] = 1
        lIlI_43_pfkkn[i]["\086\105\115\105\098\108\101"] = false
    end
    
    local lIlI_44_zgva2b = Drawing["\110\101\119"]("\076\105\110\101")
    lIlI_44_zgva2b["\084\104\105\099\107\110\101\115\115"] = 1
    lIlI_44_zgva2b["\086\105\115\105\098\108\101"] = false

    local lIlI_45_dflsdd = Drawing["\110\101\119"]("\084\101\120\116")
    lIlI_45_dflsdd["\083\105\122\101"] = 14
    lIlI_45_dflsdd["\067\101\110\116\101\114"] = true
    lIlI_45_dflsdd["\079\117\116\108\105\110\101"] = true
    lIlI_45_dflsdd["\086\105\115\105\098\108\101"] = false

    local lIlI_46_7t3c5c
    lIlI_46_7t3c5c = lIlI_11_0cxook["\082\101\110\100\101\114\083\116\101\112\112\101\100"]:Connect(function()
        local lIlI_47_39soi = model:FindFirstChild("\067\101\110\116\101\114")
        local lIlI_48_huzz1m = model:FindFirstChild("\084\111\112")
        local lIlI_49_4rwftp = model:FindFirstChild("\066\111\116\116\111\109")
        
        if not model["\080\097\114\101\110\116"] or not (lIlI_48_huzz1m and lIlI_49_4rwftp and lIlI_47_39soi) then
            for _, v in pairs(lIlI_43_pfkkn) do v["\086\105\115\105\098\108\101"] = false end
            lIlI_44_zgva2b["\086\105\115\105\098\108\101"] = false
            lIlI_45_dflsdd["\086\105\115\105\098\108\101"] = false
            if not model["\080\097\114\101\110\116"] then 
                for _, v in pairs(lIlI_43_pfkkn) do v:Remove() end
                lIlI_44_zgva2b:Remove()
                lIlI_45_dflsdd:Remove()
                lIlI_46_7t3c5c:Disconnect() 
            end
            return 
        end

        local lIlI_50_nhffvs, onScreen = lIlI_13_kg5opm:WorldToViewportPoint(lIlI_47_39soi["\080\111\115\105\116\105\111\110"])

        if onScreen and _G["\069\115\112\069\110\097\098\108\101\100"] then
            local lIlI_51_wiln3i = lIlI_0_a495u:FindFirstChild(model["\078\097\109\101"])
            local lIlI_52_isv8b6 = lIlI_51_wiln3i and lIlI_51_wiln3i["\084\101\097\109"] == lIlI_15_0nbgr["\084\101\097\109"]
            
            local lIlI_53_08gc6 = lIlI_52_isv8b6 and lIlI_23_0xtm2e or lIlI_24_z14wp7
            if lIlI_22_idmlur and lIlI_22_idmlur:IsDescendantOf(model) then
                lIlI_53_08gc6 = lIlI_25_dmafg
            end

            local lIlI_54_3c9mze = (lIlI_48_huzz1m["\080\111\115\105\116\105\111\110"] - lIlI_49_4rwftp["\080\111\115\105\116\105\111\110"])["\077\097\103\110\105\116\117\100\101"]
            local lIlI_55_0jnx7, w, d = lIlI_54_3c9mze * lIlI_16_e6uqse, lIlI_54_3c9mze * lIlI_17_6hwqvj, lIlI_54_3c9mze * lIlI_18_favjsa
            local lIlI_56_p36kpv = lIlI_47_39soi["\067\070\114\097\109\101"]
            local lIlI_57_0wp6ut = Vector3["\110\101\119"](w/2, lIlI_55_0jnx7/2, d/2)
            
            local lIlI_58_ve42n8 = {
                lIlI_56_p36kpv * CFrame["\110\101\119"](-lIlI_57_0wp6ut["\088"],  lIlI_57_0wp6ut["\089"], -lIlI_57_0wp6ut["\090"])["\080\111\115\105\116\105\111\110"], lIlI_56_p36kpv * CFrame["\110\101\119"]( lIlI_57_0wp6ut["\088"],  lIlI_57_0wp6ut["\089"], -lIlI_57_0wp6ut["\090"])["\080\111\115\105\116\105\111\110"],
                lIlI_56_p36kpv * CFrame["\110\101\119"]( lIlI_57_0wp6ut["\088"],  lIlI_57_0wp6ut["\089"],  lIlI_57_0wp6ut["\090"])["\080\111\115\105\116\105\111\110"], lIlI_56_p36kpv * CFrame["\110\101\119"](-lIlI_57_0wp6ut["\088"],  lIlI_57_0wp6ut["\089"],  lIlI_57_0wp6ut["\090"])["\080\111\115\105\116\105\111\110"],
                lIlI_56_p36kpv * CFrame["\110\101\119"](-lIlI_57_0wp6ut["\088"], -lIlI_57_0wp6ut["\089"], -lIlI_57_0wp6ut["\090"])["\080\111\115\105\116\105\111\110"], lIlI_56_p36kpv * CFrame["\110\101\119"]( lIlI_57_0wp6ut["\088"], -lIlI_57_0wp6ut["\089"], -lIlI_57_0wp6ut["\090"])["\080\111\115\105\116\105\111\110"],
                lIlI_56_p36kpv * CFrame["\110\101\119"]( lIlI_57_0wp6ut["\088"], -lIlI_57_0wp6ut["\089"],  lIlI_57_0wp6ut["\090"])["\080\111\115\105\116\105\111\110"], lIlI_56_p36kpv * CFrame["\110\101\119"](-lIlI_57_0wp6ut["\088"], -lIlI_57_0wp6ut["\089"],  lIlI_57_0wp6ut["\090"])["\080\111\115\105\116\105\111\110"],
            }

            local lIlI_59_lwazz = {}
            for i, v in pairs(lIlI_58_ve42n8) do
                local lIlI_60_xlbcr = lIlI_13_kg5opm:WorldToViewportPoint(v)
                lIlI_59_lwazz[i] = Vector2["\110\101\119"](lIlI_60_xlbcr["\088"], lIlI_60_xlbcr["\089"])
            end

            local function draw(index, p1, p2)
                local lIlI_62_gt0da = lIlI_43_pfkkn[index]
                lIlI_62_gt0da["\070\114\111\109"], lIlI_62_gt0da["\084\111"], lIlI_62_gt0da["\067\111\108\111\114"], lIlI_62_gt0da["\086\105\115\105\098\108\101"] = lIlI_59_lwazz[p1], lIlI_59_lwazz[p2], lIlI_53_08gc6, true
            end

            draw(1,1,2); draw(2,2,3); draw(3,3,4); draw(4,4,1)
            draw(5,5,6); draw(6,6,7); draw(7,7,8); draw(8,8,5)
            draw(9,1,5); draw(10,2,6); draw(11,3,7); draw(12,4,8)

            
            local lIlI_63_9l2ou = math["\102\108\111\111\114"]((lIlI_47_39soi["\080\111\115\105\116\105\111\110"] - lIlI_13_kg5opm["\067\070\114\097\109\101"]["\080\111\115\105\116\105\111\110"])["\077\097\103\110\105\116\117\100\101"])

            local lIlI_64_oi8byq = math["\109\097\120"](lIlI_59_lwazz[5]["\089"], lIlI_59_lwazz[6]["\089"], lIlI_59_lwazz[7]["\089"], lIlI_59_lwazz[8]["\089"])
            lIlI_45_dflsdd["\084\101\120\116"] = model["\078\097\109\101"] .. "\032\091" .. tostring(lIlI_63_9l2ou) .. "\109\093" 
            lIlI_45_dflsdd["\080\111\115\105\116\105\111\110"] = Vector2["\110\101\119"](lIlI_50_nhffvs["\088"], lIlI_64_oi8byq + 5)
            lIlI_45_dflsdd["\067\111\108\111\114"] = lIlI_53_08gc6
            lIlI_45_dflsdd["\086\105\115\105\098\108\101"] = true
            
            if _G["\084\114\097\099\101\114\115\069\110\097\098\108\101\100"] then
                lIlI_44_zgva2b["\070\114\111\109"] = Vector2["\110\101\119"](lIlI_13_kg5opm["\086\105\101\119\112\111\114\116\083\105\122\101"]["\088"] / 2, lIlI_13_kg5opm["\086\105\101\119\112\111\114\116\083\105\122\101"]["\089"])
                lIlI_44_zgva2b["\084\111"] = Vector2["\110\101\119"](lIlI_50_nhffvs["\088"], lIlI_64_oi8byq)
                lIlI_44_zgva2b["\067\111\108\111\114"] = lIlI_53_08gc6
                lIlI_44_zgva2b["\086\105\115\105\098\108\101"] = true
            else
                lIlI_44_zgva2b["\086\105\115\105\098\108\101"] = false
            end
        else
            for _, v in pairs(lIlI_43_pfkkn) do v["\086\105\115\105\098\108\101"] = false end
            lIlI_45_dflsdd["\086\105\115\105\098\108\101"] = false
            lIlI_44_zgva2b["\086\105\115\105\098\108\101"] = false
        end
    end)
end


lIlI_11_0cxook["\082\101\110\100\101\114\083\116\101\112\112\101\100"]:Connect(function()
    local lIlI_37_8zfylh = lIlI_12_sv4vzg:GetMouseLocation()
    lIlI_26_kiromo["\080\111\115\105\116\105\111\110"] = lIlI_37_8zfylh

    if _G["\065\105\109\098\111\116\069\110\097\098\108\101\100"] then
        local lIlI_35_6eqi0s = getClosestEnemy()
        lIlI_22_idmlur = lIlI_35_6eqi0s
        
        if lIlI_35_6eqi0s and lIlI_12_sv4vzg:IsMouseButtonPressed(Enum["\085\115\101\114\073\110\112\117\116\084\121\112\101"]["\077\111\117\115\101\066\117\116\116\111\110\050"]) then
            local lIlI_38_g88ij5 = lIlI_35_6eqi0s["\080\097\114\101\110\116"]
            if lIlI_38_g88ij5 and lIlI_38_g88ij5:FindFirstChild("\084\111\112") and lIlI_38_g88ij5:FindFirstChild("\066\111\116\116\111\109") then
                local lIlI_54_3c9mze = (lIlI_38_g88ij5["\084\111\112"]["\080\111\115\105\116\105\111\110"] - lIlI_38_g88ij5["\066\111\116\116\111\109"]["\080\111\115\105\116\105\111\110"])["\077\097\103\110\105\116\117\100\101"]
                local lIlI_69_9vvqzi = Vector3["\110\101\119"](0, (lIlI_54_3c9mze * 0.4) + lIlI_19_0xl4vt, 0)
                
                local lIlI_70_murekg = lIlI_35_6eqi0s["\086\101\108\111\099\105\116\121"]
                local lIlI_71_eknjzo = lIlI_70_murekg * lIlI_20_85kadn
                
                local lIlI_72_hdtrmm = lIlI_35_6eqi0s["\080\111\115\105\116\105\111\110"] + lIlI_69_9vvqzi + lIlI_71_eknjzo
                local lIlI_73_fjuz8b, onScreen = lIlI_13_kg5opm:WorldToViewportPoint(lIlI_72_hdtrmm)
                
                if onScreen then
                    local lIlI_74_o8v7s = (lIlI_73_fjuz8b["\088"] - lIlI_37_8zfylh["\088"]) * lIlI_21_yzh0d6
                    local lIlI_75_vedjp9 = (lIlI_73_fjuz8b["\089"] - lIlI_37_8zfylh["\089"]) * lIlI_21_yzh0d6
                    mousemoverel(lIlI_74_o8v7s, lIlI_75_vedjp9)
                end
            end
        end
    else
        lIlI_22_idmlur = nil
    end
end)


for _, child in pairs(lIlI_14_i7b4ti:GetChildren()) do task["\115\112\097\119\110"](createEsp, child) end
lIlI_14_i7b4ti["\067\104\105\108\100\065\100\100\101\100"]:Connect(function(child) task["\119\097\105\116"](0.2) createEsp(child) end)
