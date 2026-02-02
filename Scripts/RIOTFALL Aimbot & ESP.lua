--[[ Made by Jmuse ]]
local lIl_0_u6qbg = game:GetService("\80\108\97\121\101\114\115")
local lIl_1_ba5y3l = game:GetService("\82\117\110\83\101\114\118\105\99\101")
local lIl_2_ptappx = game:GetService("\85\115\101\114\73\110\112\117\116\83\101\114\118\105\99\101")
local lIl_3_ywm0xg = workspace["\67\117\114\114\101\110\116\67\97\109\101\114\97"]
local lIl_4_9ixp9 = workspace:WaitForChild("\67\104\97\114\97\99\116\101\114\115")
local lIl_5_elx0b8 = lIl_0_u6qbg["\76\111\99\97\108\80\108\97\121\101\114"]


local lIl_6_8f80o = 1
local lIl_7_5p6r6l  = 1.8
local lIl_8_i2yrxu  = 1


local lIl_9_rze0j = 0.15          
local lIl_10_ojd8ge = 0.05        
local lIl_11_v73zmm = 0.45           


_G["\69\115\112\69\110\97\98\108\101\100"] = true
_G["\84\114\97\99\101\114\115\69\110\97\98\108\101\100"] = false
_G["\65\105\109\98\111\116\69\110\97\98\108\101\100"] = false
_G["\70\111\118\82\97\100\105\117\115"] = 150
local lIl_12_magipw = nil 


local lIl_13_kadlnw = Color3["\102\114\111\109\82\71\66"](0, 255, 0)
local lIl_14_3j6yen    = Color3["\102\114\111\109\82\71\66"](255, 0, 0)
local lIl_15_tg884x   = Color3["\102\114\111\109\82\71\66"](255, 255, 0)


local lIl_16_5yyjj6 = Drawing["\110\101\119"]("\67\105\114\99\108\101")
lIl_16_5yyjj6["\84\104\105\99\107\110\101\115\115"] = 1
lIl_16_5yyjj6["\78\117\109\83\105\100\101\115"] = 64
lIl_16_5yyjj6["\82\97\100\105\117\115"] = _G["\70\111\118\82\97\100\105\117\115"]
lIl_16_5yyjj6["\84\114\97\110\115\112\97\114\101\110\99\121"] = 0.7
lIl_16_5yyjj6["\67\111\108\111\114"] = Color3["\110\101\119"](1, 1, 1)
lIl_16_5yyjj6["\86\105\115\105\98\108\101"] = false


local lIl_17_z28l3o = Instance["\110\101\119"]("\83\99\114\101\101\110\71\117\105", game:GetService("\67\111\114\101\71\117\105"))
local lIl_18_1gdw3u = Instance["\110\101\119"]("\70\114\97\109\101", lIl_17_z28l3o)
lIl_18_1gdw3u["\83\105\122\101"] = UDim2["\110\101\119"](0, 180, 0, 110)
lIl_18_1gdw3u["\80\111\115\105\116\105\111\110"] = UDim2["\110\101\119"](1, -190, 0.5, -55)
lIl_18_1gdw3u["\66\97\99\107\103\114\111\117\110\100\67\111\108\111\114\51"] = Color3["\102\114\111\109\82\71\66"](20, 20, 20)
lIl_18_1gdw3u["\66\97\99\107\103\114\111\117\110\100\84\114\97\110\115\112\97\114\101\110\99\121"] = 0.4
lIl_18_1gdw3u["\66\111\114\100\101\114\83\105\122\101\80\105\120\101\108"] = 0

local function createLabel(text, offset)
    local lIl_20_ksr1k = Instance["\110\101\119"]("\84\101\120\116\76\97\98\101\108", lIl_18_1gdw3u)
    lIl_20_ksr1k["\83\105\122\101"] = UDim2["\110\101\119"](1, -10, 0, 25)
    lIl_20_ksr1k["\80\111\115\105\116\105\111\110"] = UDim2["\110\101\119"](0, 10, 0, offset)
    lIl_20_ksr1k["\66\97\99\107\103\114\111\117\110\100\84\114\97\110\115\112\97\114\101\110\99\121"] = 1
    lIl_20_ksr1k["\84\101\120\116\67\111\108\111\114\51"] = Color3["\110\101\119"](1, 1, 1)
    lIl_20_ksr1k["\84\101\120\116"] = text
    lIl_20_ksr1k["\70\111\110\116"] = Enum["\70\111\110\116"]["\67\111\100\101"]
    lIl_20_ksr1k["\84\101\120\116\83\105\122\101"] = 13
    lIl_20_ksr1k["\84\101\120\116\88\65\108\105\103\110\109\101\110\116"] = Enum["\84\101\120\116\88\65\108\105\103\110\109\101\110\116"]["\76\101\102\116"]
    return lIl_20_ksr1k
end

local lIl_21_hrrbh = createLabel("\69\83\80\58\32\79\78\32\91\80\93", 10)
local lIl_22_cjubun = createLabel("\84\82\65\67\69\82\83\58\32\79\70\70\32\91\79\93", 40)
local lIl_23_xikczw = createLabel("\65\73\77\66\79\84\58\32\79\70\70\32\91\76\93", 70)


lIl_2_ptappx["\73\110\112\117\116\66\101\103\97\110"]:Connect(function(input, processed)
    if processed then return end
    if input["\75\101\121\67\111\100\101"] == Enum["\75\101\121\67\111\100\101"]["\80"] then
        _G["\69\115\112\69\110\97\98\108\101\100"] = not _G["\69\115\112\69\110\97\98\108\101\100"]
        lIl_21_hrrbh["\84\101\120\116"] = "\69\83\80\58\32" .. (_G["\69\115\112\69\110\97\98\108\101\100"] and "\79\78" or "\79\70\70") .. "\32\91\80\93"
    elseif input["\75\101\121\67\111\100\101"] == Enum["\75\101\121\67\111\100\101"]["\79"] then
        _G["\84\114\97\99\101\114\115\69\110\97\98\108\101\100"] = not _G["\84\114\97\99\101\114\115\69\110\97\98\108\101\100"]
        lIl_22_cjubun["\84\101\120\116"] = "\84\82\65\67\69\82\83\58\32" .. (_G["\84\114\97\99\101\114\115\69\110\97\98\108\101\100"] and "\79\78" or "\79\70\70") .. "\32\91\79\93"
    elseif input["\75\101\121\67\111\100\101"] == Enum["\75\101\121\67\111\100\101"]["\76"] then
        _G["\65\105\109\98\111\116\69\110\97\98\108\101\100"] = not _G["\65\105\109\98\111\116\69\110\97\98\108\101\100"]
        lIl_16_5yyjj6["\86\105\115\105\98\108\101"] = _G["\65\105\109\98\111\116\69\110\97\98\108\101\100"]
        lIl_23_xikczw["\84\101\120\116"] = "\65\73\77\66\79\84\58\32" .. (_G["\65\105\109\98\111\116\69\110\97\98\108\101\100"] and "\79\78" or "\79\70\70") .. "\32\91\76\93"
    end
end)


local function getClosestEnemy()
    local lIl_25_oc3di3 = nil
    local lIl_26_9mnm04 = _G["\70\111\118\82\97\100\105\117\115"]
    local lIl_27_t6oav = lIl_2_ptappx:GetMouseLocation()

    for _, player in pairs(lIl_0_u6qbg:GetPlayers()) do
        if player ~= lIl_5_elx0b8 and player["\84\101\97\109"] ~= lIl_5_elx0b8["\84\101\97\109"] then
            local lIl_28_yoony = lIl_4_9ixp9:FindFirstChild(player["\78\97\109\101"])
            if lIl_28_yoony then
                local lIl_29_gg1r4h = lIl_28_yoony:FindFirstChild("\72\101\97\100") or lIl_28_yoony:FindFirstChild("\67\101\110\116\101\114")
                if lIl_29_gg1r4h then
                    local lIl_30_8jlk9n, onScreen = lIl_3_ywm0xg:WorldToViewportPoint(lIl_29_gg1r4h["\80\111\115\105\116\105\111\110"])
                    if onScreen then
                        local lIl_31_yn06wj = (Vector2["\110\101\119"](lIl_30_8jlk9n["\88"], lIl_30_8jlk9n["\89"]) - lIl_27_t6oav)["\77\97\103\110\105\116\117\100\101"]
                        if lIl_31_yn06wj < lIl_26_9mnm04 then
                            lIl_26_9mnm04 = lIl_31_yn06wj
                            lIl_25_oc3di3 = lIl_29_gg1r4h
                        end
                    end
                end
            end
        end
    end
    return lIl_25_oc3di3
end


local function createEsp(model)
    if model["\78\97\109\101"] == lIl_5_elx0b8["\78\97\109\101"] then return end

    local lIl_33_locwfo = {}
    for i = 1, 12 do
        lIl_33_locwfo[i] = Drawing["\110\101\119"]("\76\105\110\101")
        lIl_33_locwfo[i]["\84\104\105\99\107\110\101\115\115"] = 1
        lIl_33_locwfo[i]["\86\105\115\105\98\108\101"] = false
    end
    
    local lIl_34_v9gpgp = Drawing["\110\101\119"]("\76\105\110\101")
    lIl_34_v9gpgp["\84\104\105\99\107\110\101\115\115"] = 1
    lIl_34_v9gpgp["\86\105\115\105\98\108\101"] = false

    local lIl_35_dpprv8 = Drawing["\110\101\119"]("\84\101\120\116")
    lIl_35_dpprv8["\83\105\122\101"] = 14
    lIl_35_dpprv8["\67\101\110\116\101\114"] = true
    lIl_35_dpprv8["\79\117\116\108\105\110\101"] = true
    lIl_35_dpprv8["\86\105\115\105\98\108\101"] = false

    local lIl_36_jh9egp
    lIl_36_jh9egp = lIl_1_ba5y3l["\82\101\110\100\101\114\83\116\101\112\112\101\100"]:Connect(function()
        local lIl_37_fuy96 = model:FindFirstChild("\67\101\110\116\101\114")
        local lIl_38_prrf5 = model:FindFirstChild("\84\111\112")
        local lIl_39_tt5cdg = model:FindFirstChild("\66\111\116\116\111\109")
        
        if not model["\80\97\114\101\110\116"] or not (lIl_38_prrf5 and lIl_39_tt5cdg and lIl_37_fuy96) then
            for _, v in pairs(lIl_33_locwfo) do v["\86\105\115\105\98\108\101"] = false end
            lIl_34_v9gpgp["\86\105\115\105\98\108\101"] = false
            lIl_35_dpprv8["\86\105\115\105\98\108\101"] = false
            if not model["\80\97\114\101\110\116"] then 
                for _, v in pairs(lIl_33_locwfo) do v:Remove() end
                lIl_34_v9gpgp:Remove()
                lIl_35_dpprv8:Remove()
                lIl_36_jh9egp:Disconnect() 
            end
            return 
        end

        local lIl_40_w1s95j, onScreen = lIl_3_ywm0xg:WorldToViewportPoint(lIl_37_fuy96["\80\111\115\105\116\105\111\110"])

        if onScreen and _G["\69\115\112\69\110\97\98\108\101\100"] then
            local lIl_41_9jj1w8 = lIl_0_u6qbg:FindFirstChild(model["\78\97\109\101"])
            local lIl_42_l8dq4b = lIl_41_9jj1w8 and lIl_41_9jj1w8["\84\101\97\109"] == lIl_5_elx0b8["\84\101\97\109"]
            
            local lIl_43_gqtz4e = lIl_42_l8dq4b and lIl_13_kadlnw or lIl_14_3j6yen
            if lIl_12_magipw and lIl_12_magipw:IsDescendantOf(model) then
                lIl_43_gqtz4e = lIl_15_tg884x
            end

            local lIl_44_nq5hj8 = (lIl_38_prrf5["\80\111\115\105\116\105\111\110"] - lIl_39_tt5cdg["\80\111\115\105\116\105\111\110"])["\77\97\103\110\105\116\117\100\101"]
            local lIl_45_9a40o, w, d = lIl_44_nq5hj8 * lIl_6_8f80o, lIl_44_nq5hj8 * lIl_7_5p6r6l, lIl_44_nq5hj8 * lIl_8_i2yrxu
            local lIl_46_q74wga = lIl_37_fuy96["\67\70\114\97\109\101"]
            local lIl_47_wbfn3u = Vector3["\110\101\119"](w/2, lIl_45_9a40o/2, d/2)
            
            local lIl_48_fdjtf = {
                lIl_46_q74wga * CFrame["\110\101\119"](-lIl_47_wbfn3u["\88"],  lIl_47_wbfn3u["\89"], -lIl_47_wbfn3u["\90"])["\80\111\115\105\116\105\111\110"], lIl_46_q74wga * CFrame["\110\101\119"]( lIl_47_wbfn3u["\88"],  lIl_47_wbfn3u["\89"], -lIl_47_wbfn3u["\90"])["\80\111\115\105\116\105\111\110"],
                lIl_46_q74wga * CFrame["\110\101\119"]( lIl_47_wbfn3u["\88"],  lIl_47_wbfn3u["\89"],  lIl_47_wbfn3u["\90"])["\80\111\115\105\116\105\111\110"], lIl_46_q74wga * CFrame["\110\101\119"](-lIl_47_wbfn3u["\88"],  lIl_47_wbfn3u["\89"],  lIl_47_wbfn3u["\90"])["\80\111\115\105\116\105\111\110"],
                lIl_46_q74wga * CFrame["\110\101\119"](-lIl_47_wbfn3u["\88"], -lIl_47_wbfn3u["\89"], -lIl_47_wbfn3u["\90"])["\80\111\115\105\116\105\111\110"], lIl_46_q74wga * CFrame["\110\101\119"]( lIl_47_wbfn3u["\88"], -lIl_47_wbfn3u["\89"], -lIl_47_wbfn3u["\90"])["\80\111\115\105\116\105\111\110"],
                lIl_46_q74wga * CFrame["\110\101\119"]( lIl_47_wbfn3u["\88"], -lIl_47_wbfn3u["\89"],  lIl_47_wbfn3u["\90"])["\80\111\115\105\116\105\111\110"], lIl_46_q74wga * CFrame["\110\101\119"](-lIl_47_wbfn3u["\88"], -lIl_47_wbfn3u["\89"],  lIl_47_wbfn3u["\90"])["\80\111\115\105\116\105\111\110"],
            }

            local lIl_49_p8o1i = {}
            for i, v in pairs(lIl_48_fdjtf) do
                local lIl_50_pulfbj = lIl_3_ywm0xg:WorldToViewportPoint(v)
                lIl_49_p8o1i[i] = Vector2["\110\101\119"](lIl_50_pulfbj["\88"], lIl_50_pulfbj["\89"])
            end

            local function draw(index, p1, p2)
                local lIl_52_tol4pa = lIl_33_locwfo[index]
                lIl_52_tol4pa["\70\114\111\109"], lIl_52_tol4pa["\84\111"], lIl_52_tol4pa["\67\111\108\111\114"], lIl_52_tol4pa["\86\105\115\105\98\108\101"] = lIl_49_p8o1i[p1], lIl_49_p8o1i[p2], lIl_43_gqtz4e, true
            end

            draw(1,1,2); draw(2,2,3); draw(3,3,4); draw(4,4,1)
            draw(5,5,6); draw(6,6,7); draw(7,7,8); draw(8,8,5)
            draw(9,1,5); draw(10,2,6); draw(11,3,7); draw(12,4,8)

            
            local lIl_53_4zvjz = math["\102\108\111\111\114"]((lIl_37_fuy96["\80\111\115\105\116\105\111\110"] - lIl_3_ywm0xg["\67\70\114\97\109\101"]["\80\111\115\105\116\105\111\110"])["\77\97\103\110\105\116\117\100\101"])

            local lIl_54_jsz2u = math["\109\97\120"](lIl_49_p8o1i[5]["\89"], lIl_49_p8o1i[6]["\89"], lIl_49_p8o1i[7]["\89"], lIl_49_p8o1i[8]["\89"])
            lIl_35_dpprv8["\84\101\120\116"] = model["\78\97\109\101"] .. "\32\91" .. tostring(lIl_53_4zvjz) .. "\109\93" 
            lIl_35_dpprv8["\80\111\115\105\116\105\111\110"] = Vector2["\110\101\119"](lIl_40_w1s95j["\88"], lIl_54_jsz2u + 5)
            lIl_35_dpprv8["\67\111\108\111\114"] = lIl_43_gqtz4e
            lIl_35_dpprv8["\86\105\115\105\98\108\101"] = true
            
            if _G["\84\114\97\99\101\114\115\69\110\97\98\108\101\100"] then
                lIl_34_v9gpgp["\70\114\111\109"] = Vector2["\110\101\119"](lIl_3_ywm0xg["\86\105\101\119\112\111\114\116\83\105\122\101"]["\88"] / 2, lIl_3_ywm0xg["\86\105\101\119\112\111\114\116\83\105\122\101"]["\89"])
                lIl_34_v9gpgp["\84\111"] = Vector2["\110\101\119"](lIl_40_w1s95j["\88"], lIl_54_jsz2u)
                lIl_34_v9gpgp["\67\111\108\111\114"] = lIl_43_gqtz4e
                lIl_34_v9gpgp["\86\105\115\105\98\108\101"] = true
            else
                lIl_34_v9gpgp["\86\105\115\105\98\108\101"] = false
            end
        else
            for _, v in pairs(lIl_33_locwfo) do v["\86\105\115\105\98\108\101"] = false end
            lIl_35_dpprv8["\86\105\115\105\98\108\101"] = false
            lIl_34_v9gpgp["\86\105\115\105\98\108\101"] = false
        end
    end)
end


lIl_1_ba5y3l["\82\101\110\100\101\114\83\116\101\112\112\101\100"]:Connect(function()
    local lIl_27_t6oav = lIl_2_ptappx:GetMouseLocation()
    lIl_16_5yyjj6["\80\111\115\105\116\105\111\110"] = lIl_27_t6oav

    if _G["\65\105\109\98\111\116\69\110\97\98\108\101\100"] then
        local lIl_25_oc3di3 = getClosestEnemy()
        lIl_12_magipw = lIl_25_oc3di3
        
        if lIl_25_oc3di3 and lIl_2_ptappx:IsMouseButtonPressed(Enum["\85\115\101\114\73\110\112\117\116\84\121\112\101"]["\77\111\117\115\101\66\117\116\116\111\110\50"]) then
            local lIl_28_yoony = lIl_25_oc3di3["\80\97\114\101\110\116"]
            if lIl_28_yoony and lIl_28_yoony:FindFirstChild("\84\111\112") and lIl_28_yoony:FindFirstChild("\66\111\116\116\111\109") then
                local lIl_44_nq5hj8 = (lIl_28_yoony["\84\111\112"]["\80\111\115\105\116\105\111\110"] - lIl_28_yoony["\66\111\116\116\111\109"]["\80\111\115\105\116\105\111\110"])["\77\97\103\110\105\116\117\100\101"]
                local lIl_59_8up75f = Vector3["\110\101\119"](0, (lIl_44_nq5hj8 * 0.4) + lIl_9_rze0j, 0)
                
                local lIl_60_bk41ha = lIl_25_oc3di3["\86\101\108\111\99\105\116\121"]
                local lIl_61_vizyde = lIl_60_bk41ha * lIl_10_ojd8ge
                
                local lIl_62_59okij = lIl_25_oc3di3["\80\111\115\105\116\105\111\110"] + lIl_59_8up75f + lIl_61_vizyde
                local lIl_63_lq6tc, onScreen = lIl_3_ywm0xg:WorldToViewportPoint(lIl_62_59okij)
                
                if onScreen then
                    local lIl_64_v6wfbir = (lIl_63_lq6tc["\88"] - lIl_27_t6oav["\88"]) * lIl_11_v73zmm
                    local lIl_65_u9cpac = (lIl_63_lq6tc["\89"] - lIl_27_t6oav["\89"]) * lIl_11_v73zmm
                    mousemoverel(lIl_64_v6wfbir, lIl_65_u9cpac)
                end
            end
        end
    else
        lIl_12_magipw = nil
    end
end)


for _, child in pairs(lIl_4_9ixp9:GetChildren()) do task["\115\112\97\119\110"](createEsp, child) end
lIl_4_9ixp9["\67\104\105\108\100\65\100\100\101\100"]:Connect(function(child) task["\119\97\105\116"](0.2) createEsp(child) end)