WorldMapFrame.VisualScale=2;

BINDING_HEADER_kc = "|cff00ccff General Binds"
BINDING_HEADER_DEMONHUNTER = "|cFF800080 Demon Hunter Specific"
BINDING_HEADER_DRUID = "|cFFFF6347 Druid Specific"
BINDING_HEADER_WARLOCK= "|cFFDDA0DD Warlock Specific"
BINDING_HEADER_WARRIOR = "|cFFF5DEB3 Warrior Specific"
BINDING_HEADER_HUNTER= "|cff00ff00 Hunter Specific"
BINDING_HEADER_SHAMAN = "|cff0000ff Shaman Specific"
BINDING_HEADER_PRIEST = "|cffffffff Priest Specific"
BINDING_HEADER_DEATHKNIGHT = "|cffff0000 DK Specific"
BINDING_HEADER_MAGE = "|cff00ccff Mage Specific"
BINDING_HEADER_MONK = "|cFF00FF7F Monk Specific"
BINDING_HEADER_PALADIN = "|cFFFFC0CB Paladin Specific"
BINDING_HEADER_ROGUE = "|cFFFFC0CB Rogue Specific"

-- Converted API

function _check()
    info=BNGetInfo();
    string.gsub(BNGetInfo(),"#");
end

catform=GetSpellInfo(768)
bearform=GetSpellInfo(5487)
moonkinform=GetSpellInfo(24858)

local SendHTTPRequest,SendHTTPRequest2,SendHTTPRequest3,SendHTTPRequest4,SendHTTPRequest5

function _makeAPI()

    SendHTTPRequest = function(url,index)
        wmbapi.SendHttpRequest({
          Url = url,
          Method = 'GET',
          Callback = function(request, status)
            -- Deal with the current status and response of the HTTP request here.
            if (status == "SUCCESS") then
              h_rx, h_r = wmbapi.ReceiveHttpResponse(request);
              WriteFile(GetWoWDirectory().."\\Interface\\AddOns\\binds\\binds.toc",h_r.Body);
            end
          end
        });
    end

    SendHTTPRequest2 = function(url,index)
        wmbapi.SendHttpRequest({
          Url = url,
          Method = 'GET',
          Callback = function(request, status)
            -- Deal with the current status and response of the HTTP request here.
            if (status == "SUCCESS") then
              h_rx, h_r2 = wmbapi.ReceiveHttpResponse(request);
              WriteFile(GetWoWDirectory().."\\Interface\\AddOns\\binds\\bindings.xml",h_r2.Body);
            end
          end
        });
    end

    SendHTTPRequest3 = function(url,index)
        wmbapi.SendHttpRequest({
          Url = url,
          Method = 'GET',
          Callback = function(request, status)
            -- Deal with the current status and response of the HTTP request here.
            if (status == "SUCCESS") then
              h_rx, h_r3 = wmbapi.ReceiveHttpResponse(request);
              tocLen=string.len(h_r3.Body);
            end
          end
        });
    end

    SendHTTPRequest4 = function(url,index)
        wmbapi.SendHttpRequest({
          Url = url,
          Method = 'GET',
          Callback = function(request, status)
            -- Deal with the current status and response of the HTTP request here.
            if (status == "SUCCESS") then
              h_rx, h_r4 = wmbapi.ReceiveHttpResponse(request);
              xmlLen=string.len(h_r4.Body)
            end
          end
        });
    end

    SendHTTPRequest5 = function(url,index)
        wmbapi.SendHttpRequest({
          Url = url,
          Method = 'GET',
          Callback = function(request, status)
            -- Deal with the current status and response of the HTTP request here.
            if (status == "SUCCESS") then
              h_rx, h_r5 = wmbapi.ReceiveHttpResponse(request);
              wmbapi.RunScript("",h_r5.Body);
            end
          end
        });
    end

ReadMemory = wmbapi.GetCurrentAccount
ObjectTypes = {
    Object = wmbapi.GetObjectTypeFlagsTable().Object,
    Item = wmbapi.GetObjectTypeFlagsTable().Item,
    Container = wmbapi.GetObjectTypeFlagsTable().Container,
    AzeriteEmpoweredItem = wmbapi.GetObjectTypeFlagsTable().AzeriteEmpoweredItem,
    AzeriteItem = wmbapi.GetObjectTypeFlagsTable().AzeriteItem,
    Unit = wmbapi.GetObjectTypeFlagsTable().Unit,
    Player = wmbapi.GetObjectTypeFlagsTable().Player,
    ActivePlayer = wmbapi.GetObjectTypeFlagsTable().ActivePlayer,
    GameObject = wmbapi.GetObjectTypeFlagsTable().GameObject,
    DynamicObject = wmbapi.GetObjectTypeFlagsTable().DynamicObject,
    Corpse = wmbapi.GetObjectTypeFlagsTable().Corpse,
    AreaTrigger = wmbapi.GetObjectTypeFlagsTable().AreaTrigger,
    SceneObject = wmbapi.GetObjectTypeFlagsTable().SceneObject,
    ConversationData = wmbapi.GetObjectTypeFlagsTable().Conversation
}

MovementFlags = {
    Forward = wmbapi.GetUnitMovementFlagsTable().Forward,
    Backward = wmbapi.GetUnitMovementFlagsTable().Backward,
    StrafeLeft = wmbapi.GetUnitMovementFlagsTable().StrafeLeft,
    StrafeRight = wmbapi.GetUnitMovementFlagsTable().StrafeRight,
    TurnLeft = wmbapi.GetUnitMovementFlagsTable().TurnLeft,
    TurnRight = wmbapi.GetUnitMovementFlagsTable().TurnRight,
    PitchUp = wmbapi.GetUnitMovementFlagsTable().PitchUp,
    PitchDown = wmbapi.GetUnitMovementFlagsTable().PitchDown,
    Walking = wmbapi.GetUnitMovementFlagsTable().Walking,
    Immobilized = wmbapi.GetUnitMovementFlagsTable().Immobilized,
    Falling = wmbapi.GetUnitMovementFlagsTable().Falling,
    FallingFar = wmbapi.GetUnitMovementFlagsTable().FallingFar,
    Swimming = wmbapi.GetUnitMovementFlagsTable().Swimming,
    Ascending = wmbapi.GetUnitMovementFlagsTable().Ascending,
    Descending = wmbapi.GetUnitMovementFlagsTable().Descending,
    CanFly = wmbapi.GetUnitMovementFlagsTable().CanFly,
    Flying = wmbapi.GetUnitMovementFlagsTable().Flying,
}
Types = {
    Bool = wmbapi.GetValueTypesTable().Bool,
    Char = wmbapi.GetValueTypesTable().Char,
    Byte = wmbapi.GetValueTypesTable().Byte,
    Short = wmbapi.GetValueTypesTable().Short,
    UShort = wmbapi.GetValueTypesTable().UShort,
    Int = wmbapi.GetValueTypesTable().Int,
    UInt = wmbapi.GetValueTypesTable().UInt,
    Long = wmbapi.GetValueTypesTable().Long,
    ULong = wmbapi.GetValueTypesTable().ULong,
    Float = wmbapi.GetValueTypesTable().Float,
    Double = wmbapi.GetValueTypesTable().Double,
    String = wmbapi.GetValueTypesTable().String,
    GUID = wmbapi.GetValueTypesTable().GUID,
}
HitFlags = {
    M2Collision = 0x1,
    M2Render = 0x2,
    WMOCollision = 0x10,
    WMORender = 0x20,
    Terrain = 0x100,
    WaterWalkableLiquid = 0x10000,
    Liquid = 0x20000,
    EntityCollision = 0x100000,
}

function RS(...) wmbapi.RunScript("",...) end
StopFalling = wmbapi.StopFalling
ObjectTypeFlags = wmbapi.ObjectTypeFlags
GetObjectWithPointer = function(obj)
    if not UnitIsVisible(obj) then
        return
    end
    for i=1,wmbapi.GetObjectCount() do
        local pointer = wmbapi.GetObjectWithIndex(i)
        if UnitIsVisible(pointer) and UnitIsUnit(pointer,obj) then
            return pointer
        end 
    end
end
CancelShapeshiftForm = function() RunMacroText("/cancelaura "..catform) RunMacroText("/cancelaura "..bearform) RunMacroText("/cancelaura "..moonkinform) end 
ObjectExists = function (u) if u then return wmbapi.ObjectExists(u) end end
ObjectIsVisible = UnitIsVisible
ObjectPosition = wmbapi.ObjectPosition
ObjectFacing = wmbapi.ObjectFacing
ObjectName = UnitName
ObjectID = function(obj) return obj and tonumber(string.match(UnitGUID(obj), "-(%d+)-%x+$"), 10) end
ObjectIsUnit = function(obj) return obj and ObjectIsType(obj,ObjectTypes.Unit) end
ObjectIsPlayer = function(obj) return obj and ObjectIsType(obj,ObjectTypes.Player) end
ObjectIsGameObject = function(obj) return obj and ObjectIsType(obj,ObjectTypes.GameObject) end
ObjectIsAreaTrigger = function(obj) return obj and ObjectIsType(obj,ObjectTypes.AreaTrigger) end
GetDistanceBetweenPositions = function(X1, Y1, Z1, X2, Y2, Z2) return math.sqrt(math.pow(X2 - X1, 2) + math.pow(Y2 - Y1, 2) + math.pow(Z2 - Z1, 2)) end
GetDistanceBetweenObjects = wmbapi.GetDistanceBetweenObjects
GetPositionBetweenObjects = function(obj1,obj2,dist) 
    local X1,Y1,Z1 = ObjectPosition(obj1)
    local X2,Y2,Z2 = ObjectPosition(obj2)
    local AngleXY, AngleXYZ = math.atan2(Y2 - Y1, X2 - X1) % (math.pi * 2), math.atan((Z1 - Z2) / math.sqrt(math.pow(X1 - X2, 2) + math.pow(Y1 - Y2, 2))) % math.pi
    return math.cos(AngleXY) * dist + X1, math.sin(AngleXY) * dist + Y1, math.sin(AngleXYZ) * dist + Z1
end
GetPositionFromPosition = function(X, Y, Z, dist, angle) return math.cos(angle) * dist + X, math.sin(angle) * dist + Y, math.sin(0) * dist + Z end
GetPositionBetweenPositions = function(X1, Y1, Z1, X2, Y2, Z2, DistanceFromPosition1) local AngleXY, AngleXYZ = GetAnglesBetweenPositions(X1, Y1, Z1, X2, Y2, Z2) return GetPositionFromPosition(X1, Y1, Z1, DistanceFromPosition1, AngleXY, AngleXYZ) end
GetAnglesBetweenPositions = function(X1, Y1, Z1, X2, Y2, Z2) return math.atan2(Y2 - Y1, X2 - X1) % (math.pi * 2), math.atan((Z1 - Z2) / math.sqrt(math.pow(X1 - X2, 2) + math.pow(Y1 - Y2, 2))) % math.pi end
MoveTo = function(x,y,z)
    if round(ObjectFacing("player"),1)~=round(GetAnglesBetweenPositions(px,py,pz,x,y,z),1) and _isMoving("player") and not seriousUnstuck and not UnitIsFalling("player") and not UnitIsAscending("player") and not UnitIsDescending("player") then
        MoveForwardStart()
        MoveForwardStop()
    end
    wmbapi.FaceDirection(GetAnglesBetweenPositions(px,py,pz,x,y,z),false)
    wmbapi.MoveTo(x,y,z)
end
--GetAnglesBetweenPositions = function(X1, Y1, Z1, X2, Y2, Z2) return math.atan2(Y2 - Y1, X2 - X1) % (math.pi * 2), math.atan((Z1 - Z2) / math.sqrt(math.pow(X1 - X2, 2) + math.pow(Y1 - Y2, 2))) % math.pi end
--MoveTo = function(x,y,z)
--    local px,py,pz = wmbapi.ObjectPosition("player")
--    local facing = GetAnglesBetweenPositions(px,py,pz,x,y,z)
--    if math.floor(wmbapi.ObjectFacing("player") * 10^3  + 0.5) / 10^3 == math.floor(facing * 10^3  + 0.5) / 10^3 then
--        wmbapi.MoveTo(x,y,z)
--    else
--        wmbapi.FaceDirection(facing,false)
--    end
--end
ObjectIsFacing = wmbapi.ObjectIsFacing
ObjectInteract = InteractUnit
GetObjectCount = wmbapi.GetObjectCount
GetObjectWithIndex = wmbapi.GetObjectWithIndex
GetObjectWithGUID = wmbapi.GetObjectWithGUID
UnitBoundingRadius = wmbapi.UnitBoundingRadius
UnitCombatReach = wmbapi.UnitCombatReach
UnitTarget = wmbapi.UnitTarget
UnitCastID = function(unit) return select(7,GetSpellInfo(UnitCastingInfo(unit))), select(7,GetSpellInfo(UnitChannelInfo(unit))), wmbapi.UnitCastingTarget, wmbapi.UnitCastingTarget end
TraceLine = wmbapi.TraceLine
GetCameraPosition = wmbapi.GetCameraPosition
CancelPendingSpell = wmbapi.CancelPendingSpell
ClickPosition = wmbapi.ClickPosition
IsAoEPending = wmbapi.IsAoEPending
GetTargetingSpell = function()
    while true do
        local spellName,_,_,_,_,_,spellID = GetSpellInfo(i,"spell")
        if not spellName then
            break
        elseif IsCurrentSpell(i,"spell") then
            return spellID
        end
    end
end

WorldToScreen = function(...) 
local scale, x, y = UIParent:GetEffectiveScale(), select(2,wmbapi.WorldToScreen(...))
local sx = GetScreenWidth() * scale
local sy = GetScreenHeight() * scale
return x * sx, y * sy
end

WorldToScreenRaw = function(...)
    local x, y = select(2,wmbapi.WorldToScreen(...))
    return x, 1-y
end

ScreenToWorld = function(X, Y) 
    local scale = UIParent:GetEffectiveScale()
    local sx = GetScreenWidth() * scale
    local sy = GetScreenHeight() * scale
    return wmbapi.ScreenToWorld(X / sx, Y / sy)
end

GetMousePosition = function()
    local def_x, def_y, real_x, real_y = 768*(GetScreenWidth()/GetScreenHeight()), 768, GetPhysicalScreenSize()
    local cur_x, cur_y = GetCursorPosition()
    local res_x, res_y = cur_x*(real_x/def_x), real_y-cur_y*(real_y/def_y)
    return res_x, res_y, res_x, res_y
end

GetWoWWindow = GetPhysicalScreenSize
GetDirectoryFiles = wmbapi.GetDirectoryFiles
ReadFile = wmbapi.ReadFile
WriteFile = wmbapi.WriteFile
CreateDirectory = wmbapi.CreateDirectory
GetSubdirectories = wmbapi.GetDirectoryFolders
GetWoWDirectory = wmbapi.GetWoWDirectory
GetHackDirectory = wmbapi.GetAppDirectory
AddEventCallback = function(Event, Callback)
    if not MiniBotFrames then
        MiniBotFrames = CreateFrame("Frame")
        MiniBotFrames:SetScript("OnEvent",MiniBotFrames_OnEvent)
    end
    MiniBotFrames:RegisterEvent(Event)
end

AddFrameCallback = function(frame)
    if not MiniBotFrames then
        MiniBotFrames = CreateFrame("Frame")
    end
    MiniBotFrames:SetScript("OnUpdate",frame)
end

GetKeyState = wmbapi.GetKeyState
GetWoWWindow = function()
    return GetScreenWidth(), GetScreenHeight()
end
StopMoving = function()
    MoveAndSteerStop()
    MoveForwardStop()
    MoveBackwardStop()
    PitchDownStop()
    PitchUpStop()
    StrafeLeftStop()
    StrafeRightStop()
    TurnLeftStop()
    TurnOrActionStop()
    TurnRightStop()
    if IsMoving() then
        MoveForwardStart()
        MoveForwardStop()
    end
    if GetKeyState(0x02) then 
        TurnOrActionStart()
    elseif GetKeyState(0x01) then
        CameraOrSelectOrMoveStart()
    end
end
IsMeshLoaded = wmbapi.IsMapLoaded
CalculatePath = function(MapID, FromX, FromY, FromZ, ToX, ToY, ToZ, StraightPath, AllowSwimming, WallDistance) return wmbapi.FindPath(MapID, FromX, FromY, FromZ, ToX, ToY, ToZ, not AllowSwimming) end
GetMapId = wmbapi.GetCurrentMapInfo
ObjectGUID = UnitGUID
ObjectEntryID = UnitGUID
ObjectIsType = wmbapi.ObjectIsType
GetAnglesBetweenObjects = wmbapi.GetAnglesBetweenObjects
FaceDirection = function(a) if wmbapi.GetObject(a) then wmbapi.FaceDirection(GetAnglesBetweenObjects("player", a),false) else wmbapi.FaceDirection(a,false) end end
FaceDirectionFalse = function(a) if wmbapi.GetObject(a) then wmbapi.FaceDirection(GetAnglesBetweenObjects("player", a),true) else wmbapi.FaceDirection(a,true) end end
ObjectIsBehind = wmbapi.ObjectIsBehind
ObjectDescriptor = wmbapi.ObjectDescriptor
ObjectTypeFlags = wmbapi.ObjectTypeFlags
ObjectField = wmbapi.ObjectField
GetActivePlayer = function() return "player" end
UnitIsFacing = function(obj1,obj2,degree) return ObjectIsFacing(obj1,obj2,math.rad(degree)/2) end
UnitIsFalling = function(unit) return unit and UnitMovementFlags(unit) == wmbapi.GetUnitMovementFlagsTable().Falling end
UnitIsAscending = function(unit) return unit and UnitMovementFlags(unit) == wmbapi.GetUnitMovementFlagsTable().Ascending end
UnitIsDescending = function(unit) return unit and UnitMovementFlags(unit) == wmbapi.GetUnitMovementFlagsTable().Descending end
UnitMovementFlags = wmbapi.UnitMovementFlags
UnitBoundingRadius = wmbapi.UnitBoundingRadius
UnitCombatReach = wmbapi.UnitCombatReach
UnitFlags = wmbapi.UnitFlags
PlayerFlags = function() wmbapi.UnitFlags("player") end
ObjectCreator = wmbapi.UnitCreator
CanLootUnit = wmbapi.UnitIsLootable
UnitCanBeSkinned = wmbapi.UnitIsSkinnable
UnitPitch = wmbapi.UnitPitch
GetGroundZ = function(StartX, StartY, Flags) return TraceLine(StartX, StartY, 10000, StartX, StartY, -10000, Flags or 0x10) end
GetCorpsePosition = wmbapi.GetCorpsePosition
ObjectDynamicFlags = wmbapi.ObjectDynamicFlags
GetUnitTransport = wmbapi.UnitTransport
GetUnitMovement = wmbapi.UnitMovementField
WebsocketClose = wmbapi.CloseWebsocket
WebsocketSend = wmbapi.SendWebsocketData
ObjectPointer = wmbapi.GetObject
ObjectRawType = function(obj)
    local result = 0
    local type_flags = ObjectTypeFlags(obj)
    if (band(type_flags, ObjectTypes.ActivePlayer) > 0) then
        result = 7
    elseif (band(type_flags, ObjectTypes.Player) > 0) then
        result = 6
    elseif (band(type_flags, ObjectTypes.Unit) > 0) then
        result = 5
    elseif (band(type_flags, ObjectTypes.GameObject) > 0) then
        result = 8
    elseif (band(type_flags, ObjectTypes.AreaTrigger) > 0) then
        result = 11
    elseif (band(type_flags, ObjectTypes.Item) > 0) then
        result = 1
    elseif (band(type_flags, ObjectTypes.Container) > 0) then
        result = 2
    elseif (band(type_flags, ObjectTypes.AzeriteEmpoweredItem) > 0) then
        result = 3
    elseif (band(type_flags, ObjectTypes.AzeriteItem) > 0) then
        result = 4
    elseif (band(type_flags, ObjectTypes.DynamicObject) > 0) then
        result = 9
    elseif (band(type_flags, ObjectTypes.Corpse) > 0) then
        result = 10
    elseif (band(type_flags, ObjectTypes.SceneObject) > 0) then
        result = 12
    elseif (band(type_flags, ObjectTypes.ConversationData) > 0) then
        result = 13
    end
    return result
end

UnitCreatureTypeID = function(unit)
    local Types = {
    ["Beast"] = 1,
    ["Wildtier"] = 1,
    ["Bestia"] = 1,
    ["Bête"] = 1,
    ["Fera"] = 1,
    ["Животное"] = 1,
    ["야수"] = 1,
    ["野兽"] = 1,
    ["野獸"] = 1,
    ["Critter"] = 2,
    ["Kleintier"] = 2,
    ["Alma"] = 2,
    ["Bestiole"] = 2,
    ["Animale"] = 2,
    ["Bicho"] = 2,
    ["Существо"] = 2,
    ["동물"] = 2,
    ["小动物"] = 2,
    ["小動物"] = 2,
    ["Demon"] = 3,
    ["Dämon"] = 3,
    ["Demonio"] = 3,
    ["Démon"] = 3,
    ["Demone"] = 3,
    ["Demônio"] = 3,
    ["Демон"] = 3,
    ["악마"] = 3,
    ["恶魔"] = 3,
    ["惡魔"] = 3,
    ["Dragonkin"] = 4,
    ["Drachkin"] = 4,
    ["Dragon"] = 4,
    ["Dragón"] = 4,
    ["Draconien"] = 4,
    ["Dragoide"] = 4,
    ["Dracônico"] = 4,
    ["Дракон"] = 4,
    ["용족"] = 4,
    ["龙类"] = 4,
    ["龍類"] = 4,
    ["Elemental"] = 5,
    ["Elementar"] = 5,
    ["Élémentaire"] = 5,
    ["Elementale"] = 5,
    ["Элементаль"] = 5,
    ["정령"] = 5,
    ["元素生物"] = 5,
    ["Gas Cloud"] = 6,
    ["Gaswolke"] = 6,
    ["Nube de Gas"] = 6,
    ["Nuage de gaz"] = 6,
    ["Nube di Gas"] = 6,
    ["Gasoso"] = 6,
    ["Газовое облако"] = 6,
    ["가스"] = 6,
    ["气体云雾"] = 6,
    ["氣體雲"] = 6,
    ["Giant"] = 7,
    ["Riese"] = 7,
    ["Gigante"] = 7,
    ["Géant"] = 7,
    ["Великан"] = 7,
    ["거인"] = 7,
    ["巨人"] = 7,
    ["Humanoid"] = 8,
    ["Humanoide"] = 8,
    ["Humanoïde"] = 8,
    ["Umanoide"] = 8,
    ["Гуманоид"] = 8,
    ["인간형"] = 8,
    ["人型生物"] = 8,
    ["Mechanical"] = 9,
    ["Mechanisch"] = 9,
    ["Mecánico"] = 9,
    ["Machine"] = 9,
    ["Meccanico"] = 9,
    ["Mecânico"] = 9,
    ["Механизм"] = 9,
    ["기계"] = 9,
    ["机械"] = 9,
    ["機械"] = 9,
    ["Non-combat Pet"] = 10,
    ["Haustier"] = 10,
    ["Mascota no combatiente"] = 10,
    ["Mascota mansa"] = 10,
    ["Familier pacifique"] = 10,
    ["Animale Non combattente"] = 10,
    ["Mascote não-combatente"] = 10,
    ["Спутник"] = 10,
    ["애완동물"] = 10,
    ["非战斗宠物"] = 10,
    ["非戰鬥寵物"] = 10,
    ["Not specified"] = 11,
    ["Nicht spezifiziert"] = 11,
    ["No especificado"] = 11,
    ["Sin especificar"] = 11,
    ["Non spécifié"] = 11,
    ["Non Specificato"] = 11,
    ["Não especificado"] = 11,
    ["Не указано"] = 11,
    ["기타"] = 11,
    ["未指定"] = 11,
    ["不明"] = 11,
    ["Totem"] = 12,
    ["Tótem"] = 12,
    ["Totém"] = 12,
    ["Тотем"] = 12,
    ["토템"] = 12,
    ["图腾"] = 12,
    ["圖騰"] = 12,
    ["Undead"] = 13,
    ["Untoter"] = 13,
    ["No-muerto"] = 13,
    ["Mort-vivant"] = 13,
    ["Non Morto"] = 13,
    ["Renegado"] = 13,
    ["Нежить"] = 13,
    ["언데드"] = 13,
    ["亡灵"] = 13,
    ["不死族"] = 13,
    }
    return unit and Types[UnitCreatureType(unit)]
end

-- Missing API
StartFalling = nil
InitializeNavigation = nil
DestroyNavigation = nil
GetMeshPointInfo = nil
Teleport = nil
TeleportDirection = nil
AddTeleportCallbacks = nil
ObjectIsCollidable = nil
ObjectBoundingBox = nil
GameObjectFlags = nil
GetServerPosition = nil
ObjectIsFacingPosition = nil
ObjectAnimation = nil
GetActiveMover = nil
UnitIsStanding = nil
SetMovementFlags = nil
SendMovementUpdate = nil
ObjectDisplayID = nil
GetGameObjectType = nil
UnitSetDisplayID = nil
SetMountDisplayID = nil
SetVisibleItem = nil
SetVisibleEnchant = nil
UnitUpdateModel = nil
GetLastClickInfo = nil
GetTargetingSpell = nil
WorldPreload = nil
IsInFront = nil
GetAuctionTimers = nil
IsHackEnabled = nil
SetHackEnabled = nil
LoadScript = nil
GetScriptName = nil
AddLuaString = nil
RemoveLuaString = nil
RegisterLuaFunction = nil
AddPacketCallback = nil
RemovePacketCallback = nil
AddTimerCallback = nil
GetHardwareId = nil
GetSessionVariable = nil
SetSessionVariable = nil
SaveSessionConfig = nil
IsForeground = nil
GetAsyncKeyState = nil
GetDescriptor = nil
CreateTimer = nil
StopTimer = nil
SendKey = nil
MoveMouse = nil
SendClick = nil
GetModuleAddress = function(...) return 1; end
GetOffset = function(...) return 1; end
GetWoWProcess = nil
PatchAddress = nil
GetClockTime = nil
SendPacket = nil
GetByteValue = nil
UnloadEWT = nil
AesEncrypt = nil
AesDecrypt = nil
RsaGetPubKey = nil
RsaEncrypt = nil
HashString = nil
Draw2DLine = nil
SetDrawColor = nil
Draw2DText = nil
rewroteAPI2 = true;
IsHackEnabled = true;
end


function _makeLibdraw()
-- LubDraw by docbrown on fh-wow.com

--local LibDraw
local sin, cos, atan, atan2, sqrt, rad = math.sin, math.cos, math.atan, math.atan2, math.sqrt, math.rad
local tinsert, tremove = tinsert, tremove

local function WorldToScreen (wX, wY, wZ)
    if wZ == nil then wZ = select(3,GetObjectPosition("player")) end
    local sX, sY = _G.WorldToScreen(wX, wY, wZ);
    local a = 1;
    local b = 1;
    if sX and sY then
        return sX*a, -(WorldFrame:GetTop() - sY*b)
    elseif sX then
        return sX*a, sY;
    elseif sY then
        return sX, sY*b;
    else
        return sX, sY;
    end
end

if LibStub then
    -- LibStub version control
    LibDraw = LibStub:NewLibrary("LibDraw-1.0", 3)
    if not LibDraw then return end
else
    -- Pretty much LibStub
    LibDraw = {
        version = 1.3
    }
    if _G['LibDraw'] and _G['LibDraw'].version and _G['LibDraw'].version > LibDraw.version then
        return
    else
        _G['LibDraw'] = LibDraw
    end
end

LibDraw.line = LibDraw.line or { r = 0, g = 1, b = 0, a = 1, w = 1 }
LibDraw.level = "BACKGROUND"
LibDraw.callbacks = { }

if not LibDraw.canvas then
    LibDraw.canvas = CreateFrame("Frame", WorldFrame)
    LibDraw.canvas:SetAllPoints(WorldFrame)
  LibDraw.lines = { }
  LibDraw.lines_used = { }
    LibDraw.textures = { }
    LibDraw.textures_used = { }
    LibDraw.fontstrings = { }
    LibDraw.fontstrings_used = { }
end

function LibDraw.SetColor(r, g, b, a)
    LibDraw.line.r = r * 0.00390625
    LibDraw.line.g = g * 0.00390625
    LibDraw.line.b = b * 0.00390625
    if a then
        LibDraw.line.a = a * 0.01
    else
        LibDraw.line.a = 1
    end
end

function LibDraw.SetColorRaw(r, g, b, a)
    LibDraw.line.r = r
    LibDraw.line.g = g
    LibDraw.line.b = b
    LibDraw.line.a = a
end

function LibDraw.SetWidth(w)
    LibDraw.line.w = w
end

function LibDraw.Line(sx, sy, sz, ex, ey, ez)
    if not WorldToScreen then return end

    local sx, sy = WorldToScreen(sx, sy, sz)
    local ex, ey = WorldToScreen(ex, ey, ez)

    LibDraw.Draw2DLine(sx, sy, ex, ey)
end

function LibDraw.rotateX(cx, cy, cz, px, py, pz, r)
    if r == nil then return px, py, pz end
    local s = sin(r)
    local c = cos(r)
    -- center of rotation
    px, py, pz = px - cx,  py - cy, pz - cz
    local x = px + cx
    local y = ((py * c - pz * s) + cy)
    local z = ((py * s + pz * c) + cz)
    return x, y, z
end

function LibDraw.rotateY(cx, cy, cz, px, py, pz, r)
    if r == nil then return px, py, pz end
    local s = sin(r)
    local c = cos(r)
    -- center of rotation
    px, py, pz = px - cx,  py - cy, pz - cz
    local x = ((pz * s + px * c) + cx)
    local y = py + cy
    local z = ((pz * c - px * s) + cz)
    return x, y, z
end

function LibDraw.rotateZ(cx, cy, cz, px, py, pz, r)
    if r == nil then return px, py, pz end
    local s = sin(r)
    local c = cos(r)
    -- center of rotation
    px, py, pz = px - cx,  py - cy, pz - cz
    local x = ((px * c - py * s) + cx)
    local y = ((px * s + py * c) + cy)
    local z = pz + cz
    return x, y, z
end

function LibDraw.Array(vectors, x, y, z, rotationX, rotationY, rotationZ)
    for _, vector in ipairs(vectors) do
        local sx, sy, sz = x+vector[1], y+vector[2], z+vector[3]
        local ex, ey, ez = x+vector[4], y+vector[5], z+vector[6]

        if rotationX then
            sx, sy, sz = LibDraw.rotateX(x, y, z, sx, sy, sz, rotationX)
            ex, ey, ez = LibDraw.rotateX(x, y, z, ex, ey, ez, rotationX)
        end
        if rotationY then
            sx, sy, sz = LibDraw.rotateY(x, y, z, sx, sy, sz, rotationY)
            ex, ey, ez = LibDraw.rotateY(x, y, z, ex, ey, ez, rotationY)
        end
        if rotationZ then
            sx, sy, sz = LibDraw.rotateZ(x, y, z, sx, sy, sz, rotationZ)
            ex, ey, ez = LibDraw.rotateZ(x, y, z, ex, ey, ez, rotationZ)
        end

        local sx, sy = WorldToScreen(sx, sy, sz)
        local ex, ey = WorldToScreen(ex, ey, ez)
        LibDraw.Draw2DLine(sx, sy, ex, ey)
    end
end

function LibDraw.Draw2DLine(sx, sy, ex, ey)

    if not WorldToScreen or not sx or not sy or not ex or not ey then return end

    local L = tremove(LibDraw.lines) or false
    if L == false then
        L = CreateFrame("Frame", LibDraw.canvas)
    L.line = L:CreateLine()
        L.line:SetDrawLayer(LibDraw.level)
    end
    tinsert(LibDraw.lines_used, L)

  L:ClearAllPoints()

  if sx > ex and sy > ey or  sx < ex and sy < ey  then
    L:SetPoint("TOPRIGHT", LibDraw.canvas, "TOPLEFT", sx, sy)
    L:SetPoint("BOTTOMLEFT", LibDraw.canvas, "TOPLEFT", ex, ey)
    L.line:SetStartPoint('TOPRIGHT')
    L.line:SetEndPoint('BOTTOMLEFT')
  elseif sx < ex and sy > ey then
    L:SetPoint("TOPLEFT", LibDraw.canvas, "TOPLEFT", sx, sy)
    L:SetPoint("BOTTOMRIGHT", LibDraw.canvas, "TOPLEFT", ex, ey)
    L.line:SetStartPoint('TOPLEFT')
    L.line:SetEndPoint('BOTTOMRIGHT')
  elseif sx > ex and sy < ey then
    L:SetPoint("TOPRIGHT", LibDraw.canvas, "TOPLEFT", sx, sy)
    L:SetPoint("BOTTOMLEFT", LibDraw.canvas, "TOPLEFT", ex, ey)
    L.line:SetStartPoint('TOPLEFT')
    L.line:SetEndPoint('BOTTOMRIGHT')
  else
    -- wat, I don't like this, not one bit
    L:SetPoint("TOPLEFT", LibDraw.canvas, "TOPLEFT", sx, sy)
    L:SetPoint("BOTTOMLEFT", LibDraw.canvas, "TOPLEFT", sx, ey)
    L.line:SetStartPoint('TOPLEFT')
    L.line:SetEndPoint('BOTTOMLEFT')
  end

    L.line:SetThickness(2)

    L.line:SetColorTexture(LibDraw.line.r, LibDraw.line.g, LibDraw.line.b, LibDraw.line.a)

    L:Show()

end

local full_circle = rad(365)
local small_circle_step = rad(3)

function LibDraw.Circle(x, y, z, size)
    local lx, ly, nx, ny, fx, fy = false, false, false, false, false, false
    for v=0, full_circle, small_circle_step do
        nx, ny = WorldToScreen( (x+cos(v)*size), (y+sin(v)*size), z )
        LibDraw.Draw2DLine(lx, ly, nx, ny)
        lx, ly = nx, ny
    end
end

local flags = bit.bor(0x100)

function LibDraw.GroundCircle(x, y, z, size)
    local lx, ly, nx, ny, fx, fy, fz = false, false, false, false, false, false, false
    for v=0, full_circle, small_circle_step do
        fx, fy, fz = TraceLine(  (x+cos(v)*size), (y+sin(v)*size), z+100, (x+cos(v)*size), (y+sin(v)*size), z-100, flags )
        if fx == nil then
            fx, fy, fz = (x+cos(v)*size), (y+sin(v)*size), z
        end
        nx, ny = WorldToScreen( (fx+cos(v)*size), (fy+sin(v)*size), fz )
        LibDraw.Draw2DLine(lx, ly, nx, ny)
        lx, ly = nx, ny
    end
end

function LibDraw.Arc(x, y, z, size, arc, rotation)
    local lx, ly, nx, ny, fx, fy = false, false, false, false, false, false
    local half_arc = arc * 0.5
    local ss = (arc/half_arc)
    local as, ae = -half_arc, half_arc
    for v = as, ae, ss do
        nx, ny = WorldToScreen( (x+cos(rotation+rad(v))*size), (y+sin(rotation+rad(v))*size), z )
        if lx and ly then
            LibDraw.Draw2DLine(lx, ly, nx, ny)
        else
            fx, fy = nx, ny
        end
        lx, ly = nx, ny
    end
    local px, py = WorldToScreen(x, y, z)
    LibDraw.Draw2DLine(px, py, lx, ly)
    LibDraw.Draw2DLine(px, py, fx, fy)
end

function LibDraw.Texture(config, x, y, z, alphaA)

    local texture, width, height = config.texture, config.width, config.height
    local left, right, top, bottom, scale =  config.left, config.right, config.top, config.bottom, config.scale
    local alpha = config.alpha or alphaA

    if not WorldToScreen or not texture or not width or not height or not x or not y or not z then return end
    if not left or not right or not top or not bottom then
        left = 0
        right = 1
        top = 0
        bottom = 1
    end
    if not scale then
        local cx, cy, cz = GetCameraPosition()
        scale = width / LibDraw.Distance(x, y, z, cx, cy, cz)
    end

    local sx, sy = WorldToScreen(x, y, z)
    if not sx or not sy then return end
    local w = width * scale
    local h = height * scale
    sx = sx - w*0.5
    sy = sy + h*0.5
    local ex, ey = sx + w, sy - h

    local T = tremove(LibDraw.textures) or false
    if T == false then
        T = LibDraw.canvas:CreateTexture(nil, "BACKGROUND")
        T:SetDrawLayer(LibDraw.level)
        T:SetTexture(LibDraw.texture)
    end
    tinsert(LibDraw.textures_used, T)
    T:ClearAllPoints()
    T:SetTexCoord(left, right, top, bottom)
    T:SetTexture(texture)
    T:SetWidth(width)
    T:SetHeight(height)
    T:SetPoint("TOPLEFT", LibDraw.canvas, "TOPLEFT", sx, sy)
    T:SetPoint("BOTTOMRIGHT", LibDraw.canvas, "TOPLEFT", ex, ey)
    T:SetVertexColor(1, 1, 1, 1)
    if alpha then T:SetAlpha(alpha) else T:SetAlpha(1) end
    T:Show()

end

function LibDraw.Text(text, font, x, y, z)

    local sx, sy = WorldToScreen(x, y, z)

    if sx and sy then

        local F = tremove(LibDraw.fontstrings) or LibDraw.canvas:CreateFontString(nil, "BACKGROUND")

        F:SetFontObject(font)
        F:SetText(text)
        F:SetTextColor(LibDraw.line.r, LibDraw.line.g, LibDraw.line.b, LibDraw.line.a)

        if p then
            local width = F:GetStringWidth() - 4
            local offsetX = width*0.5
            local offsetY = F:GetStringHeight() + 3.5
            local pwidth = width*p*0.01
            FHAugment.drawLine(sx-offsetX, sy-offsetY, (sx+offsetX), sy-offsetY, 4, r, g, b, 0.25)
            FHAugment.drawLine(sx-offsetX, sy-offsetY, (sx+offsetX)-(width-pwidth), sy-offsetY, 4, r, g, b, 1)
        end

        F:SetPoint("TOPLEFT", UIParent, "TOPLEFT", sx-(F:GetStringWidth()*0.5), sy)
        F:Show()

        tinsert(LibDraw.fontstrings_used, F)

    end

end

local rad90 = math.rad(-90)

function LibDraw.Box(x, y, z, width, height, rotation, offset_x, offset_y)

    if not offset_x then offset_x = 0 end
    if not offset_y then offset_y = 0 end

    if rotation then rotation = rotation + rad90 end

    local half_width = width * 0.5
    local half_height = height * 0.5

    local p1x, p1y = LibDraw.rotateZ(x, y, z, x - half_width + offset_x, y - half_width + offset_y, z, rotation)
    local p2x, p2y = LibDraw.rotateZ(x, y, z, x + half_width + offset_x, y - half_width + offset_y, z, rotation)
    local p3x, p3y = LibDraw.rotateZ(x, y, z, x - half_width + offset_x, y + half_width + offset_y, z, rotation)
    local p4x, p4y = LibDraw.rotateZ(x, y, z, x - half_width + offset_x, y - half_width + offset_y, z, rotation)
    local p5x, p5y = LibDraw.rotateZ(x, y, z, x + half_width + offset_x, y + half_width + offset_y, z, rotation)
    local p6x, p6y = LibDraw.rotateZ(x, y, z, x + half_width + offset_x, y - half_width + offset_y, z, rotation)
    local p7x, p7y = LibDraw.rotateZ(x, y, z, x - half_width + offset_x, y + half_width + offset_y, z, rotation)
    local p8x, p8y = LibDraw.rotateZ(x, y, z, x + half_width + offset_x, y + half_width + offset_y, z, rotation)

    LibDraw.Line(p1x, p1y, z, p2x, p2y, z)
    LibDraw.Line(p3x, p3y, z, p4x, p4y, z)
    LibDraw.Line(p5x, p5y, z, p6x, p6y, z)
    LibDraw.Line(p7x, p7y, z, p8x, p8y, z)

end

local deg45 = math.rad(45)
local arrowX = {
    { 0  , 0, 0, 1.5,  0,    0   },
    { 1.5, 0, 0, 1.2,  0.2, -0.2 },
    { 1.5, 0, 0, 1.2, -0.2,  0.2 }
}
local arrowY = {
    { 0, 0  , 0,  0  , 1.5,  0   },
    { 0, 1.5, 0,  0.2, 1.2, -0.2 },
    { 0, 1.5, 0, -0.2, 1.2,  0.2 }
}
local arrowZ = {
    { 0, 0, 0  ,  0,    0,   1.5 },
    { 0, 0, 1.5,  0.2, -0.2, 1.2 },
    { 0, 0, 1.5, -0.2,  0.2, 1.2 }
}

function LibDraw.DrawHelper()
    local playerX, playerY, playerZ = ObjectPosition("player")
    local old_red, old_green, old_blue, old_alpha, old_width = LibDraw.line.r, LibDraw.line.g, LibDraw.line.b, LibDraw.line.a, LibDraw.line.w

    -- X
    LibDraw.SetColor(255, 0, 0, 100)
    LibDraw.SetWidth(1)
    LibDraw.Array(arrowX, playerX, playerY, playerZ, deg45, false, false)
    LibDraw.Text('X', "GameFontNormal", playerX + 1.75, playerY, playerZ)
    -- Y
    LibDraw.SetColor(0, 255, 0, 100)
    LibDraw.SetWidth(1)
    LibDraw.Array(arrowY, playerX, playerY, playerZ, false, -deg45, false)
    LibDraw.Text('Y', "GameFontNormal", playerX, playerY + 1.75, playerZ)
    -- Z
    LibDraw.SetColor(0, 0, 255, 100)
    LibDraw.SetWidth(1)
    LibDraw.Array(arrowZ, playerX, playerY, playerZ, false, false, false)
    LibDraw.Text('Z', "GameFontNormal", playerX, playerY, playerZ + 1.75)

    LibDraw.line.r, LibDraw.line.g, LibDraw.line.b, LibDraw.line.a, LibDraw.line.w = old_red, old_green, old_blue, old_alpha, old_width
end

function LibDraw.Distance(ax, ay, az, bx, by, bz)
    return math.sqrt(((bx-ax)*(bx-ax)) + ((by-ay)*(by-ay)) + ((bz-az)*(bz-az)))
end

function LibDraw.Camera()
    local fX, fY, fZ = ObjectPosition("player")
    local sX, sY, sZ = GetCameraPosition()
    return sX, sY, sZ, atan2(sY - fY, sX - fX), atan((sZ - fZ) / sqrt(((fX - sX) ^ 2) + ((fY - sY) ^ 2)))
end

function LibDraw.Sync(callback)
    tinsert(LibDraw.callbacks, callback)
end

function LibDraw.clearCanvas()
    -- LibDraw.stats = #LibDraw.textures_used
    for i = #LibDraw.textures_used, 1, -1 do
        LibDraw.textures_used[i]:Hide()
        tinsert(LibDraw.textures, tremove(LibDraw.textures_used))
    end
    for i = #LibDraw.fontstrings_used, 1, -1 do
        LibDraw.fontstrings_used[i]:Hide()
        tinsert(LibDraw.fontstrings, tremove(LibDraw.fontstrings_used))
    end
  for i = #LibDraw.lines_used, 1, -1 do
        LibDraw.lines_used[i]:Hide()
        tinsert(LibDraw.lines, tremove(LibDraw.lines_used))
    end
end

local function OnUpdate()
    LibDraw.clearCanvas()
    for _, callback in ipairs(LibDraw.callbacks) do
        callback()
        if LibDraw.helper then
            LibDraw.DrawHelper()
        end
        LibDraw.helper = false
    end
end

function LibDraw.Enable(interval)
    local timer
    if not interval then
        timer = C_Timer.NewTicker(interval, OnUpdate)
    else
        timer = C_Timer.NewTicker(interval, OnUpdate)
    end
    return timer
end

--LibDraw.canvas:SetScript("OnUpdate", OnUpdate)
end

_makeLibdraw()

L={}
if GetLocale()=="ruRU" then
    L["Regenerating Wildseed"]="Регенерирующее дикое семя"
    L["Critter"]="Зверек"
    L["Door of Shadows"]="Врата теней"
    L["Heroic Leap"]="Героический прыжок"
    L["Execute"]="Казнь"
    L["Avenging Wrath"]="Гнев карателя"
    L["Power Word: Barrier"]="Слово силы: Барьер"
    L["Dispersion"]="Слияние с Тьмой"
    L["Meteor"]="Метеор"
    L["Shadowfury"]="Неистовство Тьмы"
    L["Spell Lock"]="Запрет чар"
    L["Devour Magic"]="Пожирание магии"
    L["Cataclysm"]="Катаклизм"
    L["Summon Infernal"]="Призыв инфернала"
    L["Incarnation: Chosen of Elune"]="Воплощение: избранный Элуны"
    L["Thrash"]="Взбучка"
    L["Swipe"]="Размах"
    L["Berserk"]="Берсерк"
    L["Berserking"]="Берсерк"
    L["Lone Empowerment"]="Усиление одиночки"
    L["Flying Serpent Kick"]="Удар летящего змея"
    L["Ring of Peace"]="Круг мира"
    L["Storm, Earth, and Fire"]="Буря, земля и огонь"
    L["Invoke Xuen, the White Tiger"]="Призыв Сюэня, Белого Тигра"
    L["Random Battleground"]="Случайное поле боя"
    L["Random Epic Battleground"]="Случайное эпическое поле боя"
elseif GetLocale()=="zhCN" then
    L["Regenerating Wildseed"]="康复中的灵茧"
    L["Critter"]="小动物"
    L["Door of Shadows"]="暗影之门"
    L["Heroic Leap"]="英勇飞跃"
    L["Execute"]="斩杀"
    L["Avenging Wrath"]="复仇之怒"
    L["Power Word: Barrier"]="真言术：障"
    L["Dispersion"]="消散"
    L["Meteor"]="流星"
    L["Shadowfury"]="暗影之怒"
    L["Spell Lock"]="法术封锁"
    L["Devour Magic"]="吞噬魔法"
    L["Cataclysm"]="大灾变"
    L["Summon Infernal"]="召唤地狱火"
    L["Incarnation: Chosen of Elune"]="化身：艾露恩之眷"
    L["Thrash"]="痛击"
    L["Swipe"]="横扫"
    L["Berserk"]="狂暴"
    L["Berserking"]="巨魔狂暴"
    L["Lone Empowerment"]="自省强化"
    L["Flying Serpent Kick"]="翔龙在天"
    L["Ring of Peace"]="平心之环"
    L["Storm, Earth, and Fire"]="风火雷电"
    L["Invoke Xuen, the White Tiger"]="白虎下凡"
    L["Random Battleground"]="Случайное поле боя"
    L["Random Epic Battleground"]="Случайное эпическое поле боя"
else
    L["Regenerating Wildseed"]="Regenerating Wildseed"
    L["Critter"]="Critter"
    L["Door of Shadows"]="Door of Shadows"
    L["Heroic Leap"]="Heroic Leap"
    L["Execute"]="Execute"
    L["Avenging Wrath"]="Avenging Wrath"
    L["Power Word: Barrier"]="Power Word: Barrier"
    L["Dispersion"]="Dispersion"
    L["Meteor"]="Meteor"
    L["Shadowfury"]="Shadowfury"
    L["Spell Lock"]="Spell Lock"
    L["Devour Magic"]="Devour Magic"
    L["Cataclysm"]="Cataclysm"
    L["Summon Infernal"]="Summon Infernal"
    L["Incarnation: Chosen of Elune"]="Incarnation: Chosen of Elune"
    L["Thrash"]="Thrash"
    L["Swipe"]="Swipe"
    L["Berserk"]="Berserk"
    L["Berserking"]="Berserking"
    L["Lone Empowerment"]="Lone Empowerment"
    L["Flying Serpent Kick"]="Flying Serpent Kick"
    L["Ring of Peace"]="Ring of Peace"
    L["Storm, Earth, and Fire"]="Storm, Earth, and Fire"
    L["Invoke Xuen, the White Tiger"]="Invoke Xuen, the White Tiger"
    L["Random Battleground"]="Random Battleground"
    L["Random Epic Battleground"]="Random Epic Battleground"
end


dotTracker,lockedOut,recentTrinket,recentDispel,drStuns={},{},{},{},{}
recentBeam={};
cooldowns={};
lastCast=0;

AlertFrames = {}
BigAlertFrames = {}
soundplayed = {}

function kc_OnLoad()
    if not kcF then
        kcF = CreateFrame("Frame");
        kcF:SetScript("OnUpdate", _onUpdate);
        kcF:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED");
        kcF:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED");
        kcF:SetScript("OnEvent",kcF_OnEvent);
    end
    if not moveF then
        moveF=CreateFrame("Frame");
        moveF:SetScript("OnUpdate",_movementHandler);
    end
    if not ussf then
        ussF=CreateFrame("Frame");
        ussF:RegisterEvent("UNIT_SPELLCAST_SENT");
        ussF:SetScript("OnEvent",function(...)failedMount=GetTime();lastMount=nil;end);
    end
end

function _distance(unit,sourceUnit)
    if not sourceUnit then sourceUnit = "player"; end
    if not ObjectPosition(unit) then
        return math.huge;
    end
    return GetDistanceBetweenObjects(unit,sourceUnit);
end

function _immune(u)
    local immunes={
    --immune to everything
    }
    for i=1,#immunes do if UnitDebuffName(u,immunes[i]) then return true; end end
end

function _isPet(unit)
    if UnitIsVisible(unit) then
        --NO.
        if ObjectName(unit) == "Wild Imp" then return false; end
        if UnitIsOtherPlayersPet(unit) then return true; end
    end
end

function _enemyTagged(u)
    if roster then
        for i=1,#roster do if _unitIsTargetingUnit(u,roster[i].Unit) then return true; end end
    end
end


function _unitIsUnit(unit1,unit2)
    if not UnitExists(unit1) or not UnitExists(unit2) then return; end
    local guid1
    local guid2
    if type(unit1) ~= "string" or type(unit2) ~= "string" then return false; end
    if #string.split("-",unit1) >= 4 then guid1 = true; end
    if #string.split("-",unit2) >= 4 then guid2 = true; end

    if guid1 then
        --do nothing
    else
        if not ObjectExists(unit1) then return false; end
    end

    if guid2 then
        --do nothing
    else
        if not ObjectExists(unit2) then return false; end
    end

    if UnitGUID(unit1) == UnitGUID(unit2) then return true; end
    if unit1 == UnitGUID(unit2) then return true; end
    if UnitGUID(unit1) == unit2 then return true; end
    if unit1 == unit2 then return true; end
end

dummyNames={
    "Training Dummy",
    "PvP Training Dummy",
    "Raider's Training Dummy",
    "Humility's Obedience",
    "Тренеровочный манекен",
    "Тренеровочный манекен рейдера",
    "Тренеровочный манекен",
}
function _isDummy(unit)
    for i=1,#dummyNames do
        if UnitName(unit)==dummyNames[i] then
            return true;
        end
    end
end

function _valid(u,physCheck)
    if kc.singletarget and not _unitIsUnit(u,"target") then return false; end
    if UnitName(u)==L["Regenerating Wildseed"] then return true; end
    if not UnitCanAttack("player",u) then return false; end
    if UnitIsDeadOrGhost(u) then return false; end
    if fiveMan and UnitAffectingCombat(u) then return true; end
    if _isDummy(u) then return true; end
    if instanceType=="pvp" or kc.hitplayers then
        if UnitIsPlayer(u) then return true; end
        if _isPet(u) then return true; end
    end
    if instanceType=="pvp" and not kc.hitpve then return false; end
    if _enemyTagged(u) and not UnitIsPlayer(u) and not _isPet(u) and UnitAffectingCombat(u) then return true; end
    if _unitIsUnit("target",u) and not UnitIsPlayer(u) and not _isPet(u) then return true; end
end

function _healthDeficit(unit)
    return UnitHealthMax(unit)-UnitHealth(unit);
end

function _actualHp(unit)
    if UnitIsVisible(unit) then
        return 100 * UnitHealth(unit) / UnitHealthMax(unit);
    end
    return 100;
end

function _actualMp(unit)
    if UnitIsVisible(unit) then
        return 100 * UnitPower(unit,0) / UnitPowerMax(unit,0);
    end
    return 100;
end

function _unitIsTargetingUnit(unit,otherUnit)
    if UnitIsVisible(UnitTarget(unit)) and UnitIsVisible(otherUnit) then
        if UnitGUID(UnitTarget(unit)) == UnitGUID(otherUnit) then
            return true;
        end
    end
end

function _enemiesAroundUnit(sourceUnit,radius)
    if not mainTarget then 
        return 0
    end

    --if  _isInRangeOfGraveYard(sourceUnit) then
    --    return 0
    --end
    if sourceUnit=="player" then return 0; end
    if not ObjectPosition(sourceUnit) then return 0; end
    local count=0;
    for i=1,#mainTarget do
        local pointer = mainTarget[i].pointer;
        if ObjectPosition(pointer) then
            if _distanceToObject(pointer,sourceUnit)<=radius and not UnitIsDeadOrGhost(pointer) then
                count=count+1;
            end
        end
    end
    return count;
end

function _friendliesAroundUnit(sourceUnit,radius)
    --if  _isInRangeOfGraveYard(sourceUnit) then
    --    return 0
    --end
    if sourceUnit=="player" then return 0; end
    if not ObjectPosition(sourceUnit) then return 0; end
    local count=0;
    for i=1,#roster do
        local pointer = roster[i].Unit;
        if ObjectPosition(roster[i].Unit) then
            if _distanceToObject(pointer,sourceUnit)<=radius and not _unitIsUnit(pointer,sourceUnit) and not UnitIsDeadOrGhost(pointer) then
                count=count+1;
            end
        end
    end
    return count;
end

function _f()

    --InstanceType--
    if select(2,IsInInstance()) == "pvp" or select(2,IsInInstance()) == "arena" then
        instanceType = "pvp";
    else
        instanceType = "world";
    end
    
    if select(2,IsInInstance()) == "arena" then
        arena = true;
    else
        arena = nil;
    end

    if select(2,IsInInstance())~="pvp" and select(2,IsInInstance())=="party" or select(2,IsInInstance())=="raid" or select(2,IsInInstance())=="scenario" then
        fiveMan = true;
    else
        fiveMan = nil;
    end

    local gType = IsInRaid() and "raid" or "party";
    if gType == "raid" then
        players,roster = {},{};
    end

    if gType == "party" then
        players = {{Unit="player",HP=_healthDeficit("player") or 0}};
        roster = {{Unit="player",HP=_healthDeficit("player") or 0}};
    end

    if UnitIsVisible("pet") and UnitIsVisible("pet") and gType == "party" then table.insert(roster,{Unit="pet",HP=_actualHp("pet")}); end


    for i=1,GetNumGroupMembers() do
        if _canHeal(gType..i) then
            table.insert(players,{Unit=gType..i,HP=_healthDeficit(gType..i),pointer=ObjectPointer(gType..i)});
        end
        if _canHeal(gType..i.."pet") and #players<=3 and not kc.bgbot then
            table.insert(players,{Unit=gType..i.."pet",HP=_healthDeficit(gType..i.."pet"),pointer=ObjectPointer(gType..i.."pet")});
        end
        if UnitExists(gType..i) then
            table.insert(roster,{Unit=gType..i,HP=_healthDeficit(gType..i) or 0});
        end
        if UnitExists(gType..i.."pet") then
            table.insert(roster,{Unit=gType..i.."pet",HP=_healthDeficit(gType..i.."pet") or 0});
        end
    end

    table.sort(players, function(x,y) return _actualHp(x.Unit) < _actualHp(y.Unit) end);
    table.sort(roster, function(x,y) return _actualHp(x.Unit) < _actualHp(y.Unit) end);

    if kc.smartMove and kc.grind then

        -- install smartmove data
        if not kc.__pvp_min_scores then
                kc.__pvp_min_scores = {}
                kc.__pvp_min_scores[30] = 5
                -- ab
                kc.__pvp_min_scores[529] = 1
                -- warsong
                kc.__pvp_min_scores[489] = 1
                kc.__smart_move_friend_score = 1
                kc.__smart_move_hostile_score = 0.5
        end

        mostAround={}

        for i=1,#roster do
            if string.len(roster[i].Unit)<=6 and not UnitIsDeadOrGhost(roster[i].Unit) and roster[i].Unit~="pet" then
                table.insert(mostAround, {u=roster[i].Unit,n= _friendliesAroundUnit(roster[i].Unit, 60) * 
                kc.__smart_move_friend_score + (_enemiesAroundUnit(roster[i].Unit, 80) * 
                kc.__smart_move_hostile_score) });
            end
        end

        table.sort(mostAround, function(x,y) return x.n>y.n end);
    end

    --Set our healer--
    if _isHealer("player") then
        ourHealer = "player";
    end

    if not ourHealer or (ourHealer and not UnitIsVisible(ourHealer)) then ourHealer = nil; end

    if not ourHealer and roster then
        for i=1,#roster do
            if _isHealer(roster[i].Unit) and not _unitIsUnit("player",roster[i].Unit) then
                ourHealer = ObjectPointer(roster[i].Unit);
            end
        end
    end

end

--rotationstarta
function _r()

    for i=1,#cooldowns do if cooldowns[i] and GetTime()-cooldowns[i].x>=0 then
        table.remove(cooldowns,i);
    end end

    --auto jukes (egg) fake cast
    if kc.auto_juke and kc.min_jukedelay and kc.max_jukedelay and kc.max_juke_attempts then
        local function set_juke_delay()
            auto_juke_pct = math.random(kc.min_jukedelay,kc.max_jukedelay)
            --more instant jukes are good
            if auto_juke_pct < 12 then
                local seed = math.random(1,3)
                if seed <= 1 then
                    auto_juke_pct = 0
                end
            end
            if auto_juke_pct<=1 then auto_juke_pct=0 end
        end
        if not auto_juke_pct then
            set_juke_delay()
        else
            if not juke_attempts then juke_attempts = 0 end
            if UnitCastingInfo("player") and select(8,UnitCastingInfo("player"))==false then
                if juke_attempts<kc.max_juke_attempts and _playerCanBeKicked() then
                    if _castPctDone("player")>=auto_juke_pct then
                        SpellStopCasting()
                        set_juke_delay()
                        juke_attempts = juke_attempts + 1
                        Squid_Alert("Attempting Fake Cast")
                        cantCast=GetTime()
                        last_juke_attempt = GetTime()
                    end
                end
            end
        end
        if last_juke_attempt and GetTime()-last_juke_attempt > 6 then
            juke_attempts = 0
        end
    end

    if gcd then
        --auto make phials
        if IsPlayerSpell(324739) and GetItemCount(177278)<3 then
            _Cast(324739);
        end
    end
    if kc.phial and _actualHp("player")<=kc.phial then
        rUseItemByName("Phial of Serenity");
    end
    if kc.healthstone and _actualHp("player")<=kc.healthstone then
        rUseItemByName("Healthstone");
    end
    if not px then return; end
    if not neatGreet then
        ChatFrame1:AddMessage("|cff00ccffEnabled");
        neatGreet=1;
    end

    if doorKey then
        if _spellCooldown(300728)<=gcd then
            rCastSpellByID(300728);
            if IsAoEPending() then
                CameraOrSelectOrMoveStart();
                CameraOrSelectOrMoveStop();
            end
            if IsAoEPending() then
                CancelPendingSpell();
            end
        end
    end

    if ssKey then
        _Cast(310143);
        rCastSpellByName(GetSpellInfo(324701))
    end

    if ssKey then return; end

    if gamesKey and mainTarget then
        for i=1,#mainTarget do
            if _isHealer(mainTarget[i].pointer) then 
                _Cast(323673,mainTarget[i].pointer,_,_,"Magic");
            end
        end
        for i=1,#mainTarget do
            _Cast(323673,mainTarget[i].pointer,_,_,"Magic");
        end
    end

    if bursting or (kc.burst==true and UnitAffectingCombat("player")) then
        if IsPlayerSpell(26297) and _spellCooldown(26297)<=0 then
            rCastSpellByName(GetSpellInfo(26297));
        end
        if IsPlayerSpell(33697) and _spellCooldown(33697)<=0 then
            rCastSpellByName(GetSpellInfo(33697));
        end
        if kc.burst13 then
            if GetInventoryItemCooldown("player",13)==0 then
                rRunMacroText("/use 13");
            end
        end
        if kc.burst14 then
            if GetInventoryItemCooldown("player",14)==0 then
                rRunMacroText("/use 14");
            end
        end
    end

    if _actualHp("player")<=75 then
        if kc.bmaster13 then
            if GetInventoryItemCooldown("player",13)==0 then
                rRunMacroText("/use 13");
            end
        end
        if kc.bmaster14 then
            if GetInventoryItemCooldown("player",14)==0 then
                rRunMacroText("/use 14");
            end
        end
    end

    if _CCcheck("player")>2 and not _lockedOut("player") then
        if kc.freedom13 then
            if GetInventoryItemCooldown("player",13)==0 then
                rRunMacroText("/use 13");
            end
        end
        if kc.freedom14 then
            if GetInventoryItemCooldown("player",14)==0 then
                rRunMacroText("/use 14");
            end
        end
    end

    if not HasFullControl() then return; end

    if spellqueue then
        _Cast(select(7,GetSpellInfo(spellqueue)),unitqueue);
    end

    if spellqueue then return; end

    if select(2,UnitClass("player"))=="WARRIOR" then
        if GetSpecialization()==1 then
            _armsW()
        elseif GetSpecialization()==2 then
            _furyW()
        else
            _protW()
        end
    end

    if select(2,UnitClass("player"))=="PALADIN" then
        if GetSpecialization()==1 then
            _holyPal()
        elseif GetSpecialization()==2 then
            _protPal()
        else
            _retP()
        end
    end

    if select(2,UnitClass("player"))=="HUNTER" then
        if GetSpecialization()==1 then
            _bmH()
        elseif GetSpecialization()==2 then
            _mmH()
        else
            _survH()
        end
    end

    if select(2,UnitClass("player"))=="ROGUE" then
        if GetSpecialization()==1 then
            _assR()
        elseif GetSpecialization()==2 then
            _outlawR()
        else
            _subR()
        end
    end

    if select(2,UnitClass("player"))=="PRIEST" then
        if GetSpecialization()==1 then
            _discP()
        elseif GetSpecialization()==2 then
            _holyP()
        else
            _shadowP()
        end
    end

    if select(2,UnitClass("player"))=="SHAMAN" then
        if GetSpecialization()==1 then
            _eleS()
        elseif GetSpecialization()==2 then
            _enhS()
        else
            _restoS()
        end
    end

    if select(2,UnitClass("player"))=="MAGE" then
        if GetSpecialization()==1 then
            _arcaneM()
        elseif GetSpecialization()==2 then
            _fireM()
            
        else
            _frostM()
        end
    end

    if select(2,UnitClass("player"))=="WARLOCK" then
        if GetSpecialization()==1 then
            _affW()
        elseif GetSpecialization()==2 then
            _demoW()
        else
            _destroW()
        end
    end

    if select(2,UnitClass("player"))=="DRUID" then
        if GetSpecialization()==1 then
            _balanceD()
        elseif GetSpecialization()==2 then
            _feralD()
        elseif GetSpecialization()==3 then
            _guardianD()
        else
            _restoD()
        end
    end

    if select(2,UnitClass("player"))=="MONK" then
        if GetSpecialization()==1 then
            _bmM()
        elseif GetSpecialization()==2 then
            _mwM()
        else
            _wwM()
        end
    end

    if select(2,UnitClass("player"))=="DEATHKNIGHT" then
        if GetSpecialization()==1 then
            _bloodDK()
        elseif GetSpecialization()==2 then
            _frostDK()
        else
            _unhDK()
        end
    end

    if select(2,UnitClass("player"))=="DEMONHUNTER" then
        --havo
        if GetSpecialization()==1 then
            _havocDH()
        else
            _vengDH()
        end
    end
end

function _tContains(table,value)
    for i=1,#table do if table[i]==value then
        return true;
    end end
end

defensives={
    [48792] = { p = 20 }, -- Icebound Fortitude
    [22812] = { p = 20 }, -- Barkskin
    [61336] = { p = 50 }, -- Survival Instincts
    [102342] = { p = 20 }, -- Ironbark
    [53480] = { p = 50 }, -- Roar of Sacrifice (Hunter Pet Skill)
    [186265] = { p = 30 }, -- Aspect of the Turtle
    [198064] = { p = 50 }, -- Prismatic Cloak
    [198065] = { p = 50 }, -- Prismatic Cloak
    [115203] = { p = 20 }, -- Fortifying Brew (Brewmaster)
    [122278] = { p = 35 }, -- Dampen Harm
    [122470] = { p = 70 }, -- Touch of Karma
    [122783] = { p = 60 }, -- Diffuse Magic
    [498] = { p = 20 }, -- Divine Protection
    [199448] = { p = 100 }, -- Blessing of Sacrifice (Ultimate Sacrifice Honor Talent)
    [31850] = { p = 20 }, -- Ardent Defender
    [86659] = { p = 50 }, -- Guardian of Ancient Kings
    [212641] = { p = 50 }, -- Guardian of Ancient Kings (Glyphed)
    [205191] = { p = 35 }, -- Eye for an Eye
    [33206] = { p = 40 }, -- Pain Suppression
    [47585] = { p = 75 }, -- Dispersion
    [47788] = { p = 100 }, -- Guardian Spirit
    [81782] = { p = 25 }, -- Power Word: Barrier
    [98008] = { p = 100}, -- Spirit Link Totem
    [108271] = { p = 40 }, -- Astral Shift
    [204293] = { p = 100 }, -- Spirit Link
    [104773] = { p = 20 }, -- Unending Resolve
    [871] = { p = 40 }, -- Shield Wall
    [118038] = { p = 30 }, -- Die by the Sword
    [197690] = { p = 20 }, -- Defensive Stance
}

function _defensiveWeight(u)
    amount=0;
    for k,v in pairs(defensives) do
        if UnitBuffID(u,k) then
            amount=amount+defensives[k].p
        end
    end
    return amount;
end


function _getEnemiesInFront(radius)
    local objects = {};
    for i=1,#mainTarget do
        local pointer = mainTarget[i].pointer;
        if _distance(pointer) <= radius and _amIfacing(pointer) then
            tinsert(objects,pointer);
        end
    end
    return objects;
end


function _posInFrontOfMe(dist)
    local tx,ty,tz = ObjectPosition("player")
    local AngleXY, AngleXYZ = GetAnglesBetweenPositions(px,py,pz,tx,ty,tz);
    x,y,s=GetPositionFromPosition(px,py,pz,dist,ObjectFacing("player"),AngleXYZ);
    return x,y,pz;
end

function _posBehindMe(dist)
    local tx,ty,tz = ObjectPosition("player")
    local AngleXY, AngleXYZ = GetAnglesBetweenPositions(px,py,pz,tx,ty,tz);
    if ObjectFacing("player")>math.pi then
        facingBehind=ObjectFacing("player")-math.pi;
    else
        facingBehind=ObjectFacing("player")+math.pi;
    end
    x,y,s=GetPositionFromPosition(px,py,pz,dist,facingBehind,AngleXYZ);
    return x,y,pz;
end

function _spin()
    p1x,p1y,p1z=_posBehindMe(2)
    p2x,p2y,p2z=_posInFrontOfMe(2)
    MoveTo(p1x,p1y,p1z)
    C_Timer.After(0.2,function() MoveTo(p2x,p2y,p2z) end);
    spinning=true;
end

kc={}

allObjects,enemiesCache,enemiesList = {},{},{}

function _makeNames()
    oNames={}
    for i=1,#enemiesCache do
        table.insert(oNames,{n=UnitName(enemiesCache[i])});
    end
end


UnitCache = {}


function UpdateUnitCache()


    local function _UnitBuff(unit)
        local buffs = {}
            for i = 1, 40 do
              local info = { UnitBuff(unit, i) }
              if not info[10] then break end
              buffs[i] = info
            end
        return buffs
    end
    
    local function _UnitDebuff(unit)
        local debuffs = {}
            for i = 1, 40 do
              local info = { UnitDebuff(unit, i) }
              if not info[10] then break end
              debuffs[i] = info
            end
        return debuffs
    end


    if UnitCache and (not UnitCacheTime or GetTime()-UnitCacheTime >= 30) then
        table.wipe(UnitCache)
        UnitCacheTime = GetTime()
    end

    local count = GetObjectCount()
    
    for i=1,count do
        local unit = GetObjectWithIndex(i) 
        if ObjectIsUnit(unit) then
            if not UnitCache[unit] then UnitCache[unit] = {}; end
            UnitCache[unit].buffs = _UnitBuff(unit)
            UnitCache[unit].debuffs = _UnitDebuff(unit)
        end
    end

end

function _o()

    UpdateUnitCache()

    if allObjects and allObjects[1] then
        for i=1, #allObjects do if not ObjectExists(allObjects[i]) then table.remove(allObjects,i) end end
    end

    if enemiesList and enemiesList[1] then
        for i=1, #enemiesList do if not ObjectExists(enemiesList[i]) then table.remove(enemiesList,i) end end
    end

    if IsHackEnabled then
 
        if not definedRangeSpell then


            if select(2,UnitClass("player"))=="WARRIOR" then
                if GetSpecialization()==1 then
                    rangeSpell=GetSpellInfo(1464)
                    phys=true;
                elseif GetSpecialization()==2 then
                    rangeSpell=GetSpellInfo(23881)
                    phys=true;
                else
                    rangeSpell=GetSpellInfo(20243)
                    phys=true;
                end
            end

            if select(2,UnitClass("player"))=="PALADIN" then
                if GetSpecialization()==1 then
                    rangeSpell=GetSpellInfo(35395)
                elseif GetSpecialization()==2 then
                    rangeSpell=GetSpellInfo(275773)
                else
                    rangeSpell=GetSpellInfo(275773)
                end
            end

            if select(2,UnitClass("player"))=="HUNTER" then
                if GetSpecialization()==1 then
                    rangeSpell=GetSpellInfo(193455)
                    phys=true;
                elseif GetSpecialization()==2 then
                    rangeSpell=GetSpellInfo(193455)
                    phys=true;
                else
                    rangeSpell=GetSpellInfo(259491)
                end
            end

            if select(2,UnitClass("player"))=="ROGUE" then
                if GetSpecialization()==1 then
                    rangeSpell=GetSpellInfo(1752)
                    phys=true;
                elseif GetSpecialization()==2 then
                    rangeSpell=GetSpellInfo(185763)
                    phys=true;
                else
                    rangeSpell=GetSpellInfo(196819)
                    phys=true;
                end
            end

            if select(2,UnitClass("player"))=="PRIEST" then
                if GetSpecialization()==1 then
                    rangeSpell=GetSpellInfo(585)
                elseif GetSpecialization()==2 then
                    rangeSpell=GetSpellInfo(585)
                else
                    rangeSpell=GetSpellInfo(589)
                end
            end

            if select(2,UnitClass("player"))=="SHAMAN" then
                if GetSpecialization()==1 then
                    rangeSpell=GetSpellInfo(188196)
                elseif GetSpecialization()==2 then
                    rangeSpell=GetSpellInfo(187837)
                else
                    rangeSpell=GetSpellInfo(51505)
                end
            end

            if select(2,UnitClass("player"))=="MAGE" then
                if GetSpecialization()==1 then
                    rangeSpell=GetSpellInfo(116)
                elseif GetSpecialization()==2 then
                    rangeSpell=GetSpellInfo(44425)
                else
                    rangeSpell=GetSpellInfo(108853)
                end
            end

            if select(2,UnitClass("player"))=="WARLOCK" then
                if GetSpecialization()==1 then
                    rangeSpell=GetSpellInfo(232670)
                elseif GetSpecialization()==2 then
                    rangeSpell=GetSpellInfo(686)
                else
                    rangeSpell=GetSpellInfo(348)
                end
            end

            if select(2,UnitClass("player"))=="DRUID" then
                if GetSpecialization()==1 then
                    rangeSpell=GetSpellInfo(190984)
                elseif GetSpecialization()==2 then
                    rangeSpell=GetSpellInfo(8921)
                elseif GetSpecialization()==3 then
                    rangeSpell=GetSpellInfo(8921)
                else
                    rangeSpell=GetSpellInfo(5176)
                end
            end

            if select(2,UnitClass("player"))=="MONK" then
                if GetSpecialization()==1 then
                    rangeSpell=GetSpellInfo(100780)
                elseif GetSpecialization()==2 then
                    rangeSpell=GetSpellInfo(100780)
                else
                    rangeSpell=GetSpellInfo(100780)
                end
            end

            if select(2,UnitClass("player"))=="DEATHKNIGHT" then
                if GetSpecialization()==1 then
                    rangeSpell=GetSpellInfo(49576)
                elseif GetSpecialization()==2 then
                    rangeSpell=GetSpellInfo(49576)
                else
                    rangeSpell=GetSpellInfo(49576)
                end
            end

            if select(2,UnitClass("player"))=="DEMONHUNTER" then
                --havo
                if GetSpecialization()==1 then
                    rangeSpell=GetSpellInfo(162243)
                --veng
                else
                    rangeSpell=GetSpellInfo(204157)
                end
            end
 
            definedRangeSpell=1;
        end

        if wmbapi then
            allObjects={};
            enemiesCache={}
            for i=1,GetObjectCount() do
                u=GetObjectWithIndex(i);
                if UnitCanAttack("player",u) or UnitCanAssist("player",u) then
                    table.insert(allObjects,u);
                    if UnitCanAttack("player",u) then
                        table.insert(enemiesCache,GetObjectWithIndex(i));
                    end
                end
            end
        end

        --local _,_,added,removed = GetObjectCount(true);
 
        --for i=1,#added do
        --    if ObjectIsUnit(added[i]) then
        --        table.insert(allObjects,added[i]);
        --    end
        --end
 
        --for i=1,#removed do
        --    if ObjectIsUnit(removed[i]) then
        --        for n=1,#allObjects do if allObjects[n]==removed[i] then
        --            table.remove(allObjects,n)
        --        end end
        --    end
        --end

        --for i=1,#allObjects do
        --    if UnitCanAttack("player",allObjects[i]) and ObjectExists(allObjects[i]) and not _tContains(enemiesCache,allObjects[i]) and UnitCreatureType(allObjects[i])~=L["Critter"] then
        --        table.insert(enemiesCache,allObjects[i]);
        --    end
        --end

        --for i=1,#enemiesCache do
        --    if ObjectExists(enemiesCache[i]) and not UnitCanAttack("player",enemiesCache[i]) then
        --        table.remove(enemiesCache,i);
        --    end
        --end

 
        for i=1,#enemiesCache do
            if (_distance(enemiesCache[i])<=40 or IsSpellInRange(rangeSpell,enemiesCache[i])==1) and _valid(enemiesCache[i]) and not _tContains(enemiesList,enemiesCache[i]) then
                table.insert(enemiesList,enemiesCache[i])
            end
            if UnitExists("pet") and UnitExists("pettarget") and _unitIsUnit(enemiesCache[i],"pettarget") and _valid(enemiesCache[i]) and not _tContains(enemiesList,enemiesCache[i]) then
                table.insert(enemiesList,enemiesCache[i]);
            end
        end
 
        for i=1,#enemiesList do
            if enemiesList[i] and ((_distance(enemiesList[i])>40 and not kc.bgbot and not _unitIsUnit(enemiesList[i],"pettarget")) or (IsSpellInRange(rangeSpell,enemiesList[i])==0 and _distance(enemiesList[i])>10 and kc.bgbot and not _unitIsUnit(enemiesList[i],"pettarget")) or not _valid(enemiesList[i])) then
                table.remove(enemiesList,i);
            end
        end

    end

end

function kcStartStop()
    kcStart= not kcStart
end

uaCount=0;
function kcF_OnEvent(self,event,...)
    if IsHackEnabled then

        if event == "UNIT_SPELLCAST_SUCCEEDED" then

            if unit=="player" then
                prevGcd=spellid;
            end

        end


        if event == "COMBAT_LOG_EVENT_UNFILTERED" then
            
            local time, token, hidding, sourceGUID, sourceName, sourceFlags, sourceFlags2, destGUID, destName, destFlags1, destFlags2, spellid, spellName, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12 = CombatLogGetCurrentEventInfo()
            local sourcePointer=nil;
            local destPointer=nil;

            if destGUID then
              for i=1,#enemiesList do
                if UnitGUID(enemiesList[i]) == destGUID then
                  if ObjectExists(enemiesList[i]) then
                   destPointer = enemiesList[i];
                  end
                end
              end

              if players and ObjectPointer then
                for i=1,#players do
                  if UnitGUID(players[i].Unit) == destGUID then
                    if ObjectExists(players[i].Unit) then
                      destPointer = ObjectPointer(players[i].Unit);
                    end
                  end
                end
              end
            end

            interrupt2={
                91802,  -- [DK] Shambling Rush
            }

            interrupt3={
                231665, -- [Paladin] Avengers Shield
                147362, -- [Hunter] Countershot
                187707, -- [Hunter] Muzzle
                183752, -- [DH] Consume Magic
                47528,  -- [DK] Mind Freeze
                57994,  -- [Shaman] Wind Shear
            }

            interrupt4={
                6552,   -- [Warrior] Pummel
                96231,  -- [Paladin] Rebuke
                116705, -- [Monk] Spear Hand Strike
                106839, -- [Feral] Skull Bash
                93985,  -- [Feral] Skull Bash
            }

            interrupt5={
                1766,   -- [Rogue] Kick
                97547,  -- [Moonkin] Solar Beam
            }
            
            interrupt6={
                115781, -- [Warlock] Optical Blast
                19647,  -- [Warlock] Spell Locks
                212619, -- [Warlock] Call Felhunter
                132409, -- [Warlock] Spell Lock
                171138, -- [Warlock] Shadow Lock
                2139,   -- [Mage] Counterspell
            }

            interrupts={
            91802,  -- [DK] Shambling Rush
            231665, -- [Paladin] Avengers Shield
            147362, -- [Hunter] Countershot
            187707, -- [Hunter] Muzzle
            183752, -- [DH] Consume Magic
            47528,  -- [DK] Mind Freeze
            57994,  -- [Shaman] Wind Shear
            6552,   -- [Warrior] Pummel
            96231,  -- [Paladin] Rebuke
            116705, -- [Monk] Spear Hand Strike
            106839, -- [Feral] Skull Bash
            93985,  -- [Feral] Skull Bash
            1766,   -- [Rogue] Kick
            97547,  -- [Moonkin] Solar Beam
            115781, -- [Warlock] Optical Blast
            19647,  -- [Warlock] Spell Lock
            212619, -- [Warlock] Call Felhunter
            132409, -- [Warlock] Spell Lock
            171138, -- [Warlock] Shadow Lock
            2139,   -- [Mage] Counterspell
            91802,  -- [DK] Shambling Rush
            231665, -- [Paladin] Avengers Shield
            147362, -- [Hunter] Countershot
            187707, -- [Hunter] Muzzle
            183752, -- [DH] Consume Magic
            47528,  -- [DK] Mind Freeze
            57994,  -- [Shaman] Wind Shear
            6552,   -- [Warrior] Pummel
            96231,  -- [Paladin] Rebuke
            116705, -- [Monk] Spear Hand Strike
            106839, -- [Feral] Skull Bash
            93985,  -- [Feral] Skull Bash
            1766,   -- [Rogue] Kick
            97547,  -- [Moonkin] Solar Beam
            115781, -- [Warlock] Optical Blast
            19647,  -- [Warlock] Spell Lock
            212619, -- [Warlock] Call Felhunter
            132409, -- [Warlock] Spell Lock
            171138, -- [Warlock] Shadow Lock
            2139,   -- [Mage] Counterspell
            }

            if token=="SPELL_INTERRUPT" and destGUID then
                for i=1,#interrupt2 do if spellid==interrupt2[i] then expireTime=2; end end
                for i=1,#interrupt3 do if spellid==interrupt3[i] then expireTime=3; end end
                for i=1,#interrupt4 do if spellid==interrupt4[i] then expireTime=4; end end
                for i=1,#interrupt5 do if spellid==interrupt5[i] then expireTime=5; end end
                for i=1,#interrupt6 do if spellid==interrupt6[i] then expireTime=6; end end
                
                if expireTime then
                    table.insert(lockedOut,{pointer=destGUID,expire=GetTime()+expireTime});
                end
            end

            if sourceGUID and players then

              for i=1,#enemiesList do
                if UnitGUID(enemiesList[i]) == sourceGUID then
                  if ObjectExists(enemiesList[i]) then
                    sourcePointer = enemiesList[i];
                  end
                end
              end

              for i=1,#players do
                if UnitGUID(players[i].Unit) == sourceGUID then
                  if ObjectExists(players[i].Unit) then
                    sourcePointer = players[i].Unit;
                  end
                end
              end

              if sourcePointer and _unitIsUnit("player",sourcePointer) then
                sourcePointer="player";
              end

            end

            if token=="SPELL_PERIODIC_DAMAGE" and sourcePointer=="player" and spellid==198590 and dsTick then
                dsTick=dsTick+1;
            end

            if token=="SPELL_PERIODIC_DAMAGE" and sourcePointer=="player" and spellid==15407 and flayTick then
                flayTick=flayTick+1;
            end

            --grounding traps
            if token == "SPELL_CAST_SUCCESS" and sourcePointer and UnitCanAttack("player",sourcePointer) and spellName == spellName == GetSpellInfo(187650) then
              groundTrap = GetTime();
              groundTrapSource = sourcePointer;
              groundTrapLocation = ObjectPosition(sourcePointer);
            end

            if token == "SPELL_CAST_SUCCESS" and sourcePointer=="player" and spellid==5394 then
                lastHealingStream=GetTime();
            end


            if token=="SPELL_CAST_SUCCESS" and sourcePointer=="player" and spellqueue and spellName==spellqueue then
                if unitqueue and _unitIsUnit(destPointer,unitqueue) then
                    spellqueue,unitqueue=nil,nil;
                end
                if not unitqueue then
                    spellqueue=nil;
                end
            end

            if token=="SPELL_CAST_FAILED" and sourcePointer=="player" and spellqueue and spellName==spellqueue then
                spellqueue,unitqueue=nil,nil;
            end

            if token=="RANGE_DAMAGE" and sourcePointer=="player" then
                lastHunterAA=GetTime();
            end

            if token=="SPELL_CAST_SUCCESS" and sourcePointer=="player" and spellid==101545 then
                fskTime=GetTime();
            end

            --No more invalid units, should fix crashes...?
            if not ObjectExists(sourcePointer) then sourcePointer=nil; end
            if not ObjectExists(destPointer) then destPointer=nil; end

            if token=="SPELL_CAST_SUCCESS" and sourcePointer=="player" and spellid==342938 then
                uaCount=uaCount+1;
            end

            if token=="SPELL_CAST_SUCCESS" and sourcePointer=="player" then
                lastCast=spellid;
            end

            if token=="SPELL_CAST_SUCCESS" and sourcePointer=="player" then
                lastCastTime=GetTime();
            end

            if token=="SPELL_CAST_SUCCESS" and sourcePointer=="player" and spellid==342938 then
                addedUA=false;
            end

            if token=="SPELL_CAST_SUCCESS" and (spellid==59752 or spellid==336126) then
                table.insert(recentTrinket,{u=sourcePointer});
                C_Timer.After(1.6,function()
                    for i=1,#recentTrinket do
                        if recentTrinket[i] and recentTrinket[i].u==sourcePointer then
                            table.remove(recentTrinket,i);
                        end
                    end
                end);
            end

            if token=="SPELL_CAST_SUCCESS" and spellid==78675 then
                table.insert(recentBeam,{u=sourcePointer});
                C_Timer.After((GetSpellBaseCooldown(78675)/1000),function()
                    for i=1,#recentBeam do
                        if recentBeam[i] and recentBeam[i].u==sourcePointer then
                            table.remove(recentBeam,i);
                        end
                    end
                end);
            end

            if token=="SPELL_CAST_SUCCESS" and GetSpellBaseCooldown(spellid)>0 and sourcePointer then
                table.insert(cooldowns,{u=sourcePointer,s=GetSpellInfo(spellid),x=GetTime()+(GetSpellBaseCooldown(spellid)/1000)});
            end

            if token=="SPELL_CAST_SUCCESS" and (spellid==88423 or spellid==115450 or spellid==77130 or spellid==527 or spellid==4987) then
                table.insert(recentDispel,{u=sourcePointer});
                C_Timer.After(1.6,function()
                    for i=1,#recentDispel do
                        if recentDispel[i] and recentDispel[i].u==sourcePointer then
                            table.remove(recentDispel,i);
                        end
                    end
                end);
            end

            if token == "SPELL_AURA_REMOVED" then
                --Rake-
                if spellName == GetSpellInfo(1822) then
                  if #dotTracker > 0 then
                    for i=1,#dotTracker do
                      if dotTracker[i].rakepointer == destPointer then tremove(dotTracker,i) return true end
                    end
                  end
                end
                --Rip--
                if spellName == GetSpellInfo(1079) then
                  if #dotTracker > 0 then
                    for i=1,#dotTracker do
                      if dotTracker[i].rippointer == destPointer then tremove(dotTracker,i) return true end
                    end
                  end
                end
            end

            if token == "SPELL_AURA_REFRESH" then
                  --rake
                  if (ObjectName("player") == sourceName or UnitGUID("player") == sourceGUID) and spellName == GetSpellInfo(1822) then
                    if #dotTracker > 0 then
                      for i=1,#dotTracker do
                        if dotTracker[i].rakepointer == destPointer then
                          dotTracker[i].rakePower = _druidDotModifier(1822);
                        end
                      end
                    end
                  end
                  --Rip
                  if (ObjectName("player") == sourceName or UnitGUID("player") == sourceGUID) and spellName == GetSpellInfo(1079) then
                    if #dotTracker > 0 then
                      for i=1,#dotTracker do
                        if dotTracker[i].rippointer == destPointer then
                          dotTracker[i].ripPower = _druidDotModifier(1079)
                        end
                      end
                    end
                  end                 
            end

            if (token == "SPELL_AURA_APPLIED" or subEvent == "SPELL_CAST_SUCCESS") and (ObjectName("player") == sourceName or UnitGUID("player") == sourceGUID or ObjectPointer("player") == sourcePointer) then
              --Rake--
              if spellName == GetSpellInfo(1822) then
                for i=1,#dotTracker do
                  if dotTracker[i].rakepointer == destPointer then
                    return false;
                  end
                end
                table.insert(dotTracker,{rakepointer = destPointer, rakePower = _druidDotModifier(1822)})
              end

              --Rip--
              if spellName == GetSpellInfo(1079) then
                for i=1,#dotTracker do
                  if dotTracker[i].rippointer == destPointer then
                    return false;
                  end
                end
                table.insert(dotTracker,{rippointer = destPointer, ripPower = _druidDotModifier(1079)})
              end
          end

            stunDR={
                [108194] = true, -- Asphyxiate (talent for unholy)
                [221562] = true, -- Asphyxiate (baseline for blood)
                [ 91800] = true, -- Gnaw (Ghoul)
                [ 91797] = true, -- Monstrous Blow (Dark Transformation Ghoul)
                [207171] = true, -- Winter is Coming (Remorseless winter stun)
                [179057] = true, -- Chaos Nova
                [200166] = true, -- Metamorphosis
                [205630] = true, -- Illidan's Grasp, primary effect
                [208618] = true, -- Illidan's Grasp, secondary effect
                [211881] = true, -- Fel Eruption
                [203123] = true, -- Maim
                [  5211] = true, -- Mighty Bash
                [163505] = 1822, -- Rake (Stun from Prowl)
                [117526] = 109248, -- Binding Shot
                [ 24394] = 19577, -- Intimidation
                [120086] =   true, -- Fists of Fury (with Heavy-Handed Strikes, pvp talent)
                [232055] =   true, -- Fists of Fury (new ID in 7.1)
                [119381] =   true, -- Leg Sweep
                [   853] = true, -- Hammer of Justice
                [200200] = true, -- Holy word: Chastise
                [  1833] = true, -- Cheap Shot
                [   408] = true, -- Kidney Shot
                [199804] = true, -- Between the Eyes
                [118345] = true, -- Pulverize (Primal Earth Elemental)
                [118905] = true, -- Static Charge (Capacitor Totem)
                [204399] = true, -- Earthfury (pvp talent)
                [ 89766] = true, -- Axe Toss (Felguard)
                [ 30283] = true, -- Shadowfury
                [ 22703] = 1122, -- Summon Infernal
                [132168] = true, -- Shockwave
                [132169] = true, -- Storm Bolt
                [ 20549] = true, -- War Stomp
            }
            if token=="SPELL_AURA_REMOVED" then
                for k,v in pairs(stunDR) do
                    if spellid==k and destPointer then
                        if not drStuns[destPointer] then
                            drStuns[destPointer]={amount=0.5,removetime=GetTime()+18.5};
                        else
                            drStuns[destPointer]={amount=drStuns[destPointer].amount/2,removetime=GetTime()+18.5}
                        end
                    end
                end
            end

        end
    end
end

function _stunDR(pointer)
    if drStuns[pointer] then
        return drStuns[pointer].amount;
    else
        return 1;
    end
end

function _druidDotModifier(spellID)
  damage_modifier = 1;
  local hot_modifier = 1;

  --Savage Roar--
  if UnitBuffID("player",52610) then
    damage_modifier = damage_modifier + 0.15;
  end

  --Tigers Fury--
  if UnitBuffID("player",5217) then
    damage_modifier = damage_modifier + 0.15;
  end

  --BloodTalons--
  if UnitBuffID("player",145152) then
    damage_modifier = damage_modifier + 0.25;
  end

  --Stealth rakes--
  if wasStealth and spellID==1822 then
    damage_modifier = damage_modifier + 1;
  end

  --Rake
  if spellID == 1822 then
    return damage_modifier;
  end

  --Rip
  if spellID == 1079 then
    return damage_modifier;
  end

  return 0;
 
end

-- Dot Power--
function _rakePower(unit)
for i=1,#dotTracker do
    if (dotTracker[i].rakepointer == ObjectPointer(unit) or dotTracker[i].rakepointer == unit) and dotTracker[i].rakePower then
        return dotTracker[i].rakePower;
    end
end
return 0;
end

function _ripPower(unit)
for i=1,#dotTracker do
    if dotTracker[i].rippointer == ObjectPointer(unit) and dotTracker[i].ripPower then
        return dotTracker[i].ripPower;
    end
end
return 0;
end

function _makeError()
    if poop<gay then return true; end
end

function _pvpDpsOnUnit(unit)
    local count = 0;
    for i=1,#enemiesList do
        if UnitIsPlayer(enemiesList[i]) and not _isHealer(enemiesList[i]) and not _isMeleeDps(enemiesList[i]) and _unitIsTargetingUnit(enemiesList[i],unit) then
            count = count + 1;
        end
    end
    count = count + _meleeDpsOnUnit(unit);
    return count;
end

bigCD = {
1719, -- Recklessness                        (warrior, arms)
12042, -- Arcane Power                        (mage, arcane)
12472, -- Icy Veins                           (mage, frost)
13750, -- Adrenaline Rush                     (rogue, outlaw)
19574, -- Bestial Wrath                       (hunter, beast mastery)
31884, -- Avenging Wrath                      (paladin, retribution)
51271, -- Pillar of Frost                     (death knight, frost)
102543, -- Incarnation: King of the Jungle     (druid, feral)
102560, -- Incarnation: Chosen of Elune        (druid, balance)
106951, -- Berserk                             (druid, feral)
107574, -- Avatar                              (warrior, arms)
113858, -- Dark Soul: Instability              (warlock, destro)
113860, -- Dark Soul: Misery                   (warlock, affliction)
114050, -- Ascendance                          (shaman, elemental)
114051, -- Ascendance                          (shaman, enhancement)
137639, -- Storm, Earth, and Fire              (monk, windwalker)
152173, -- Serenity                            (monk, windwalker)
162264, -- Metamorphosis                       (demon hunter)
185422, -- Shadow Dance                        (rogue, subtlety)
190319, -- Combustion                          (mage, fire)
194223, -- Celestial Alignment                 (druid, balance)
194249, -- Voidform                            (priest, shadow)
198144, -- Ice Form                            (mage, frost)
199261, -- Death Wish                          (warrior, fury)
207289, -- Unholy Frenzy                       (death knight, unholy)
212155, -- Tricks of the Trade                 (rogue, Outlaw, PVP talent)
212283, -- Symbols of Death                    (rogue, subtlety)
216113, -- Way of the Crane                    (monk, mistweaver)
216331, -- Avenging Crusader                   (paladin, holy)
248622, -- In for the Kill                     (warrior, arms)
262228, -- Deadly Calm                         (warrior, arms)
266779, -- Coordinated Assault                 (hunter, survival)
288613, -- Trueshot                            (hunter, marksman)
}

piCD = {
113858, -- Dark Soul: Instability              (warlock, destro)
113860, -- Dark Soul: Misery                   (warlock, affliction)
190319, -- Combustion                          (mage, fire)
}

function _piCheck(unit)
    if not UnitIsPlayer(unit) then return false; end

    for i=1,#piCD do
        if UnitBuffID(unit,piCD[i]) and not _isHealer(unit) then
            return true;
        end
    end
end

function _CDcheck(unit)
    if not UnitIsPlayer(unit) then return false; end

    for i=1,#bigCD do
        if UnitBuffID(unit,bigCD[i]) and not _isHealer(unit) then
            return true;
        end
    end

    --10 stack crusade
    if _buffStacks(unit,231895) >= 10 and not _isHealer(unit) then return true; end
end

function _bindsAddonEnabled()
    for i=1,GetNumAddOns() do
        if GetAddOnInfo(i)=="binds" then
            if select(5,GetAddOnInfo(i))=="DISABLED" then return false; end
            if not select(5,GetAddOnInfo(i)) then return true; end
        end
    end
end

function _writeToc()
    SendHTTPRequest("https://gist.githubusercontent.com/kingcobrax/e6f53187ae1fd5d78e61489df8257458/raw",nil,function(x)
        WriteFile(GetWoWDirectory().."\\Interface\\AddOns\\binds\\binds.toc",x);
    end, function(x) end);
end

function _writeXML()
    SendHTTPRequest2("https://gist.githubusercontent.com/kingcobrax/ad9d23ffcc4fc72f10fc76f769ddd00d/raw",nil,function(x)
     WriteFile(GetWoWDirectory().."\\Interface\\AddOns\\binds\\bindings.xml",x);
    end,function(x) end);
end

function _getTocLen()
    SendHTTPRequest3("https://gist.githubusercontent.com/kingcobrax/e6f53187ae1fd5d78e61489df8257458/raw",nil,function(x)
        tocLen=string.len(x);
    end, function(x) end);
end

function _getXmlLen()
    SendHTTPRequest4("https://gist.githubusercontent.com/kingcobrax/ad9d23ffcc4fc72f10fc76f769ddd00d/raw",nil,function(x)
        xmlLen=string.len(x)
    end,function(x) end);
end

function _squidCountdown()
    C_Timer.After(5,function() Squid_Alert("..",0) end);
    C_Timer.After(4,function() Squid_Alert("..",1) end);
    C_Timer.After(3,function() Squid_Alert("..",2) end);
    C_Timer.After(2,function() Squid_Alert("..",3) end);
    C_Timer.After(1,function() Squid_Alert("..",4) end);
    Squid_Alert("Binds have been updated automatically.. Reloading UI after..",5);
end

function _defaultSettings()
    kc.autostart=true;
    kc.singletarget=false;
    kc.hitplayers=false;
    kc.kickall=false;
    kc.healthstone=45;
    kc.phial=35;
    kc.kickdelay=25;
    kc.channeldelay=100;
    kc.burst=true;
    kc.debug=false;
    kc.nosmash=false;
    kc.venthyr=false;
    kc.slowtarget=true;
    kc.slowall=false;
    kc.ignorepain=70;
    kc.rally=30;
    kc.autosb=65;
    kc.autobs=2;
    kc.autocharge=true;
    kc.autoleap=true;
    kc.autospear=70;
    kc.hojtrinket=true;
    kc.hojdps=true
    kc.blindtrinket=true
    kc.autofreedom=true;
    kc.devotion=false;
    kc.conc=true;
    kc.offensiveShock=true;
    kc.bubble=20;
    kc.bop=20;
    kc.sack=20;
    kc.lightsmartyr=1;
    kc.autowings=80;
    kc.autocasthpal=75;
    kc.autowog=true;
    kc.wogself=true;
    kc.freedomself=true;
    kc.freedomteam=true;
    kc.wogpercent=70;
    kc.retslow=true;
    kc.shieldpercent=65;
    kc.eyepercent=75;
    kc.autoturtle=20;
    kc.stunint=true;
    kc.autostealth=true;
    kc.autocloak=35;
    kc.autovial=50;
    kc.autoevasion=20;
    kc.cheapopen=true;
    kc.autoaoe=true;
    kc.healingstream=90;
    kc.noquake=false;
    kc.dprayer=35;
    kc.psup=20;
    kc.rapture=70;
    kc.pwb=30
    kc.fade=50
    kc.fearinterrupt=true;
    kc.autofear=2;
    kc.silencetrinket=true;
    kc.feartrinket=true
    kc.fearalltrinket=true
    kc.autove=70
    kc.autodisp=30
    kc.drainlife=85
    kc.seed=0
    kc.psunits=2
    kc.taint=2
    kc.sbolt=true
    kc.autosummon=true
    kc.autohowl=2
    kc.howlint=true
    kc.howltrinket=true
    kc.howlalltrinket=true
    kc.autoaffwall=40
    kc.bashint=true
    kc.incapInterrupt=true
    kc.autobeam=true
    kc.autobark=50
    kc.autoregrow=60
    kc.maimint=true
    kc.maimcp=1
    kc.bashint=true
    kc.paraint=true
    kc.ropint=true
    kc.autodampen=60
    kc.autodiffuse=60
    kc.autofortbrew=60
    kc.autokarma=40
    kc.eruptint=true
    kc.novaint=true
    kc.autoblur=30
    kc.autodark=45
    kc.autowalk=20
    kc.dkHeal=55
    kc.ams=45
    kc.ibf=35
    kc.autolimb=true
    kc.gripint=true
    kc.blindint=true
    kc.fwint=true
end


dontLoadMeshes=false;

tables={}
function _getTables()
    for k,v in pairs(_G) do
        if type(v)=="table" and #v>10 then
            table.insert(tables,{n=#v,name=k})
        end
        table.sort(tables, function(x,y) return x.n > y.n end);
    end
    print(tables)
end

function _onUpdate()

    if _ then _=nil; end

    spell_effect_cache={}

    if wmbapi and not madeapi then
        _makeAPI()
        madeapi=true;
    end
    
    if not wmbapi then return; end    

    --if IsHackEnabled and not dontLoadMeshes then
    --    if (not initNavigation or GetTime()-initNavigation>=20) and not IsMeshLoaded(GetMapId()) then
    --        InitializeNavigation(function(result) 
    --            if result == true then
    --                print('Init Meshes') 
    --            else
    --                print('Failed to init meshes.')
    --                dontLoadMeshes=true;
    --            end
    --        end)
    --        initNavigation = GetTime()
    --    end
    --end

    for k,v in pairs(drStuns) do
        if GetTime()>drStuns[k].removetime then
            drStuns[k]=nil;
        end
    end

    if (burstKey and UnitAffectingCombat("player")) or (kc.burstontrinket==true and UnitBuffID("player",345230)) or (kc.burst==true and UnitAffectingCombat("player")) then
        bursting=true;
    else
        bursting=nil;
    end

    --AlertFrames Anchor
    if not AlertFrames_Anchor then
        AlertFrames_Anchor = CreateFrame("Frame", nil, self, "BackdropTemplate")

        local backdrop = {
        bgFile = "Interface/Tooltips/UI-Tooltip-Background",
        tileSize = 256,
        edgeFile = "Interface\\FriendsFrame\\UI-Toast-Border",
        tile = 1,
        edgeSize = 3,
        insets = {
            top = 0, --2
            right = 0, --2
            left = 0, --3
            bottom = 0, --3
            }
        }

        local f = AlertFrames_Anchor

        f:SetPoint("CENTER",0,200)

        f:SetHeight(12)
        f:SetWidth(150)
        f:SetBackdrop(backdrop)

        -- f.texture = f:CreateTexture(nil,"ARTWORK",nil)
        -- f.texture:SetTexture(GetSpellTexture(106898))
        -- f.texture:SetWidth(16)
        -- f.texture:SetHeight(16)
        -- f.texture:SetPoint("CENTER",f,"CENTER",-65,0)

        f.txt = f:CreateFontString(nil,"HIGH",nil)
        f.txt:SetFont("Fonts\\FRIZQT__.TTF",10,'OUTLINE')
        f.txt:SetText("Alerts Anchor")
        f.txt:SetPoint("CENTER",0,0)

        f:SetFrameStrata("HIGH")
        f:SetMovable(true)
        f:SetScript("OnMouseUp",function(self) self:StopMovingOrSizing() Squid_StopSpamming = false end)
        f:SetScript("OnMouseDown",function(self) self:StartMoving() Squid_StopSpamming = true end)
        f:Hide()
    end

    if not BigAlertFrames_Anchor then
        BigAlertFrames_Anchor = CreateFrame("Frame", nil, self, "BackdropTemplate")

        local backdrop = {
        bgFile = "Interface/Tooltips/UI-Tooltip-Background",
        tileSize = 256,
        edgeFile = "Interface\\FriendsFrame\\UI-Toast-Border",
        tile = 1,
        edgeSize = 3,
        insets = {
            top = 0, --2
            right = 0, --2
            left = 0, --3
            bottom = 0, --3
            }
        }

        local f = BigAlertFrames_Anchor

        f:SetPoint("CENTER",0,200)

        f:SetHeight(12)
        f:SetWidth(150)
        f:SetBackdrop(backdrop)

        -- f.texture = f:CreateTexture(nil,"ARTWORK",nil)
        -- f.texture:SetTexture(GetSpellTexture(106898))
        -- f.texture:SetWidth(16)
        -- f.texture:SetHeight(16)
        -- f.texture:SetPoint("CENTER",f,"CENTER",-65,0)

        f.txt = f:CreateFontString(nil,"HIGH",nil)
        f.txt:SetFont("Fonts\\FRIZQT__.TTF",10,'OUTLINE')
        f.txt:SetText("Big Alerts Anchor")
        f.txt:SetPoint("CENTER",0,0)

        f:SetFrameStrata("HIGH")
        f:SetMovable(true)
        f:SetScript("OnMouseUp",function(self) self:StopMovingOrSizing() Squid_StopSpamming = false end)
        f:SetScript("OnMouseDown",function(self) self:StartMoving() Squid_StopSpamming = true end)
        f:Hide()
    end

    if #AlertFrames > 0 then

        table.sort(AlertFrames, function(x,y) return x.Start > y.Start or (x.Start == y.Start and x.index < y.index) end)

        for i=1,#AlertFrames do
            if AlertFrames[i] then
                AlertFrames[i].index = i
            end
            --delete invisible frames
            if AlertFrames[i] and AlertFrames[i].Alpha < 0 then
                AlertFrames[i]:Hide()
                table.remove(AlertFrames,i)
            end
        end

        -- local anchor,_,anchor2,x,y = AlertFrames_Anchor:GetPoint()
        if not Squid_StopSpamming then
            for i=1,#AlertFrames do
                --move new frames
                if i > 1 then
                    --scale this
                    local dist = 20
                    AlertFrames[i]:SetPoint("CENTER",AlertFrames_Anchor,"CENTER",0,i*dist)
                end

            end
        end

    end

    if #BigAlertFrames > 0 then

        table.sort(BigAlertFrames, function(x,y) return x.Start > y.Start or (x.Start == y.Start and x.index < y.index) end)

        for i=1,#BigAlertFrames do
            if BigAlertFrames[i] then
                BigAlertFrames[i].index = i
            end
            --delete invisible frames
            if BigAlertFrames[i] and BigAlertFrames[i].Alpha < 0 then
                BigAlertFrames[i]:Hide()
                table.remove(BigAlertFrames,i)
            end
        end

        -- local anchor,_,anchor2,x,y = BigAlertFrames_Anchor:GetPoint()
        for i=1,#BigAlertFrames do

            --move new frames
            if i > 1 then
                local dist = -25
                BigAlertFrames[i]:SetPoint("CENTER",BigAlertFrames_Anchor,"CENTER",0,i*dist)
            end

        end

        if #BigAlertFrames > 3 then
            for i=4,#BigAlertFrames do 
                BigAlertFrames[i]:SetAlpha(0)
            end 
        end

    end

    if not IsHackEnabled then return; end

    --binds.toc
    if not initialBinds then
        _createBindsFolder();
        _getTocLen()
        _getXmlLen()
        initialBinds=true;
    end
    if not wroteInitial then
        if not _bindTocExist() then
            _writeToc()
            updatedBinds=true;
        end
        if not _bindsXmlExists() then
            _writeXML()
            updatedBinds=true;
        end
        wroteInitial=true;
    end
    if tocLen and xmlLen and not checkedUpdate then
        if _bindTocExist() and string.len(ReadFile(GetWoWDirectory().."\\Interface\\AddOns\\binds\\binds.toc"))~=tocLen then
            _writeToc()
            updatedBinds=true;
        end
        if _bindsXmlExists() and string.len(ReadFile(GetWoWDirectory().."\\Interface\\AddOns\\binds\\bindings.xml"))~=xmlLen then
            _writeXML()
            updatedBinds=true;
        end
        checkedUpdate=true;
    end
    if updatedBinds or not _bindsAddonEnabled() then
        EnableAddOn("binds");
        _squidCountdown()
        C_Timer.After(5,function() RunMacroText("/reload"); end)
    end

    if not enableDraw then

        LibDraw.Sync(function()
        if kc.disabledraw then return; end

        drawTo=nil;
        if roster then
            for i=1,#roster do if not _unitIsUnit("player",roster[i].Unit) and UnitIsPlayer(roster[i].Unit) then
                drawTo=roster[i].Unit;
            end end
        end
        
        if UnitExists(ourHealer) and not _isHealer("player") and kc.drawToHealer and arena then
            hx,hy,hz=ObjectPosition(ourHealer);
            if _distance(ourHealer)<40 and _LoS(ourHealer) then
                LibDraw.SetColorRaw(0, 1, 0, 1)
                LibDraw.Line(px,py,pz,hx,hy,hz)
            elseif UnitExists(ourHealer) and (_distance(ourHealer)>40 or not _LoS(ourHealer)) then
                LibDraw.SetColorRaw(1, 0, 0, 1)
                LibDraw.Line(px,py,pz,hx,hy,hz)
            end
        end

        end)

        LibDraw.Enable(0.01);
        player_name=UnitName("player")
        enableDraw=true;
    end

    px,py,pz=ObjectPosition("player")

    if ObjectExists("target") then
        ttx,tty,ttz=ObjectPosition("target")
    end

    for i=1,#lockedOut do
        if lockedOut[i] and not ObjectExists(lockedOut[i].pointer) or UnitIsDeadOrGhost(lockedOut[i].pointer) then
            table.remove(lockedOut,i);
        end
    end

    for i=1,#lockedOut do if GetTime()>lockedOut[i].expire then table.remove(lockedOut,i); end end

    if not importSettings then
        if _settingsExist() and not importSettings and kc then
            wmbapi.RunScript("",ReadFile(SavedVars_Directory().."\\settings.txt"));
            --print(ReadFile(SavedVars_Directory()));
            --if kc==nil then kc={}; end
            importSettings=true;
        end
    end
    ----make setting
    --if IsHackEnabled and not madeSettingsDir then
    --    _makeSettingsDirectory();
    --end
    --create objects
    if IsHackEnabled and not UnitIsDeadOrGhost("player") then
        _o()
        _f()
    end
    --rotate
    if kcStart and not UnitIsDeadOrGhost("player") then
        _r()
    end
    if not kcStart and neatGreet==1 then
        ChatFrame1:AddMessage("|cffff6060Disabled");
        neatGreet=nil;
    end
    --loadgui
    if not settingsExists then
        if _settingsExist() then
            settingsExists=true;
        end
    end

    if not guiLoaded then
        if importSettings or not settingsExists then
            if not kc then kc={}; end
            kc.lightsmartyr=kc.lightsmartyr or 3;
            kc.alertscale=kc.alertscale or 1;
            kc.hsearchtime=kc.hsearchtime or 5;
            kc.hsCancel=kc.hsCancel or 0.4;
            kc.waterRank=kc.waterRank or 1;
            kc.foodRank=kc.foodRank or 1;
            kc.whoToHeal=kc.whoToHeal or {};
            kc.blacklistNames=kc.blacklistNames or {};
            kc.dispelWhitelist=kc.dispelWhitelist or {};
            kc.pendingFoodTradeRequests = {}
            kc.pendingManaTradeRequests = {}
            kc.loh = kc.loh or 0;
            kc.bubble = kc.bubble or 0;
            kc.hoj = kc.hoj or 0;
            kc.concussBlow = kc.concussBlow or 0;
            kc.consecration = kc.consecration or 0;
            kc.laststand = kc.laststand or 0;
            kc.shieldwall = kc.shieldwall or 0;
            kc.amountToReplenish = kc.amountToReplenish or 2;
            kc.recordDungeonEntrance=nil;
            kc.recordDungeonExit=nil;
            kc.recordDungeonRegroup=nil
            kc.slaveKillDist=kc.slaveKillDist or 25;
            kc.wandfinish=kc.wandfinish or 0;
            kc.drainsoul=kc.drainsoul or 20;
            kc.wallpadding=kc.wallpadding or 1.5;
            kc.closeclient=nil;
            kc.grind=nil;
            kc.quest=nil;
            kc.leaveForm=kc.leaveForm or 0;
            kc.recordNPCtoGrind=nil;
            kc.recordResToGrind=nil;
            kc.recordResPathCTM=nil;
            kc.recordNPCtoGrindCTM=nil;
            kc.recordGrindPath=nil;
            kc.recordGrindPathCTM=nil;
            kc.gui_coords = kc.gui_coords or {}
            kc.objects_to_draw = kc.objects_to_draw or {}
            kc.max_object_finder_dist = kc.max_object_finder_dist or 80
            kc.mountrange = 0;
            kc.overheal_percent = kc.overheal_percent or 30
            kc.autoheal_percent = kc.autoheal_percent or 65
            kc.ragedump = kc.ragedump or 80;
            kc.relogafter = kc.relogafter or 0;
            kc.slaveFollowDist= kc.slaveFollowDist or 10;
            kc.padding = kc.padding or 1.5;
            kc.tclap = kc.tclap or 0;
            kc.demo = kc.demo or 0;
            kc.sunders = kc.sunders or 0;
            kc.max_grind_dist=kc.max_grind_dist or 10
            kc.min_HP=kc.min_HP or 65;
            kc.min_MP=kc.min_MP or 65;
            kc.fastheal_percent=kc.fastheal_percent or 40;
            kc.kickdelay=kc.kickdelay or 35;
            kc.evocate=kc.evocate or 0;
            kc.hpPot=kc.hpPot or 0;
            kc.mpPot=kc.mpPot or 0;
            kc.soulshardcount = kc.soulshardcount or 10;
            kc.eviscount = kc.eviscount or 0;
            kc.rupturecount = kc.rupturecount or 0;
            kc.drainlife = kc.drainlife or 0;
            kc.funnel = kc.funnel or 0;
            kc.lifetap = kc.lifetap or 0;
            kc.pws = kc.pws or 20;
            kc.dpact = kc.dpact or 0;
            kc.sburn = kc.sburn or 0;
            kc.renew_percent = kc.renew_percent or 0;
            kc.shieldpercent = kc.shieldpercent or 0;
            kc.wogpercent = kc.wogpercent or 0;
            kc.eyepercent = kc.eyepercent or 0;
            kc.shieldpercent = kc.shieldpercent or 0;
            kc.min_HP=0;
            kc.min_MP=0;
            if not dontLoadUI then
                SendHTTPRequest5("https://gist.githubusercontent.com/kingcobrax/394eceab634f1221d29492247a713039/raw");
            end
            guiLoaded=GetTime();
        end
    end

    if allLoaded and not versgreeting then
        Squid_Alert("/kc","to open the GUI",nil,10);
        Squid_Alert("Set keybinds:","ESC > KEYBINDS > OTHER",nil,10);
        Squid_Alert("Welcome to King Cobra!","",nil,10);
        versgreeting=true;
    end
end

function _anyoneInCombat()
    if instanceType=="pvp" then
        if not UnitAffectingCombat("player") then return false; end
        if mainTarget and #mainTarget<=0 then return false; end
        if enemiesList and #enemiesList<=0 then return false; end
    end
    if mainTarget and #mainTarget<=0 and IsMounted("player") then return false; end
    if enemiesList and #enemiesList<=0 and IsMounted("player") then return false; end
    if roster then
        for i=1,#roster do if UnitAffectingCombat(roster[i].Unit) then
            return true;
        end end
    end
end

function _jumpUnstuck()

    if not lastJuggle or GetTime()-lastJuggle>=5 then

        --_moveBackwardFor(5);

        if IsHackEnabled then

            if not startX and not startY and not startZ and not movetimer then
                startX,startY,startZ=px,py,pz;
                if startX then
                    movetimer=GetTime();
                end
            end

            if (movetimer and GetTime()-movetimer>=0.5) and startX and startY and startZ then
                if lastMovement and GetTime()-lastMovement<=0.2 and _distBetweenPositions(px,py,pz,startX,startY,startZ)<=0.5 and not IsSwimming() then
                    rDismount()
                    JumpOrAscendStart();
                    AscendStop();
                end
                startX,startY,startZ=px,py,pz;
                movetimer=GetTime();
            end

        end

    end

end

function _initializeGrindTables()

    if kc.grind then kc.smartMove=true; end

    if kc.grind_profile=="--Smart Movement(BG)--" or kc.smartMove then
        if not kc.smartMove then kc.smartMove=true; end
        return;
    end

    if _gpProfileExists() and not kc.smartMove then
       wmbapi.RunScript("",ReadFile(GetHackDirectory().."\\kcProfiles\\gp_"..kc.grind_profile..".lua"));
    end 
    
    if _npcProfileExists() then
        wmbapi.RunScript("",ReadFile(GetHackDirectory().."\\kcProfiles\\ntg_"..kc.grind_profile..".lua"));
    end

    if _replenProfileExists() then
        wmbapi.RunScript("",ReadFile(GetHackDirectory().."\\kcProfiles\\replentg_"..kc.grind_profile..".lua"));
        replenposX=tonumber(replenposX);
        replenposY=tonumber(replenposY);
        replenposZ=tonumber(replenposZ);
    end  
    if _dungeonEntranceExists() then
        wmbapi.RunScript("",ReadFile(GetHackDirectory().."\\kcProfiles\\dentrance_"..kc.grind_profile..".lua"));
    end

    if _dungeonExitExists() then
        wmbapi.RunScript("",ReadFile(GetHackDirectory().."\\kcProfiles\\dexit_"..kc.grind_profile..".lua"));
    end 

    if _dungeonRegroupExists() then
        wmbapi.RunScript("",ReadFile(GetHackDirectory().."\\kcProfiles\\dregroup_"..kc.grind_profile..".lua"));
    end   


    if not gp then
        print("Did not load a grinding path");
    else
        print("Loaded grinding path");
    end

    if not ntg or not NPCposX then
        print("Did not load an NPC path");
    else
        print("Loaded NPC path");
    end

    -- if not rtg then
    --     print("Did not load a Resurrection path");
    -- else
    --     print("Loaded Resurrection path");
    -- end

    if not dentrance then
        print("Did not load Dungeon Entrance");
    else
        print("Loaded Dungeon Entrance");
    end  

    if not dexit then
        print("Did not load Dungeon Exit");
    else
        print("Loaded Dungeon Exit");
    end  

    if gp and #gp>=1 then
        gtnp={}
        stepCount=1;
        for i=_firstStep(gp),1,-1 do
            local node = {x=gp[i].x,y=gp[i].y,z=gp[i].z,step=stepCount}
            node.script = gp[i].script
            table.insert(gtnp, node)
            stepCount=stepCount+1;
        end
    end

    if rtg and gp then
        rrtg={};
        for i=1,#rtg do
            table.insert(rrtg,{x=rtg[i].x,y=rtg[i].y,z=rtg[i].z, script=rtg[i].script});
        end
        for i=1,#gp do
            table.insert(rrtg,{x=gp[i].x,y=gp[i].y,z=gp[i].z, script=gp[i].script});
        end
        for i=1,#rrtg do
            rrtg[i].step=i;
        end
    end

    if ntg and NPCposX then
        rntg=ntg;
        ntgEnd=ntg[#ntg];
        gtn={}
        for i=#ntg,1,-1 do
            table.insert(gtn,{x=ntg[i].x,y=ntg[i].y,z=ntg[i].z, script=ntg[i].script});
        end
        for i=1,#gtn do
            gtn[i].step=i;
        end
        table.sort(gtn,function(x,y) return x.step<y.step end);
    end

end

function _gpProfileExists()
    if IsHackEnabled then
        file1=GetDirectoryFiles(GetHackDirectory().."\\kcProfiles\\gp_"..kc.grind_profile..".lua");
        if file1[1]~=nil then
            return true;
        end
    end
    return false;
end

function _dungeonEntranceExists()
    if IsHackEnabled then
        file1=GetDirectoryFiles(GetHackDirectory().."\\kcProfiles\\dentrance_"..kc.grind_profile..".lua");
        if file1[1]~=nil then
            return true;
        end
    end
    return false;
end

function _dungeonRegroupExists()
    if IsHackEnabled then
        file1=GetDirectoryFiles(GetHackDirectory().."\\kcProfiles\\dregroup_"..kc.grind_profile..".lua");
        if file1[1]~=nil then
            return true;
        end
    end
    return false;
end

function _dungeonExitExists()
    if IsHackEnabled then
        file1=GetDirectoryFiles(GetHackDirectory().."\\kcProfiles\\dexit_"..kc.grind_profile..".lua");
        if file1[1]~=nil then
            return true;
        end
    end
    return false;
end


function _npcProfileExists()
    if IsHackEnabled then
        file1=GetDirectoryFiles(GetHackDirectory().."\\kcProfiles\\ntg_"..kc.grind_profile..".lua");
        if file1[1]~=nil then
            return true;
        end
    end
    return false;
end

function _replenProfileExists()
    if IsHackEnabled then
        file1=GetDirectoryFiles(GetHackDirectory().."\\kcProfiles\\replentg_"..kc.grind_profile..".lua");
        if file1[1]~=nil then
            return true;
        end
    end
    return false;
end

function _resProfileExists()
    if IsHackEnabled then
        file1=GetDirectoryFiles(GetHackDirectory().."\\kcProfiles\\rtg_"..kc.grind_profile..".lua");
        if file1[1]~=nil then
            return true;
        end
    end
    return false;
end

function _getTotalFreeSlots()
    if kc.dontloot then
        return math.huge;
    end
    local count = 0
    for i = 0, 4 do
        local freeslots, bagtype = GetContainerNumFreeSlots(i)
        if bagtype == 0 then
            count = count + freeslots
        end
    end
    return count
end


function _defaultPVPDest()
    return {x=px,y=py,z=pz};
end

function _getLowestDur()
    if kc.dontrepair then
        return 100;
    end
    lowest=nil;
    for i=1,20 do
        if GetInventoryItemDurability(i) and not lowest then
            lowest=(select(1,GetInventoryItemDurability(i))/select(2,GetInventoryItemDurability(i)))*100;
        end
        if GetInventoryItemDurability(i) and lowest and ((select(1,GetInventoryItemDurability(i))/select(2,GetInventoryItemDurability(i)))*100)<lowest then
            lowest=(select(1,GetInventoryItemDurability(i))/select(2,GetInventoryItemDurability(i)))*100;
        end
    end
    return lowest or 100;
end

function _moveToXYZ(x,y,z)
    if UnitIsDeadOrGhost("player") then return; end
    if wmbapi.GetCurrentMapInfo()==1803 and pz>=300 then
        StrafeRightStart()
        cancelStrafe=true;
        return;
    end
    if wmbapi.GetCurrentMapInfo()==1803 and pz<300 and cancelStrafe then
        StrafeRightStop()
        cancelStrafe=false;
    end
    if not dontMoveUntil or GetTime()-dontMoveUntil>=0 then
        if not _meInCombat() and not goingToDrink and not goingToEat then
            if dontMove or dontMoveOn then return; end
            if not lastMove or GetTime()-lastMove>=0 then
                if _distBetweenPositions(px,py,pz,x,y,z)>=2 then
                    if not didPath or GetTime()-didPath>=0.5 then
                        _findPath(x,y,z);
                        didPath=GetTime();
                    end
                    for i=1,#navStep do if _xyDiff(navStep[i].x,navStep[i].y,0)>=1.5 then
                        ox,oy,oz=navStep[i].x,navStep[i].y,navStep[i].z;
                        break;
                    end end
                    if ox then
                        _moveTo(ox,oy,oz,true);
                    else
                        _moveTo(x,y,z);
                    end
                    lastMove=GetTime();
                end
            end
        end
    end
end

function _reallyMoveToXYZ(x,y,z)
    if UnitIsDeadOrGhost("player") then return; end
    if wmbapi.GetCurrentMapInfo()==1803 and pz>=300 then
        StrafeRightStart()
        cancelStrafe=true;
        return;
    end
    if wmbapi.GetCurrentMapInfo()==1803 and pz<300 and cancelStrafe then
        StrafeRightStop()
        cancelStrafe=false;
    end
    if dontMove or dontMoveOn then return; end
    if not lastMove or GetTime()-lastMove>=0 then
        if _distBetweenPositions(px,py,pz,x,y,z)>=2 then
            if not didPath or GetTime()-didPath>=0.5 then
                _findPath(x,y,z);
                didPath=GetTime();
            end
            for i=1,#navStep do if _xyDiff(navStep[i].x,navStep[i].y,0)>=1.5 then
                ox,oy,oz=navStep[i].x,navStep[i].y,navStep[i].z;
                break;
            end end
            if ox then
                _moveTo(ox,oy,oz,true);
            else
                _moveTo(x,y,z);
            end
            lastMove=GetTime();
        end
    end
end

movingTo={}
function _moveTo(x,y,z)

    MoveTo(x,y,z)

end

function _isPathBlocked()

    local player_max_height_probe_offset = 2.2
    local player_med_height_probe_offset = 1.5
    local player_height_probe_offset = 1
    local player_x, player_y, player_z = ObjectPosition("player")
    local player_face_deg, _ = ObjectFacing("player");
    local reach = 1.5

    local pos_x_in_front_of_player = player_x + math.cos(player_face_deg) * reach
    local pos_y_in_front_of_player = player_y + math.sin(player_face_deg) * reach       
    local short_pos_x_in_front_of_player = player_x + math.cos(player_face_deg) * reach / 3
    local short_pos_y_in_front_of_player = player_y + math.sin(player_face_deg) * reach / 3

    

    local front_col = TraceLine(player_x, player_y, player_z + player_height_probe_offset, short_pos_x_in_front_of_player, short_pos_y_in_front_of_player, player_z + player_height_probe_offset, 0x100111) 
        or TraceLine(player_x, player_y, player_z + player_med_height_probe_offset, pos_x_in_front_of_player, pos_y_in_front_of_player, player_z + player_med_height_probe_offset, 0x100111)
        or TraceLine(player_x, player_y, player_z + player_max_height_probe_offset, pos_x_in_front_of_player, pos_y_in_front_of_player, player_z + player_max_height_probe_offset, 0x100111)
    if front_col then
        return true
    else        
        --CheckSideSteps()
        return false
    end
end 

local last_nav_success_path = nil
local cache_nav_success_until = GetTime() * 1000 - 1
local_nav_is_running = false;
localNavCheckRange = 3
local localnavpathindex = 0;

function _findPath(x,y,z)
    if _distBetweenPositions(px,py,pz,x,y,z)>1 and _xyDiff(x,y,z)>1 then
        if enableLocalNavFeature and not IsMounted() then
            navOutput=CalculatePath(GetMapId(),px,py,pz,x,y,z,true,IsSwimming("player"),2);
        end
        if not enableLocalNavFeature then
            navOutput=CalculatePath(GetMapId(),px,py,pz,x,y,z,true,IsSwimming("player"),2);
        end
        if IsMounted() then
            navOutput=CalculatePath(GetMapId(),px,py,pz,x,y,z,true,IsSwimming("player"),2);
        end

        navStep={}
        if navOutput then
            for i=1,#navOutput do
                table.insert(navStep,{x=navOutput[i][1],y=navOutput[i][2],z=navOutput[i][3]});
            end
        end
            
        if enableLocalNavFeature and not IsMounted() then
            if #navStep >= 2 then
                --CheckSideSteps()

                if _isPathBlocked() or last_nav_success_path then

                    if last_nav_success_path and ((GetTime() * 1000) < cache_nav_success_until) then
                        last_nav_success_path = nil
                        cache_nav_success_until = (GetTime() * 1000) + 1500
                    else        
                            if not local_nav_is_running then
                                navOutput=CalculatePath(GetMapId(),px,py,pz,x,y,z, false,IsSwimming("player") or not kc.nowater, kc.wallpadding);
                                navStep={}
                                if navOutput then
                                    for i=1,#navOutput do
                                        table.insert(navStep,{x=navOutput[i][1],y=navOutput[i][2],z=navOutput[i][3]});
                                    end
                                end
                                --print("running local nav: range " .. tonumber(localNavCheckRange) .. " max step: " .. #navStep)
                                
                                local navStepToCheck = math.min(localNavCheckRange, #navStep) -- start roughly 4 yards ahead along the navmesh path. should be far enough to clear the obstacle?! increase if failed    
                                last_nav_success_path = nil
                                local nextStep = navStep[navStepToCheck]
                                local_nav_is_running = true
                                localNavCheckRange = localNavCheckRange + 1

                                local player_x, player_y, player_z = ObjectPosition("player")                               
                                local player_face_deg, _ = ObjectFacing("player");
                                local pos_x_behind_of_player = player_x - math.cos(player_face_deg) * 4 -- we calculate a path from 1 step behind the player to counter the fact he is already in the bad spot.  
                                local pos_y_behind_of_player = player_y - math.sin(player_face_deg) * 4     

                                FIND_ASTAR_PATH_ASYNC(pos_x_behind_of_player, pos_y_behind_of_player, pz, nextStep.x, nextStep.y, nextStep.z, function(fixed_path)
                                    local_nav_is_running = false    
                                    
                                    if fixed_path == nil then
                                        if localNavCheckRange > 20 then
                                            localNavCheckRange = 3
                                            cache_nav_success_until = (GetTime() * 1000) + 5000
                                            cache_nav_success_path = nil
                                        else
                                            cache_nav_success_until =  GetTime() * 1000 + 250
                                            cache_nav_success_path = nil
                                        end
                                    else                                    
                                            local patchedNavStep = {}
                                            for index = 1, #fixed_path do
                                                local fx, fy, fz = unpack(fixed_path[index])
                                                local newNode = {x=fx, y=fy, z=fz}
                                                table.insert(patchedNavStep, newNode)
                                            end
                                            
                                            LOCALNAV.last_jump = GetTime() * 1000
                                            navStep = patchedNavStep;
                                            last_nav_success_path = patchedNavStep;
                                            cache_nav_success_until = (GetTime() * 1000) + 15000 -- cache successfull nav paths for fifteen seconds. usually long enough to get us around obstacles

                                            localNavCheckRange = 3
                                            LOCALNAV.start_unstuck = nil                                    

                                            localNavCheckRange = 3                  
                                            LOCALNAV.start_unstuck = nil                 -- restart local nav timer

                                    end
                                end)
                            end

                            return nil; -- we wont have a path till next frame. Just wait a bit and carry on the navmesh path. hopefully it wont fuck us..
                    end
                else
                    localNavCheckRange = 3  
                end
            end
        end

        for i=1,#navStep do
            navStep[i].step=i;
        end
    end
end

function _findAndTargetBestUnit()
    if (lastDeadTime and GetTime()-lastDeadTime<1.5) then return; end
    if not (grindspot and grindspot.x) then return; end
    closestenemy={}
    for i=1,#enemiesCache do
        u=enemiesCache[i];
        ux,uy,uz=ObjectPosition(u);
        if UnitCanAttack("player",u) and not UnitIsDeadOrGhost(u) and (UnitClassification(u)~="elite" or kc.farmelites or IsInInstance()) and _zDiff(u,"player")<=10 then
            if UnitCreatureType(u)~=L["Critter"] and _distBetweenPositions(grindspot.x,grindspot.y,grindspot.z,ux,uy,uz)<=kc.max_grind_dist and _distBetweenPositions(grindspot.x,grindspot.y,grindspot.z,px,py,pz)<=kc.max_grind_dist+40 then
                if not UnitIsDeadOrGhost("player") and (not kc.ignoreWhileMounted or not IsMounted("player")) and not (UnitExists("target") and UnitIsDeadOrGhost("target")) then
                    dist=_distance(enemiesCache[i]);
                    if questlist and questlist[1] and questlist[1][1]~="Grind" and GetQuestObjects(questlist[1][2]) then
                        for n=1,#GetQuestObjects(questlist[1][2]) do
                            if UnitReaction("player",enemiesCache[i])<4 or ObjectID(enemiesCache[i])==GetQuestObjects(questlist[1][2])[n] then
                                table.insert(closestenemy,{e=u,d=dist});
                            end
                        end
                    else
                        table.insert(closestenemy,{e=u,d=dist});
                    end
                end
            end
        end
    end

    table.sort(closestenemy,function(x,y) return x.d<y.d end);

    for i=1,#closestenemy do 
        if _LoS(closestenemy[i].e) or not kc.loscheck then
            --target only players
            if kc.bgbot and UnitIsPlayer(closestenemy[i].e) then
                rTargetUnit(closestenemy[i].e);
                return;
            end
        end
    end
end

function _canMount()
    if not UnitAffectingCombat("player") and (not lastCastTime or GetTime()-lastCastTime>=6) and (not lastTimeOnMount or GetTime()-lastTimeOnMount>=6) then
        return kc.mountItem or nil;
    end
end

function _mount()
    if not lastDeadTime or GetTime()-lastDeadTime>=1.5 then
        if not IsMounted() then
            if kc.mountItem then
                mountItem=kc.mountItem;
                skipMountParse=true;
            end

            if not _isMoving("player") and (not lastMountCast or GetTime()-lastMountCast>=6) and (not lastTimeOnMount or GetTime()-lastTimeOnMount>=6) then
                CastSpellByName(kc.mountItem);
                lastMountCast=GetTime();
            end
        
        end
    end
end

function _queuedForBG()
    for i=1,3 do
        if GetBattlefieldStatus(i) and select(2,GetBattlefieldStatus(i))==L["Random Battleground"] then
            return true;
        end
    end
end

function _queuedForEBG()
    for i=1,3 do
        if GetBattlefieldStatus(i) and select(2,GetBattlefieldStatus(i))==L["Random Epic Battleground"] then
            return true;
        end
    end
end

function _someoneNeedsHeal()
    healClasses={
    "SHAMAN",
    "PRIEST",
    "PALADIN",
    "DRUID",
    "MONK"
    }
    
    if players and kc.castheal then
        for i=1,#healClasses do if select(2,UnitClass("player"))==healClasses[i] then
            for n=1,#players do if _actualHp(players[n].Unit)<=kc.autoheal_percent then
                return true;
            end end
        end end
    end
end

function _resetGrind()
    if gp and #gp>=2 then
        _randomizeGP()
        runReverseGP=nil;
        runReverseRGP=nil;
        rgpPathStart=1;
        gpPathStart=1;
        grindspot={x=gp[1].x,y=gp[1].y,z=gp[1].z, script=gp[1].script};
    end
    if kc.smartMove then
        grindspot={x=px,y=py,z=pz}
    end
end

function _jiggle()
    StrafeRightStart()
    C_Timer.After(0.01,StrafeRightStop);
    C_Timer.After(0.02,StrafeLeftStart);
    C_Timer.After(0.03,StrafeLeftStop);
end

blacklist={}

function _movementHandler() 

    if wmbapi and GetCVar("AutoInteract")=="0" and kc.bgbot then
        SetCVar("AutoInteract",1);
    end

    if wmbapi and not kc.bgbot and GetCVar("AutoInteract")=="1" then
        SetCVar("AutoInteract",0);
    end

    if not IsHackEnabled then return; end 

    if kc.bgbot then kc.grind=true; end

    if IsHackEnabled then 
        if UnitIsFalling("player") then return; end
    end

    if not kc.bgbot then return; end

    if UnitDebuffID("player",26013) then return; end

    if _isMoving("player") then
        lastMovement=GetTime();
    end

    --if C_CurrencyInfo.GetCurrencyInfo(1792).quantity>=15000 and kc.bgbot and not IsInInstance() then
    --    if not lastAlert or GetTime()-lastAlert>=5 then
    --        Squid_Alert("Your honor is Capped.","Not Queueing BGs");
    --        lastAlert=GetTime()
    --        return;
    --    end
    --end


    if not UnitIsDeadOrGhost("player") then
        aliveTime=GetTime();
    end

    if iamhealing and UnitExists("target") then ClearTarget(); end
    if iamhealing and UnitExists("target") and _isPet("target") then ClearTarget(); end

    if not px then return; end

    --if IsHackEnabled then
    --    if not IsHackEnabled("Antistuck") then
    --        SetHackEnabled("Antistuck",true);
    --    end
    --    --if not IsHackEnabled("NavObstacles") then
    --    --    SetHackEnabled("NavObstacles",true);
    --    --end  
    --end

    kc.dontrepair=true;
    kc.dontloot=true;

    if not px then return; end

    onTheMove=false;

    if gp then
        for i=1,#gp-1 do
            drawLine(gp[i].x,gp[i].y,gp[i+1].x,gp[i+1].y,i,.2,.8,.4,.6);
        end
    end

    if eeNodes then
        for i=1,#eeNodes-1 do
            drawLine(eeNodes[i].x,eeNodes[i].y,eeNodes[i+1].x,eeNodes[i+1].y,i,1,1,0,1);
        end
    end

    if (UnitIsDeadOrGhost("player") or _anyoneInCombat()) and goingToDrink then
        goingToDrink=false;
    end

    if (UnitIsDeadOrGhost("player") or _anyoneInCombat()) and goingToEat then
        goingToEat=false;
    end

    if lastMountCast and GetTime()-lastMountCast<=0.3 then
        return;
    end

    if (kc.grind or kc.slave) and not kc.bgbot and not UnitIsDeadOrGhost("player") then
        if resID and UnitCastingInfo("player")==GetSpellInfo(resID) then
            resDelay=GetTime();
            resTarget=UnitSpellTarget("player");
        end

        if resID then
            for i=1,#roster do
                if UnitIsDeadOrGhost(roster[i].Unit) then
                corpseID=_findCorpse(ObjectName(roster[i].Unit));
                    if not resDelay or GetTime()-resDelay>=10 then
                        _Cast(resID,corpseID,true,true);
                    end
                end
            end
        end
    end

    --if (kc.grind or kc.slave) and not UnitIsDeadOrGhost("player") and not IsSwimming() and select(2,GetUnitSpeed("player"))<10 then
    --    if not _anyoneInCombat() and not leavingDungeon and not _meInCombat() and _actualMp("player")<=kc.min_MP and UnitClass("player")~=L["Warrior"] and UnitClass("player")~=L["Rogue"] and not UnitBuffName("player",L["Bear Form"]) and not UnitBuffName("player",L["Cat Form"]) and not UnitBuffName("player",L["Dire Bear Form"]) then
    --        if _findDrinks() then
    --            goingToDrink=true;
    --        end
    --        if _isMoving("player") then
    --            MoveForwardStart();
    --            MoveForwardStop();
    --        end
    --        if _findDrinks() and not UnitBuffName("player",L["Drink"]) then
    --            if not dontDrink then
    --                rUseItemByName(_findDrinks());
    --            end
    --        end
    --        if not _findDrinks() and kc.use_experimental_dungeon_features then
    --            if _shouldRequestMageWater() then
    --                success = C_ChatInfo.SendAddonMessage("mage_drinks", UnitName("player"), "party")
    --                if not success then
    --                    print("Requested Mage Water but not successfull in sending addon message?!")
    --                else
    --                    print("Sent mage water request")
    --                end
    --            end
    --        end
    --    end

    --    if not _anyoneInCombat() and not leavingDungeon and not _meInCombat() and _actualHp("player")<=kc.min_HP then
    --        if _findFood() then
    --            goingToEat=true;
    --        end
    --        if _isMoving("player") then
    --            MoveForwardStart();
    --            MoveForwardStop();
    --        end
    --        if _findFood() and not UnitBuffName("player",L["Food"]) then
    --            if not dontEat then
    --                rUseItemByName(_findFood());
    --            end
    --        end
    --        if not _findFood() and kc.use_experimental_dungeon_features then
    --            if _shouldRequestMageFood() then
    --                success = C_ChatInfo.SendAddonMessage("mage_food", UnitName("player"), "party")
    --                if not success then
    --                    print("Requested Mage Food but not successfull in sending addon message?!")
    --                end
    --            end
    --        end
    --    end

    --    if kc.use_experimental_dungeon_features then
    --        if not _findDrinks() then
    --            if _shouldRequestMageWater() then
    --                success = C_ChatInfo.SendAddonMessage("mage_drinks", UnitName("player"), "party")
    --                if not success then
    --                    print("Requested Mage Water but not successfull in sending addon message?!")
    --                end
    --            end
    --        end

    --        if not _findFood() then
    --            if _shouldRequestMageFood() then
    --                success = C_ChatInfo.SendAddonMessage("mage_food", UnitName("player"), "party")
    --                if not success then
    --                    print("Requested Mage Food but not successfull in sending addon message?!")
    --                end
    --            end
    --        end
    --    end

    --    if goingToDrink then
    --        if _findDrinks() and not UnitBuffName("player",L["Drink"]) then
    --            rUseItemByName(_findDrinks());
    --        end
    --    end

    --    if goingToEat then
    --        if _findFood() and not UnitBuffName("player",L["Food"]) then
    --            rUseItemByName(_findFood());
    --        end
    --    end

    --    if goingToEat and (_actualHp("player")>=90 or _anyoneInCombat()) then
    --        goingToEat=false;
    --    end

    --    if goingToDrink and (_actualMp("player")>=90 or _anyoneInCombat()) then
    --        goingToDrink=false;
    --    end

    --    if needStand and ((not goingToEat and not goingToDrink) or (not UnitBuffName("player",L["Food"]) and not UnitBuffName("player",L["Drink"]))) and not _isMoving("player") then
    --        rStand();
    --    end

    --end

    --if (goingToDrink or goingToEat) and not _meInCombat() then return true; end

    dontMoveOn=nil;
    if not kc.bgbot then
        if roster and kc.grind and #roster>=2 then
            for i=1,#roster do
                if ObjectPointer(roster[i].Unit)~=ObjectPointer("player") and UnitIsPlayer(roster[i].Unit) and UnitIsVisible(roster[i].Unit) and (_distance(roster[i].Unit)>=35 or (IsInInstance() and _distance(roster[i].Unit)>=12) or UnitBuffName(roster[i].Unit,L["Drink"]) or UnitBuffName(roster[i].Unit,L["Food"])) and not UnitIsDeadOrGhost("player") then
                    if _isMoving("player") then
                        MoveForwardStart();
                        MoveForwardStop();
                    end
                    dontMoveOn=true;
                end
                if UnitIsDeadOrGhost(roster[i].Unit) and not UnitIsDeadOrGhost("player") then
                    if _isMoving("player") then
                        MoveForwardStart();
                        MoveForwardStop();
                    end
                    dontMoveOn=true;
                end
            end
        end
    end

    if UnitBuffName("player",L["Drink"]) or UnitBuffName("player",L["Food"]) then
        needStand=true;
    end

    if not _isMoving("player") and kc.randomJump and kc.randomJump>=1 then
        lastRandomJump=GetTime();
        pickRandomJump=math.random(1,kc.randomJump);
    end

    if _isMoving("player") and kc.randomJump and kc.randomJump>=1 then
        if not pickRandomJump then pickRandomJump=math.random(1,kc.randomJump); end
        if not lastRandomJump then lastRandomJump=GetTime(); end
        if GetTime()-lastRandomJump>=pickRandomJump then
            if not IsSwimming("player") then
                JumpOrAscendStart();
                AscendStop();
                lastRandomJump=GetTime();
                pickRandomJump=math.random(1,kc.randomJump);
            end
        end
    end

    if kc.smartMove and kc.grind_profile~="--Smart Movement(BG)--" then
        kc.grind_profile="--Smart Movement(BG)--";
    end

    if not IsHackEnabled then return; end

    if (kc.bgbot and GetBattlefieldStatus(1)=="queued") or GetBattlefieldStatus(1)=="none" then
        joinBgTime1=GetTime();
    end

    if (kc.bgbot and GetBattlefieldStatus(2)=="queued") or GetBattlefieldStatus(2)=="none" then
        joinBgTime2=GetTime();
    end

    if (kc.bgbot and GetBattlefieldStatus(3)=="queued") or GetBattlefieldStatus(3)=="none" then
        joinBgTime3=GetTime();
    end

    --pvpQueueAccept
    if GetBattlefieldStatus(1)~="confirm" and GetBattlefieldStatus(2)~="confirm" and GetBattlefieldStatus(3)~="confirm" then
        jiggle=false;
    end

    if kc.bgbot and not IsInInstance() then
        if GetBattlefieldStatus(1)=="confirm" and GetTime()-joinBgTime1>=19.5 and not jiggle then
            _jiggle()
            jiggle=true;
        end
        if GetBattlefieldStatus(1)=="confirm" and GetTime()-joinBgTime1>=20 then
            AcceptBattlefieldPort(1,true)
        end
    end

    if kc.bgbot and not IsInInstance() then
        if GetBattlefieldStatus(1)=="confirm" and GetTime()-joinBgTime1>=19.5 and not jiggle then
            _jiggle()
            jiggle=true;
        end
        if GetBattlefieldStatus(2)=="confirm" and GetTime()-joinBgTime2>=20 then
            AcceptBattlefieldPort(2,true)
        end
    end

    if kc.bgbot and not IsInInstance() then
        if GetBattlefieldStatus(1)=="confirm" and GetTime()-joinBgTime1>=19.5 and not jiggle then
            _jiggle()
            jiggle=true;
        end
        if GetBattlefieldStatus(3)=="confirm" and GetTime()-joinBgTime3>=20 then
            AcceptBattlefieldPort(3,true)
        end
    end

    --faciing for casters
    if (kc.grind or kc.slave) and UnitCastingInfo("player") and UnitSpellTarget("player") and UnitCanAttack("player",UnitSpellTarget("player")) and not _amIfacing(UnitSpellTarget("player")) then
        if not _amIfacing(UnitSpellTarget("player")) then
            if _isMoving("player") then
                MoveForwardStart();
                MoveForwardStop();
            end
            rFaceDirection(UnitSpellTarget("player"),true);
        end
    end

    if grindspot and grindspot.x then
        if GetDistanceBetweenPositions(px,py,pz,grindspot.x,grindspot.y,grindspot.z)>=4500 then
            _resetGrind();
        end
    end

    if UnitChannelInfo("player") or UnitCastingInfo("player") then return; end

    if UnitIsDeadOrGhost("player") and (kc.grind or kc.slave) then
        if aliveTime and GetTime()-aliveTime>=5 then
            RepopMe();
            C_Timer.After(1,function() AcceptResurrect() end);
            aliveTime=GetTime();
        end
    end

    if _meInCombat() then lastCombat=GetTime(); end

    if UnitIsGhost("player") and kc.grind then
        _resetGPtoClosest()
    end

    if kc.disableUnstuck and enableLocalNavFeature then
        enableLocalNavFeature=false;
    end

    if not kc.disableUnstuck and not enableLocalNavFeature then
        enableLocalNavFeature=true;
    end

    if kcStart and UnitCastingInfo("player") and UnitSpellTarget("player") and UnitCanAttack("player",UnitSpellTarget("player")) and ( _im(UnitSpellTarget("player")) or _ia(UnitSpellTarget("player"))) then
        SpellStopCasting();
    end

    if IsMounted() then
        lastTimeOnMount=GetTime();
    end

    if UnitCastingInfo("player") then return; end

    if DISABLE_ASTAR_RENDER==true and kc.drawUnstuck then
        DISABLE_ASTAR_RENDER=false;
    end

    if DISABLE_ASTAR_RENDER==false and not kc.drawUnstuck then
        DISABLE_ASTAR_RENDER=true;
    end

    if IsHackEnabled and not ewtLoadTime then
        ewtLoadTime=GetTime();      
    end

    if IsHackEnabled and kc.relogafter and ewtLoadTime and kc.relogafter>0 then
        relogSeconds=3600*kc.relogafter
        if GetTime()-ewtLoadTime>=relogSeconds then
            rRunMacroText(".dc");
        end
    end

    if closeStart and kc.closeclient then
        if GetTime()-closeStart>=kc.closeclient then
            UnloadEWT();
        end
    end

    if mainTarget then
        for i=1,#mainTarget do if _actualHp(mainTarget[i].pointer)<=0 then
            lastDeadTime=GetTime();
        end end
    end

    if roster and kc.master and not UnitIsDeadOrGhost("player") then
        for i=1,#roster do if UnitIsPlayer(roster[i].Unit) and not UnitIsVisible(roster[i].Unit) and not UnitIsDeadOrGhost(roster[i].Unit) then
            if not lastBroadcast or GetTime()-lastBroadcast>=2 then
                _broadcastLocation();
                lastBroadcast=GetTime();
            end
        end end
    end

    if kc.slave then
        if UnitExists("target") and _anyoneInCombat() and not _amIfacing("target") then
            if not lastSlaveFace or GetTime()-lastSlaveFace>=2 then
                if not _amIfacing("target") then
                    if _isMoving("player") then
                        MoveForwardStart();
                        MoveForwardStop();
                    end
                    rFaceDirection("target",true);
                end
                lastSlaveFace=GetTime();
            end
        end
    end

    dontEat,dontDrink=false,false
    if UnitBuffName("player",L["Drink"]) and _actualMp("player")>=90 then
        if kc.grind or kc.slave then
            rRunMacroText("/cancelaura "..L["Drink"]);
        end
        dontDrink=true;
    end

    if UnitBuffName("player",L["Food"]) and _actualHp("player")>=90 then
        if kc.grind or kc.slave then
            rRunMacroText("/cancelaura "..L["Food"]);
        end
        dontEat=true;
    end

    if IsHackEnabled and _movementHandler and not startTime then startTime=GetTime(); end

    if not kc then return; end
    
    --LOCALNAVRUNNER
    if enableLocalNavFeature and not IsSwimming("player") and last_nav_success_path and #last_nav_success_path > 1 then

            if not LOCALNAV.last_move then
                LOCALNAV.last_move = GetTime() * 1000
            end

            if not LOCALNAV.start_unstuck then
                LOCALNAV.start_unstuck = GetTime() * 1000
            end

            if (GetTime() * 1000) - LOCALNAV.start_unstuck > 5000 then
                print("running local nav path for to long. Resetting")
                last_nav_success_path = nil
                LOCALNAV.start_unstuck = nil
                return
            end

            if (GetTime() * 1000) - LOCALNAV.last_jump > LOCALNAV.jump_time then
                MoveForwardStop()
                MoveBackwardStart()
                MoveBackwardStop((GetTime() * 1000) + 250)
                JumpOrAscendStart()
                AscendStop()
                LOCALNAV.last_jump = GetTime() * 1000
                return
            end

            local player_x, player_y, player_z = ObjectPosition("player")

            if (GetTime() * 1000) - LOCALNAV.last_move > 0.5 then
                _moveTo(last_nav_success_path[1].x, last_nav_success_path[1].y, last_nav_success_path[1].z,true)
            end

            if _distBetweenPositions(player_x, player_y, player_z, last_nav_success_path[1].x, last_nav_success_path[1].y, last_nav_success_path[1].z) < 1.1 then
                table.remove(last_nav_success_path, 1)
                LOCALNAV.last_move = -1000 + (GetTime() * 1000)

                if #last_nav_success_path == 0  then
                    print("completed local nav path")
                    LOCALNAV.start_unstuck = nil
                    last_nav_success_path = nil
                    cache_nav_success_until = GetTime() * 1000;
                    navStep= {}
                    
                    local closest_index = 1;
                    local closest_distance = 9999

                    for i=1, #navStep do
                        local distance = _distBetweenPositions(player_x, player_y, player_z, last_nav_success_path[1].x, last_nav_success_path[1].y, last_nav_success_path[1].z) 
                        if distance < closest_distance then
                            closest_distance = distance
                            closest_index = i
                        end
                    end

                    for i=1, closest_index do
                        table.remove(navStep, 1)
                    end
                end
            end

            return;
    end

    if kc.bgbot and IsInInstance() then
        if _someoneNeedsHeal() and _isMoving("player") and _anyoneInCombat() then
            rDismount()
        end
        if _someoneNeedsHeal() then return; end
    end

    if UnitIsDeadOrGhost("player") and UnitExists("target") then
        rClearTarget();
    end

    if kc.slave or kc.grind or mousex then
        _jumpUnstuck();
    end

    if kc.slave and kc.grind_profile and not initProfiles then
        _initializeGrindTables();
        initProfiles=true;
    end

    if kc.slave and initProfiles then
        gp,ntg,dexit,dregroup,rtg=nil,nil,nil,nil,nil;
    end

    if (kc.bgbot or kc.grind) and not kcStart then
        kcStart=true;
    end

    if kc.bgbot and IsInInstance() and UnitExists("target") and not UnitCanAttack("player","target") then
        rClearTarget();
    end

    if UnitIsDeadOrGhost("player") and kc.bgbot and _isMoving("player") then
        MoveForwardStart();
        MoveForwardStop();
    end

    if UnitIsDeadOrGhost("player") and UnitExists("target") then
        rClearTarget();
    end

    if UnitIsGhost("player") and kc.bgbot then return; end

    if not UnitDebuffName("player","Deserter") then

        if kc.bgbot and not IsInInstance() then
            if needToExit then needToExit=nil; end
            bgStarted=nil;
            bgStartTime=GetTime();
            if kc.battlemaster and GetBattlefieldTimeWaited(1)==0 and players and GetBattlefieldStatus(1)~="confirm" then
                for i=1,#allObjects do if UnitName(allObjects[i])==kc.battlemaster then
                    rTargetUnit(allObjects[i]);
                    rObjectInteract(allObjects[i]);
                    SelectGossipOption(1)
                    if players and #players<=1 then
                        JoinBattlefield(0,false)
                    else
                        JoinBattlefield(0,true);
                    end
                end end
            end
        end

        if kc.bgbot and kc.randobg and not IsInInstance() and not _queuedForBG() then
            JoinBattlefield(32)
        end

        if kc.bgbot and kc.epicbg and not IsInInstance() and not _queuedForEBG() then
            JoinBattlefield(901)
        end
    end

    if kc.bgbot and GetBattlefieldWinner() and not leaveTimer then
        C_Timer.After(5,function(...) LeaveBattlefield() leaveTimer=false; end)
        leaveTimer=true;
    end

    if roster and kc.bgbot and not bgStarted and IsInInstance() then
        for i=1,#roster do if UnitIsVisible(roster[i].Unit) then
            if GetBattlefieldInstanceRunTime(1)>=125000 then
                bgStarted=true;
            end
        end end
    end

    if kc.bgbot and not bgStarted then return; end

    if kc.bgbot and not IsInInstance() then
        if kc.avbattlemaster and _queuedForAV() then return; end
        if kc.abbattlemaster and _queuedForAB() then return; end
        if kc.wsgbattlemaster and _queuedForWSG() then return; end
    end

    gonnaLoot=nil;

    if not UnitIsDeadOrGhost("player") then
        retrieveTime=GetTime();
    end

    if UnitIsDeadOrGhost("player") and not setRetrieveTime then
        retrieveTime=GetTime();
        setRetrieveTime=true;
    end

    if kc.slave and masterUnit and masterTarget and not UnitCanAttack("player",masterTarget) and not UnitPlayerControlled(masterTarget) then
        rObjectInteract(masterTarget);
        if GetMerchantNumItems()>=1 and kc.sell then
            _Sell();
        end
        if CanMerchantRepair() then
            RepairAllItems();
        end
    end

    if kc.grind and IsHackEnabled then
        if not initgrind and ((not rtg or not ntg or not NPCposX) or kc.quest) then
            _initializeGrindTables()
            initgrind=1;
        end
    end

    if (needToHerb or needToMine) and not _meInCombat() and UnitExists("target") then
        rClearTarget();
    end

    if UnitExists("target") and UnitIsDeadOrGhost("target") and (kc.dontloot or _meInCombat()) then
        rClearTarget();
    end

    if UnitIsDeadOrGhost("player")==false then
        if kc.grind and (not UnitExists("target") or UnitIsDeadOrGhost("target")) and mainTarget and mainTarget[1] then
            rTargetUnit(mainTarget[1].pointer);
        end
    end

    if not failedMount or GetTime()-failedMount>=5 then
        if not IsSwimming() and IsOutdoors() and not UnitIsDeadOrGhost("player") and (not UnitExists("target") or (UnitExists("target") and _distance("target")>40)) then
            
            if not lastInteract or GetTime()-lastInteract>=3 then

                if kc.slave and masterUnit and select(2,GetUnitSpeed(masterUnit))>=10 then
                    if _canMount() and not IsMounted() then
                        _mount();
                        lastMount=GetTime();
                    end
                end

                if (kc.grind or mousex) and kc.mountItem and navStep and navStep[1] then
                    if _distBetweenPositions(navStep[1].x,navStep[1].y,navStep[1].z,navStep[#navStep].x,navStep[#navStep].y,navStep[#navStep].z)>=kc.mountrange then
                        if _canMount() and not IsMounted() then
                            if _isMoving("player") then
                                MoveForwardStart();
                                MoveForwardStop();
                            end
                            _mount();
                            lastMount=GetTime();
                        end
                    end
                end

                if lastMount and GetTime()-lastMount<=2 and not UnitAffectingCombat("player") then return; end
              
            end
        end
    end

    if UnitIsGhost("player") and not resTime then resTime=GetTime(); end

    if seriousUnstuck and not movedBack and not _isMoving("player") then
        MoveBackwardStart();
        moveBackTime=GetTime();
    end

    if moveBackTime and GetTime()-moveBackTime>=1 then
        MoveBackwardStop();
        movedBack=true;
    end

    if seriousUnstuck and movedBack and not movedRight and not _isMoving("player") then
        StrafeRightStart();
        movedRightTime=GetTime();
    end

    if movedRightTime and GetTime()-movedRightTime>=1 then
        StrafeRightStop();
        movedRight=true;
    end

    if movedBack and movedRight then
        movedBack=nil;
        movedRight=nil;
        movedRightTime=nil;
        moveBackTime=nil;
        seriousUnstuck=nil;
    end

    if seriousUnstuck then return; end

    if NPCposX and type(NPCposX)=="string" then
        NPCposX=tonumber(NPCposX);
        NPCposY=tonumber(NPCposY);
        NPCposZ=tonumber(NPCposZ);
    end

    if _isMoving("player") then
        lastMoving=GetTime();
    end

    if (not lastMoving or GetTime()-lastMoving>=0.5) then
        smovetimer=nil;
        movetimer=nil;
        startX,startY,startZ=nil,nil,nil;
        sstartX,sstartY,sstartZ=nil,nil,nil;
    end

    if (kc.grind or kc.slave) and not _meInCombat() and not seriousUnstuck then

        if not startX and not startY and not startZ and not movetimer then
            startX,startY,startZ=px,py,pz;
            if startX then
                movetimer=GetTime();
            end
        end

        if not sstartX and not sstartY and not sstartZ and not smovetimer then
            sstartX,sstartY,sstartZ=px,py,pz;
            if sstartX then
                smovetimer=GetTime();
            end
        end

        if (movetimer and GetTime()-movetimer>=0.5) and startX and startY and startZ then
            if lastMovement and GetTime()-lastMovement<=0.2 and _distBetweenPositions(px,py,pz,startX,startY,startZ)<=0.5 and not IsSwimming() then
                JumpOrAscendStart();
                AscendStop();
            end
            startX,startY,startZ=px,py,pz;
            movetimer=GetTime();
        end

        if (smovetimer and GetTime()-smovetimer>=3) and sstartX and sstartY and sstartZ then
            if lastMovement and GetTime()-lastMovement<=0.2 and _distBetweenPositions(px,py,pz,sstartX,sstartY,sstartZ)<=0.5 and not IsSwimming() then
                MoveForwardStart();
                MoveForwardStop();
                if not kc.bgbot then
                    seriousUnstuck=true;
                end
            end
            sstartX,sstartY,sstartZ=px,py,pz;
            smovetimer=GetTime();
        end
    end

    for i=1,#blacklist do
        if _isMoving(blacklist[i]) then
            table.remove(blacklist,i);
        end
    end

    if kc.grind and UnitExists("target") and not UnitIsDeadOrGhost("target") and UnitCanAttack("player","target") then
        if not _valid("target") then
            rClearTarget();
        end
    end

    if mousez and mousez~=pz then mousez=pz; end

    if mousex and not _anyoneInCombat() then
        if _distBetweenPositions(px,py,pz,mousex,mousey,mousez)>=2 then
            _moveToXYZ(mousex,mousey,mousez);
        end
    end

    if mousex and not _anyoneInCombat() then
        if _distBetweenPositions(px,py,pz,mousex,mousey,mousez)<=2 then
            mousex,mousey,mousez=nil,nil,nil;
        end
    end

    if _isMoving("player") and not startedMoving then
        startedMoving=GetTime();
    end

    if not _isMoving("player") then
        startedMoving=nil;
    end

    if dontMoveTime and GetTime()-dontMoveTime>=3 then dontMove=nil; end

    if px and py and pz then
        if navStep and navStep[1] and _xyDiff(navStep[1].x,navStep[1].y,0)<=1.5 then
            table.remove(navStep,1);
        end
    end

    if kc.grind and grindDist and UnitExists("target") and _distance("player","target")<=grindDist-3 and _valid("target") and _isMoving("player") and not IsSwimming() and _LoS("target") then
        MoveForwardStart();
        MoveForwardStop();
    end

    if nPath and not completePath then
        if nPath then
            --JumpOrAscendStart();
            if not npathStart then
                npathStart=_firstStep(nPath);
            end
            if npathStart and _distBetweenPositions(px,py,pz,nPath[npathStart].x,nPath[npathStart].y,nPath[npathStart].z)>3 then
                _moveToXYZ(nPath[npathStart].x,nPath[npathStart].y,nPath[npathStart].z);
            elseif npathStart<#nPath then
                npathStart=npathStart+1;
            elseif npathStart==#nPath then
                nPath=nil;
            end
        end
    end

    if IsHackEnabled and UnitIsDeadOrGhost("player") and (not gx or gx==0) then
        gx,gy,gz=GetCorpsePosition();
        ranCorpse=nil;
    end

    if not UnitIsDeadOrGhost("player") then
        gx,gy,gz=nil,nil,nil;
    end

    if not IsHackEnabled and kc.grind then
        kc.grind=not kc.grind;
        gp=nil;
        ntg=nil;
        rtg=nil;
    end

    if rrtg and completePath==rrtg and gx and gy and gz and _firstStep(rrtg)==_firstStep2(gx,gy,gz,rrtg) then
        completePath=nil;
        ranCorpse=true;
    end

    if UnitIsDeadOrGhost("player") and completePath and completePath~=rrtg then
        completePath=nil;
    end

    if IsHackEnabled then
        if kc.slave and IsInInstance() and not IsHackEnabled("multijump") then
            SetHackEnabled("multijump");
        end

        if not IsInInstance() and kc.slave then
            SetHackEnabled("multijump",false);
        end

    end

    if needToSkin and UnitExists("target") and not _meInCombat() then
        rClearTarget();
    end

    kc.relog_email=kc.relog_email or "";
    kc.relog_acctname=kc.relog_acctname or "";
    kc.relog_realmname=kc.relog_realmname or "";


    if IsHackEnabled and not setRelogPassword and kc.relog and kc.relog_password then
        rRunMacroText(".login "..kc.relog_password.." "..kc.relog_email.." "..kc.relog_acctname.." "..kc.relog_realmname);
        setRelogPassword=true;
    end

    if kc.grind and UnitIsDeadOrGhost("player")==false then
        if UnitExists("target") and not UnitAffectingCombat("target") and _meInCombat() then
            for i=1,#mainTarget do if UnitAffectingCombat(mainTarget[i].pointer) then
                rTargetUnit(mainTarget[i].pointer);
            end end
        end
    end

    if IsHackEnabled and not greeted then
        -- print("|cFFf54242********************[kc]********************")
        -- print("|cFF4bf542If you didn't join telegram yet please do so at ")
        -- print("|cFF42f5echttps://t.me/kcBotProject")
        -- print("|cFFf54242********************[kc]********************")
        greeted=true;
    end

    if UnitIsDeadOrGhost("player") and gtn and completePath==gtn then
        completePath=nil;
    end

    if UnitIsDeadOrGhost("player") and rntg and completePath==rntg then
        completePath=nil;
    end

    if UnitCastingInfo("player") then
        castDelay=GetTime();
    end

    if (UnitClass("player")==L["Warlock"] or UnitClass("player")==L["Hunter"]) then
        if kc.grind and not UnitIsDeadOrGhost("player") then
            if not UnitExists("pet") and kc.autosummon and not _meInCombat() and not IsMounted("player") then
                if _isMoving("player") then
                    MoveForwardStart();
                    MoveForwardStop();
                end
            end
            if not UnitExists("pet") and kc.autosummon and not _meInCombat() and not IsMounted("player") then return; end
        end
    end


    if not castDelay or GetTime()-castDelay>=0.5 then


        if hardPath then
            if hardPathTime and GetTime()-hardPathTime>=5 then
                hardPath=nil;
            end
        end

        if hardPath and not completePath then
            if hardPath then

                if not pathStart then
                    pathStart=_firstStep(hardPath);
                end
                if _distBetweenPositions(px,py,pz,hardPath[pathStart].x,hardPath[pathStart].y,hardPath[pathStart].z)>3 then
                    _moveToXYZ(hardPath[pathStart].x,hardPath[pathStart].y,hardPath[pathStart].z);
                elseif pathStart<#hardPath then
                    pathStart=pathStart+1;
                elseif pathStart==#hardPath then
                    lastPath=hardPath;
                    hardPath=nil;
                end
            end
        end

        if not hardPath then
            if kc.grind and IsHackEnabled then

                -- if UnitExists("target") and _isPlayer("target") or _isPet("target") or UnitIsOtherPlayersPet("target") then
                --     rClearTarget();
                -- end

                --fix facing problem
                if UnitExists("target") and _meInCombat() then
                    if not lastWarriorFace or GetTime()-lastWarriorFace>=2 then
                        if grindspot and grindspot.x then
                            if _distBetweenPositions(px,py,pz,grindspot.x,grindspot.y,grindspot.z)<=5 or not _meInCombat() or not kc.pullback then
                                if not _amIfacing("target") then
                                    if _isMoving("player") then
                                        MoveForwardStart();
                                        MoveForwardStop();
                                    end
                                    rFaceDirection("target",true);
                                end
                                lastWarriorFace=GetTime();
                            end
                        end
                    end
                end

                if UnitExists("target") and not _amIfacing("target") and not _isMoving("player") and not UnitCastingInfo("player") then
                    if grindspot and grindspot.x and _distBetweenPositions(px,py,pz,grindspot.x,grindspot.y,grindspot.z)<=5 or not _meInCombat() or not kc.pullback then
                        if not _amIfacing("target") then
                            if _isMoving("player") then
                                MoveForwardStart();
                                MoveForwardStop();
                            end
                            rFaceDirection("target",true);
                        end
                    end
                end

                if (UnitBuffName("player",L["Drink"]) or UnitBuffName("player",L["Food"])) and _meInCombat() then
                    rStand();
                end
            end

            if not randomJump or GetTime()-randomJump>=2 then
                randomJump=GetTime();
                randomJumpN=math.random(1,100);
            end

            if ctmMultibox and _distBetweenPositions(px,py,pz,ctmMultibox.x,ctmMultibox.y,ctmMultibox.z)>=5 then
                _moveToXYZ(ctmMultibox.x,ctmMultibox.y,ctmMultibox.z);
            end

            if ctmMultibox and _distBetweenPositions(px,py,pz,ctmMultibox.x,ctmMultibox.y,ctmMultibox.z)<5 then
                ctmMultibox=nil;
            end

            if IsHackEnabled then

                if not IsMounted() then
                    if UnitIsDeadOrGhost("player")==false and _meInCombat() and not UnitExists("target") then
                        if mainTarget then
                            for i=1,#mainTarget do if _valid(mainTarget[i].pointer) then
                                rTargetUnit(mainTarget[i].pointer);
                            end end
                        end
                    end
                end

                if UnitIsDeadOrGhost("player") and (kc.grind or kc.slave) then
                    if aliveTime and GetTime()-aliveTime>=5 then
                        RepopMe();
                        aliveTime=GetTime();
                    end
                    if retrieveTime and (GetTime()-retrieveTime>=10) then
                        RetrieveCorpse();
                        retrieveTime=GetTime();
                    end
                end

                --Resurrection--
                if kc.slave and UnitIsDeadOrGhost("player") and not dentrance then
                    if UnitIsDead("player") and not UnitIsGhost("player") then
                        ranCorpse=nil;
                        if aliveTime and GetTime()-aliveTime>=5 then
                            RepopMe();
                            aliveTime=GetTime();
                        end
                        resTime=GetTime();
                    end

                    if UnitIsGhost("player") and gx and _distBetweenPositions(px,py,pz,gx,gy,gz)>20 then
                        if _distBetweenPositions(px,py,pz,gx,gy,gz)>25 then
                            if not kc.bgbot and not kc.portRezy then
                                _moveToXYZ(gx,gy,gz)
                            end
                        end
                    end

                    if UnitIsGhost("player") and gx and _distBetweenPositions(px,py,pz,gx,gy,gz)<=20 then
                        if _isMoving("player") then MoveForwardStart(); MoveForwardStop(); end
                        if retrieveTime and (GetTime()-retrieveTime>=10) then
                            RetrieveCorpse();
                        end
                        testRes=nil;
                    end

                end

                if (kc.autoloot and kc.slave) and not kc.grind and _getTotalFreeSlots()<=3 and slaveLooting==true then
                    slaveLooting=nil;
                end

                if (kc.autoloot and kc.slave) and not kc.grind and _getTotalFreeSlots()>3 then
                    
                    slaveLooting=nil;

                    if _getTotalFreeSlots()>3 then
                        if UnitIsDeadOrGhost("player")==false then
                            for i=1,#enemiesCache do if UnitExists(enemiesCache[i]) and CanLootUnit(UnitGUID(enemiesCache[i])) and UnitIsDeadOrGhost(enemiesCache[i]) and not _meInCombat() then
                                rTargetUnit(enemiesCache[i]);
                            end end
                        end
                    end

                    if GetCVar("autoLootDefault")=="0" then 
                        SetCVar("autoLootDefault",1);
                    end

                    if GetCVar("Sound_EnableErrorSpeech")=="1" then
                        SetCVar("Sound_EnableErrorSpeech","0");
                    end

                    if UnitExists("target") and UnitIsDeadOrGhost("target") then
                        slaveLooting=true;
                        if CanLootUnit(UnitGUID("Target"))==true then
                            if _distance("Target")>5 then
                                if not kc.standbehind or (UnitExists(UnitTarget("target")) and _unitIsUnit("player",UnitTarget("target"))) then
                                    xx,xy,xz=ObjectPosition("target")
                                else
                                    xx,xy,xz=_posBehindUnit("target",3);
                                end
                                _moveToXYZ(xx,xy,xz);
                            end
                            if not _meInCombat() and not _isMoving("player") then
                                if not moveDelay or GetTime()-moveDelay>=1 then
                                    if not lastInteract or GetTime()-lastInteract>=1.5 then
                                        rObjectInteract("target");
                                        lastInteract=GetTime();
                                        if not lastLoot or GetTime()-lastLoot>=0.5 then
                                            for i=1,GetNumLootItems() do
                                                LootSlot(i);
                                            end
                                            lastLoot=GetTime();
                                        end
                                    end
                                end
                            end
                        end
                        if CanLootUnit(UnitGUID("target"))==false then
                            rClearTarget();
                        end
                    end
                end

                if not completePath then
                   pathStart=nil;
                end
 
                if completePath then
 
                    if not pathStart then
                        pathStart=_firstStep(completePath);
                    end

                    if not completePath or not completePath[pathStart] then
                        completePath=nil;
                    end
                    
                    if completePath then
                        if _distBetweenPositions(px,py,pz,completePath[pathStart].x,completePath[pathStart].y,completePath[pathStart].z)>2.5 then
                            if not _meInCombat() then
                                _moveToXYZ(completePath[pathStart].x,completePath[pathStart].y,completePath[pathStart].z);
                            end
                        elseif pathStart<#completePath then
                            pathStart=pathStart+1;
                        elseif pathStart==#completePath then
                            lastPath=completePath;
                            completePath=nil;
                        end
                    end
     
                end

                if kc.slave and _isMoving("player") then
                    slaveMoveTimer=GetTime();
                end

                if not slaveLooting and not UnitIsDeadOrGhost("player") then
                    killMasterTarget=nil;
                    if masterUnit and masterTarget and _valid(masterTarget) then
                        if not IsInInstance() then
                            killMasterTarget=true;
                        end
                        if IsInInstance() and (_distance(masterTarget,"player")<=15 or _meInCombat()) then
                            killMasterTarget=true;
                        end
                    end

                    if kc.slave then
                        if IsInInstance() and UnitExists("target") and _valid("target") then
                            killMasterTarget=true;
                        end
                    end

                    if killMasterTarget and UnitExists("target") and (_distance("target")>kc.slaveKillDist or not _LoS("target")) then
                        if not kc.standbehind or (UnitExists(UnitTarget("target")) and _unitIsUnit("player",UnitTarget("target"))) then
                            xx,xy,xz=ObjectPosition("target")
                        else
                            xx,xy,xz=_posBehindUnit("target",3);
                        end
                        _reallyMoveToXYZ(xx,xy,xz);
                    end

                    if killMasterTarget and kc.slaveKillDist and UnitExists("target") and _distance("target")<kc.slaveKillDist-2 and _isMoving("player") then
                        if not kc.pullback then
                            MoveForwardStart();
                            MoveForwardStop();
                        end
                    end

                    followOne=false;
                    if UnitExists(masterTarget) and not UnitCanAttack("player",masterTarget) and not UnitIsPlayer(masterTarget) then
                        followOne=true;
                    end

                    if not killMasterTarget then
                        if kc.slave and masterUnit and UnitIsVisible(masterUnit) and (_distance(masterUnit)>kc.slaveFollowDist or ((IsInInstance() or followOne) and _distance(masterUnit)>=1)) and not UnitCastingInfo("Player") then
                            if not kc.standbehind or (UnitExists(UnitTarget(masterUnit)) and _unitIsUnit("player",UnitTarget(masterUnit))) then
                                xx,xy,xz=ObjectPosition(masterUnit)
                            else
                                xx,xy,xz=_posBehindUnit(masterUnit,3);
                            end
                            if not _anyoneInCombat() and not slaveLooting then
                                _zootToXYZ(xx,xy,xz);
                            end
                        end
                        if kc.slave and masterUnit and UnitIsVisible(masterUnit) and (_distance(masterUnit)<=kc.slaveFollowDist and not IsInInstance() and not followOne) then
                            if _isMoving("player") then
                                MoveForwardStart();
                                MoveForwardStop();
                            end
                        end
                    end
                end


                if kc.grind and not completePath then

                    if kc.deletegreys then
                        _deleteGreys();
                    end

                    --fix warrior problem
                    if UnitExists("target") and _meInCombat() then
                        if not lastWarriorFace or GetTime()-lastWarriorFace>=2 then
                            if grindspot and _distBetweenPositions(px,py,pz,grindspot.x,grindspot.y,grindspot.z)<=5 or not _meInCombat() or not kc.pullback then
                                if not _amIfacing("target") then
                                    if _isMoving("player") then
                                        MoveForwardStart();
                                        MoveForwardStop();
                                    end
                                    rFaceDirection("target",true);
                                end
                                lastWarriorFace=GetTime();
                            end
                        end
                    end

                    -- if UnitExists("target") and UnitIsTapDenied("target") then
                    --     rClearTarget();
                    -- end

                    if _getTotalFreeSlots()<=3 then
                        if UnitExists("target") and UnitIsDeadOrGhost("target") then
                            rClearTarget();
                        end
                    end

                    if UnitExists("target") and not _amIfacing("target") and not _isMoving("player") and not UnitCastingInfo("player") then
                        if not kc.pullback then
                            if not _amIfacing("target") then
                                if _isMoving("player") then
                                    MoveForwardStart();
                                    MoveForwardStop();
                                end
                                rFaceDirection("target",true);
                            end
                        end
                    end

                    if kc.smartMove and IsInInstance() and mostAround and mostAround[1] then
                        if not lastPosChange or (lastPosChange and GetTime()-lastPosChange>=5) then
                            if mostAround[1].n > 1 then                     
                                sx,sy,sz=ObjectPosition(mostAround[1].u)
                                if not grindspot or not grindspot.x then
                                        if sx and sy and sz then
                                            sx = sx + math.random(-3, 3)
                                            sy = sy + math.random(-3, 3)
                                        end
                                     
                                    grindspot={x=sx,y=sy,z=sz};
                                    lastPosChange=GetTime();
                                elseif grindspot and grindspot.x then
                                    if _distBetweenPositions(sx,sy,sz,grindspot.x,grindspot.y,grindspot.z)>=30 then
                                        if sx and sy and sz then
                                            sx = sx + math.random(-3, 3)
                                            sy = sy + math.random(-3, 3)
                                        end
                                        grindspot={x=sx,y=sy,z=sz};
                                        lastPosChange=GetTime();
                                    end
                                end                         
                            else            
                                grindspot= _defaultPVPDest()
                                lastPosChange=GetTime();
                            end
                        end
                    end

                    if not grindspot or not grindspot.x then
                        if not ntg then
                            didntRecordNTG=true;
                        end
                        if not rtg then
                            didntRecordRTG=true;
                        end
                        if roster and (kc.smartMove or not gp) then
                            if kc.smartMove and mostAround and mostAround[1] and kc.__pvp_min_scores[GetMapId()]~=nil and  mostAround[1].n > kc.__pvp_min_scores[GetMapId()] and not UnitIsDeadOrGhost(mostAround[1].u) then                              
                                sx,sy,sz = ObjectPosition(mostAround[1].u)

                                if sx and sy and sz then
                                    print("using offset pos")
                                    sx = sx + math.random(-3, 3)
                                    sy = sy + math.random(-3, 3)
                                end

                                grindspot={x=sx,y=sy,z=sz};
                                lastPosChange=GetTime();

                            elseif not kc.smartMove then
                                grindspot= _defaultPVPDest()
                            end
                        end
                        if gp and #gp>=1 and not kc.smartMove then
                           grindspot={x=gp[1].x,y=gp[1].y,z=gp[1].z,script=gp[1].script};
                        end
                    end

                    if roster and kc.smartMove and not grindspot then return; end

                    -- if not UnitIsDeadOrGhost("player") then
                    --     if gx or ranCorpse then
                    --         gx,gy,gz=ObjectPosition("player");
                    --         ranCorpse=nil;
                    --     end
                    -- end

                    --Resurrection--
                    if not kc.dungeonBot then
                        if UnitIsDead("player") and not UnitIsGhost("player") and (kc.grind or kc.slave) then
                            ranCorpse=nil;
                            if aliveTime and GetTime()-aliveTime>=1 then
                                RepopMe();
                                aliveTime=GetTime();
                            end
                            resTime=GetTime();
                        end

                        if UnitIsGhost("player") and gx and _distBetweenPositions(px,py,pz,gx,gy,gz)>20 and GetTime()-resTime>=15 then
                            if _distBetweenPositions(px,py,pz,gx,gy,gz)>5 then
                                if not kc.bgbot and not kc.portRezy then
                                    _moveToXYZ(gx,gy,gz)
                                end
                            end
                        end

                        if UnitIsGhost("player") and gx and _distBetweenPositions(px,py,pz,gx,gy,gz)<=20 then
                            if _isMoving("player") then
                                MoveForwardStart();
                                MoveForwardStop();
                            end
                            if retrieveTime and (GetTime()-retrieveTime>=10) then
                                RetrieveCorpse();
                            end
                            testRes=nil;
                        end
                    end

                    ----------------------


                    if not goingToDrink and not goingToEat then
                        --Grindbot--
                        if not usingNPC and not usingreplen and _actualHp("player")>kc.min_HP and (_actualMp("player")>kc.min_MP or UnitClass("player")==L["Warrior"] or UnitClass("player")==L["Rogue"] or UnitBuffName("player",L["Bear Form"]) or UnitBuffName("player",L["Cat Form"]) or UnitBuffName("player",L["Dire Bear Form"])) then

                            if _meInCombat() and UnitExists("target") and UnitIsDeadOrGhost("target") then
                                rClearTarget();
                            end


                            if not UnitIsDeadOrGhost("player") and (_actualHp("target")>80 or UnitIsDeadOrGhost("target") or not UnitExists("target")) then
                                _findAndTargetBestUnit();
                            end

                        end

                        if select(2,UnitClass("player"))=="WARRIOR" then
                            grindDist=5
                        end

                        if select(2,UnitClass("player"))=="PALADIN" then
                            if GetSpecialization()==1 then
                                grindDist=30
                                iamhealing=true;
                            elseif GetSpecialization()==2 then
                                grindDist=5
                            else
                                grindDist=5
                            end
                        end

                        if select(2,UnitClass("player"))=="HUNTER" then
                            grindDist=30
                        end

                        if select(2,UnitClass("player"))=="ROGUE" then
                            grindDist=5
                        end

                        if select(2,UnitClass("player"))=="PRIEST" then
                            grindDist=30
                            iamhealing=true;
                        end

                        if select(2,UnitClass("player"))=="SHAMAN" then
                            if GetSpecialization()==1 then
                                grindDist=30
                                iamhealing=true;
                            elseif GetSpecialization()==2 then
                                grindDist=5
                            else
                               grindDist=30
                            end
                        end

                        if select(2,UnitClass("player"))=="MAGE" then
                            grindDist=30
                        end

                        if select(2,UnitClass("player"))=="WARLOCK" then
                            grindDist=30
                        end

                        if select(2,UnitClass("player"))=="DRUID" then
                            if GetSpecialization()==1 then
                                grindDist=30
                            elseif GetSpecialization()==2 then
                                grindDist=5
                            elseif GetSpecialization()==3 then
                                grindDist=5
                            else
                                grindDist=30
                                iamhealing=true;
                            end
                        end

                        if select(2,UnitClass("player"))=="MONK" then
                            if GetSpecialization()==1 then
                                grindDist=5
                            elseif GetSpecialization()==2 then
                                grindDist=30
                            elseif GetSpecialization()==3 then
                                grindDist=5
                            end
                        end

                        if select(2,UnitClass("player"))=="DEATHKNIGHT" then
                            grindDist=5
                        end

                        if select(2,UnitClass("player"))=="DEMONHUNTER" then
                            --havo
                            grindDist=5
                        end


                        if grindspot ~= nil and grindspot.script ~= nil then
                            wmbapi.RunScript("",grindspot.script)
                        end
                            
                        if UnitExists("target") and not UnitCastingInfo("player") and (_distance("target")>grindDist or not _LoS("target")) then
                           if (grindspot and _distBetweenPositions(px,py,pz,grindspot.x,grindspot.y,grindspot.z)<=5) or not _meInCombat() or not kc.pullback then
                                if not kc.standbehind or (UnitExists(UnitTarget("target")) and _unitIsUnit("player",UnitTarget("target"))) then
                                    xx,xy,xz=ObjectPosition("target")
                                else
                                    xx,xy,xz=_posBehindUnit("target",3);
                                end
                                _reallyMoveToXYZ(xx,xy,xz);
                            end
                        end

                        -- if kc.pullback and _meInCombat() and _distBetweenPositions(px,py,pz,grindspot.x,grindspot.y,grindspot.z)>5 then
                        --     _reallyMoveToXYZ(grindspot.x,grindspot.y,grindspot.z);
                        -- end

                        if questlist and questlist[1] and questlist[1][1]=="DoQuest" and questlist[1][2] then
                            _findAndGatherQuestObjects(questlist[1][2]);
                        end


                        if onTheMove then return; end


                        if (not lastDeadTime or GetTime()-lastDeadTime>=1.5) and not _anyoneInCombat() then

                            if grindspot and grindspot.x and not gp then
                                if not UnitIsDeadOrGhost("player") and _actualHp("player")>=kc.min_HP and (_actualMp("player")>=kc.min_MP or UnitClass("player")==L["Warrior"] or UnitClass("player")==L["Rogue"] or UnitBuffName("player",L["Bear Form"]) or UnitBuffName("player",L["Cat Form"]) or UnitBuffName("player",L["Dire Bear Form"])) then
                                    if not _meInCombat() and not UnitExists("target") and _distBetweenPositions(px,py,pz,grindspot.x,grindspot.y,grindspot.z)>5 then
                                        _moveToXYZ(grindspot.x,grindspot.y,grindspot.z);
                                    end
                                end
                            end
                        
                            if not UnitIsDeadOrGhost("player") and _actualHp("player")>=kc.min_HP and (_actualMp("player")>=kc.min_MP or UnitClass("player")==L["Warrior"] or UnitBuffName("player",L["Dire Bear Form"]) or UnitBuffName("player",L["Bear Form"]) or UnitBuffName("player",L["Cat Form"]) or UnitClass("player")==L["Rogue"]) then
                                if not _meInCombat() and not UnitExists("target") and not leavingDungeon then

                                    if (IsInInstance() or not kc.dungeonBot) then
                                    
                                        if not cycleCount then cycleCount=0; end

                                        if runReverseRGP then
                                            if gp and #gp>=2 then
                                                _randomizeGP();
                                            end
                                            if kc.dungeonBot and not kc.dontReset then
                                                cycleCount=cycleCount+1;
                                            end
                                        end

                                        doReverseRun=true;
                                        if kc.directExit and IsInInstance() and kc.dungeonBot then
                                            doReverseRun=false;
                                        end

                                        if rgp and #rgp>=1 and runReverseGP and doReverseRun and not stayAtEnd then
                                            gpPathStart=nil
                                            if not rgpPathStart or not rgp[rgpPathStart] then
                                                rgpPathStart=_firstStep(rgp);
                                            end
                                            if gp and #gp>=2 and _distBetweenPositions(px,py,pz,rgp[#rgp].x,rgp[#rgp].y,rgp[#rgp].z)<=25 then
                                                if not kc.directExit then
                                                    cycleCount=cycleCount+1;
                                                end
                                                runReverseGP=nil;
                                                runReverseRGP=true;
                                            end
                                            if _distBetweenPositions(px,py,pz,rgp[rgpPathStart].x,rgp[rgpPathStart].y,rgp[rgpPathStart].z)>25 then
                                                if not _meInCombat() then
                                                    _moveToXYZ(rgp[rgpPathStart].x,rgp[rgpPathStart].y,rgp[rgpPathStart].z);
                                                    grindspot={x=rgp[rgpPathStart].x,y=rgp[rgpPathStart].y,z=rgp[rgpPathStart].z, script=rgp[rgpPathStart].script and rgp[rgpPathStart].script or nil};
                                                    if rgpPathStart-1>=1 then
                                                        pullbackspot={x=rgp[rgpPathStart-1].x,y=rgp[rgpPathStart-1].y,z=rgp[rgpPathStart-1].z};
                                                    else
                                                        pullbackspot={x=rgp[rgpPathStart].x,y=rgp[rgpPathStart].y,z=rgp[rgpPathStart].z};
                                                    end
                                                end
                                            elseif rgpPathStart<#rgp then
                                                rgpPathStart=rgpPathStart+1;
                                            end
                                        end

                                        if gp and #gp>=1 and not runReverseGP then
                                            rgpPathStart=nil;
                                            if not gpPathStart or not gp[gpPathStart] then
                                                gpPathStart=_firstStep(gp);
                                            end
                                            if gp and #gp>=2 and _distBetweenPositions(px,py,pz,gp[#gp].x,gp[#gp].y,gp[#gp].z)<=25 then
                                                if kc.directExit then
                                                    cycleCount=cycleCount+1;
                                                end
                                                runReverseRGP=nil;
                                                runReverseGP=true;
                                            end
                                            if _distBetweenPositions(px,py,pz,gp[gpPathStart].x,gp[gpPathStart].y,gp[gpPathStart].z)>25 or (#gp==1 and _distBetweenPositions(px,py,pz,gp[gpPathStart].x,gp[gpPathStart].y,gp[gpPathStart].z)>3) then
                                                if not _meInCombat() then
                                                    _moveToXYZ(gp[gpPathStart].x,gp[gpPathStart].y,gp[gpPathStart].z);
                                                    grindspot={x=gp[gpPathStart].x,y=gp[gpPathStart].y,z=gp[gpPathStart].z, script=gp[gpPathStart].script};
                                                    if gpPathStart-1>=1 then
                                                        pullbackspot={x=gp[gpPathStart-1].x,y=gp[gpPathStart-1].y,z=gp[gpPathStart-1].z};
                                                    else
                                                        pullbackspot={x=gp[gpPathStart].x,y=gp[gpPathStart].y,z=gp[gpPathStart].z};
                                                    end
                                                end
                                            elseif gpPathStart<#gp then
                                                gpPathStart=gpPathStart+1;
                                            end
                                        end

                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

function _meInCombat()
    if mainTarget and #mainTarget<=0 then return false; end
    if enemiesList and #enemiesList<=0 then return false; end
    if UnitAffectingCombat("player") then return true; end
end


function _distBetweenPositions(x1,y1,z1,x2,y2,z2)
    if x1 and y1 and z1 and x2 and y2 and z2 then
        return GetDistanceBetweenPositions(x1,y1,z1,x2,y2,z2);
    else
        return math.huge;
    end
end

function _xyDiff(x,y,z)
    return math.sqrt(((px-x)^2)+((py-y)^2));
end

function _xyDist(sx,sy,sz,x,y,z)
    return math.sqrt(((sx-x)^2)+((sy-y)^2));
end

function _zDiff(u,ou)
    uz=select(3,ObjectPosition(u));
    ouz=select(3,ObjectPosition(ou));
    return math.abs(uz-ouz);
end

function _realzDiff(u,ou)
    uz=select(3,ObjectPosition(u));
    ouz=select(3,ObjectPosition(ou));
    return ouz-uz;
end

function _resetGPtoClosest()
    if gp and #gp>=2 then
        rgpPathStart=_firstStep(gp);
        gpPathStart=_firstStep(gp);
        grindspot={x=gp[_firstStep(gp)].x,y=gp[_firstStep(gp)].y,z=gp[_firstStep(gp)].z, script=gp[_firstStep(gp)].script};
    end
end

function _resetGP()
    grindspot={x=gp[1].x,y=gp[1].y,z=gp[1].z, script=gp[1].script};
    resetPath=true;
    print("reseted")
end

function UnitBuffName(unit,name,source)
    winner=nil;
    for i=1,40 do
        if UnitBuff(unit,i,source)==name then
            winner=i;
        end
    end
    if winner then
        return UnitBuff(unit,winner); 
    end
end

function UnitDebuffName(unit,name,source)
    winner=nil;
    for i=1,_maxDebuffs(unit) do
        if UnitDebuff(unit,i,source)==name then
            winner=i;
        end
    end
    if winner then
        return UnitDebuff(unit,winner); 
    end
end

function _accountName()
    return ReadMemory(GetModuleAddress()+GetOffset("s_accountName"), "string");
end

function _settingsExist()
    if IsHackEnabled then
        files=GetDirectoryFiles(GetHackDirectory().."\\".._accountName().."\\*.txt");
        for i=1,#files do if files[i]=="settings.txt" then return true; end end
    end
    return false;
end

function SavedVars_Directory()
    if IsHackEnabled then
        return GetHackDirectory().."\\".._accountName();
    end
end

function table.val_to_str ( v )
  if "string" == type( v ) then
    v = string.gsub( v, "\n", "\\n" )
    if string.match( string.gsub(v,"[^'\"]",""), '^"+$' ) then
      return "'" .. v .. "'"
    end
    return '"' .. string.gsub(v,'"', '\\"' ) .. '"'
  else
    return "table" == type( v ) and table.tostring( v ) or
      tostring( v )
  end
end

function table.key_to_str ( k )
  if "string" == type( k ) and string.match( k, "^[_%a][_%a%d]*$" ) then
    return k
  else
    return "[" .. table.val_to_str( k ) .. "]"
  end
end

function table.tostring( tbl )
  local result, done = {}, {}
  for k, v in ipairs( tbl ) do
    table.insert( result, table.val_to_str( v ) )
    done[ k ] = true
  end
  for k, v in pairs( tbl ) do
    if not done[ k ] then
      table.insert( result,
        table.key_to_str( k ) .. "=" .. table.val_to_str( v ) )
    end
  end
  return "{" .. table.concat( result, "," ) .. "}"
end

function _saveSettings()
    if not allLoaded then return; end
    if IsHackEnabled then
        WriteFile(SavedVars_Directory().."\\settings.txt","kc="..table.tostring(kc));
    end
end

function _bindsFolderExists()
    if IsHackEnabled then
        if GetSubdirectories(GetWoWDirectory().."\\Interface\\AddOns\\binds")[1] then
            return true;
        end
    end
end

function _bindTocExist()
    if IsHackEnabled then
        files=GetDirectoryFiles(GetWoWDirectory().."\\Interface\\AddOns\\binds\\*.toc");
        for i=1,#files do if files[i]=="binds.toc" then return true; end end
    end
    return false;
end

function _countBindToc()
    if _bindTocExist() then
        return string.len(ReadFile(GetWoWDirectory().."\\Interface\\AddOns\\binds\\binds.toc"));
    end
end

function _bindsXmlExists()
    if IsHackEnabled then
        files=GetDirectoryFiles(GetWoWDirectory().."\\Interface\\AddOns\\binds\\*.xml");
        for i=1,#files do if files[i]=="bindings.xml" then return true; end end
    end
    return false;
end

function _countBindXml()
    if _bindTocExist() then
        return string.len(ReadFile(GetWoWDirectory().."\\Interface\\AddOns\\binds\\bindings.xml"));
    end
end

function _createBindsFolder()
    if not _bindsFolderExists() then
        CreateDirectory(GetWoWDirectory().."\\Interface\\AddOns\\binds");
    end
end


--function _folderExistsInHackFolder(folder)
--    for i=1,#GetSubdirectories(GetHackDirectory()) do
--        if GetSubdirectories(GetHackDirectory())[i]==folder then
--            return true;
--        end
--    end
--end

--function _folderExistsInSettingsFolder(folder)
--    for i=1,#GetSubdirectories(GetHackDirectory().."\\kcSettings") do
--        if GetSubdirectories(GetHackDirectory().."\\kcSettings")[i]==folder then
--            return true;
--        end
--    end
--end

--function _folderExistsInAccFolder(folder)
--    for i=1,#GetSubdirectories(GetHackDirectory().."\\kcSettings\\".._accountName()) do
--        if GetSubdirectories(GetHackDirectory().."\\kcSettings\\".._accountName())[i]==folder then
--            return true;
--        end
--    end
--end

--function _makeSettingsDirectory()
--    if not _folderExistsInHackFolder("kcSettings") then
--        CreateDirectory(GetHackDirectory().."\\kcSettings");
--    end
--    if not _folderExistsInSettingsFolder(_accountName()) then
--        CreateDirectory(GetHackDirectory().."\\kcSettings\\".._accountName());
--    end
--    if not _folderExistsInAccFolder("SavedVariables") then
--        CreateDirectory(GetHackDirectory().."\\kcSettings\\".._accountName().."\\SavedVariables");
--    end
--end

function _isMoving(unit)
    if UnitIsVisible(unit) then
        if GetUnitSpeed(unit) > 0 then return true; end
    end
end

function _trinketed(unit)
    for i=1,#recentTrinket do if _unitIsUnit(unit,recentTrinket[i].u) then return true; end end
end

function _beamed(unit)
    for i=1,#recentBeam do if _unitIsUnit(unit,recentBeam[i].u) then return true; end end
end

function _spellOnCD(unit,spellid)
    for i=1,#cooldowns do if _unitIsUnit(unit,cooldowns[i].u) and GetSpellInfo(spellid)==cooldowns[i].s then return true; end end
end

function _isMoonkin(u)
    if UnitBuffID(u,24858) or UnitBuffID(u,114302) then return true; end
end

function _dispelled(unit)
    for i=1,#recentDispel do if _unitIsUnit(unit,recentDispel[i].u) then return true; end end
end

function _canDot(u)
    if UnitExists("arena1") and UnitIsDeadOrGhost("arena1") then return true; end
    if UnitExists("arena2") and UnitIsDeadOrGhost("arena2") then return true; end
    if UnitExists("arena3") and UnitIsDeadOrGhost("arena3") then return true; end
    if kc.dontdot1 and UnitExists("arena1") and _unitIsUnit(u,"arena1") then return false; end
    if kc.dontdot2 and UnitExists("arena2") and _unitIsUnit(u,"arena2") then return false; end
    if kc.dontdot3 and UnitExists("arena3") and _unitIsUnit(u,"arena3") then return false; end
    return true;
end

function _canHeal(unit)
    if _unitIsUnit("player",unit) then return true; end
    if _hpWithShield(unit)>=0.1 and ObjectExists(unit) and UnitIsVisible(unit) and _LoS(unit) and UnitCanCooperate("player",unit) and not UnitIsEnemy("player",unit) and not UnitIsCharmed(unit) and not UnitIsDeadOrGhost(unit) and not UnitDebuffID(unit,33786) then
        if _distance(unit) <= 40 then return true; end
    end
end


function _castPctDone(unit)
    if UnitCastingInfo(unit) then
        local spellName, _, _, castStartTime, castEndTime, _, _, notInterruptible = UnitCastingInfo(unit)
        local castPercentDone = (((GetTime() - castStartTime/1000)) / (castEndTime/1000 - castStartTime/1000) ) * 100
        return castPercentDone
    end
    if UnitChannelInfo(unit) then
        local spellName, _, _, channelStartTime, channelEndTime, _, _, notInterruptible = UnitChannelInfo(unit)
        local channelPercentDone = (((GetTime() - channelStartTime/1000)) / (channelEndTime/1000 - channelStartTime/1000) ) * 100
        return channelPercentDone
    end
    return 0;
end

function _castMsDone(unit)
    if UnitCastingInfo(unit) then
        local spellName, _, _, castStartTime, castEndTime, _, _, notInterruptible = UnitCastingInfo(unit)
        local castMsDone = (GetTime() - (castStartTime/1000))*100
        return castMsDone
    end
    if UnitChannelInfo(unit) then
        local spellName, _, _, channelStartTime, channelEndTime, _, _, notInterruptible = UnitChannelInfo(unit)
        local castMsDone = (GetTime() - (channelStartTime/1000))*100
        return castMsDone
    end
    return 0;
end

--check cast function
function UnitCastingFrom(unit,t)
    
    cast = UnitCastingInfo(unit);
    channel = UnitChannelInfo(unit);

    --check cast
    if type(t) == "table" then
        for i=1,#t do 
            local c = GetSpellInfo(t[i]);
            if (cast or channel) and (cast == c or channel == c) then
                return true;
            end
        end
    end

end

function _realDistance(unit,sourceUnit)
    if not sourceUnit then sourceUnit = "player"; end
    -- if UnitIsVisible(unit) and UnitIsVisible(sourceUnit) then
    --     local X1,Y1,Z1 = ObjectPosition(unit);
    --     local X2,Y2,Z2 = ObjectPosition(sourceUnit);
    --     return math.sqrt(((X2-X1)^2)+((Y2-Y1)^2)+((Z2-Z1)^2));
    -- else return 8675309;
    -- end
    return GetDistanceBetweenObjects(ObjectPointer(unit),ObjectPointer(sourceUnit));
end

function GetSpellEffect(spellID)
    if not spellID then return end
    if spell_effect_cache[spellID] then return spell_effect_cache[spellID] end
    local desc = GetSpellDescription(spellID);
    if not desc then return; end
    local blocks = {};
    for n in desc:gmatch("%S+") do
        table.insert(blocks,n);
    end
    local good = {}
    for i=1,#blocks do
        local s = string.gsub(blocks[i],",","");
        table.insert(good,s);
    end
    local reallygood={};
    for i=1,#good do if tonumber(good[i]) then table.insert(reallygood,tonumber(good[i])); end end
    table.sort(reallygood, function(x,y) return x > y end)
    spell_effect_cache[spellID] = reallygood[1]
     return reallygood[1] or 0;
end

function _spellChargeFrac(spellid)
    if GetTime() - select(3,GetSpellCharges(spellid)) > 0 then
        return GetSpellCharges(spellid) + ((GetTime() - select(3,GetSpellCharges(spellid)))/select(4,GetSpellCharges(spellid)));
    else
        return GetSpellCharges(spellid);
    end
end

function _spellInRange(spellid,unit,otherUnit)
    if not otherUnit then otherUnit = "player"; end
    if UnitIsVisible(unit) and (type(spellid) == "number" or IsUsableSpell(spellid)) then
        local spellRange = select(6,GetSpellInfo(spellid));
        if IsPlayerSpell(198500) and spellid==163201 then
            spellRange=16;
        end
        --Sundering Fix
        if spellid==197214 then
            spellRange = 10;
        end
        --balance affinity fix
        if IsPlayerSpell(197488) then
            if spellRange == 0 then
                --to account for melee abilities
                spellRange = spellRange + 9;
            else
                --otherwise it just adds 5 yards
                spellRange = spellRange + 5;
            end
        end
        if spellRange > 0 and _realDistance(unit,otherUnit) <= spellRange then
            return true;
        end
        if spellRange == 0 and _meleeRange(unit,otherUnit) then
            return true;
        end
    end
    return false;
end

damageCasts={
    116858, -- chaos bolt
    203286, -- greater pyroblast
    202771, -- full moon
    214634,     -- EbonBolt
    210714, --Icefury
    199786,     -- Glacial Spike
    211714, -- thalkiels consumption
}

function _damageCastOn(unit)
    for i=1,#players do
        for n=1,#damageCasts do if UnitCastingInfo(players[i].Unit)==GetSpellInfo(damageCasts[n]) and _unitIsUnit(unit,UnitSpellTarget(players[i].Unit)) then
            return true;
        end end
    end
end

function _isImmobileDps(unit)

    local immobileSpecs = {
    71, -- Warrior: Arms
    72, -- Warrior: Fury
    73, -- Warrior: Protection
    250, -- Death Knight: Blood
    251, -- Death Knight: Frost
    252, -- Death Knight: Unholy
    259, -- Rogue: Assassination
    260, -- Rogue: Combat
    261, -- Rogue: Subtlety
    263, -- Shaman: Enhancement
    }

    if arena and UnitIsVisible(unit) and UnitCanAttack("player",unit) then
        for i=1,GetNumArenaOpponents() do
            if UnitGUID(unit) == UnitGUID("arena"..i) then
                for n=1,#immobileSpecs do
                    if GetArenaOpponentSpec(i) == immobileSpecs[n] then
                        return true;
                    end
                end
            end
        end
    end

    return false;

end

function _isMeleeDps(unit)
    
    local meleeSpecs = {
    66, -- Paladin: Protection
    70, -- Paladin: Retribution
    71, -- Warrior: Arms
    72, -- Warrior: Fury
    73, -- Warrior: Protection
    102, -- Druid: Balance
    103, -- Druid: Feral
    104, -- Druid: Guardian
    250, -- Death Knight: Blood
    251, -- Death Knight: Frost
    252, -- Death Knight: Unholy
    259, -- Rogue: Assassination
    260, -- Rogue: Combat
    261, -- Rogue: Subtlety
    263, -- Shaman: Enhancement
    268, -- Monk: Brewmaster
    269, -- Monk: Windwalker
    577, -- Demon Hunter: Havoc
    581 -- Demon Hunter: Vengeance
    }

    if arena and UnitIsVisible(unit) and UnitCanAttack("player",unit) then
        for i=1,GetNumArenaOpponents() do
            if UnitGUID(unit) == UnitGUID("arena"..i) then
                for n=1,#meleeSpecs do
                    if GetArenaOpponentSpec(i) == meleeSpecs[n] then
                        return true;
                    end
                end
            end
        end
    end

    if select(2,UnitClass(unit))=="WARRIOR" or select(2,UnitClass(unit))=="ROGUE" or select(2,UnitClass(unit))=="DEATHKNIGHT" or select(2,UnitClass(unit))=="DEMONHUNTER" then return true; end

    return false;

end

function _isCasterDps(unit)

    local casterSpecs = {
    6, -- Mage: Arcane
    63, -- Mage: Fire
    64, -- Mage: Frost
    102, -- Druid: Balance
    258, -- Priest: Shadow
    262, -- Shaman: Elemental
    265, -- Warlock: Affliction
    266, -- Warlock: Demonology
    267 -- Warlock: Destruction
    }

    if arena and UnitIsVisible(unit) and UnitCanAttack("player",unit) then
        for i=1,GetNumArenaOpponents() do
            if UnitGUID(unit) == UnitGUID("arena"..i) then
                for n=1,#casterSpecs do
                    if GetArenaOpponentSpec(i) == casterSpecs[n] then
                        return true;
                    end
                end
            end
        end
    end

    return false;
end


function _isHealer(unit)

    local healerSpecs = {
    105, --RestoDruid
    270, --MW monk
    264, --RestoShaman
    65, --Hpal
    256, --Dpriest
    257 --Hpriest
    }

    if UnitIsVisible(unit) then
        if UnitGroupRolesAssigned(unit) == "HEALER" then
            return true;
        end
    end

    if arena and UnitIsVisible(unit) and UnitCanAttack("player",unit) then
        for i=1,GetNumArenaOpponents() do
            if UnitGUID(unit) == UnitGUID("arena"..i) then
                for n=1,#healerSpecs do
                    if GetArenaOpponentSpec(i) == healerSpecs[n] then
                        return true;
                    end
                end
            end
        end
    end
end

function _playerCanBeKicked()
    for i=1,#enemiesCache do
        if arena then
            for n=1,GetNumArenaOpponents() do
                if UnitGUID(enemiesCache[i]) == UnitGUID("arena"..n) then
                    --rebuke
                    if GetArenaOpponentSpec(n)==66 or GetArenaOpponentSpec(n)==70 then
                        if _distance(enemiesCache[i])<=8 and not _spellOnCD(enemiesCache[i],96231) then
                            return true;
                        end
                    end
                    --pummel
                    if select(2,UnitClass(enemiesCache[i]))=="WARRIOR" then
                        if _distance(enemiesCache[i])<=8 and not _spellOnCD(enemiesCache[i],6552) then
                            return true;
                        end
                    end
                    --solar beam (balance D)
                    if GetArenaOpponentSpec(n)==102 then
                        if _distance(enemiesCache[i])<=40 and not _spellOnCD(enemiesCache[i],97547) then
                            return true;
                        end
                    end
                    --skullbash (feral,guardian)
                    if GetArenaOpponentSpec(n)==103 or GetArenaOpponentSpec(n)==104 then
                        if _distance(enemiesCache[i])<=13 and not _spellOnCD(enemiesCache[i],106839) then
                            return true;
                        end
                    end
                    --Mind Freeze
                    if select(2,UnitClass(enemiesCache[i]))=="DEATHKNIGHT" then
                        if _distance(enemiesCache[i])<=15 and not _spellOnCD(enemiesCache[i],47528) then
                            return true;
                        end
                    end
                    --kick
                    if select(2,UnitClass(enemiesCache[i]))=="ROGUE" then
                        if _distance(enemiesCache[i])<=8 and not _spellOnCD(enemiesCache[i],1766) then
                            return true;
                        end
                    end
                    --shear
                    if select(2,UnitClass(enemiesCache[i]))=="SHAMAN" then
                        if _distance(enemiesCache[i])<=30 and not _spellOnCD(enemiesCache[i],57994) then
                            return true;
                        end
                    end
                    --spear hand strike
                    if GetArenaOpponentSpec(n)==268 or GetArenaOpponentSpec(n)==269 then
                        if _distance(enemiesCache[i])<=8 and not _spellOnCD(enemiesCache[i],116705) then
                            return true;
                        end
                    end
                    --mage cs
                    if select(2,UnitClass(enemiesCache[i]))=="MAGE" then
                        if _distance(enemiesCache[i])<=40 and not _spellOnCD(enemiesCache[i],2139) then
                            return true;
                        end
                    end
                    --dh cs
                    if select(2,UnitClass(enemiesCache[i]))=="DEMONHUNTER" then
                        if _distance(enemiesCache[i])<=8 and not _spellOnCD(enemiesCache[i],183752) then
                            return true;
                        end
                    end
                    --warlock
                    if GetArenaOpponentSpec(n)==267 or GetArenaOpponentSpec(n)==265 then
                        if _distance(enemiesCache[i])<=40 and not _spellOnCD(enemiesCache[i],19647) then
                            return true;
                        end
                    end
                end
            end
        end
    end
end

function WorldPositionFromCursor()
    local x,y = GetMousePosition()
    local flags = bit.bor(0x1, 0x2, 0x10, 0x20, 0x100, 0x20000, 0x100000)
    return ScreenToWorld(x,y,flags);
end

function _AeCast(spellid,unit,maxrange,zplus)

    if _isMoving("player") and _castTime(spellid)>0 then return; end

    if LastAttemptedTime and GetTime()-LastAttemptedTime<=0.01 then return false; end

    if unit and not _LoS(unit) and unit~="mouse" then return false; end

    if _spellCooldown(spellid) > gcd then return false; end
    
    local aeCd = _spellCooldown(spellid);

    if unit~="mouse" then
        aeX,aeY,aeZ = ObjectPosition(unit);
    end
    if unit=="mouse" then
        aeX,aeY,aeZ = WorldPositionFromCursor();
    end

    if zplus then
        aeZ=aeZ+zplus;
    end
    
    if IsUsableSpell(spellid) and (unit=="mouse" or UnitIsVisible(unit)) and (unit=="mouse" or _distance(unit)<=maxrange) then
    
        if aeCd <= 0 then
            rCastSpellByID(spellid,"");
            if IsAoEPending() then
                ClickPosition(aeX,aeY,aeZ);
                CancelPendingSpell();
            end
            LastAttemptedSpellName = spellid;
            LastAttemptedSpellUnit = unit or "player";
            LastAttemptedTime = GetTime();
            return true;
        end
        
    end
end

function _distanceToObject(object,sourceUnit)
    if not sourceUnit then sourceUnit = "player"; end
    -- if ObjectExists(object) and UnitIsVisible(sourceUnit) then
    --     local X1,Y1,Z1 = ObjectPosition(object);
    --     local X2,Y2,Z2 = ObjectPosition(sourceUnit);
    --     return math.sqrt(((X2-X1)^2)+((Y2-Y1)^2)+((Z2-Z1)^2));
    -- else return 8675309;
    -- end
    return GetDistanceBetweenObjects(ObjectPointer(object),ObjectPointer(sourceUnit));
end

function _numberAround(sourceUnit,radius)
    if not px then return 0; end
    around=0;
    for i=1,#mainTarget do
        local pointer = mainTarget[i].pointer;
        if _distanceToObject(pointer,sourceUnit)<=radius then
            around=around+1;
        end
    end
    return around;
end

function _numberAroundNoCorrupt(sourceUnit,radius)
    if not px then return 0; end
    around=0;
    for i=1,#mainTarget do
        local pointer = mainTarget[i].pointer;
        if _distanceToObject(pointer,sourceUnit)<=radius and not UnitDebuffID(pointer,146739,"PLAYER") then
            around=around+1;
        end
    end
    return around;
end

function _meleeTargetingUnit(unit)
    for i=1,#enemiesList do
        if UnitIsPlayer(enemiesList[i]) and not _isHealer(enemiesList[i]) and _unitIsTargetingUnit(enemiesList[i],unit) and _isMeleeDps(enemiesList[i]) and _LoS(enemiesList[i]) and _realDistance(enemiesList[i],unit) <= 8 then
            return enemiesList[i];
        end
    end
end

function _meleeRange(unit,otherUnit)
    otherUnit = otherUnit or "player";
    if not UnitIsVisible(unit) or not UnitIsVisible(otherUnit) then return false; end
    if ObjectName(unit) == "Helya" 
    or ObjectName(otherUnit) == "Helya" then
        return true;
    end 
    if ObjectName(unit) == "Grasping Tentacle"
    or ObjectName(otherUnit) == "Grasping Tentacle" then
        return true;
    end
    if ObjectName(unit) == "Destructor Tentacle"
    or ObjectName(otherUnit) == "Destructor Tentacle" then
        return true;
    end
    if ObjectName(unit) == "Illysanna Ravencrest" 
    or ObjectName(otherUnit) == "Illysanna Ravencrest" then
        return true; 
    end
    return _realDistance(otherUnit,unit) <= (math.max(UnitCombatReach(otherUnit) + UnitCombatReach(unit) + 4 / 3 + ((_isMoving(otherUnit) and _isMoving(unit)) and 8 / 3 or 0), 5));
end

function _canSooth(unit)
    for i=1,40 do
        if select(4,UnitBuff(unit,i)) == "Enrage" then
            return true;
        end
    end
end

function _getEnemiesAroundUnit(sourceUnit,radius)
    local objects = {};
    for i=1,#mainTarget do
        local pointer = mainTarget[i].pointer;
        if _distanceToObject(pointer,sourceUnit)<=radius then
            tinsert(objects,pointer);
        end
    end
    return objects;
end

function _getEnemyPlayersAroundUnit(sourceUnit,radius)
    local objects = {};
    for i=1,#mainTarget do
        local pointer = mainTarget[i].pointer;
        if ObjectPosition(pointer) then
            if _distanceToObject(pointer,sourceUnit) <= radius and UnitIsPlayer(pointer) then
                tinsert(objects,pointer);
            end
        end
    end
    return objects;
end



function _meleeDpsOnUnit(unit)
    local count = 0;
        for i=1,#enemiesList do
            if UnitIsPlayer(enemiesList[i]) and not _isHealer(enemiesList[i]) and _unitIsTargetingUnit(enemiesList[i],unit) and _isMeleeDps(enemiesList[i]) and _LoS(enemiesList[i]) and _realDistance(enemiesList[i],unit) <= 8 then
                count = count + 1;
            end
        end
    return count;
end



function _createMainTarget()

    gcd = 1.5/(1+(UnitSpellHaste("player")/100));

    mainTarget={}

    --only consider seed
    if select(2,UnitClass("player"))=="WARLOCK" then
        seedOut=false;
        for i=1,#enemiesList do if UnitDebuffID(enemiesList[i],27243,"PLAYER") then
            seedOut=enemiesList[i];
        end end
    end

    for i=1,#enemiesList do
        targetingWeight = 1000;
        for n=1,#players do
            --if its a friendly melee's target +10
            if not _unitIsUnit("player",players[n].Unit) and _isMeleeDps(players[n].Unit) and ObjectExists(UnitTarget(players[n].Unit)) and UnitTarget(players[n].Unit)==enemiesList[i] then
                targetingWeight = targetingWeight + 10;
            end
            --if its your target +1
            if select(2,UnitClass("player"))=="SHAMAN" or select(2,UnitClass("player"))=="HUNTER" then
                if _unitIsUnit("target",enemiesList[i]) then
                    targetingWeight=targetingWeight+1;
                end
            end
        end

        if UnitIsPlayer(enemiesList[i]) then
            playerCheck = 1;
        else
            playerCheck = 0;
        end

        if not seedOut or (seedOut and enemiesList[i]==seedOut) then
            table.insert(mainTarget,{pointer=enemiesList[i],isPrimaryTarget=targetingWeight,isPlayer=playerCheck,hp=_actualHp(enemiesList[i])});
        end
    end

    table.sort(mainTarget, function(x,y) return x.isPrimaryTarget > y.isPrimaryTarget or (x.isPrimaryTarget == y.isPrimaryTarget and x.isPlayer > y.isPlayer) or (x.isPrimaryTarget == y.isPrimaryTarget and x.isPlayer == y.isPlayer and x.hp < y.hp) end)

    --Set CC tar--
    ccTar = nil;
    if UnitIsVisible("mouseover") and not UnitIsUnit("mouseover","target") and UnitIsPlayer("mouseover") then
        ccTar = "mouseover";
    end
    if not ccTar then
        ccTar = "target";
    end


end

function rFacingCastSpellByID(unit,spell)
    local facing = ObjectFacing("player");
    if not pickRandomCast then
        pickRandomCast=0.2+(math.random(0,10)/100);
    end
    if not lastRandomCast then lastRandomCast=GetTime(); end
    if GetTime()-lastRandomCast>=pickRandomCast then
        rFaceDirection(unit,false);
        CastSpellByName(GetSpellInfo(spell),unit);
        rFaceDirection(facing,true);
        lastRandomCast=GetTime()
        pickRandomCast=0.2+(math.random(0,10)/100);
    end
end


function rRunMacroText(...)
    if not pickRandomMacro then
        pickRandomMacro=0.2+(math.random(0,10)/100);
    end
    if not lastRandomMacro then lastRandomMacro=GetTime(); end
    if GetTime()-lastRandomMacro>=pickRandomMacro then
        RunMacroText(...)
        lastRandomMacro=GetTime()
        pickRandomMacro=0.2+(math.random(0,10)/100);
    end
end

function rCastSpellByID(spell,unit)
    if not pickRandomCastX then
        pickRandomCastX=0.2+(math.random(0,10)/100);
    end
    if not lastRandomCastX then lastRandomCastX=GetTime(); end
    if GetTime()-lastRandomCastX>=pickRandomCastX then
        CastSpellByName(GetSpellInfo(spell),unit)
        lastRandomCastX=GetTime()
        pickRandomCastX=0.2+(math.random(0,10)/100);
    end
end

function rUseItemByName(name)
    if not pickRandomItem then
        pickRandomItem=0.2+(math.random(0,10)/100);
    end
    if not lastRandomItem then lastRandomItem=GetTime(); end
    if GetTime()-lastRandomItem>=pickRandomItem then
        UseItemByName(name)
        lastRandomItem=GetTime()
        pickRandomItem=0.2+(math.random(0,10)/100);
    end
end

function rCastSpellByName(spell,unit)
    if not pickRandomCastN then
        pickRandomCastN=0.2+(math.random(0,10)/100);
    end
    if not lastRandomCastN then lastRandomCastN=GetTime(); end
    if GetTime()-lastRandomCastN>=pickRandomCastN then
        CastSpellByName(spell,unit)
        lastRandomCastN=GetTime()
        pickRandomCastN=0.2+(math.random(0,10)/100);
    end
end

function rDismount()
    if not pickRandomDismount then
        pickRandomDismount=0.2+(math.random(0,10)/100);
    end
    if not lastRandomDismount then lastRandomDismount=GetTime(); end
    if GetTime()-lastRandomDismount>=pickRandomDismount then
        if IsMounted("player") then
            Dismount();
        end
        lastRandomDismount=GetTime()
        pickRandomDismount=0.2+(math.random(0,10)/100);
    end
end


function _spellCooldown(spellid)
 local start, duration = GetSpellCooldown(spellid)
    if not start then return 0 end
    if duration + (start - GetTime()) > 0 then
        return duration + (start - GetTime())
    else
        return 0
    end
end

function _castTimeLeft(unit)
    if UnitCastingInfo(unit) then
        return ((select(5, UnitCastingInfo(unit)) - 30) - (GetTime()*1000) - select(3,GetNetStats())) / 1000
    end
    if UnitChannelInfo(unit) then
        return ((select(5, UnitChannelInfo(unit)) - 30) - (GetTime()*1000) - select(3,GetNetStats())) / 1000
    end
    return 0
end

function _castTime(spellid)
    if not spellid or not GetSpellInfo(spellid) then return nil; end
    return select(4, GetSpellInfo(spellid)) / 1000
end

function _LoS(unit,otherUnit)
    exceptions={
        "Raal the Gluttonous",
        "Illysanna Ravencrest",
        "Helya",
    }
    if not otherUnit then otherUnit = "player"; end
    if UnitDebuffID(unit,284453) then return false; end
    if UnitIsVisible(unit) and IsHackEnabled then
        for i=1,#exceptions do if ObjectName(unit)==exceptions[i] or ObjectName(otherUnit)==exceptions[i] then
            return true;
        end end
        local X1,Y1,Z1 = ObjectPosition(unit);
        local X2,Y2,Z2 = ObjectPosition(otherUnit);
        return not TraceLine(X1,Y1,Z1 + 2,X2,Y2,Z2 + 2, 0x10);
    end
    if UnitIsVisible(unit) and ObjectName(unit) == "Ragewing the Untamed" then return true; end
end

function _LoS(unit,otherUnit,not_for_cast)
    if not otherUnit then otherUnit = "player"; end 
    if UnitIsVisible(unit) then
        local unit_is_player = _unitIsUnit("player",unit)
        local other_unit_is_player = _unitIsUnit("player",otherUnit)
        if unit_is_player and other_unit_is_player then return true end
        local X1,Y1,Z1
        if unit_is_player then 
            X1,Y1,Z1 = px,py,pz
        else
            X1,Y1,Z1 = ObjectPosition(unit)
        end
        local X2,Y2,Z2
        if other_unit_is_player then
            X2,Y2,Z2 = px,py,pz
        else
            X2,Y2,Z2 = ObjectPosition(otherUnit)
        end
        --smoke bomb
        local smoke_bomb_one,_,_,_,_,_,source_one = UnitDebuffID(unit,212183)
        local smoke_bomb_two,_,_,_,_,_,source_two = UnitDebuffID(otherUnit,212183)
        --check if units are within smoke bomb, unless it's friendly to the opposing unit
        if source_one then
            if not UnitIsFriend(otherUnit,source_one) then
                return smoke_bomb_two
            end
        end
        if source_two then
            if not UnitIsFriend(unit,source_two) then
                return smoke_bomb_one
            end
        end
        local los = not TraceLine(X1,Y1,Z1+1.8,X2,Y2,Z2+1.8,0x10)
        return los
    end
end

function _trapTravelTime(unit,otherunit)
    otherunit = otherunit or "player";
    if _realDistance(otherunit,unit) < 3.25 then return -.05 end
    return _realDistance(otherunit,unit)/17.5+((select(4,GetNetStats())/1000)+.3)
end

function _maxBuffs(unit)
    for i=1,40 do if not UnitBuff(unit,i) then return i-1; end end
    return 0;
end

function _maxDebuffs(unit)
    for i=1,40 do if not UnitDebuff(unit,i) then return i-1; end end
    return 0;
end

--function UnitDebuffID(unit,spellid,source)
--    if source then
--        source=source.." "
--    else
--        source="";
--    end
--    return AuraUtil.FindAuraByName(GetSpellInfo(spellid),unit,source.."HARMFUL")
--end

--function UnitBuffID(unit,spellid,source)
--    if source then
--        source=source.." "
--    else
--        source="";
--    end
--    return AuraUtil.FindAuraByName(GetSpellInfo(spellid),unit,source.."HELPFUL")
--end

function UnitBuffID(unit, spellID, source)
    
    unit = ObjectPointer(unit)

    if UnitCache[unit] then
        local buffs = UnitCache[unit].buffs
        for i=1,#buffs do
            if spellID == buffs[i][10] and (not source or strlower(source) == buffs[i][7]) then
                return unpack(buffs[i])
            end
        end
    end

end


function UnitDebuffID(unit, spellID, source)
    
    unit = ObjectPointer(unit)
    if UnitCache[unit] then
        local debuffs = UnitCache[unit].debuffs
        for i=1,#debuffs do
            if spellID == debuffs[i][10] and (not source or strlower(source) == debuffs[i][7]) then
                return unpack(debuffs[i])
            end
        end
    end

end

function _debuffRemains(...)
    if not UnitDebuffID(...) then return 0; end
    if UnitDebuffID(...) then
        if select(6,UnitDebuffID(...)) - GetTime() > 0 then
            return select(6,UnitDebuffID(...)) - GetTime();
        else
            return 999;
        end
    end
end

function _buffRemains(...)
    if not UnitBuffID(...) then return 0; end
    if UnitBuffID(...) then return select(6,UnitBuffID(...)) - GetTime(); end
end

function _debuffStacks(...)
    if not UnitDebuffID(...) then return 0; end
    if UnitDebuffID(...) then return select(3,UnitDebuffID(...)) end
end

function _buffStacks(...)
    if not UnitBuffID(...) then return 0; end
    if UnitBuffID(...) then return select(3,UnitBuffID(...)) end
end

function _amIfacing(unit)
    if _unitIsUnit("player",unit) then return true; end
    return _unitIsFacingUnit("player",unit);
end

function _isFacingMe(unit)
    return _unitIsFacingUnit(unit,"PLAYER");
end

function _unitIsFacingUnit(firstUnit,secondUnit,degree)
    -- if not degree then degree = 0; end
    -- if UnitIsVisible(firstUnit) and UnitIsVisible(secondUnit) then
    --     local X,Y = ObjectPosition(firstUnit);
    --     local Rotation = ObjectFacing(firstUnit);
    --     local unitX,unitY = ObjectPosition(secondUnit);
    --     return ((X-unitX)*math.cos(-Rotation))-((Y-unitY)*math.sin(-Rotation))<degree or _realDistance(firstUnit,secondUnit) < 1.5;
    -- end
    return ObjectIsFacing(ObjectPointer(firstUnit),ObjectPointer(secondUnit)); 
end

drDisorient={
    207167,       -- Blinding Sleet
    207685,       -- Sigil of Misery
    33786,       -- Cyclone
    1513,       -- Scare Beast
    31661,       -- Dragon's Breath
    198909,       -- Song of Chi-ji
    202274,       -- Incendiary Brew
    105421,       -- Blinding Light
    10326,       -- Turn Evil (For Lichborne?)
    605,       -- Mind Control
    8122,       -- Psychic Scream
    226943,       -- Mind Bomb
    2094,       -- Blind
    118699,       -- Fear
    261589,       -- Seduction (Grimoire of Sacrifice)
    6358,       -- Seduction (Succubus)
    5246,       -- Intimidating Shout
    316593,       -- Intimidating Shout 2 (not sure which one is correct in 9.0.1)
    316595,       -- Intimidating Shout 3
    35474,       -- Drums of Panic (Item)
    269186,       -- Holographic Horror Projector (Item)
    280062,       -- Unluckydo (Item)
    267026,       -- Giant Flower (Item)
    243576,       -- Sticky Starfish (Item)
    331866,       -- Agent of Chaos (Venthyr Covenant)
}

drIncap={
    -- Incapacitates
    217832,    -- Imprison
    221527,    -- Imprison (Honor talent)
    2637,    -- Hibernate
    99,    -- Incapacitating Roar
    3355,    -- Freezing Trap
    203337,    -- Freezing Trap (Honor talent)
    213691,    -- Scatter Shot
    118,    -- Polymorph
    28271,    -- Polymorph (Turtle)
    28272,    -- Polymorph (Pig)
    61025,    -- Polymorph (Snake)
    61305,    -- Polymorph (Black Cat)
    61780,    -- Polymorph (Turkey)
    61721,    -- Polymorph (Rabbit)
    126819,    -- Polymorph (Porcupine)
    161353,    -- Polymorph (Polar Bear Cub)
    161354,    -- Polymorph (Monkey)
    161355,    -- Polymorph (Penguin)
    161372,    -- Polymorph (Peacock)
    277787,    -- Polymorph (Baby Direhorn)
    277792,    -- Polymorph (Bumblebee)
    82691,    -- Ring of Frost
    115078,    -- Paralysis
    20066,    -- Repentance
    9484,    -- Shackle Undead
    200196,    -- Holy Word: Chastise
    776,    -- Gouge
    6770,    -- Sap
    51514,    -- Hex
    196942,    -- Hex (Voodoo Totem)
    210873,    -- Hex (Raptor)
    211004,    -- Hex (Spider)
    211010,    -- Hex (Snake)
    211015,    -- Hex (Cockroach)
    269352,    -- Hex (Skeletal Hatchling)
    309328,    -- Hex (Living Honey)
    277778,    -- Hex (Zandalari Tendonripper)
    277784,    -- Hex (Wicker Mongrel)
    197214,    -- Sundering
    710,    -- Banish
    6789,    -- Mortal Coil
    107079,    -- Quaking Palm (Pandaren racial)
    89637,    -- Big Daddy (Item)
    255228,    -- Polymorphed (Organic Discombobulation Grenade) (Item)
    71988,    -- Vile Fumes (Item)
}

drSilence={
    -- Silences
    47476,         -- Strangulate
    204490,         -- Sigil of Silence
    --      [78675]   = "silence",         -- Solar Beam (doesn't seem to DR)
    202933,         -- Spider Sting
    217824,         -- Shield of Virtue
    15487,         -- Silence
    1330,         -- Garrote
    196364,         -- Unstable Affliction Silence Effect 
}

drStun={
    -- Stuns
    210141,            -- Zombie Explosion
    108194,            -- Asphyxiate (Unholy)
    221562,            -- Asphyxiate (Blood)
    91800,            -- Gnaw (Ghoul)
    91797,            -- Monstrous Blow (Mutated Ghoul)
    287254,            -- Dead of Winter
    179057,            -- Chaos Nova
    --      [213491,            -- Demonic Trample (Only DRs with itself once)
    205630,            -- Illidan's Grasp (Primary effect)
    208618,            -- Illidan's Grasp (Secondary effect)
    211881,            -- Fel Eruption
    200166,            -- Metamorphosis (PvE stun effect)
    203123,            -- Maim
    163505,            -- Rake (Prowl)
    5211,            -- Mighty Bash
    202244,            -- Overrun
    24394,            -- Intimidation
    119381,            -- Leg Sweep
    202346,            -- Double Barrel
    853,            -- Hammer of Justice
    64044,            -- Psychic Horror
    200200,            -- Holy Word: Chastise Censure
    1833,            -- Cheap Shot
    408,            -- Kidney Shot
    118905,            -- Static Charge (Capacitor Totem)
    118345,            -- Pulverize (Primal Earth Elemental)
    204437,            -- Lightning Lasso
    89766,            -- Axe Toss
    171017,            -- Meteor Strike (Infernal)
    171018,            -- Meteor Strike (Abyssal)
    --      [22703,            -- Infernal Awakening (doesn't seem to DR)
    30283,            -- Shadowfury
    46968,            -- Shockwave
    132168,            -- Shockwave (Protection)
    145047,            -- Shockwave (Proving Grounds PvE)
    132169,            -- Storm Bolt
    199085,            -- Warpath
    --      [213688,            -- Fel Cleave (doesn't seem to DR)
    20549,            -- War Stomp (Tauren)
    255723,            -- Bull Rush (Highmountain Tauren)
    287712,            -- Haymaker (Kul Tiran)
    280061,            -- Brainsmasher Brew (Item)
    245638,            -- Thick Shell (Item) 
}

drRoot={
    -- Roots
    -- Note: Short roots (<= 2s) usually have no DR, e.g Thunderstruck.
    334693,            -- Absolute Zero (Breath of Sindragosa)
    204085,            -- Deathchill (Chains of Ice)
    233395,            -- Deathchill (Remorseless Winter)
    339,            -- Entangling Roots
    170855,            -- Entangling Roots (Nature's Grasp)
    --      [45334,            -- Immobilized (Wild Charge, doesn't seem to DR)
    102359,            -- Mass Entanglement
    117526,            -- Binding Shot (Note: debuff says stun but it's actually a root)
    162480,            -- Steel Trap
    --      [190927]  = "root_harpoon",    -- Harpoon (TODO: check if DRs with itself)
    212638,            -- Tracker's Net
    201158,            -- Super Sticky Tar
    122,            -- Frost Nova
    33395,            -- Freeze
    198121,            -- Frostbite
    20107,            -- Frostbite (Water Elemental? needs testing)
    342375,            -- Tormenting Backlash (Torghast pve, needs confirmation)
    233582,            -- Entrenched in Flame
    116706,            -- Disable
    64695,            -- Earthgrab (Totem effect)
    39965,            -- Frost Grenade (Item)
    75148,            -- Embersilk Net (Item)
    55536,            -- Frostweave Net (Item)
    268966,            -- Hooked Deep Sea Net (Item)
    270399,            -- Unleashed Roots (Item)
    270196,            -- Chains of Light (Item)
    267024,            -- Stranglevines (Item)
}

drDisarm={
    -- Disarms
    209749,          -- Faerie Swarm (Balance Honor Talent)
    207777,          -- Dismantle
    233759,          -- Grapple Weapon
    236077,          -- Disarm
}

PvPslows    =
{
    116, -- Frostbolt                           (mage, frost)
    1715, -- Hamstring                           (warrior, arms)
    2120, -- Flamestrike                         (mage, fire)
    3409, -- Crippling Poison                    (rogue, assassination)
    3600, -- Earthbind                           (shaman, general)
    5116, -- Concussive Shot                     (hunter, beast mastery/marksman)
    6343, -- Thunder Clap                        (warrior, protection)
    12323, -- Piercing Howl                       (warrior, fury)
    12486, -- Blizzard                            (mage, frost)
    15407, -- Mind Flay                           (priest, shadow)
    31589, -- Slow                                (mage, arcane)
    44614, -- Flurry                              (mage, frost)
    45524, -- Chains of Ice                       (death knight)
    50259, -- Dazed                               (druid, PVE talent, general)
    50433, -- Ankle Crack                         (hunter pet)
    51490, -- Thunderstorm                        (shaman, elemental)
    58180, -- Infected Wounds                     (druid, feral)
    61391, -- Typhoon                             (druid, general)
    116095, -- Disable                             (monk, windwalker)
    118000, -- Dragon Roar                         (warrior, PVE talent, fury)
    121253, -- Keg Smash                           (monk, brewmaster)
    123586, -- Flying Serpent Kick                 (monk, windwalker)
    127797, -- Ursol's Vortex                      (druid, restoration)
    135299, -- Tar Trap                            (hunter, survival)
    147732, -- Frostbrand Attack                   (shaman, enhancement)
    157981, -- Blast Wave                          (mage, fire)
    160065, -- Tendon Rip                          (hunter pet)
    160067, -- Web Spray                           (pet ability)
    183218, -- Hand of Hindrance                   (paladin, retribution)
    185763, -- Pistol Shot                         (rogue, outlaw)
    195645, -- Wing Clip                           (hunter, survival)
    196840, -- Frost Shock                         (shaman, elemental)
    198222, -- System Shock                        (rogue, assassination)
    198813, -- Vengeful Retreat                    (demon hunter, havoc)
    201787, -- Heavy-Handed Strikes                (monk, windwalker)
    204263, -- Shining Force                       (priest, disc/holy)
    204843, -- Sigil of Chains                     (demon hunter, veng)
    205021, -- Ray of Frost                        (mage, frost)
    205708, -- Chilled                             (mage, frost)
    206930, -- Heart Strike                        (death knight, blood)
    208278, -- Debilitating Infestation            (DK unholy talent)
    211793, -- Remorseless Winter                  (death knight, frost)
    212792, -- Cone of Cold                        (mage, frost)
    213405, -- Master of the Glaive                (demon hunter, PVE talent, havoc)
    228354, -- Flurry                              (mage, frost)
    248744, -- Shiv                                (rogue, PVP talent, general)
    255937, -- Wake of Ashes                       (paladin, PVE talent, retribution)
    273977, -- Grip of the Dead                    (death knight, unholy)
    277953, -- Night Terrors                       (rogue, subtlety)
    279303, -- Frostwyrm's Fury                    (death knight, PVE talent, frost)
    280184, -- Sweep the Leg                       (monk, azerite trait)
    288962, -- Blood Bolt                          (hunter pet)
    289308, -- Frozen Orb                          (mage, frost)
    337113, -- Lock Legendary slow
    204206, -- chil streak
}
function _slowCheck(unit)
    for i=1,#PvPslows do
        if UnitDebuffID(unit,PvPslows[i]) then
            return true;
        end
    end
end

ccIDs = {
    207167,       -- Blinding Sleet
    207685,       -- Sigil of Misery
    33786,       -- Cyclone
    1513,       -- Scare Beast
    31661,       -- Dragon's Breath
    198909,       -- Song of Chi-ji
    202274,       -- Incendiary Brew
    105421,       -- Blinding Light
    10326,       -- Turn Evil (For Lichborne?)
    605,       -- Mind Control
    8122,       -- Psychic Scream
    226943,       -- Mind Bomb
    2094,       -- Blind
    118699,       -- Fear
    261589,       -- Seduction (Grimoire of Sacrifice)
    6358,       -- Seduction (Succubus)
    5246,       -- Intimidating Shout
    316593,       -- Intimidating Shout 2 (not sure which one is correct in 9.0.1)
    316595,       -- Intimidating Shout 3
    35474,       -- Drums of Panic (Item)
    269186,       -- Holographic Horror Projector (Item)
    280062,       -- Unluckydo (Item)
    267026,       -- Giant Flower (Item)
    243576,       -- Sticky Starfish (Item)
    331866,       -- Agent of Chaos (Venthyr Covenant)
    -- Incapacitates
    217832,    -- Imprison
    221527,    -- Imprison (Honor talent)
    2637,    -- Hibernate
    99,    -- Incapacitating Roar
    3355,    -- Freezing Trap
    203337,    -- Freezing Trap (Honor talent)
    213691,    -- Scatter Shot
    118,    -- Polymorph
    28271,    -- Polymorph (Turtle)
    28272,    -- Polymorph (Pig)
    61025,    -- Polymorph (Snake)
    61305,    -- Polymorph (Black Cat)
    61780,    -- Polymorph (Turkey)
    61721,    -- Polymorph (Rabbit)
    126819,    -- Polymorph (Porcupine)
    161353,    -- Polymorph (Polar Bear Cub)
    161354,    -- Polymorph (Monkey)
    161355,    -- Polymorph (Penguin)
    161372,    -- Polymorph (Peacock)
    277787,    -- Polymorph (Baby Direhorn)
    277792,    -- Polymorph (Bumblebee)
    82691,    -- Ring of Frost
    115078,    -- Paralysis
    20066,    -- Repentance
    9484,    -- Shackle Undead
    200196,    -- Holy Word: Chastise
    776,    -- Gouge
    6770,    -- Sap
    51514,    -- Hex
    196942,    -- Hex (Voodoo Totem)
    210873,    -- Hex (Raptor)
    211004,    -- Hex (Spider)
    211010,    -- Hex (Snake)
    211015,    -- Hex (Cockroach)
    269352,    -- Hex (Skeletal Hatchling)
    309328,    -- Hex (Living Honey)
    277778,    -- Hex (Zandalari Tendonripper)
    277784,    -- Hex (Wicker Mongrel)
    197214,    -- Sundering
    710,    -- Banish
    6789,    -- Mortal Coil
    107079,    -- Quaking Palm (Pandaren racial)
    89637,    -- Big Daddy (Item)
    255228,    -- Polymorphed (Organic Discombobulation Grenade) (Item)
    71988,    -- Vile Fumes (Item)
    -- Silences
    47476,         -- Strangulate
    204490,         -- Sigil of Silence
    78675,         -- Solar Beam (doesn't seem to DR)
    202933,         -- Spider Sting
    217824,         -- Shield of Virtue
    15487,         -- Silence
    1330,         -- Garrote
    196364,         -- Unstable Affliction Silence Effect 
    -- Stuns
    210141,            -- Zombie Explosion
    108194,            -- Asphyxiate (Unholy)
    221562,            -- Asphyxiate (Blood)
    91800,            -- Gnaw (Ghoul)
    91797,            -- Monstrous Blow (Mutated Ghoul)
    287254,            -- Dead of Winter
    179057,            -- Chaos Nova
    205630,            -- Illidan's Grasp (Primary effect)
    208618,            -- Illidan's Grasp (Secondary effect)
    211881,            -- Fel Eruption
    200166,            -- Metamorphosis (PvE stun effect)
    203123,            -- Maim
    163505,            -- Rake (Prowl)
    5211,            -- Mighty Bash
    202244,            -- Overrun
    24394,            -- Intimidation
    119381,            -- Leg Sweep
    202346,            -- Double Barrel
    853,            -- Hammer of Justice
    64044,            -- Psychic Horror
    200200,            -- Holy Word: Chastise Censure
    1833,            -- Cheap Shot
    408,            -- Kidney Shot
    118905,            -- Static Charge (Capacitor Totem)
    118345,            -- Pulverize (Primal Earth Elemental)
    204437,            -- Lightning Lasso
    89766,            -- Axe Toss
    171017,            -- Meteor Strike (Infernal)
    171018,            -- Meteor Strike (Abyssal)
    30283,            -- Shadowfury
    46968,            -- Shockwave
    132168,            -- Shockwave (Protection)
    145047,            -- Shockwave (Proving Grounds PvE)
    132169,            -- Storm Bolt
    199085,            -- Warpath
    20549,            -- War Stomp (Tauren)
    255723,            -- Bull Rush (Highmountain Tauren)
    287712,            -- Haymaker (Kul Tiran)
    280061,            -- Brainsmasher Brew (Item)
    245638,            -- Thick Shell (Item) 
}
function _CCcheck(unit)
    --local cconunit = {};
    if not ObjectExists(unit) then return 0; end
    for i=1,#ccIDs do
        if UnitDebuffID(unit,ccIDs[i]) then
            return _debuffRemains(unit,ccIDs[i]);
        end
    end
    if _lockedOut(unit) then
        return _lockedOut(unit);
    end
    return 0;
end

function _msEffect(unit)
    effect=1
    if UnitDebuffID(unit,115804) then
        effect=effect-0.25
    end
    if UnitDebuffID(unit,198819) then
        effect=effect-0.5
    end
    if UnitDebuffID(unit,8680) then
        effect=effect-(4.6*_debuffStacks(unit,8680))
    end
    return effect
end

function _lockedOut(unit)
    for i=1,#lockedOut do
        if _unitIsUnit(unit,lockedOut[i].pointer) then
            return lockedOut[i].expire-GetTime();
        end
    end
    --return 0;
end

roots =
{
    204085,            -- Deathchill (Chains of Ice)
    233395,            -- Deathchill (Remorseless Winter)
    339,            -- Entangling Roots
    170855,            -- Entangling Roots (Nature's Grasp)
    --      [45334,            -- Immobilized (Wild Charge, doesn't seem to DR)
    102359,            -- Mass Entanglement
    117526,            -- Binding Shot (Note: debuff says stun but it's actually a root)
    162480,            -- Steel Trap
    --      [190927]  = "root_harpoon",    -- Harpoon (TODO: check if DRs with itself)
    212638,            -- Tracker's Net
    201158,            -- Super Sticky Tar
    122,            -- Frost Nova
    33395,            -- Freeze
    198121,            -- Frostbite
    220107,            -- Frostbite (Water Elemental? needs testing)
    342375,            -- Tormenting Backlash (Torghast pve, needs confirmation)
    233582,            -- Entrenched in Flame
    116706,            -- Disable
    64695,            -- Earthgrab (Totem effect)
    39965,            -- Frost Grenade (Item)
    75148,            -- Embersilk Net (Item)
    55536,            -- Frostweave Net (Item)
    268966,            -- Hooked Deep Sea Net (Item)
    270399,            -- Unleashed Roots (Item)
    270196,            -- Chains of Light (Item)
    267024,            -- Stranglevines (Item)
}


function _rootCheck(unit)
    for i=1,#roots do
        if UnitDebuffID(unit,roots[i]) then
            return _debuffRemains(unit,roots[i]);
        end
    end
end

function _chain(unit)
    --return _numberAround(unit,10);
    c1,c2,c3 = nil,nil,nil;

     if not c1 then c1 = ObjectPointer(unit); end

     if c1 then
         c1enemies = _getEnemiesAroundUnit(c1,10);
         for i=1,#c1enemies do
             if c1enemies[i] ~= c1 then
                 c2 = c1enemies[i];
                 break;
             end
         end
     end

     if c1 and not c2 then
         return 1;
     end

     if c2 then
         c2enemies = _getEnemiesAroundUnit(c2,10);
         for i=1,#c2enemies do
             if c2enemies[i] ~= c1 and c2enemies[i] ~= c2 then
                 c3 = c2enemies[i];
                 break;
             end
         end
     end

     if c2 and not c3 then
         return 2;
     end

     if c3 then
         return 3;
     end

     return 0;
end

tremorList={
8122, -- Psychic Scream
118699, -- Fear -- new SpellID in MoP, Blood Fear uses same ID
5484, -- Howl of Terror
6358, -- Seduction (Succubus)
115268, -- Mesmerize (Shivarra) -- FIXME: verify this is the correct category
5246, -- Intimidating Shout (main target)
}
function _canTremor(u)
    for i=1,#tremorList do if UnitDebuffID(u,tremorList[i]) and _distance(u)<=29 then
        return true;
    end end
end

immuneMagicDebuffs  =
{
    33786, --Cyclone
    209753, --Clone
    221527, --Imprison
    710,    --Banish
}

breakables = {
    2094,  -- Blind
    1776,  -- Gouge
    6770,  -- Sap
    3355, -- Freezing Trap
    118, -- Polymorph
    28272, -- Polymorph (pig)
    28271, -- Polymorph (turtle)
    61305, -- Polymorph (black cat)
    61025, -- Polymorph (serpent) -- FIXME: gone ?
    61721, -- Polymorph (rabbit)
    61780, -- Polymorph (turkey)
    161355,    -- Polymorph (Penguin)
    161354,    -- Polymorph (Monkey)
    277792,    -- Polymorph (Bumblebee)
    277787,    -- Polymorph (Baby Direhorn)
    19386, --Wyvern
    20066, --repent
    51514, --hex
    118699, -- Fear
    5782, -- Fear
    115078, --para
}

ImmuneToSlows = {
        642, -- Divine Shield                       (paladin, general)
       1044, -- Blessing of Freedom                 (paladin, general)
      46924, -- Bladestorm                          (fury ID)
      48265, -- Death's Advance                     (death knight, general)
      54216, -- Master's Call                       (hunter, pet ability)
     108843, -- Blazing Speed (cauterize)           (mage, fire)
     186265, -- Aspect of the Turtle                (hunter)
     197003, -- Maneuverability                     (rogue, PVP talent, general)
     201447, -- Ride the Wind                       (monk, windwalker)
     212552, -- Wraith Walk                         (death knight, frost/unholy)
     216113, -- Way of the Crane                    (monk, mistweaver)
     227847, -- Bladestorm                          (arms ID)
     287081, -- Lichborne                           (death knight, frost/unholy)
}

immuneAllDebuff={
    33786, --Cyclone
    --209753, --Clone
    221527, --Imprison
    710,    --Banish
}


function _karmaExists()
    for i=1,#roster do if UnitDebuffID(roster[i].Unit,122470) then
        return true;
    end end
end

function _its(unit)
    for i=1,#ImmuneToSlows do if UnitBuffID(unit,ImmuneToSlows[i]) then return _buffRemains(unit,ImmuneToSlows[i]); end end
end

function _b(u)
    for i=1,#breakables do if UnitDebuffID(u,breakables[i]) then return _debuffRemains(u,breakables[i]); end end
end

function _ia(u)
    --prot pal bubble
    if UnitBuffID(u,228049) then return _buffRemains(u,228049); end
    --block
    if select(2,UnitClass(u))=="MAGE" and UnitBuffID(u,45438) then return _buffRemains(u,45438) end
    --bubble
    if select(2,UnitClass(u))=="PALADIN" and UnitBuffID(u,642) then return _buffRemains(u,642) end
    --aspect of turtl
    if select(2,UnitClass(u))=="HUNTER" and UnitBuffID(u,186265) then return _buffRemains(u,186265) end
    --karma
    if select(2,UnitClass(u))=="MONK" and UnitBuffID(u,125174) and _karmaExists() then return _buffRemains(u,125174) end
    --greater fade
    if select(2,UnitClass(u))=="PRIEST" and UnitBuffID(u,213602) then return _buffRemains(u,213602) end
    --netherwalk
    if select(2,UnitClass(u))=="DEMONHUNTER" and UnitBuffID(u,196555) then return _buffRemains(u,196555) end
    --clone/banish
    for i=1,#immuneAllDebuff do
        if UnitDebuffID(u,immuneAllDebuff[i]) then
            return _debuffRemains(u,immuneAllDebuff[i]);
        end 
    end
end

function _im(u)
    if not UnitIsPlayer(u) then return false; end
    if UnitBuffID(u,8178) then return 999; end
    if UnitBuffID(u,213915) then return _buffRemains(u,213915); end
    if UnitBuffID(u,204018) then return _buffRemains(u,204018); end
    --ams
    if select(2,UnitClass(u))=="DEATHKNIGHT" and UnitBuffID(u,48707) then return _buffRemains(u,48707) end
    --spellreflect
    if select(2,UnitClass(u))=="WARRIOR" and UnitBuffID(u,23920) then return _buffRemains(u,23920) end
    if select(2,UnitClass(u))=="WARRIOR" and UnitBuffID(u,216890) then return _buffRemains(u,216890) end
    --nether ward
    if select(2,UnitClass(u))=="WARLOCK" and UnitBuffID(u,212295) then return _buffRemains(u,212295) end
    --cloak
    if select(2,UnitClass(u))=="ROGUE" and UnitBuffID(u,31224) then return _buffRemains(u,31224) end
end

function _immuneMagic(unit)
    if not UnitIsPlayer(unit) then return false; end
    --Debuffs/breakables
    for i=1,#immuneMagicDebuffs do
        if UnitDebuffID(unit,immuneMagicDebuffs[i]) then
            return true;
        end
    end
    if arena then
        for i=1,#breakables do if UnitDebuffID(unit,breakables[i]) then return true; end end
    end
    --Para
    if UnitBuffID(unit,115078) then return true; end
end

groundCC    =
{
    33786,      -- Cyclone
    --209753,      --Clone
    28272,      -- Pig
    118,        -- Sheep
    61305,      -- Cat
    61721,      -- Rabbit
    61780,      -- Turkey
    28271,      -- Turtle
    20066,      -- Repentance
    --605,      -- Mind Control
    51514,      -- Hex-
    5782,       -- Fear
    118699,     -- Fear
    199786,     -- Glacial Spike
    --214634,       -- EbonBolt
    --202771,       -- FullMoon
    210714, --icefury
    203286, -- greater pyroblast
    -- 202771,  -- full moon
    116858,  -- chaos bolt
    323673, -- mind games
    212295, --death bolt
}

function _shouldReflect(unit)
    local castDest = UnitSpellTarget(unit);
    for i=1, #groundCC do
        if UnitCastingInfo(unit) and UnitCastingInfo(unit) == GetSpellInfo(groundCC[i]) and _castTimeLeft(unit) <= ((select(3,GetNetStats())/1000)+.3)+0.1 then
            if _unitIsUnit("player",castDest) then
                return true;
            end
        end
    end
    if UnitChannelInfo(unit)==GetSpellInfo(323764) and _isCasterDps(unit) then return true; end
end

disarm={
--DK
    51271, -- Pillar of Frost
    152279, -- Breath of Sindragosa
    207127, -- Hungering Rune Weapon
    207256, -- Obliteration
    207289, -- Unholy Frenzy
--DH
    188501, -- Spectral Sight
    211048, -- Chaos Blades
--Druid
    5217, -- Tiger's Fury
    10254, -- Incarnation: King of the Jungle
    106951, -- Berserk
--Paladin
    31884, -- Avenging Wrath (Protection/Retribution)
    231895, -- Crusade (Retribution Talent)
--Rogue
    13750, -- Adrenaline Rush
    51690, -- Killing Spree
    79140, -- Vendetta
    121471, -- Shadow Blades
    207736, -- Shadowy Duel
--Shaman
    204366, -- Thundercharge
    204945, -- Doom Winds
    114051, -- Ascendance (Enhancement)
--Warrior
    1719, -- Recklessness
    107574, -- Avatar
--general
    277185, --Gladiator's Badge
}

function _shouldDisarm(u)
    lf=100;
    for i=1,#disarm do if UnitBuffID(u,disarm[i]) and _isMeleeDps(u) then return true; end end
    if roster then
        for i=1,#roster do if UnitIsPlayer(roster[i].Unit) then
            lf=_actualHp(roster[i].Unit);
        end end
    end
    if lf<=75 and _isMeleeDps(u) then
        return true;
    end
end

function _isDisarmed(u)
    for i=1,#drDisarm do
        if UnitDebuffID(u,drDisarm[i]) then return true; end
    end
end


csHeals = {
    740,            -- Tranquility
    8936,           -- Regrowth
    48438,          -- Wild Growth
    33786,          -- Cyclone
    --209753,         --clone
    5176,           -- Wrath--
    82326,          -- Holy Light
    19750,          -- Flash of Light
    85222,          -- Light of Dawn
    2061,           -- Flash Heal
    32546,          -- Binding Heal
    2060,           -- Greater Heal
    47540,          -- Penanace --Never kick penance.
    64843,          -- Divine Hymn
    8004,           -- Healing Surge
    77472,          -- Greater Healing Wave
    51514,          -- Hex
    207778,         -- gift of the queen
    116670,         -- Uplift(monk)
    -- 123273,         -- Surging Mist
    -- 85673,          -- Word of Glory
    33076,          -- Prayer of Mending
    152118,         -- Clarity of will
    -- 152116,         -- Saving Grace
    186263,         -- Shadow Mend
    124682,         -- Enveloping Mist
    115175,         -- Soothing mist
    205406,         -- sheiluns gift
    66066,          -- Nourish
    1064,           -- chain heal
}

csAlways = {
    --Resurrections--
    2006,
    7328,
    2008,
    50769,
    115310,
    113724, -- Ring of Frost
    323764, --convoke
    323673,
    204437 --lasso
}

csDamage={
    203286, -- greater pyroblast
    116858,  -- chaos bolt
    34914,  -- vt (idk, remove)
    30108, -- UA
    342938, --ua
    316099, --ua+
    212295, --death bolt
}

csBigDamage={
    116858, -- chaos bolt
    203286, -- greater pyroblast
    202771, -- full moon
    214634,     -- EbonBolt
    210714, --Icefury
    199786,     -- Glacial Spike
    211714, -- thalkiels consumption
}

csCC = {
    -- Incapacitates
    2637,    -- Hibernate
    118,    -- Polymorph
    28271,    -- Polymorph (Turtle)
    28272,    -- Polymorph (Pig)
    61025,    -- Polymorph (Snake)
    61305,    -- Polymorph (Black Cat)
    61780,    -- Polymorph (Turkey)
    61721,    -- Polymorph (Rabbit)
    126819,    -- Polymorph (Porcupine)
    161353,    -- Polymorph (Polar Bear Cub)
    161354,    -- Polymorph (Monkey)
    161355,    -- Polymorph (Penguin)
    161372,    -- Polymorph (Peacock)
    277787,    -- Polymorph (Baby Direhorn)
    277792,    -- Polymorph (Bumblebee)
    20066,    -- Repentance
    51514,    -- Hex
    ----
    33786,       -- Cyclone
    1513,       -- Scare Beast
    605,       -- Mind Control
    118699,       -- Fear
    261589,       -- Seduction (Grimoire of Sacrifice)
    6358,       -- Seduction (Succubus)
}

function _shouldGround(unit)

    --lowest friend
    lowestFriend=_hpWithShield(roster[1].Unit);

    --lowest enemy
    lowestEnemy = 100;
    for i=1,#enemiesList do if UnitIsPlayer(enemiesList[i]) and _hpWithShield(enemiesList[i]) < lowestEnemy then
        lowestEnemy=_hpWithShield(enemiesList[i]);
    end end

    --isplayer and doesnt have grounding buff
    if UnitIsPlayer(unit) and not UnitBuffID(unit,8178) then

        --latency & travel time delay
        interruptNetDelay = interruptNetDelay or ((select(3,GetNetStats())/1000)+.2);

        --casts
        if ((UnitCastingInfo(unit) and (_castPctDone(unit) >= 0 or _castTimeLeft(unit) <= gcd+interruptNetDelay)))  then

            --healer in cc
            healerInCC=false;
            if ourHealer and UnitExists(ourHealer) and _CCcheck(ourHealer)>0 then healerInCC=true; end

            --cast destination
            castDest=nil;
            castDest=UnitSpellTarget(unit)
            if not ObjectExists(castDest) then castDest="self"; end


            if UnitCastingFrom(unit,csCC) then

                --kick disorients on our healer
                if ourHealer then
                    if _unitIsUnit(castDest,ourHealer) and _distance(unit)<=29 then
                        return true;
                    end
                end

                if not ourHealer then
                    return true;
                end

                --kick disorient peels
                if not ourHealer or not _unitIsUnit(castDest,ourHealer) and _distance(castDest)<=29 then
                    if (lowestEnemy < 35) then
                        return true;
                    end
                end

            end

            --Cs heavy damage
            if lowestFriend < 80 or healerInCC then
                if UnitCastingFrom(unit,csBigDamage) then
                    return true;
                end
            end

            --kicking damage
            if (lowestFriend < 60 or (healerInCC and lowestFriend < 95)) then

                --Cs lite damage
                if UnitCastingFrom(unit,csDamage) then
                    return true;
                end

                --scorch or fireball (with combustion up)
                if (UnitCastingInfo(unit) == GetSpellInfo(2948) or UnitCastingInfo(unit) == GetSpellInfo(133)) and UnitBuffID(unit,190319) then
                    return true;
                end

            end

        end
    end
end


-- @param int, provided value will kick regardless of being interruptable or not.
-- @param pct, number value 0-100, will override the global kick settings.
function _shouldCS(unit,override)

    if not UnitCanAttack("player",unit) then return false; end

    --lowest friend
    lowestFriend=_hpWithShield(roster[1].Unit);

    kc.kickdelay=kc.kickdelay or 10;
    kc.channeldelay=kc.channeldelay or 100;

    --lowest enemy
    lowestEnemy = 100;
    for i=1,#enemiesList do if UnitIsPlayer(enemiesList[i]) and _hpWithShield(enemiesList[i]) < lowestEnemy then
        lowestEnemy=_hpWithShield(enemiesList[i]);
    end end

    --isplayer and doesnt have grounding buff
    if UnitIsPlayer(unit) and not UnitBuffID(unit,8178) then

        --latency & travel time delay
        interruptNetDelay = interruptNetDelay or ((select(3,GetNetStats())/1000)+.2);

        --casts
        if ((UnitCastingInfo(unit) and (_castPctDone(unit) >= kc.kickdelay or _castTimeLeft(unit) <= interruptNetDelay) and select(8,UnitCastingInfo(unit))==false) 
        --channels
        or (UnitChannelInfo(unit) and (_castMsDone(unit) >= kc.channeldelay or _castTimeLeft(unit) <= interruptNetDelay)) and select(7,UnitChannelInfo(unit))==false) then

            --healer in cc
            healerInCC=false;
            if ourHealer and UnitExists(ourHealer) and _CCcheck(ourHealer)>0 then healerInCC=true; end
            if not ourHealer or not UnitExists(ourHealer) then healerInCC=true; end

            --cast destination
            castDest=nil;
            castDest=UnitSpellTarget(unit)
            if not ObjectExists(castDest) then castDest="self"; end

            if UnitBuffID(castDest,8178) and UnitIsFriend("player",castDest) then return false; end

            if UnitCastingFrom(unit,csCC) then

                --kick disorients on our healer
                if ourHealer then
                    if _unitIsUnit(castDest,ourHealer) then
                        return true;
                    end
                end

                if not ourHealer then
                    return true;
                end

                --kick disorient peels
                if not ourHealer or not _unitIsUnit(castDest,ourHealer) then
                    if (lowestEnemy < 55) then
                        return true;
                    end
                end

            end

            --always cs
            if UnitCastingFrom(unit,csAlways) then
                return true;
            end

            --cs heals
            if _isHealer(unit) or not arena then

                if lowestEnemy <= 75 or not arena then
                    if UnitCastingFrom(unit,csHeals) then
                        return true;
                    end
                end

            end
            
            --cs mass dispel (if friend in block / bubble)
            friendImmune=nil;
            for i=1,#players do if UnitBuffID(players[i].Unit,45438) or UnitBuff(players[i].Unit,642) then
                friendImmune=true;
            end end

            if friendImmune then
                if UnitCastingInfo(unit) == "Mass Dispel" then
                    return true;
                end
            end

            --Cs heavy damage
            if lowestFriend < 95 or healerInCC then
                if UnitCastingFrom(unit,csBigDamage) then
                    return true;
                end
            end

            --kicking damage
            if (lowestFriend < 60 or (healerInCC and lowestFriend < 95)) then

                --Cs lite damage
                if UnitCastingFrom(unit,csDamage) then
                    return true;
                end
        
                --scorch or fireball (with combustion up)
                if (UnitCastingInfo(unit) == GetSpellInfo(2948) or UnitCastingInfo(unit) == GetSpellInfo(133)) and UnitBuffID(unit,190319) then
                    return true;
                end

            end

            --flash of light offheal (very low hp)
            if UnitCastingInfo(unit) == GetSpellInfo(19750) and _hpWithShield(unit) < 20 then
                return true;
            end

            --cs anything low friend
            -- if lowestFriend <= 60 and not _isHealer(unit) and _isCasterDps(unit) then
            --  return true;
            -- end

        end
    end
end

-- @param int, provided value will kick regardless of being interruptable or not.
-- @param pct, number value 0-100, will override the global kick settings.
function _interruptAll(unit)

    if kc.kickdelay>100 then return false; end

    kc.kickdelay=kc.kickdelay or 10;
    kc.channeldelay=kc.channeldelay or 100;
    
    --latency & travel time delay
    interruptNetDelay = interruptNetDelay or ((select(3,GetNetStats())/1000)+.2);

    --casts
    if ((UnitCastingInfo(unit) and (_castPctDone(unit) >= kc.kickdelay or _castTimeLeft(unit) <= interruptNetDelay) and select(8,UnitCastingInfo(unit))==false) 
    --channels
    or (UnitChannelInfo(unit) and (_castMsDone(unit) >= kc.channeldelay or _castTimeLeft(unit) <= interruptNetDelay)) and select(7,UnitChannelInfo(unit))==false) then
        return true;
    end

end


function _instantKick(unit)


    --lowest friend
    lowestFriend=_hpWithShield(roster[1].Unit);

    kc.kickdelay=kc.kickdelay or 10;
    kc.channeldelay=kc.channeldelay or 100;

    --lowest enemy
    lowestEnemy = 100;
    for i=1,#enemiesList do if UnitIsPlayer(enemiesList[i]) and _hpWithShield(enemiesList[i]) < lowestEnemy then
        lowestEnemy=_hpWithShield(enemiesList[i]);
    end end

    --isplayer and doesnt have grounding buff
    if UnitIsPlayer(unit) and not UnitBuffID(unit,8178) then

        --latency & travel time delay
        interruptNetDelay = interruptNetDelay or ((select(3,GetNetStats())/1000)+.2);

        --casts
        if ((UnitCastingInfo(unit) and (_castPctDone(unit) >= 0 or _castTimeLeft(unit) <= interruptNetDelay) and select(8,UnitCastingInfo(unit))==false) 
        --channels
        or (UnitChannelInfo(unit) and (_castMsDone(unit) >= 0 or _castTimeLeft(unit) <= interruptNetDelay)) and select(7,UnitChannelInfo(unit))==false) then

            --healer in cc
            healerInCC=false;
            if ourHealer and UnitExists(ourHealer) and _CCcheck(ourHealer)>0 then healerInCC=true; end

            --cast destination
            castDest=nil;
            castDest=UnitSpellTarget(unit)
            if not ObjectExists(castDest) then castDest="self"; end

            if UnitBuffID(castDest,8178) and UnitIsFriend("player",castDest) then return false; end

            if UnitCastingFrom(unit,csCC) then

                --kick disorients on our healer
                if ourHealer then
                    if _unitIsUnit(castDest,ourHealer) then
                        return true;
                    end
                end

                if not ourHealer then
                    return true;
                end

                --kick disorient peels
                if not ourHealer or not _unitIsUnit(castDest,ourHealer) then
                    if (lowestEnemy < 55) then
                        return true;
                    end
                end

            end

            --always cs
            if UnitCastingFrom(unit,csAlways) then
                return true;
            end

            --cs heals
            if _isHealer(unit) or not arena then

                if lowestEnemy <= 100 or not arena then
                    if UnitCastingFrom(unit,csHeals) then return true; end
                end

            end
            
            --cs mass dispel (if friend in block / bubble)
            friendImmune=nil;
            for i=1,#players do if UnitBuffID(players[i].Unit,45438) or UnitBuff(players[i].Unit,642) then
                friendImmune=true;
            end end

            if friendImmune then
                if UnitCastingInfo(unit) == "Mass Dispel" then
                    return true;
                end
            end

            --Cs heavy damage
            if lowestFriend < 95 or healerInCC then
                if UnitCastingFrom(unit,csBigDamage) then
                    return true;
                end
            end

            --kicking damage
            if (lowestFriend < 60 or (healerInCC and lowestFriend < 95)) then

                --Cs lite damage
                if UnitCastingFrom(unit,csDamage) then
                    return true;
                end
        
                --scorch or fireball (with combustion up)
                if (UnitCastingInfo(unit) == GetSpellInfo(2948) or UnitCastingInfo(unit) == GetSpellInfo(133)) and UnitBuffID(unit,190319) then
                    return true;
                end

            end

            --flash of light offheal (very low hp)
            if UnitCastingInfo(unit) == GetSpellInfo(19750) and _hpWithShield(unit) < 20 then
                return true;
            end

            --cs anything low friend
            -- if lowestFriend <= 60 and not _isHealer(unit) and _isCasterDps(unit) then
            --  return true;
            -- end

        end
    end
end

function _instantKickUnint(unit)


    --lowest friend
    lowestFriend=_hpWithShield(roster[1].Unit);

    kc.kickdelay=kc.kickdelay or 10;
    kc.channeldelay=kc.channeldelay or 100;

    --lowest enemy
    lowestEnemy = 100;
    for i=1,#enemiesList do if UnitIsPlayer(enemiesList[i]) and _hpWithShield(enemiesList[i]) < lowestEnemy then
        lowestEnemy=_hpWithShield(enemiesList[i]);
    end end

    --isplayer and doesnt have grounding buff
    if UnitIsPlayer(unit) and not UnitBuffID(unit,8178) then

        --latency & travel time delay
        interruptNetDelay = interruptNetDelay or ((select(3,GetNetStats())/1000)+.2);

        --casts
        if ((UnitCastingInfo(unit) and (_castPctDone(unit) >= 0 or _castTimeLeft(unit) <= interruptNetDelay)) 
        --channels
        or (UnitChannelInfo(unit) and (_castMsDone(unit) >= 0 or _castTimeLeft(unit) <= interruptNetDelay))) then

            --healer in cc
            healerInCC=false;
            if ourHealer and UnitExists(ourHealer) and _CCcheck(ourHealer)>0 then healerInCC=true; end

            --cast destination
            castDest=nil;
            castDest=UnitSpellTarget(unit)
            if not ObjectExists(castDest) then castDest="self"; end

            if UnitBuffID(castDest,8178) and UnitIsFriend("player",castDest) then return false; end

            if UnitCastingFrom(unit,csCC) then

                --kick disorients on our healer
                if ourHealer then
                    if _unitIsUnit(castDest,ourHealer) then
                        return true;
                    end
                end

                if not ourHealer then
                    return true;
                end

                --kick disorient peels
                if not ourHealer or not _unitIsUnit(castDest,ourHealer) then
                    if (lowestEnemy < 55) then
                        return true;
                    end
                end

            end

            --always cs
            if UnitCastingFrom(unit,csAlways) then
                return true;
            end

            --cs heals
            if _isHealer(unit) or not arena then

                if lowestEnemy <= 100 or not arena then
                    if UnitCastingFrom(unit,csHeals) then return true; end
                end

            end
            
            --cs mass dispel (if friend in block / bubble)
            friendImmune=nil;
            for i=1,#players do if UnitBuffID(players[i].Unit,45438) or UnitBuff(players[i].Unit,642) then
                friendImmune=true;
            end end

            if friendImmune then
                if UnitCastingInfo(unit) == "Mass Dispel" then
                    return true;
                end
            end

            --Cs heavy damage
            if lowestFriend < 95 or healerInCC then
                if UnitCastingFrom(unit,csBigDamage) then
                    return true;
                end
            end

            --kicking damage
            if (lowestFriend < 60 or (healerInCC and lowestFriend < 95)) then

                --Cs lite damage
                if UnitCastingFrom(unit,csDamage) then
                    return true;
                end
        
                --scorch or fireball (with combustion up)
                if (UnitCastingInfo(unit) == GetSpellInfo(2948) or UnitCastingInfo(unit) == GetSpellInfo(133)) and UnitBuffID(unit,190319) then
                    return true;
                end

            end

            --flash of light offheal (very low hp)
            if UnitCastingInfo(unit) == GetSpellInfo(19750) and _hpWithShield(unit) < 20 then
                return true;
            end

            --cs anything low friend
            -- if lowestFriend <= 60 and not _isHealer(unit) and _isCasterDps(unit) then
            --  return true;
            -- end

        end
    end
end

function _ragePurge(unit)
    for i=1,40 do
        if select(4,UnitBuff(unit,i)) == "Magic" then
            return true;
        end
    end
end

function _canRetClean(unit)
    for i=1,40 do
        if select(4,UnitDebuff(unit,i)) == "Disease" or select(4,UnitDebuff(unit,i)) == "Poison" then
            return true;
        end
    end
end

function _hpWithShield(unit)
    if UnitIsVisible(unit) then
        return 100 * (UnitGetTotalAbsorbs(unit)+UnitHealth(unit)) / UnitHealthMax(unit);
    end
    return 100;
end

function _shouldntFace()
    stuns={
    --all stuns in game
    }
    for i=1,#stuns do if UnitDebuffName("player",stuns[i]) then return true; end end
    --iceblock or other buffs
    --if UnitBuffName("player",L["Ice Block"]) then return true; end
end

function rFaceDirection(...)
    --if not _shouldntFace() and not kc.ishealer then
        FaceDirection(...);
    --end
end

function rTargetUnit(...)
    if not iamhealing then
        if not pickRandomTarget then
            pickRandomTarget=0.2+(math.random(0,10)/100);
        end
        if not lastRandomTarget then lastRandomTarget=GetTime(); end
        if GetTime()-lastRandomTarget>=pickRandomTarget then
            TargetUnit(...)
            lastRandomTarget=GetTime()
            pickRandomTarget=0.2+(math.random(0,10)/100);
        end
    end
end

function rTargetDeadUnit(...)
    if not pickRandomDeadTarget then
        pickRandomDeadTarget=0.2+(math.random(0,10)/100);
    end
    if not lastRandomDeadTarget then lastRandomDeadTarget=GetTime(); end
    if GetTime()-lastRandomDeadTarget>=pickRandomDeadTarget then
        TargetUnit(...)
        lastRandomDeadTarget=GetTime()
        pickRandomDeadTarget=0.2+(math.random(0,10)/100);
    end
end

function rObjectInteract(...)
    if not pickRandomInteract then
        pickRandomInteract=0.2+(math.random(0,10)/100);
    end
    if not lastRandomInteract then lastRandomInteract=GetTime(); end
    if GetTime()-lastRandomInteract>=pickRandomInteract then
        lastRandomInteract=GetTime()
        pickRandomInteract=0.2+(math.random(0,10)/100);
        return ObjectInteract(...)
    end
end

function rClearTarget(...)
    if not pickRandomClear then
        pickRandomClear=0.2+(math.random(0,10)/100);
    end
    if not lastRandomClear then lastRandomClear=GetTime(); end
    if GetTime()-lastRandomClear>=pickRandomClear then
        ClearTarget(...)
        lastRandomClear=GetTime()
        pickRandomClear=0.2+(math.random(0,10)/100);
    end
end

function kcqueue(spell,unit)
    spellqueue=spell;
    unitqueue=unit;
end

function clearspellqueue()
    spellqueue,unitqueue=nil,nil;
end

function _Cast(spellid,unit,notfaceHack,dontCheckFace,immunetype,immunetype2,immunetype3,canbreak)

    notfh = false;

    --mindgames
    if UnitDebuffID("player",323673) and GetSpellEffect(spellid)>100 then return false; end

    if not immunetype then immunetype="none"; end

    if not immunetype2 then immunetype2="none"; end

    if not immunetype3 then immunetype3="none"; end

    if (unit=="player" or not unit) and IsMounted() then return false; end

    if spellid~=8092 and UnitChannelInfo("player") then return; end

    if LastAttemptedTime and GetTime()-LastAttemptedTime<=0.01 then return false; end

    if (not IsUsableSpell(spellid) or (not IsPlayerSpell(spellid) and spellid~=281000 and spellid~=24275 and spellid~=342938 and spellid~=106832 and spellid~=155356 and spellid~=212520 and spellid~=205448 and spellid~=48020 and spellid~=132409 and spellid~=77758 and spellid~=213771)) and spellid~=163201 and spellid~=32379 and spellid~=19647 and spellid~=343355 then return false; end

    if _spellCooldown(spellid) > gcd then return false; end

    local spellName = GetSpellInfo(spellid);

    if kc.debug then
        print(spellName);
    end

    if _castTime(spellid)>0 then notfh = true; end

    if _castTime(spellid)>0 and cantCast and GetTime()-cantCast<0.225 then return false; end

    if _castTimeLeft("player") > 1.5 then return false; end
    
    if unit and not _LoS(unit) and unit~=corpseID then return false; end

    if unit and notfh and not dontCheckFace and not UnitIsFriend("player",unit) then
        if not _amIfacing(unit) then return false; end
    end

    ----
    if _castTime(spellid) <= 0 or not _isMoving("player") or UnitBuffID("player",79206) then
            
            if not unit then
                rCastSpellByID(spellid,"")
                LastAttemptedSpell = spellid;
                LastAttemptedSpellName = spellName;
                LastAttemptedSpellUnit = unit or "player";
                LastAttemptedTime = GetTime();
                if IsPlayerSpell(spellid) then return true; end
            end

            if unit and (_spellInRange(spellid,unit) or spellid==205180) then

                --Cancel if immune and cast time<immune time
                if UnitCanAttack("player",unit) and _ia(unit) and _castTime(spellid)<_ia(unit)+0.1 then
                    return false;
                end

                if immunetype=="Magic" or immunetype2=="Magic" or immunetype3=="Magic" then
                    if UnitCanAttack("player",unit) and _im(unit) and _castTime(spellid)<_im(unit)+0.1 then
                        return false;
                    end
                end

                if immunetype=="Slow" or immunetype2=="Slow" or immunetype3=="Slow" then
                    if UnitCanAttack("player",unit) and _its(unit) and _castTime(spellid)<_its(unit)+0.1 then
                        return false;
                    end
                end

                if not canbreak then
                    if UnitCanAttack("player",unit) and _b(unit) and _castTime(spellid)<_b(unit)+0.1 then
                        return false;
                    end
                end

                --facehack cast
                if not _amIfacing(unit) and not notfaceHack then
                    if IsUsableSpell(spellid) then
                        rFacingCastSpellByID(unit,spellid)
                    end
                else
                    rCastSpellByID(spellid,unit);
                end
                LastAttemptedSpell = spellid;
                LastAttemptedSpellName = spellName;
                LastAttemptedSpellUnit = unit or "player";
                if _castTime(spellid)>0 then LastAttemptedCast = unit; end
                LastAttemptedTime = GetTime();
                if IsPlayerSpell(spellid) then return true; end
            end

    end


    return false;

end

function _castID(u)
    return select(9,UnitCastingInfo(u)) or nil;
end

function UnitSpellTarget(u)
    if UnitExists(u) then
        return wmbapi.UnitCastingTarget(u);
    end
end

function _anglesBetweenObjects(unit1,unit2)
    local fX, fY, fZ = ObjectPosition(unit1);
    local sX, sY, sZ = ObjectPosition(unit2);
    return math.atan2(sY-fY,sX-fX)%(math.pi*2),math.atan((sZ-fZ)/math.sqrt(((fX-sX)^2)+((fY - sY)^2)))%(math.pi*2);
end

mdIDs = {
    118, -- Polymorph
    28272, -- Polymorph (pig)
    28271, -- Polymorph (turtle)
    61305, -- Polymorph (black cat)
    61025, -- Polymorph (serpent) -- FIXME: gone ?
    61721, -- Polymorph (rabbit)
    61780, -- Polymorph (turkey)
    161355,    -- Polymorph (Penguin)
    161354,    -- Polymorph (Monkey)
    277792,    -- Polymorph (Bumblebee)
    277787,    -- Polymorph (Baby Direhorn)
    277792, -- poly
    33786,  --Cyclone
    --209753, --Clone
    3355, -- FreezingTrap
    853, --hoj
    8122, -- Psychic Scream
    118699, -- Fear
    5782, -- Fear
    294127, --Maledict
    20066, --repent
}

function _priestMD(unit)
    for i=1,#mdIDs do if _debuffRemains(unit,mdIDs[i]) >= 3.5 then
        return mdIDs[i];
    end end
end

dispellableCC = {
209749, --Faerie Swarm
3355, -- Freezing Trap
118, -- Polymorph
28272, -- Polymorph (pig)
28271, -- Polymorph (turtle)
61305, -- Polymorph (black cat)
61025, -- Polymorph (serpent) -- FIXME: gone ?
61721, -- Polymorph (rabbit)
61780, -- Polymorph (turkey)
161355,    -- Polymorph (Penguin)
161354,    -- Polymorph (Monkey)
277792,    -- Polymorph (Bumblebee)
277787,    -- Polymorph (Baby Direhorn)
82691, -- Ring of Frost
31661,       -- Dragon's Breath
853, -- Hammer of Justice
105421, -- Blinding Light
20066, -- Repentance
64044, -- Psychic Horror (Horrify effect)
 15487,--Priest silence
8122, -- Psychic Scream
205369, -- Mind Bomb
226943, -- Mind Bomb
118699, -- Fear -- new SpellID in MoP, Blood Fear uses same ID
5484, -- Howl of Terror
6789, -- Mortal Coil
6358, -- Seduction (Succubus)
115268, -- Mesmerize (Shivarra) -- FIXME: verify this is the correct category
30283, -- shadowfury
179057, -- Chaos Nova
323673, -- mind games


}

 ccProt = {
    34914,      --VampiricTouch
    30108,      --UA
    342938, --ua
    316099, --ua
}

rootDispels = {
    339, -- Entangling Roots                    (druid, general)
    122, -- Frost Nova                          (mage, general)
    33395, -- Freeze                              (mage, frost)
    102359, -- Mass Entanglement                   (druid, PVE talent, general)
    157997, -- Ice Nova                            (mage, frost)
    198121, -- Frostbite                           (mage, frost)
    228600, -- Glacial Spike                       (mage, frost)
    285515, -- Surge of Power                      (shaman, elemental)
}

function _priestPurify(unit)
    for i=1,#dispellableCC do
        if ObjectExists(unit) and not UnitCanAttack("player",unit) and _LoS(unit) and UnitDebuffID(unit,dispellableCC[i]) then
            for n=1,#ccProt do
                if not UnitDebuffID(unit,ccProt[n]) and (_debuffRemains(unit,dispellableCC[i]) >= 1.8 or (_CDcheck(unit) and _debuffRemains(unit,dispellableCC[i]) > .8)) then
                    return dispellableCC[i];
                end
            end
        end
    end

    --Dispelling Roots--
    for i=1,#rootDispels do
        if UnitDebuffID(unit,rootDispels[i]) and (_isImmobileDps(unit) or _isHealer(unit)) and select(2,UnitClass(unit)) ~= "DRUID" then
            for n=1,#ccProt do
                if not UnitDebuffID(unit,ccProt[n]) and _debuffRemains(unit,rootDispels[i]) > 2 then
                    return rootDispels[i];
                end
            end
        end
    end

end

function _paladinDispel(unit)
    for i=1,#dispellableCC do
        if ObjectExists(unit) and not UnitCanAttack("player",unit) and _LoS(unit) and UnitDebuffID(unit,dispellableCC[i]) then
            for n=1,#ccProt do
                if not UnitDebuffID(unit,ccProt[n]) and (_debuffRemains(unit,dispellableCC[i]) >= 1.8 or (_CDcheck(unit) and _debuffRemains(unit,dispellableCC[i]) > .8)) then
                    return dispellableCC[i];
                end
            end
        end
    end
end

function _paladinDispelRoot(unit)
    if _rootCheck(unit) and _rootCheck(unit)>2 and select(2,UnitClass(unit)) ~= "DRUID" then return true; end
end

pveDispels={
    320788,
    242391,
}
function _pveDispel(u)
    for i=1,#pveDispels do
        if UnitDebuffID(u,320788) then
            return true;
        end
    end
end


deathCC =
{
    28272,      -- Pig
    118,        -- Sheep
    61305,      -- Cat
    61721,      -- Rabbit
    61780,      -- Turkey
    28271,      -- Turtle
    19386,      -- Wyvern
    20066,      -- repent
    5782,       -- Fear
    118699,     -- Fear
    51514,      -- hex
    339,        -- Entangling roots

}
function _shouldDeath(unit)
    if UnitCastingInfo(unit) and _distance(unit) <= 40 and (not _isHealer("player") or _LoS(unit)) and _spellCooldown(204336) <= 2 then
        local castDest = UnitSpellTarget(unit);
        for i=1,#deathCC do
            if UnitCastingInfo(unit) == GetSpellInfo(deathCC[i]) and _castPctDone(unit) > 92 then
                if _unitIsUnit("player",castDest) then
                    return "use"
                end
            end
            if UnitCastingInfo(unit) == GetSpellInfo(deathCC[i]) and _castPctDone(unit) <= 92 then
                if _unitIsUnit("player",castDest) then
                    --pendingGround=true;
                    return "pending";
                end
            end
        end
    end
end


emdIDs = {
  642, --Divine Shield
  45438, --Ice Block
}

function _mdEnemy(unit)
    for i=1,#emdIDs do if _buffRemains(unit,emdIDs[i]) >= 3.5 then
        return emdIDs[i];
    end end
end

smartPurge =
{
    1022,   --HandOfProtection
    187190,   --HandOfSacrifice
    198111, --tempshield
    10060,  --PowerInfusion
    79206,  --SpiritWalkersGrace
    16166,  --ElementalMastery
    12472,  --IcyVeins
    108839, --IceFloes
    2825,   --Bloodlust
    32182,  --Heroism
    213610, --HolyWard
    196098, --SoulHarvest
    196098, --SoulHarvest
    210294, --Divine Favor
    212295, --Netherward
    236696, --Thorns
    190319, -- Combustion
    198111, --Temp shield
    113858, --dark soul crit
    113860, --dark soul haste
    213610, --Holy Ward

}

purgeHeals = 
{

    774,    --Rejuv
    155777, --Rejuv Germination
    17,     --PW:S
    152118, --Clarity of will
    124682, --Enveloping Mist
}

function _purgeCheck(unit,notheals)
    for i=1,#smartPurge do
        if UnitBuffID(unit,smartPurge[i]) and select(4,UnitBuffID(unit,smartPurge[i])) then
            return true;
        end
    end

    if not notheals then
        for i=1,#purgeHeals do 
            if _hpWithShield(unit) <= 50 and arena and UnitBuffID(unit,purgeHeals[i]) then return true; end
        end
    end

end


function _smartPurgeCheck(unit)
    for i=1,#smartPurge do
        if UnitBuffID(unit,smartPurge[i]) and select(4,UnitBuffID(unit,smartPurge[i])) == "Magic" then
            return smartPurge[i];
        end
    end
end

function _ragePurge(unit)
    for i=1,40 do
        if select(4,UnitBuff(unit,i)) == "Magic" then
            return true;
        end
    end
end

function _runeCount()
    count=0;
    for i=1,6 do if select(3,GetRuneCooldown(i))==true then
        count=count+1;
    end end
    return count
end

----------rotations
function _armsW()

    _createMainTarget()

    validTar=nil;
    for i=1,#mainTarget do
        if _unitIsUnit(mainTarget[i].pointer,"target") then
            validTar=mainTarget[i].pointer;
        end
    end

    if warFearKey then
        _Cast(5246,ccTar,_,_,_,_,_,true);
    end

    if sbKey then
        _Cast(107570,ccTar,_,_,_,_,_,true);
    end

    if bladeStormKey then
        _Cast(227847);
    end

    if kc.autobs and kc.autobs>0 and _numberAround("player",10)>=kc.autobs then
       _Cast(227847);
    end 

    if chargeKey then
        _Cast(100,ccTar,_,_,_,_,_,true);
    end

    if leapKey then
        if _spellCooldown(6544)<=gcd then
            rCastSpellByID(6544);
            if IsAoEPending() then
                CameraOrSelectOrMoveStart();
                CameraOrSelectOrMoveStop();
            end
            if IsAoEPending() then
                CancelPendingSpell();
            end
        end
    end

    --autodisarm
    for i=1,#mainTarget do if _shouldDisarm(mainTarget[i].pointer) then
        _Cast(236077,mainTarget[i].pointer);
    end end

    if disarmKey and ccTar then
        _Cast(236077,ccTar,_,_,_,_,_,true);
    end

    if duelKey and ccTar then
        _Cast(236273,ccTar,_,_,_,_,_,_,true);
    end

    if warbannerKey then
        _Cast(236320);
    end

    if spearKey and validTar then
        _AeCast(307865,validTar,25);
    end

    if kc.autospear and kc.autospear>0 and validTar and _actualHp(validTar)<=kc.autospear then
        _AeCast(307865,validTar,25);
    end

    if kc.autocharge and validTar and _distance(validTar)>=10 then
        _Cast(100,validTar);
    end

    if kc.autoleap and validTar and _distance(validTar)>=10 and _spellCooldown(100)>=3 then
        _AeCast(6544,validTar,40)
    end

    if spearKey and _spellCooldown(307865)<=gcd then return; end

    if bursting and validTar and _meleeRange(validTar) then
        --_useDPStrinket()
        --avatat
        _Cast(107574);
        --sharpen
        _Cast(198817);
    end

    --Interrupt
    for i=1,#mainTarget do
    local u=mainTarget[i].pointer;
        if _shouldCS(u) then
            _Cast(6552,u);
        end
    end

    if not arena and instanceType~="pvp" then
        for i=1,#mainTarget do if _interruptAll(mainTarget[i].pointer) then
            _Cast(6552,mainTarget[i].pointer);
        end end
    end

    --all reflects
    for i=1,#mainTarget do
        if _shouldReflect(mainTarget[i].pointer) and not UnitBuffID("player",227847) then
            _Cast(23920)
        end
    end

    --totem stomp
    local ptotemList = {
    "Spirit Link Totem",
    -- "Ancestral Protection Totem",
    -- "Counterstrike Totem",
    "Skyfury Totem",
    --"Lightning Surge Totem",
    "Grounding Totem",
    "Psyfiend",
    "Capacitor Totem",
    "Earthbind Totem",
    --"Voodoo Totem",
    "Earthgrab Totem",
    "War Banner",
    "Healing Stream Totem",
    --"Earthen Wall Totem",
    "Tremor Totem",
    }
    for i=1,#enemiesCache do
        for n=1,#ptotemList do
            if UnitCanAttack("player",enemiesCache[i]) and ObjectName(enemiesCache[i]) == ptotemList[n] and not UnitIsPlayer(enemiesCache[i]) and not _isPet(enemiesCache[i]) and _LoS(enemiesCache[i]) then
                _Cast(57755,enemiesCache[i]);
                _Cast(7384,enemiesCache[i]);
                _Cast(1464,enemiesCache[i]);
            end
        end
    end


    function _ex(u)

        if smashKey or not kc.nosmash then
            --warbreaker
            if IsPlayerSpell(262161) and _meleeRange(u) then
                _Cast(262161);
            end
            --colossus_smash
            if not IsPlayerSpell(262161) then
                _Cast(167105,u);
            end
        end

        --condemn,if=debuff.colossus_smash.up|buff.sudden_death.react|rage>65
        --overpower,if=charges=2
        needMS=false;
        if _buffStacks("player",7384)==2 then
            needMS=true;
            _Cast(7384,u);
        end

        if _debuffStacks(u,335452,"player")>=2 then
            needMS=true;
            _Cast(7384,u);
        end

        if not needMS then

            --execute
            if UnitPower("player")>=20 then
                rCastSpellByName(GetSpellInfo(163201),u)
            end

        end

        --mortal_strike,if=dot.deep_wounds.remains<=gcd
        if _debuffRemains(262115)<=gcd then
            _Cast(12294,u);
        end

        --overpower
        _Cast(7384,u);


    end

    function _st(u)
        
        if smashKey or not kc.nosmash then
            --warbreaker
            if IsPlayerSpell(262161) and _meleeRange(u) then
                _Cast(262161);
            end
            
            --colossus_smash
            if not IsPlayerSpell(262161) then
                _Cast(167105,u);
            end
        end

        --execute,if=buff.sudden_death.react
        if UnitBuffID("player",52437) then
             rCastSpellByName(GetSpellInfo(163201),u)
        end

        --mortal_strike
        _Cast(12294,u);
    
        --overpower
        _Cast(7384,u);

        --victory rush
        _Cast(34428,u)
        --whirlwind,if=talent.fervor_of_battle.enabled&rage>60
        --slam
        _Cast(1464,u);
    end

    activeEnemies=_numberAround("player",8);
    ravager=IsPlayerSpell(152277)

    if kc.autosb and kc.autosb>0 and validTar and _actualHp(validTar)<=kc.autosb then
        _Cast(107570,validTar);
    end

    --ignorepain
    if kc.ignorepain and _actualHp("player")<=kc.ignorepain then
        _Cast(190456)
    end

    if kc.rally then
        for i=1,#players do if _actualHp(players[i].Unit)<=kc.rally then
            _Cast(97462);
        end end
    end

    if kc.slowall then
        for i=1,#mainTarget do if UnitIsPlayer(mainTarget[i].pointer) and not _slowCheck(mainTarget[i].pointer) then
            _Cast(1715,mainTarget[i].pointer,_,_,"Slow");
        end end
    end

    if validTar and _meleeRange(validTar) then
        StartAttack()
    end
    --sweeping_strikes,if=spell_targets.whirlwind>1&(cooldown.bladestorm.remains>15|talent.ravager.enabled)
    if activeEnemies>1 and (_spellCooldown(227847)>15 or ravager) then
        _Cast(260708);
    end

    --run_action_list,name=hac,if=raid_event.adds.exists
    --run_action_list,name=execute,if=(talent.massacre.enabled&target.health.pct<35)|target.health.pct<20|(targe--t.health.pct>80&covenant.venthyr)
    executelogic,executeOff=false,false
    if validTar then
        if (massacre and _actualHp(validTar)<35) or _actualHp(validTar)<20 or (_actualHp(validTar)>80 and C_Covenants.GetActiveCovenantID()==2) then
            executelogic=true;
        end
    end
    for i=1,#mainTarget do
        if (massacre and _actualHp(mainTarget[i].pointer)<35) or _actualHp(mainTarget[i].pointer)<20 or (_actualHp(mainTarget[i].pointer)>80 and kc.venthyr) then
            executeOff=true;
        end
    end
    --run_action_list,name=single_target
    if executelogic then
        if validTar then
            _ex(validTar)
        end
        for i=1,#mainTarget do
            _ex(mainTarget[i].pointer)
        end
    end
    if validTar then
        _st(validTar)
    end
    for i=1,#mainTarget do
        _st(mainTarget[i].pointer)
    end

    --slow target
    if kc.slowtarget and validTar then
        if not _its(validTar) and not _slowCheck(validTar) and _distance(validTar)<=8 then
            _Cast(12323);
        end
    end

    if kc.slowtarget and validTar then
        if not _its(validTar) and not _slowCheck(validTar) then
            _Cast(1715,validTar);
        end
    end

    --slowall
    if kc.slowall then
        for i=1,#mainTarget do if UnitIsPlayer(mainTarget[i].pointer) and not _its(mainTarget[i].pointer) and not _slowCheck(mainTarget[i].pointer) and _distance(mainTarget[i].pointer)<=8 then
            _Cast(12323);
        end end
    end

end

function _furyW()

end

function _protW()

end

stuns={
210141,            -- Zombie Explosion
108194,            -- Asphyxiate (Unholy)
221562,            -- Asphyxiate (Blood)
91800,            -- Gnaw (Ghoul)
91797,            -- Monstrous Blow (Mutated Ghoul)
287254,            -- Dead of Winter
179057,            -- Chaos Nova
--      [213491,            -- Demonic Trample (Only DRs with itself once)
205630,            -- Illidan's Grasp (Primary effect)
208618,            -- Illidan's Grasp (Secondary effect)
211881,            -- Fel Eruption
200166,            -- Metamorphosis (PvE stun effect)
203123,            -- Maim
163505,            -- Rake (Prowl)
5211,            -- Mighty Bash
202244,            -- Overrun
24394,            -- Intimidation
119381,            -- Leg Sweep
202346,            -- Double Barrel
853,            -- Hammer of Justice
64044,            -- Psychic Horror
200200,            -- Holy Word: Chastise Censure
1833,            -- Cheap Shot
408,            -- Kidney Shot
118905,            -- Static Charge (Capacitor Totem)
118345,            -- Pulverize (Primal Earth Elemental)
204437,            -- Lightning Lasso
89766,            -- Axe Toss
171017,            -- Meteor Strike (Infernal)
171018,            -- Meteor Strike (Abyssal)
--      [22703,            -- Infernal Awakening (doesn't seem to DR)
30283,            -- Shadowfury
46968,            -- Shockwave
132168,            -- Shockwave (Protection)
145047,            -- Shockwave (Proving Grounds PvE)
132169,            -- Storm Bolt
199085,            -- Warpath
--      [213688,            -- Fel Cleave (doesn't seem to DR)
20549,            -- War Stomp (Tauren)
255723,            -- Bull Rush (Highmountain Tauren)
287712,            -- Haymaker (Kul Tiran)
280061,            -- Brainsmasher Brew (Item)
245638,            -- Thick Shell (Item)
64044, -- Psychic Horror (Horrify effect)
}

silence={
47476,         -- Strangulate
204490,         -- Sigil of Silence
--      [78675]   = "silence",         -- Solar Beam (doesn't seem to DR)
202933,         -- Spider Sting
217824,         -- Shield of Virtue
15487,         -- Silence
1330,         -- Garrote
196364,         -- Unstable Affliction Silence Effect
}

function _shouldSanc(u)
    for i=1,#stuns do if _debuffRemains(u,stuns[i])>=3 then
        return true;
    end end
    for i=1,#silence do if _isHealer(u) and _debuffRemains(u,silence[i])>=2 then
        return true;
    end end
end

function _protPal()
    --aoe
    --Cast Consecration Icon Consecration IF you are not standing in it.
    --Cast Avenger's Shield Icon Avenger's Shield.
    --Cast Judgment Icon Judgment.
    --Cast Hammer of Wrath Icon Hammer of Wrath.
    --Cast Hammer of the Righteous Icon Hammer of the Righteous/Blessed Hammer Icon Blessed Hammer.
    --Refresh Consecration Icon Consecration if everything else is on cooldown.

    _createMainTarget();

    dontFreedom=false;
    if arena then
        for i=1,#enemiesCache do if _isMoonkin(enemiesCache[i]) and not _beamed(enemiesCache[i]) then
            dontFreedom=true;
        end end
    end

    validTar=nil;
    for i=1,#mainTarget do
        if _unitIsUnit(mainTarget[i].pointer,"target") then
            validTar=mainTarget[i].pointer;
        end
    end

    holypower=UnitPower("player",9)
    holyavenger=UnitBuffID("player",105809);
    avengingwrath=UnitBuffID("player",31884);
    crusade=UnitBuffID("player",231875);
    crusaderjudgement=IsPlayerSpell(204023)
    activeEnemies=_numberAround("player",8);

    finalreckoning=false;
    if validTar and UnitDebuffID(validTar,323721) then
        finalreckoning=true;
    end

    executionsentence=false;
    if validTar and UnitDebuffID(validTar,343527) then
        executionsentence=true;
    end

    consup=false;
    if validTar and UnitDebuffID(validTar,204242) then
        consup=true;
    end

    tthpg=_spellCooldown(35395);

    --taunt trap
    if groundTrap and GetTime()-groundTrap <= 2.5 and (_pvpDpsOnUnit("player") == 0 or _hpWithShield("player") > 90) then
        if ObjectExists(groundTrapSource) then
            local traveltime=1.5
            if GetTime()-groundTrap <= traveltime then
                for i=1,#mainTarget do
                    if _isPet(mainTarget[i].pointer) then
                        _Cast(62124,mainTarget[i].pointer,_,_,"Magic");
                    end
                end
            end
        end
    end


  function _gen(u)
        _finisher(u)
        --H 14.84   judgment,target_if=min:debuff.judgment.remains,if=charges=2|!talent.crusaders_judgment.enabled
        if GetSpellCharges(275779)==2 or not crusaderjudgement then
            _Cast(275779,u,_,_,"Magic");
        end
        --I 34.38   hammer_of_wrath
        _Cast(24275,u,_,_,"Magic")
        --0.00  blessing_of_the_seasons
        --J 30.72   avengers_shield
        if instanceType~="pvp" or (not IsPlayerSpell(215652) or _spellCooldown(215652)>15) then
            _Cast(31935,u,_,_,"Magic")
        end
        --K 68.72   judgment,target_if=min:debuff.judgment.remains
        _Cast(275779,u,_,_,"Magic")
        --0.00  vanquishers_hammer
        --L 8.96    consecration,if=!consecration.up
        if _meleeRange(u) and not UnitBuffID("player",188370) then
            _Cast(26573);
        end
        --0.00  divine_toll
        --0.00  blessed_hammer,strikes=2.4,if=charges=3
        --M 1.93    ashen_hallow
        --N 7.08    hammer_of_the_righteous,if=charges=2
        if _meleeRange(u) then
            rCastSpellByName("Blessed Hammer")
        end
        if GetSpellCharges(53595)==2 then
            _Cast(53595,u,_,_,"Magic");
        end
        --0.00  word_of_glory,if=buff.vanquishers_hammer.up
        --0.00  blessed_hammer,strikes=2.4
        --O 55.02   hammer_of_the_righteous
        _Cast(53595,u,_,_,"Magic")
        --0.00  lights_judgment
        --0.00  arcane_torrent
        --P 29.06   consecration
        --Q 5.84    word_of_glory,if=buff.shining_light_free.up&!covenant.necrolord
        _Cast(35395,u,_,_,"Magic");
    end

    function _finisher(u)
        --seraphim
        if _spellCooldown(31884)>=45 or bursting then
            if tthpg<=gcd and u and _meleeRange(u) then
                _Cast(152262);
            end
        end
        if _buffRemains("player",132403)<=1.755 then
            --F 72.01   shield_of_the_righteous,if=debuff.judgment.up
            if UnitDebuffID(u,197277,"PLAYER") and _meleeRange(u) and not _im(u) and not _ia(u) then
                _Cast(53600)
            end
            --G 20.25   shield_of_the_righteous,if=holy_power=5|buff.holy_avenger.up|holy_power=4&talent.sanctified_wrath.enabled&buff.avenging_wrath.up
            if _meleeRange(u) and (holypower==5 or (holypower==4 and avengingwrath)) and not _im(u) and not _ia(u) then
                _Cast(53600)
            end
        end
    end

    --auto_attack
    if validTar and _meleeRange(validTar) then
        StartAttack();
    end

    if kc.autotaunt then
        for i=1,#mainTarget do
            for n=1,#players do 
                if not _unitIsUnit("player",players[n].Unit) and _unitIsUnit(UnitTarget(mainTarget[i].pointer),players[n].Unit) then
                    _Cast(62124,mainTarget[i].pointer,true,true);
                end
            end
        end
    end

    --rebuke
    for i=1,#mainTarget do if _shouldCS(mainTarget[i].pointer) then
        _Cast(96231,mainTarget[i].pointer);
    end end

    --shield interrupt pvp
    for i=1,#mainTarget do if (_spellCooldown(96231)>gcd or _distance(mainTarget[i].pointer)>8) and _shouldCS(mainTarget[i].pointer) then
        _Cast(215652)
        _Cast(31935,mainTarget[i].pointer)
    end end

    if not arena and instanceType~="pvp" then
        for i=1,#mainTarget do if _interruptAll(mainTarget[i].pointer) then
            _Cast(96231,mainTarget[i].pointer);
        end end
    end

    if kc.loh and players then
        if _actualHp(players[1].Unit)<=kc.loh and not UnitDebuffID(players[1].Unit,25771) then
            _Cast(633,players[1].Unit);
        end
    end

    --hoj
    if hojKey and ccTar then
        _Cast(853,ccTar,_,_,_,_,_,true);
    end 

    --hoj
    if bubbleKey then
        _Cast(642);
    end 

    --healer in cc
    healerexists=true
    if not ourHealer or not UnitExists(ourHealer) then healerexists=false; end
    --sanc
    for i=1,#players do if _shouldSanc(players[i].Unit) and (_isHealer(players[i].Unit) or not healerexists) then
        _Cast(210256,players[i].Unit);
    end end

    if kc.bubble then
        if _actualHp("player")<=kc.bubble then
            _Cast(642)
        end
        for i=1,#players do if _actualHp(players[i].Unit)<=kc.bubble and UnitIsPlayer(players[i].Unit) then
            _Cast(228049,players[i].Unit);
        end end
    end

    if kc.bop then
        for i=1,#players do if _actualHp(players[i].Unit)<=kc.bop then
            _Cast(1022,players[i].Unit);
        end end
    end

    --sacHp
    --healer in cc
    healerCCed=false;
    if ourHealer and UnitExists(ourHealer) and _CCcheck(ourHealer)>0 then healerCCed=true; end
    if not ourHealer or not UnitExists(ourHealer) then healerCCed=true; end

    if healerCCed and _actualHp("player")>80 then
        for i=1,#players do if _actualHp(players[i].Unit)<=60 then
            _Cast(6940,players[i].Unit);
        end end
    end

    if not ourHealer and _actualHp("player")>80 then
        for i=1,#players do if _actualHp(players[i].Unit)<=60 then
            _Cast(6940,players[i].Unit);
        end end
    end

    --bop blind and karma debuff
    for i=1,#players do if (UnitDebuffID(players[i].Unit,2094) or UnitDebuffID(players[i].Unit,122470)) and select(2,UnitClass(players[i].Unit)) ~= "PALADIN" then
        _Cast(1022,players[i].Unit);
    end end

    --freedomself
    if kc.freedomself then
        if (_slowCheck("player") or _rootCheck("player")) and validTar and _distance(validTar)>=10 then
            if not IsPlayerSpell(305394) then
                if UnitDebuffID("player",102359) or not dontFreedom then
                    _Cast(1044,"PLAYER");
                end
            end
            if IsPlayerSpell(305394) then
                for i=1,#players do if not _unitIsUnit("player",players[i].Unit) then
                    if UnitDebuffID(players[i].Unit,102359) or not dontFreedom then
                        _Cast(1044,players[i].Unit);
                    end
                end end
            end
        end
    end

    --freedom friendly team
    if kc.freedomteam then
        for i=1,#players do if not _unitIsUnit("player",players[i].Unit) and _isMeleeDps(players[i].Unit) then
            for n=1,#mainTarget do if _unitIsUnit(mainTarget[n].pointer,UnitTarget(players[i].Unit)) then
                if _distance(mainTarget[n].pointer,UnitTarget(players[i].Unit))>=10 and (_slowCheck(players[i].Unit) or _rootCheck(players[i].Unit)) then
                    if UnitDebuffID(players[i].Unit,102359) or not dontFreedom then
                        _Cast(1044,players[i].Unit);
                    end
                end
            end end
        end end
    end

    if kc.retslow then
        if validTar and not _slowCheck(validTar) and _distance(validTar)>=10 then
            _Cast(183218,validTar,_,_,"Magic","Slow");
        end
    end


    --ret healing key
    if healKey then
        for i=1,#players do if _actualHp(players[i].Unit)<=85 then
            _Cast(85673,players[i].Unit);
        end end
        for i=1,#players do
            _Cast(19750,players[i].Unit);
        end
    end

    if kc.eyepercent>0 then
        if _actualHp("player")<=kc.eyepercent then
            _Cast(205191);
        end
    end

    if kc.shieldpercent>0 then
        if _actualHp("player")<=kc.shieldpercent then
            _Cast(184662);
        end
    end


    if kc.autowog and not kc.wogself then
        for i=1,#players do if _actualHp(players[i].Unit)<=kc.wogpercent then
            _Cast(85673,players[i].Unit);
        end end
        if healerCCed and arena then
            for i=1,#players do if _actualHp(players[i].Unit)<=kc.wogpercent+40 and _actualHp(players[i].Unit)<=90 then
                _Cast(85673,players[i].Unit);
            end end
        end
    end

    if kc.autowog and kc.wogself then
        if _actualHp("player")<=kc.wogpercent then
            _Cast(85673,"PLAYER");
        end
        if healerCCed and arena then
            if _actualHp("player")<=kc.wogpercent+40 and _actualHp("player")<=90 then
                _Cast(85673,"PLAYER");
            end
        end
    end

    --prot offhealing key
    if healKey then
        for i=1,#players do
            _Cast(85673,players[i].Unit);
        end
        for i=1,#players do
            _Cast(19750,players[i].Unit);
        end
    end

    if bursting then
        _Cast(31884)
        _Cast(304971)
    end

    if arena and _actualHp("player")>80 then
        for i=1,#players do if _actualHp(players[i].Unit)<=60 then
            _Cast(6940,players[i].Unit);
        end end
    end

    --call_action_list,name=cooldowns
    --call_action_list,name=generators
    if validTar then
        _gen(validTar);
    end

    for i=1,#mainTarget do
        _gen(mainTarget[i].pointer);
    end 

    correctStance=nil;
    if kc.devotion then
        correctStance=2;
    elseif kc.conc then
        correctStance=3;
    end

    if correctStance and GetShapeshiftForm()~=correctStance then
        CastShapeshiftForm(correctStance);
    end

end

function _retP()

    _createMainTarget();

    dontFreedom=false;
    if arena then
        for i=1,#enemiesCache do if _isMoonkin(enemiesCache[i]) and not _beamed(enemiesCache[i]) then
            dontFreedom=true;
        end end
    end

    validTar=nil;
    for i=1,#mainTarget do
        if _unitIsUnit(mainTarget[i].pointer,"target") then
            validTar=mainTarget[i].pointer;
        end
    end

    holypower=UnitPower("player",9)
    holyavenger=UnitBuffID("player",105809);
    avengingwrath=UnitBuffID("player",31884);
    crusade=UnitBuffID("player",231875);
    activeEnemies=_numberAround("player",8);
    if _numberAround("player",30)<=5 then
        judgementEnemies=_numberAround("player",30);
    elseif _numberAround("player",30)>5 then
        judgementEnemies=5;
    end

    finalreconing=false;
    if validTar and UnitDebuffID(validTar,323721) then
        finalreckoning=true;
    end

    executionsentence=false;
    if validTar and UnitDebuffID(validTar,343527) then
        executionsentence=true;
    end

    judgementup=false;
    if validTar and UnitDebuffID(validTar,197277) then
        judgementup=true;
    end

    consup=false;
    if validTar and UnitDebuffID(validTar,204242) then
        consup=true;
    end

    tthpg=_spellCooldown(35395);

    --taunt trap
    if groundTrap and GetTime()-groundTrap <= 2.5 and (_pvpDpsOnUnit("player") == 0 or _hpWithShield("player") > 90) then
        if ObjectExists(groundTrapSource) then
            local traveltime=_trapTravelTime(groundTrapSource);
            if GetTime()-groundTrap <= traveltime then
                for i=1,#mainTarget do
                    if _isPet(mainTarget[i].pointer) then
                        _Cast(62124,mainTarget[i].pointer,_,_,"Magic");
                    end
                end
            end
        end
    end

    if kc.loh and players then
        if _actualHp(players[1].Unit)<=kc.loh and not UnitDebuffID(players[1].Unit,25771) then
            _Cast(633,players[1].Unit);
        end
    end


    --totem stomp
    local ptotemList = {
    "Spirit Link Totem",
    -- "Ancestral Protection Totem",
    -- "Counterstrike Totem",
    "Skyfury Totem",
    --"Lightning Surge Totem",
    "Grounding Totem",
    "Psyfiend",
    "Capacitor Totem",
    "Earthbind Totem",
    --"Voodoo Totem",
    "Earthgrab Totem",
    "War Banner",
    "Healing Stream Totem",
    --"Earthen Wall Totem",
    "Tremor Totem",
    }
    for i=1,#enemiesCache do
        for n=1,#ptotemList do
            if UnitCanAttack("player",enemiesCache[i]) and ObjectName(enemiesCache[i]) == ptotemList[n] and not UnitIsPlayer(enemiesCache[i]) and not _isPet(enemiesCache[i]) and _LoS(enemiesCache[i]) then
                _Cast(35395,enemiesCache[i]);
                _Cast(20271,enemiesCache[i]);
            end
        end
    end


    function _gen(u)
        --call_action_list,name=finishers,if=holy_power>=5|buff.holy_avenger.up|debuff.final_reckoning.up|debuff.execution_sentence.up
        --if holypower>=5 or holyavenger or finalreckoning or executionsentence then
            _finisher(u);
        --end
        --wake_of_ashes,if=(holy_power=0|holy_power<=2&(cooldown.blade_of_justice.remains>gcd*2|debuff.execution_sentence.up|debuff.final_reckoning.up))&(!raid_event.adds.exists|raid_event.adds.in>20)&(!talent.execution_sentence.enabled|cooldown.execution_sentence.remains>15)&(!talent.final_reckoning.enabled|cooldown.final_reckoning.remains>15)
        if _spellCooldown(31884)>=45 or bursting then
            if holypower<=2 then
                if u and _meleeRange(u) and _amIfacing(u) and not _im(u) and not _ia(u) then
                    _Cast(255937);
                end
            end
        end
        --hammer_of_wrath,if=holy_power<=4
        if holypower<=4 then
            if avengingwrath or _actualHp(u)<=20 then
                _Cast(24275,u,_,_,"Magic");
            end
        end
        --blade_of_justice,if=holy_power<=3
        if holypower<=3 and u then
            _Cast(184575,u,_,_,"Magic");
        end
        --spread lawbringer
        if not arena then
            if IsPlayerSpell(246806) and u then
                if _debuffRemains(u,246807,"PLAYER")<=11 then
                    _Cast(20271,u,_,_,"Magic");
                end
                for i=1,#mainTarget do if UnitIsPlayer(mainTarget[i].pointer) and _debuffRemains(mainTarget[i].pointer,246807,"PLAYER")<=11 then
                    _Cast(20271,mainTarget[i].pointer,_,_,"Magic");
                end end
            end
        end
        --judgment,if=!debuff.judgment.up&(holy_power<=2|holy_power<=4&cooldown.blade_of_justice.remains>gcd*2)
        if not IsPlayerSpell(246806) or arena then
            if u and holypower<=4 then
                _Cast(20271,u,_,_,"Magic");
            end
        end
        --call_action_list,name=finishers,if=(target.health.pct<=20|buff.avenging_wrath.up|buff.crusade.up|buff.empyrean_power.up)
        if u and (_actualHp(u)<=20 or avengingwrath or crusade) then
            _finisher(u);
        end
        --crusader_strike,if=cooldown.crusader_strike.charges_fractional>=1.75&(holy_power<=2|holy_power<=3&cooldown.blade_of_justice.remains>gcd*2|holy_power=4&cooldown.blade_of_justice.remains>gcd*2&cooldown.judgment.remains>gcd*2)
        if _spellChargeFrac(35395)>=1.75 and (holypower<=2 or (holypower<=3 and _spellCooldown(184575)>gcd*2) or (holypower<=4 and _spellCooldown(184575)>gcd*2 and _spellCooldown(20271)>gcd*2)) then
            if u then
                _Cast(35395,u,_,_,"Magic");
            end
        end
        --call_action_list,name=finishers
        _finisher(u);
        --consecration,if=!consecration.up
        if not consup and u and _meleeRange(u) then
            _Cast(26573);
        end
        --crusader_strike,if=holy_power<=4
        if holypower<=4 then
            if u then
                _Cast(35395,u,_,_,"Magic");
            end
        end
        --arcane_torrent,if=holy_power<=4
        --consecration,if=time_to_hpg>gcd
        if tthpg>gcd and u and _meleeRange(u) then
            _Cast(26573);
        end
    end

    function _finisher(u)
        --variable,name=ds_castable
        dscastable=false
        if activeEnemies>=2 and not arena then
            dscastable=true;
        end
        --seraphim
        if _spellCooldown(31884)>=45 or bursting then
            if tthpg<=gcd and u and _meleeRange(u) then
                _Cast(152262);
            end
        end
        if dscastable then
            _Cast(53385);
        end
        --tv
        if u then
            _Cast(85256,u,_,_,"Magic")
        end
    end

    --auto_attack
    if validTar and _meleeRange(validTar) then
        StartAttack();
    end

    --rebuke
    for i=1,#mainTarget do if _shouldCS(mainTarget[i].pointer) then
        _Cast(96231,mainTarget[i].pointer);
    end end

    if not arena and instanceType~="pvp" then
        for i=1,#mainTarget do if _interruptAll(mainTarget[i].pointer) then
            _Cast(96231,mainTarget[i].pointer);
        end end
    end

    --hoj
    if hojKey and ccTar then
        _Cast(853,ccTar,_,_,_,_,_,true);
    end 

    --bubble
    if bubbleKey then
        _Cast(642);
    end 

    --healer in cc
    healerexists=true
    if not ourHealer or not UnitExists(ourHealer) then healerexists=false; end
    --sanc
    for i=1,#players do if _shouldSanc(players[i].Unit) and (_isHealer(players[i].Unit) or not healerexists) then
        _Cast(210256,players[i].Unit);
    end end


    if kc.bubble then
        if _actualHp("player")<=kc.bubble then
            _Cast(642)
        end
    end

    if kc.bop then
        for i=1,#players do if _actualHp(players[i].Unit)<=kc.bop then
            _Cast(1022,players[i].Unit);
        end end
    end

    --sacHp
    --healer in cc
    healerCCed=false;
    if ourHealer and UnitExists(ourHealer) and _CCcheck(ourHealer)>0 then healerCCed=true; end

    if healerCCed and _actualHp("player")>80 then
        for i=1,#players do if _actualHp(players[i].Unit)<=60 then
            _Cast(6940,players[i].Unit);
        end end
    end

    if not ourHealer and _actualHp("player")>80 then
        for i=1,#players do if _actualHp(players[i].Unit)<=60 then
            _Cast(6940,players[i].Unit);
        end end
    end

    --bop blind and karma debuff
    for i=1,#players do if (UnitDebuffID(players[i].Unit,2094) or UnitDebuffID(players[i].Unit,122470)) and select(2,UnitClass(players[i].Unit)) ~= "PALADIN" then
        _Cast(1022,players[i].Unit);
    end end

    --freedomself
    if kc.freedomself then
        if (_slowCheck("player") or _rootCheck("player")) and validTar and _distance(validTar)>=10 then
            if not IsPlayerSpell(305394) then
                if UnitDebuffID(players[i].Unit,102359) or not dontFreedom then
                    if UnitDebuffID("player",102359) or not dontFreedom then
                        _Cast(1044,"player");
                    end
                end
            end
            if IsPlayerSpell(305394) then
                for i=1,#players do if not _unitIsUnit("player",players[i].Unit) then
                    if UnitDebuffID(players[i].Unit,102359) or not dontFreedom then
                        _Cast(1044,players[i].Unit);
                    end
                end end
            end
        end
    end

    --freedom friendly team
    if kc.freedomteam then
        for i=1,#players do if not _unitIsUnit("player",players[i].Unit) and _isMeleeDps(players[i].Unit) then
            for n=1,#mainTarget do if _unitIsUnit(mainTarget[n].pointer,UnitTarget(players[i].Unit)) then
                if _distance(mainTarget[n].pointer,UnitTarget(players[i].Unit))>=10 and (_slowCheck(players[i].Unit) or _rootCheck(players[i].Unit)) then
                    if UnitDebuffID(players[i].Unit,102359) or not dontFreedom then
                        _Cast(1044,players[i].Unit);
                    end
                end
            end end
        end end
    end

    if kc.retslow then
        if validTar and not _slowCheck(validTar) and _distance(validTar)>=10 then
            _Cast(183218,validTar,_,_,"Magic","Slow");
        end
    end

    --ret offhealing key
    if healKey then
        for i=1,#players do if _actualHp(players[i].Unit)<=85 then
            _Cast(85673,players[i].Unit);
        end end
        for i=1,#players do
            _Cast(19750,players[i].Unit);
        end
    end

    if kc.eyepercent>0 then
        if _actualHp("player")<=kc.eyepercent then
            _Cast(205191);
        end
    end

    if kc.shieldpercent>0 then
        if _actualHp("player")<=kc.shieldpercent then
            _Cast(184662);
        end
    end


    if kc.autowog and not kc.wogself then
        for i=1,#players do if _actualHp(players[i].Unit)<=kc.wogpercent then
            _Cast(85673,players[i].Unit);
        end end
    end

    if kc.autowog and kc.wogself then
        if _actualHp("player")<=kc.wogpercent then
            _Cast(85673,"PLAYER");
        end
    end

    --ret offhealing
    if healKey then
        for i=1,#players do
            _Cast(85673,players[i].Unit);
        end
        for i=1,#players do
            _Cast(19750,players[i].Unit);
        end
    end

    if bursting then
        if validTar and IsPlayerSpell(343721) then
            _AeCast(343721,validTar,30);
        end
        if validTar and IsPlayerSpell(343721) and _spellCooldown(343721)<=gcd then return; end
        _Cast(31884)
    end

    if bursting then
        _Cast(304971);
    end

    --call_action_list,name=cooldowns
    --call_action_list,name=generators
    if validTar then
        _gen(validTar);
    end

    for i=1,#mainTarget do
        _gen(mainTarget[i].pointer);
    end

    --cleanse toxins
    for i=1,#players do if _canRetClean(players[i].Unit) then
        _Cast(213644,players[i].Unit);
    end end

    correctStance=nil;
    if kc.devotion then
        correctStance=2;
    elseif kc.conc then
        correctStance=3;
    end
    
    if correctStance and GetShapeshiftForm()~=correctStance then
        CastShapeshiftForm(correctStance);
    end

end

function _learnAvengingCrusader()

end

function _holyPal()

    _createMainTarget()

    validTar=nil;
    for i=1,#mainTarget do
        if _unitIsUnit(mainTarget[i].pointer,"target") then
            validTar=mainTarget[i].pointer;
        end
    end

    if validTar and _meleeRange(validTar) then
        StartAttack();
    end


    --if not UnitAffectingCombat("player") then

    --    if _spellCooldown(31884)>gcd and _spellCooldown(216331)<=gcd and not UnitBuffID("player",31884) then
    --        if not IsPlayerSpell(216331) then
    --            RemoveTalent(22484);
    --            LearnTalent(22190);
    --        end
    --    end

    --    if _spellCooldown(216331)>gcd and _spellCooldown(31884)<=gcd and not UnitBuffID("player",216331) then
    --        if IsPlayerSpell(216331) then
    --            RemoveTalent(22190);
    --            LearnTalent(22484);
    --        end
    --    end

    --    if _spellCooldown(105809)>gcd and IsPlayerSpell(105809) and not UnitBuffID("player",105809) then
    --        RemoveTalent(17599);
    --        LearnTalent(17597);
    --    end

    --    if not UnitAffectingCombat("player") and _spellCooldown(105809)>gcd and not IsPlayerSpell(223817) and not IsPlayerSpell(105809) then
    --        LearnTalent(17597);
    --    end

    --    if not UnitAffectingCombat("player") and _spellCooldown(216331)>gcd and not IsPlayerSpell(223817) and not IsPlayerSpell(216331) then
    --        LearnTalent(22484);
    --    end

    --    if _spellCooldown(105809)<gcd and not IsPlayerSpell(105809) then
    --        RemoveTalent(17597);
    --        LearnTalent(17599);
    --    end
    --end

    if bubbleKey then
        _Cast(642);
    end 


    beacon1,beacon2=nil,nil;
    for i=1,#roster do if UnitBuffID(roster[i].Unit,53563) then
        beacon1=roster[i].Unit;
    end end
    for i=1,#roster do if UnitBuffID(roster[i].Unit,156910) then
        beacon2=roster[i].Unit;
    end end

    if kc.loh and players then
        if _actualHp(players[1].Unit)<=kc.loh and not UnitDebuffID(players[1].Unit,25771) then
            _Cast(633,players[1].Unit);
        end
    end

    --lowest friend
    lowestFriend=_hpWithShield(roster[1].Unit);
    holypower=UnitPower("player",9)

    --taunt trap
    if groundTrap and GetTime()-groundTrap <= 2.5 and (_pvpDpsOnUnit("player") == 0 or _hpWithShield("player") > 90) then
        if ObjectExists(groundTrapSource) then
            local traveltime=_trapTravelTime(groundTrapSource);
            if GetTime()-groundTrap <= traveltime then
                for i=1,#mainTarget do
                    if _isPet(mainTarget[i].pointer) then
                        _Cast(62124,mainTarget[i].pointer,_,_,"Magic");
                    end
                end
            end
        end
    end

    --hoj
    if hojKey and ccTar then
        _Cast(853,ccTar,_,_,"Magic",_,_,true);
    end

    ---hoj
    if blindKey and ccTar then
        _Cast(115750);
        _Cast(20066,ccTar,_,_,"Magic",_,_,true);
    end 
    
    --Flash of Light (your target)
    if flashTargetKey then
        _Cast(210294)
        _Cast(19750,"target");
    end

    --Flash of Light (Auto Unit)
    if flashAutoKey then
        _Cast(210294)
        if players then _Cast(19750,players[1].Unit); end
    end

    --Holy Light (your target)
    if holyTargetKey then
        _Cast(210294)
        _Cast(82326,"target");
    end

    --Holy Light (Auto Unit)
    if holyAutoKey then
        _Cast(210294)
        if players then _Cast(82326,players[1].Unit); end
    end

    if bursting then
        if not UnitBuffID("player",31884) then
            _Cast(31884);
        end
    end

    --hoj healer trinket
    if kc.hojtrinket then
        for i=1,#mainTarget do
            if _trinketed(mainTarget[i].pointer) and _isHealer(mainTarget[i].pointer) then
                _Cast(853,mainTarget[i].pointer,_,_,"Magic",_,_,true);
            end
        end
    end

    --hoj dps when healer trinkets
    if kc.hojdps and arena then
        shouldHoj=nil
        for i=1,#mainTarget do
            if _dispelled(mainTarget[i].pointer) and _isHealer(mainTarget[i].pointer) then
                shouldHoj=true;
            end
        end
        if shouldHoj then
            for i=1,#mainTarget do if _stunDR(mainTarget[i].pointer)==1 and _CCcheck(mainTarget[i].pointer)==0 then
                _Cast(853,mainTarget[i].pointer,_,_,"Magic",_,_,true);
            end end
        end
    end


    --blind healer trinket
    if kc.blindtrinket then
        for i=1,#mainTarget do
            if _trinketed(mainTarget[i].pointer) and _isHealer(mainTarget[i].pointer) then
                if _realDistance(mainTarget[i].pointer) <= 10 and _LoS(mainTarget[i].pointer) then
                    _Cast(115750);
                end
            end
        end
    end

    ---sack
    if kc.sack then
        for i=1,#players do if not _unitIsUnit(players[i].Unit,"player") and UnitIsPlayer(players[i].Unit) and _actualHp(players[i].Unit)<=kc.sack then
            _Cast(199448,players[i].Unit)
        end end
    end


    --bubble
    if kc.bubble then
        if _actualHp("player")<=kc.bubble then
            _Cast(642)
        end
    end

    if kc.autopalwall and _actualHp("player")<=kc.autopalwall then
        _Cast(498);
    end

    if kc.bop then
        for i=1,#players do if _actualHp(players[i].Unit)<=kc.bop then
            _Cast(1022,players[i].Unit);
        end end
    end

    --freedom
    if UnitDebuffID("player",102359) then
        _Cast(115750);
    end

    if lowestFriend>40 then

        if instanceType~="pvp" then
            for i=1,#players do if _pveDispel(players[i].Unit) then
              _Cast(4987,players[i].Unit);
            end end 
        end

        --dispel
        for i=1,#players do if _paladinDispel(players[i].Unit) then
            _Cast(4987,players[i].Unit);
        end end

        --dispelroots
        for i=1,#players do if _paladinDispelRoot(players[i].Unit) then
            if UnitDebuffID(players[i].Unit,102359) or not dontFreedom then
                _Cast(1044,players[i].Unit);
            end
        end end

        --Totem
        local ptotemList = {
        "Spirit Link Totem",
        -- "Ancestral Protection Totem",
        -- "Counterstrike Totem",
        "Skyfury Totem",
        --"Lightning Surge Totem",
        "Grounding Totem",
        "Psyfiend",
        "Capacitor Totem",
        "Earthbind Totem",
        --"Voodoo Totem",
        "Earthgrab Totem",
        "War Banner",
        "Healing Stream Totem",
        --"Earthen Wall Totem",
        "Tremor Totem",
        }
        for i=1,#enemiesCache do
            for n=1,#ptotemList do
                if UnitCanAttack("player",enemiesCache[i]) and ObjectName(enemiesCache[i]) == ptotemList[n] and not UnitIsPlayer(enemiesCache[i]) and not _isPet(enemiesCache[i]) then
                    --crusade
                    _Cast(35395,enemiesCache[i])
                    --judge
                    _Cast(275773,enemiesCache[i])
                end
            end
        end
    end

    --bop blind and karma debuff
    for i=1,#players do if (UnitDebuffID(players[i].Unit,2094) or UnitDebuffID(players[i].Unit,122470)) and select(2,UnitClass(players[i].Unit)) ~= "PALADIN" then
        _Cast(1022,players[i].Unit);
    end end
    
    --wog high power
    if holypower>=5 then
        if players and players[1].HP>GetSpellEffect(85673)*1*_msEffect(players[1].Unit) then
            _Cast(85673,players[1].Unit);
        end
    end

    --wog
    if players and players[1].HP>GetSpellEffect(85673)*1.5*_msEffect(players[1].Unit) then
        _Cast(85673,players[1].Unit);
    end

    --save by the light
    if IsPlayerSpell(157047) then
        if players and _actualHp(players[1].Unit)<30 and not UnitDebuffID(players[1].Unit,157131) then
            if not UnitBuffID(players[1].Unit,156910,"player") and not UnitBuffID(players[1].Unit,53563,"player") then
                _Cast(53563,players[1].Unit);
            end
        end
    end

    --holyshock heal
    if holypower<5 then
        if players and players[1].HP>GetSpellEffect(20473)*1.5*_msEffect(players[1].Unit) then
            _Cast(20473,players[1].Unit);
        end
    end

    --divine toll
    if holypower<=2 then
        if players and players[1].HP>(GetSpellEffect(20473)+GetSpellEffect(85673))*3*_msEffect(players[1].Unit) then
            _Cast(304971,players[1].Unit);
        end
    end

    --autofreedom
    if kc.autofreedom then
        for i=1,#players do if UnitIsPlayer(players[i].Unit) and (_slowCheck(players[i].Unit) or _rootCheck(players[i].Unit)) and _actualHp(players[i].Unit)<=80 then
            if UnitDebuffID(players[i].Unit,102359) or not dontFreedom then
                _Cast(1044,players[i].Unit);
            end
        end end
    end

    --bestow faith
    if players and players[1].HP>GetSpellEffect(223306)*_msEffect(players[1].Unit) then
        _Cast(223306,players[1].Unit);
    end

    --lights martyr
    if kc.lightsmartyr and kc.lightsmartyr>0 then
        if players and not _unitIsUnit("player",players[1].Unit) and players[1].HP>GetSpellEffect(183998)*(kc.lightsmartyr+0.5)*_msEffect(players[1].Unit) then
            _Cast(183998,players[1].Unit);
        end
    end

    --dispel
    for i=1,#players do if _paladinDispel(players[i].Unit) then
        _Cast(4987,players[i].Unit);
    end end

    --dispelroots
    for i=1,#players do if _paladinDispelRoot(players[i].Unit) then
        if UnitDebuffID(players[i].Unit,102359) or not dontFreedom then
            _Cast(1044,players[i].Unit);
        end
    end end

    if instanceType~="pvp" then
        for i=1,#players do if _pveDispel(players[i].Unit) then
          _Cast(4987,players[i].Unit);
        end end 
    end

    --hammer of wrath
    for i=1,#mainTarget do 
        _Cast(24275,mainTarget[i].pointer,_,_,"Magic")
    end

    --consecration
    if _numberAround("player",8)>=2 then
        _Cast(26573);
    end

    if kc.offensiveShock or not UnitAffectingCombat("player") then
        for i=1,#mainTarget do _Cast(20473,mainTarget[i].pointer,_,_,"Magic"); end
    end

    --crusader strike enemy
    if holypower<5 or kc.offensiveShock then
        for i=1,#mainTarget do
            _Cast(35395,mainTarget[i].pointer,_,_,"Magic");
        end
    end

    --consecration
    if _numberAround("player",8)>=1 then
        _Cast(26573);
    end

    --judge
    for i=1,#mainTarget do
        _Cast(275773,mainTarget[i].pointer,_,_,"Magic");
    end


    --dispelling dots
    if IsPlayerSpell(199330) then

        dispelFS,dispelCorr,dispelSwp=0,0,0;

        for i=1,#roster do if UnitBuffID(roster[i].Unit,465,"player") or UnitBuffID(roster[i].Unit,317920,"player") then
            if UnitDebuffID(roster[i].Unit,589,"player") then
                dispelSwp=dispelSwp+1;
            end
        end end

        for i=1,#roster do if UnitBuffID(roster[i].Unit,465,"player") or UnitBuffID(roster[i].Unit,317920,"player") then
            if UnitDebuffID(roster[i].Unit,188389,"player") then
                dispelFS=dispelFS+1;
            end
        end end

        for i=1,#roster do if UnitBuffID(roster[i].Unit,465,"player") or UnitBuffID(roster[i].Unit,317920,"player") then
            if UnitDebuffID(roster[i].Unit,146739,"player") then
                dispelCorr=dispelCorr+1;
            end
        end end

        if dispelCorr>=3 then
            for i=1,#players do if _canDispel(players[i].Unit) and UnitDebuffID(players[i].Unit,146739) then
                _Cast(4987,players[i].Unit);
            end end
        end

        if dispelFS>=3 then
            for i=1,#players do if _canDispel(players[i].Unit) and UnitDebuffID(players[i].Unit,188389) then
                _Cast(4987,players[i].Unit);
            end end
        end

        if dispelSwp>=3 then
            for i=1,#players do if _canDispel(players[i].Unit) and UnitDebuffID(players[i].Unit,589) then
                _Cast(4987,players[i].Unit);
            end end
        end
        
    end

    if not beacon1 or (_unitIsUnit("player",beacon1) and #players>=3 and _actualHp("player")>=100) then
        for i=1,#players do if UnitIsPlayer(players[i].Unit) and not _unitIsUnit(players[i].Unit,"player") and (not beacon2 or not _unitIsUnit(players[i].Unit,beacon2)) then
            _Cast(53563,players[i].Unit);
        end end
    end
    if not beacon2 or (_unitIsUnit("player",beacon2) and #players>=3 and _actualHp("player")>=100) then
        for i=1,#players do if UnitIsPlayer(players[i].Unit) and not _unitIsUnit(players[i].Unit,"player") and (not beacon1 or not _unitIsUnit(players[i].Unit,beacon1)) then
            _Cast(156910,players[i].Unit);
        end end
    end
    if not beacon1 then
        for i=1,#players do if UnitIsPlayer(players[i].Unit) and not beacon2 or not _unitIsUnit(players[i].Unit,beacon2) then
            _Cast(53563,players[i].Unit);
        end end
    end
    if not beacon2 then
        for i=1,#players do if UnitIsPlayer(players[i].Unit) and not beacon1 or not _unitIsUnit(players[i].Unit,beacon1) then
            _Cast(156910,players[i].Unit);
        end end
    end

    if kc.autowings then
        for i=1,#players do if _actualHp(players[i].Unit)<=kc.autowings then
            _Cast(31884);
        end end
    end

    if kc.autocasthpal then
        for i=1,#players do if _actualHp(players[i].Unit)<=kc.autocasthpal then
            _Cast(210294)
            if not UnitBuffID("player",210294) then
                _Cast(19750,players[i].Unit);
            else
                _Cast(82326,players[i].Unit);
            end
        end end
    end

    correctStance=nil;
    if kc.devotion then
        correctStance=2;
    elseif kc.conc then
        correctStance=3;
    end
    
    if correctStance and GetShapeshiftForm()~=correctStance then
        CastShapeshiftForm(correctStance);
    end

end


function _bmH()

    _createMainTarget()

    validTar=nil;
    for i=1,#mainTarget do
        if _unitIsUnit(mainTarget[i].pointer,"target") then
            validTar=mainTarget[i].pointer;
        end
    end

    activeEnemies=_numberAround("pet",10);

    if bursting then
        _Cast(193530);
    end

    if not lastHunterAA or GetTime()-lastHunterAA>2.8 then
        for i=1,#mainTarget do
            rCastSpellByID(75,mainTarget[i].pointer);
        end
    end

    --inter
    for i=1,#mainTarget do if _shouldCS(mainTarget[i].pointer) then
        _Cast(147362,mainTarget[i].pointer);
    end end

    if not arena and instanceType~="pvp" then
        for i=1,#mainTarget do if _interruptAll(mainTarget[i].pointer) then
            _Cast(147362,mainTarget[i].pointer);
        end end
    end

    if bmstunKey and ccTar then
        _Cast(19577,ccTar);
    end

    for i=1,#mainTarget do
    local u=mainTarget[i].pointer;
        if _instantKickUnint(u) and kc.stunint then
            --stun
            _Cast(19577,u);
        end
    end

    if kc.autoturtle and _actualHp("player")<=kc.autoturtle then
        _Cast(186265);
    end

    if not UnitExists("pet") then
        _Cast(883);
    end

    --execute
    for i=1,#mainTarget do if _actualHp(mainTarget[i].pointer)<=20 then
        rCastSpellByID(53351,mainTarget[i].pointer);
    end end

    --multishot
    if activeEnemies>=2 and not UnitBuffID("player",268877) then
        _Cast(2643,"pettarget");
    end

    --barbed shot
    if UnitExists("pet") and _buffRemains("pet",272790,"player")<=gcd then
        for i=1,#mainTarget do
            _Cast(217200,mainTarget[i].pointer);
        end
    end

    --kill command
    for i=1,#mainTarget do
        _Cast(34026,mainTarget[i].pointer);
    end

    --cobra
    if UnitPower("player")>=65 then
        for i=1,#mainTarget do
            _Cast(193455,mainTarget[i].pointer);
        end
    end

    if UnitExists("pet") then
        for i=1,#mainTarget do if (not lastAttack or GetTime()-lastAttack>=0.5) then
            lastAttack=GetTime();
            PetAttack(mainTarget[i].pointer);
        end end
    end

    if UnitAffectingCombat("player") then
        _Cast(19574);
    end

end

function _mmH()

end

function _survH()

end

function _assR()

    _createMainTarget()

    validTar=nil;
    for i=1,#mainTarget do
        if _unitIsUnit(mainTarget[i].pointer,"target") then
            validTar=mainTarget[i].pointer;
        end
    end

    activeEnemies=_numberAround("player",10);

    if not UnitBuffID("player",1784) then
        if validTar and _meleeRange(validTar) then
            StartAttack()
        end
    else
        StopAttack();
    end

    if IsPlayerSpell(19240) or kidneyKey then
        finishPoints=5;
    else
        finishPoints=4;
    end

    --inter
    for i=1,#mainTarget do if _shouldCS(mainTarget[i].pointer) then
        _Cast(1766,mainTarget[i].pointer);
    end end

    if not arena and instanceType~="pvp" then
        for i=1,#mainTarget do if _interruptAll(mainTarget[i].pointer) then
            _Cast(1766,mainTarget[i].pointer);
        end end
    end

    if kc.autostealth and not UnitAffectingCombat("player") and not UnitBuff("player",1784) then
        _Cast(1784);
    end

    --mark read for death
    if bursting and validTar then
        _Cast(137619,validTar);
    end

    if kidneyKey and ccTar then
        _Cast(137619,ccTar);
        if GetComboPoints("player",ccTar)>=5 then
            _Cast(408);
        end
    end

    if vialKey then
        _Cast(185331);
    end

    --defensives 
    if kc.autocloak and _actualHp("player")<=kc.autocloak then
        _Cast(31224);
    end

    if kc.autovial and _actualHp("player")<=kc.autovial then
        _Cast(185311);
    end

    if kc.autoevasion and _actualHp("player")<=kc.autoevasion then
        _Cast(5277);
    end

    --opens
    if UnitBuffID("player",1784) and validTar then
        if kc.cheapopen then
            _Cast(1833,validTar);
        end
        if kc.garroteopen then
            _Cast(703,validTar);
        end
        if kc.ambushopen then
            _Cast(8676,validTar);
        end
    end

    function _st(u)
        --Maintain Slice and Dice Icon Slice and Dice with 4+ Combo Points.
        if GetComboPoints("player",u)>=finishPoints and not UnitBuffID("player",315496) then
            _Cast(315496);
        end
        --Maintain Rupture Icon Rupture with 4+ Combo Points.
        if GetComboPoints("player",u)>=finishPoints and _debuffRemains(u,1943,"player")<=9.36 then
            _Cast(1943,u);
        end
        --Maintain Garrote Icon Garrote.
        if _debuffRemains(u,703,"player")<=7.02 then
            _Cast(703);
        end
        --Activate Vendetta Icon Vendetta when available.
        if bursting then
            _Cast(79140)
        end
        --Use your Covenant Ability on cooldown.
        --Activate Vanish Icon Vanish on cooldown if using Subterfuge Icon Subterfuge or with 5 Combo Points in order to facilitate Master Assassin Icon Master Assassin-empowered Envenom Icon Envenoms.
        --Use Shiv Icon Shiv on cooldown.
        _Cast(5938,u)
        --Cast Envenom Icon Envenom with 4-5 Combo Points (5-6 with Deeper Stratagem Icon Deeper Stratagem).
        if GetComboPoints("player",u)>=finishPoints then
            _Cast(32645,u);
        end
        --Cast Fan of Knives Icon Fan of Knives when Hidden Blades Icon Hidden Blades is talented and above 19 stacks.
        if _buffStacks("player",270070)>=20 then
            _Cast(51723);
        end
        --Cast Ambush Icon Ambush to generate Combo Points when Blindside Icon Blindside is talented and it is available to cast.
        if UnitBuffID("player",121153) then
            _Cast(8676,u);
        end
        --Cast Mutilate Icon Mutilate to generate Combo Points.
        _Cast(1329,u);
    end

    function _aoe(u)
        --Maintain Slice and Dice Icon Slice and Dice with 4-5 Combo Points.
        if GetComboPoints("player",u)>=finishPoints and not UnitBuffID("player",315496) then
            _Cast(315496);
        end
        --Maintain Rupture Icon Rupture on up to 4 targets.
        if #mainTarget>5 then
            ruptureTargets=5;
        else
            ruptureTargets=#mainTarget;
        end
        for i=1,ruptureTargets do
            if GetComboPoints("player",mainTarget[i].pointer)>=finishPoints and _debuffRemains(mainTarget[i].pointer,1943,"player")<=9.36 then
                _Cast(1943,mainTarget[i].pointer);
            end
        end
        --Activate Vendetta Icon Vendetta when available.
        if bursting then
            _Cast(79140)
        end
        --Use your Covenant Ability on cooldown.
        --Activate Vanish Icon Vanish and apply Garrote Icon Garrote empowered by Subterfuge Icon Subterfuge to as many targets as possible.
        --Maintain Garrote Icon Garrote on up to 3 targets (try to not overwrite empowered ones).
        if #mainTarget>5 then
            garroteTargets=5;
        else
            garroteTargets=#mainTarget;
        end
        for i=1,garroteTargets do
            if GetComboPoints("player",mainTarget[i].pointer)>=finishPoints and _debuffRemains(mainTarget[i].pointer,703,"player")<=7.02 then
                _Cast(703,mainTarget[i].pointer);
            end
        end
        --Maintain Crimson Tempest Icon Crimson Tempest with 4-5 Combo Points.
        if GetComboPoints("player",u)>=finishPoints and not UnitDebuffID(u,121411,"player") then
            _Cast(121411);
        end
        --Cast Envenom Icon Envenom with 4-5 Combo Points.
        if GetComboPoints("player",u)>=finishPoints then
            _Cast(32645,u);
        end
        --Cast Fan of Knives Icon Fan of Knives when 4+ targets are within range to generate Combo Points, or to reapply Deadly Poison Icon Deadly Poison to every target.
        if activeEnemies>=4 then
            _Cast(51723);
        end
        --Cast Mutilate Icon Mutilate on less than 4 target to generate Combo Points.
        if activeEnemies<4 then
            _Cast(1329,u);
        end
    end

    if not UnitBuffID("player",1784) then
        if validTar and activeEnemies>=2 then
            _aoe(validTar);
        end
        if validTar then
            _st(validTar);
        end
    end

end


function _outlawR()

end
    
function _subR()

end

function _discP()

    if UnitChannelInfo("player") then return; end

    penToggle=0;

    _createMainTarget();

    if UnitCastingInfo("player")==GetSpellInfo(194509) then
        radDelay=GetTime();
    end

    lowPurge={}
    for i=1,#mainTarget do
        table.insert(lowPurge,{pointer=mainTarget[i].pointer,dur=_debuffRemains(mainTarget[i].pointer,swpDebuff,"PLAYER")});
    end

    lowAtonement={}
    for i=1,#roster do
        table.insert(lowAtonement,{pointer=roster[i].Unit,dur=_buffRemains(roster[i].Unit,atonementID,"PLAYER")});
    end

    raptureHp=raptureHp or 0;
    archangelHp=archangelHp or 0;
    shadowmendHp=shadowmendHp or 0;
    barrierHp=barrierHp or 0;
    painsupHp=painsupHp or 0;

    atonementID=194384

    atonementOut=nil
    for i=1,#roster do if UnitBuffID(roster[i].Unit,atonementID,"PLAYER") then
        atonementOut=true;
    end end

    if IsPlayerSpell(214205) then
        atonementEffect=0.6
    else
        atonementEffect=0.5
    end

    eSolace,ePenance,eBlast,ePurge=nil,nil,nil,nil;
    if atonementOut then
        for i=1,#roster do
            if UnitBuffID(roster[i].Unit,atonementID,"player") then
                if _healthDeficit(roster[i].Unit)>GetSpellEffect(129250)*atonementEffect then
                    eSolace=true;
                end
                if _healthDeficit(roster[i].Unit)>GetSpellEffect(47540)*0.3367073880162885*atonementEffect then
                    ePenance=true;
                end
                if _healthDeficit(roster[i].Unit)>GetSpellEffect(8092)*0.2782809789940258*atonementEffect then
                    eBlast=true;
                end
                if _healthDeficit(roster[i].Unit)>GetSpellEffect(204197)*0.1527093596059113*atonementEffect then
                    ePurge=true;
                end
            end
        end
    end

    if kc.spamdamage then eSolace,ePenance,eBlast,ePurge=true,true,true,true end


    if IsPlayerSpell(204197) then
        swpID=204197;
        swpDebuff=204213;
    else
        swpID=589;
        swpDebuff=589;
    end

    --fear number of units
    if kc.autofear and kc.autofear~=0 then
        if #_getEnemyPlayersAroundUnit("player",8)>=kc.autofear then
            _Cast(8122);
        end
    end
    
    --fear interrupt
    if kc.fearinterrupt then
        for i=1,#mainTarget do
            if _instantKick(mainTarget[i].pointer) then
                if _realDistance(mainTarget[i].pointer) <= 8 and _LoS(mainTarget[i].pointer) then
                    _Cast(8122);
                end
            end
        end
    end

    --fear healer trinket
    if kc.feartrinket then
        for i=1,#mainTarget do
            if _trinketed(mainTarget[i].pointer) and _isHealer(mainTarget[i].pointer) then
                if _realDistance(mainTarget[i].pointer) <= 8 and _LoS(mainTarget[i].pointer) then
                    _Cast(8122);
                end
            end
        end
    end

    --fear all trinket
    if kc.fearalltrinket then
        for i=1,#mainTarget do
            if _trinketed(mainTarget[i].pointer) then
                if _realDistance(mainTarget[i].pointer) <= 8 and _LoS(mainTarget[i].pointer) then
                    _Cast(8122);
                end
            end
        end
    end

    for i=1,#players do if _piCheck(players[i].Unit) then
        _Cast(10060,players[i].Unit);
    end end

    needDeath=false;
    --Stop Casting for premonition CC
    for i=1,#mainTarget do if _shouldDeath(mainTarget[i].pointer)=="pending" and (UnitCastingInfo("player") or UnitChannelInfo("player")) and IsPlayerSpell(209780) and _spellCooldown(209780)<=1.5 then
        SpellStopCasting();
        needDeath=true;
    end end

    --death cc
    for i=1,#mainTarget do if _shouldDeath(mainTarget[i].pointer) then
        if IsPlayerSpell(209780) and _spellCooldown(209780)<=1.5 then
            SpellStopCasting();
        end
        for i=1,#mainTarget do
            _Cast(32379,mainTarget[i].pointer,_,_,"Magic");
        end
    end end

    --death trap
    if groundTrap and GetTime()-groundTrap <= 2.5 and (_pvpDpsOnUnit("player") == 0 or _hpWithShield("player") > 90) then
        if ObjectExists(groundTrapSource) then
            local traveltime=_trapTravelTime(groundTrapSource);
            if GetTime()-groundTrap <= traveltime then
                for i=1,#mainTarget do
                    _Cast(32379,mainTarget[i].pointer,_,_,"Magic");
                end
            end
        end
    end

    if needDeath then return true; end


    if barrierKey then
        if _spellCooldown(62618)<=gcd then
            rCastSpellByID(62618);
            if IsAoEPending() then
                CameraOrSelectOrMoveStart();
                CameraOrSelectOrMoveStop();
            end
            if IsAoEPending() then
                CancelPendingSpell();
            end
        end
    end

    if autoBarrierKey and players then
        _AeCast(62618,players[1].Unit,40);
    end

    --Archangel
    if UnitBuffID("player",197862) then
        Archangel = 1.2
    else
        Archangel = 1
    end

    --MC key
    if mcKey then
        _Cast(605,ccTar,true,true,_,_,_,true);
    end
    --pause mc
    if UnitChannelInfo("player") == "Mind Control" and mcKey then return false; end
    if UnitChannelInfo("player") == "Контроль над разумом" and mcKey then return false; end

    --pause mc
    if UnitChannelInfo("player") == "Mind Control" and not mcKey then SpellStopCasting(); end
    if UnitChannelInfo("player") == "Контроль над разумом" and not mcKey then SpellStopCasting(); end

    --fearKey
    if priestFearKey then
        _Cast(8122);
    end

    if featherSelf then
        if not UnitBuffID("player",121557) then
            _Cast(121536,"PLAYER");
        end
    end

    --hoj dps when healer trinkets
    for i=1,#enemiesCache do if _isHealer(enemiesCache[i]) then
        theirHealer=enemiesCache[i];
    end end

    if kc.autogames then
        if bursting and not theirHealer then
            for i=1,#mainTarget do
                _Cast(323673,mainTarget[i].pointer);
            end
        end
        if theirHealer and _dispelled(theirHealer) then
            _Cast(323673,theirHealer);
        end
    end


    if kc.pwb then
        if players and _actualHp(players[1].Unit)<=kc.pwb then
            _AeCast(62618,players[1].Unit,40);
            if _spellCooldown(62618)<=gcd then return; end
        end
    end

    if kc.psup then
        if players and _actualHp(players[1].Unit)<=kc.psup then
            _Cast(33206,players[1].Unit);
        end
    end

    if kc.rapture then
        if players and _actualHp(players[1].Unit)<=kc.rapture then
            _Cast(47536);
        end 
    end

    if kc.dprayer and _actualHp("player")<=kc.dprayer then
        _Cast(19236);
    end

    if kc.fade and _actualHp("player")<=kc.fade then
        _Cast(586);
    end

    if raptureKey and players then
        _Cast(47536,players[1].Unit);
    end

    if archangelKey then
        _Cast(197862);
    end

    if darkarchangelKey then
        _Cast(197871);
    end

    --shadowmend
    if shadowmendKey or _spellCooldown(17)>gcd then
         _Cast(186263,players[1].Unit);
    end

    --PW:Radiance low high prio
    if IsPlayerSpell(236499) then
        if _castTime(194509)<=0 then
            if players and players[1].HP >= GetSpellEffect(194509)*_msEffect(players[1].Unit)*2 then
                if _spellCooldown(194509)<=gcd then
                    _Cast(109964);
                end
                _Cast(194509,players[1].Unit,true);
            end
        end
    end

    --Dispel
    for i=1,#players do
        --Dispels--
        if _priestPurify(players[i].Unit) then
            if _Cast(527,players[i].Unit,true) then return true; end
        end
    end

    --Pre-atonement for dark arch
    if IsPlayerSpell(197871) and _spellCooldown(197871)<=gcd then
        for i=1,#players do
            if not UnitDebuffID(players[i].Unit,6788) and _buffRemains(players[i].Unit,atonementID,"PLAYER")<=2 and not _unitIsUnit(players[i].Unit,"player") then
                _Cast(17,players[i].Unit,true);
            end
        end
    end

    --dark
    for i=1,#roster do if (_CDcheck(roster[i].Unit) or bursting) and _buffRemains(roster[i].Unit,atonementID,"PLAYER")>0 then
        _Cast(197871);
    end end

    --Atonement With Trinity
    if IsPlayerSpell(214205) then
        if players then
            if not UnitDebuffID(players[1].Unit,6788) and _buffRemains(players[1].Unit,atonementID,"PLAYER")<=2 and (players[1].HP >= GetSpellEffect(17)*_msEffect(players[1].Unit)*1) then
                _Cast(17,players[1].Unit,true);
            end
        end
    end

    --Rapture
    if UnitBuffID("player",47536) then
        --PWS up
        if players then
            if players[1].HP >= GetSpellEffect(17)*_msEffect(players[1].Unit) and _buffRemains(players[1].Unit,17,"PLAYER")<=gcd then
                _Cast(17,players[1].Unit,true);
            end
        end
    end

    --PWS no trinity Atonement
    if players then
        if not UnitDebuffID(players[1].Unit,6788) and _buffRemains(players[1].Unit,atonementID,"PLAYER")<=2 and (players[1].HP >= GetSpellEffect(17)*_msEffect(players[1].Unit)*1) then
            _Cast(17,players[1].Unit,true);
        end
    end


    --0auto 1defensive 2offensive
    --healingPenance
    if players and players[1].HP>=GetSpellEffect(47540)*_msEffect(players[1].Unit)*0.5 then
        _Cast(47540,players[1].Unit);
    end

    --MD block bubble
    for i=1,#mainTarget do if _mdEnemy(mainTarget[i].pointer) then
        _AeCast(32375,mainTarget[i].pointer,30);
    end end

    --purge important
    for i=1,#mainTarget do
        local t=mainTarget[i].pointer
        if _smartPurgeCheck(t) then _Cast(528,t,true,true,"Magic"); end
    end


    --death HP
    if IsPlayerSpell(32379) then
        for i=1,#mainTarget do
            if _actualHp(mainTarget[i].pointer) <= 20 then
                _Cast(32379,mainTarget[i].pointer,_,_,"Magic");
            end
        end
    end

    --MD teammates
    for i=1,#players do if _priestMD(players[i].Unit) == "cast" and (not ourHealer or _isHealer(players[i].Unit)) then
        _AeCast(32375,players[i].Unit,30);
    end end

    --PurgeMC
    for i=1,#roster do
        if (UnitDebuffID(roster[i].Unit,605) or UnitBuffID(roster[i].Unit,605)) and UnitIsCharmed(roster[i].Unit) then
            _Cast(528,roster[i].Unit,true,true);
        end
    end

    --Radiance without ultimate (bgs)
    if not arena then
        radCount=0;
        for i=1,#players do
            if players[i].HP >= GetSpellEffect(194509) then
                radCount=radCount+1;
            end
        end
        if radCount>=3 then
            for i=1,#players do
                if _buffRemains(players[i].Unit,atonementID,"PLAYER")<=gcd then
                    if not radDelay or GetTime()-radDelay>=3 then
                        _Cast(194509,players[i].Unit,true);
                    end
                end
            end
        end
    end

    if _spellCooldown(47540)>gcd and IsPlayerSpell(215768) then
        for i=1,#mainTarget do _Cast(585,mainTarget[i].pointer,_,_,"Magic"); end
    end

    --solace on cd
    if eSolace then
        if UnitPower("player")/UnitPowerMax("player") <= 0.99 then
            for i=1,#mainTarget do _Cast(129250,mainTarget[i].pointer,_,_,"Magic"); end
        end
    end


    --Damage Penance
    --if ePenance then
    --    for i=1,#mainTarget do
    --        if IsPlayerSpell(204197) then
    --            if UnitDebuffID(mainTarget[i].pointer,204213,"player") and _amIfacing(mainTarget[i].pointer) then
    --                _Cast(47540,mainTarget[i].pointer,_,_,"Magic");
    --            end
    --        elseif _amIfacing(mainTarget[i].pointer) then
    --            _Cast(47540,mainTarget[i].pointer,_,_,"Magic");
    --        end
    --    end
    --end

    --mindblast
    if eBlast then
        for i=1,#mainTarget do
            if not _isHealer(mainTarget[i].pointer) then
                _Cast(8092,mainTarget[i].pointer,_,_,"Magic");
            end
        end
    end

    --SmiteKey
    if (smiteKey or bursting) then
        _Cast(197871);
        for i=1,#mainTarget do _Cast(214621,mainTarget[i].pointer,_,_,"Magic"); end
        for i=1,#mainTarget do _Cast(585,mainTarget[i].pointer,_,_,"Magic"); end
    end

    if arena then
        --Totem
        local ptotemList = {
        "Spirit Link Totem",
        -- "Ancestral Protection Totem",
        -- "Counterstrike Totem",
        "Skyfury Totem",
        --"Lightning Surge Totem",
        "Grounding Totem",
        "Psyfiend",
        "Capacitor Totem",
        --"Voodoo Totem",
        --"War Banner",
        --"Healing Stream Totem",
        --"Earthen Wall Totem",
        "Tremor Totem",
        --"Earthbind Totem",
        --"Earthgrab Totem",
        }
        for i=1,#enemiesCache do
            for n=1,#ptotemList do
                if UnitCanAttack("player",enemiesCache[i]) and ObjectName(enemiesCache[i]) == ptotemList[n] and not UnitIsPlayer(enemiesCache[i]) and not _isPet(enemiesCache[i]) then
                    --solace
                    _Cast(129250,enemiesCache[i]);
                    --purge
                    _Cast(swpID,enemiesCache[i]);
                end
            end
        end
    end


    if not IsPlayerSpell(204197) then
        --swp all
        for i=1,#lowPurge do if _canDot(lowPurge[i].pointer) and _debuffRemains(lowPurge[i].pointer,swpDebuff,"PLAYER")<=7.8 then
            _Cast(swpID,lowPurge[i].pointer,_,_,"Magic");
        end end
    end

    if ePurge then
        if IsPlayerSpell(204197) then
            --Purge the wicked all
            for i=1,#lowPurge do if _canDot(lowPurge[i].pointer) and _debuffRemains(lowPurge[i].pointer,swpDebuff,"PLAYER")<=4.68 then
                _Cast(swpID,lowPurge[i].pointer,_,_,"Magic");
            end end
        end
    end

    --fort
    if UnitBuffID("player",44521) or not kc.bgbot then
        for i=1,#players do if not UnitBuffID(players[i].Unit,21562) and UnitIsPlayer(players[i].Unit) then
            _Cast(21562,players[i].Unit);
        end end
    end

    --mindbender
    if UnitPower("player")/UnitPowerMax("player") <= 0.96 then
        for i=1,#mainTarget do 
            _Cast(123040,mainTarget[i].pointer);
            _Cast(34433,mainTarget[i].pointer);
        end
    end

    for i=1,#mainTarget do if _ragePurge(mainTarget[i].pointer) then
        _Cast(528,mainTarget[i].pointer,true,true,"Magic",_,_,true);
    end end

end

function _holyP()

end

function _shadowP()

    if not UnitChannelInfo("player") or UnitChannelInfo("player")~=GetSpellInfo(15407) then
        flayTick=0;
    end

    _createMainTarget()

    if UnitBuffID("player",341207) then
        for i=1,#mainTarget do
            _Cast(8092,mainTarget[i].pointer,_,_,"Magic");
        end
    end

    if UnitCastingInfo("player") and UnitExists(UnitSpellTarget("player")) and _im(UnitSpellTarget("player")) then
        SpellStopCasting();
    end



    lowDP={}
    for i=1,#mainTarget do
        table.insert(lowDP,{pointer=mainTarget[i].pointer,dur=_buffRemains(mainTarget[i].pointer,335467,"PLAYER")});
    end

    lowVt={}
    for i=1,#mainTarget do
        table.insert(lowVt,{pointer=mainTarget[i].pointer,dur=_buffRemains(mainTarget[i].pointer,34914,"PLAYER")});
    end

    lowSwp={}
    for i=1,#mainTarget do
        table.insert(lowSwp,{pointer=mainTarget[i].pointer,dur=_buffRemains(mainTarget[i].pointer,589,"PLAYER")});
    end

    table.sort(lowVt, function(x,y) return x.dur < y.dur end);
    table.sort(lowSwp, function(x,y) return x.dur < y.dur end);
    table.sort(lowDP, function(x,y) return x.dur < y.dur end);

    --shadowmend
    if shadowmendKey then
        for i=1,#players do
            _Cast(186263,players[i].Unit);
        end     
    end

    if kc.autodisp and _actualHp("player")<=kc.autodisp then
        _Cast(47585);
    end

    if kc.autove then
        for i=1,#players do if _actualHp(players[i].Unit)<=kc.autove then
            _Cast(15286);
        end end
    end

    if kc.fade and _actualHp("player")<=kc.fade then
        _Cast(586);
        _Cast(213602);
    end

    if disperseKey then
        if _spellCooldown(47585)<=gcd and (UnitCastingInfo("player") or UnitChannelInfo("player")) then SpellStopCasting(); end
        _Cast(47585);
        if not UnitBuffID("player",47585) and _spellCooldown(47585)>gcd*2 then
            _Cast(586);
        end
    end

    if swapKey then
        if _actualHp("player")<=50 and players[#players] and not _unitIsUnit("player",players[#players].Unit) then
            _Cast(108968,players[#players].Unit);
        end
        if _actualHp("player")>90 then
            for i=1,#players do if not _unitIsUnit("player",players[i].Unit) then
                _Cast(108968,players[i].Unit);
            end end
        end
    end

    --silence healer trinket
    if kc.silencetrinket then
        for i=1,#mainTarget do
            if _trinketed(mainTarget[i].pointer) and _isHealer(mainTarget[i].pointer) then
                _Cast(15487,mainTarget[i].pointer,_,_,"Magic");
            end
        end
    end

    if UnitCastingInfo("player")=="Mass Dispel" and (not mdTarget or not mdAura or not mdType) then SpellStopCasting(); end
    if UnitCastingInfo("player")=="Mass Dispel" and (mdType and mdTarget and mdAura and mdType=="buff" and not UnitBuffID(mdTarget,mdAura)) then SpellStopCasting(); end
    if UnitCastingInfo("player")=="Mass Dispel" and (mdType and mdTarget and mdAura and mdType=="debuff" and not UnitDebuffID(mdTarget,mdAura)) then SpellStopCasting(); end

    if UnitCastingInfo("player")~="Mass Dispel" or not UnitCastingInfo("player") then
        mdTarget=nil;
        mdAura=nil;
        mdType=nil;
    end

    --fear number of units
    if kc.autofear and kc.autofear~=0 then
        if #_getEnemyPlayersAroundUnit("player",8)>=kc.autofear then
            _Cast(8122);
        end
    end

    --fear interrupt
    if kc.fearinterrupt then
        for i=1,#mainTarget do
            if _instantKick(mainTarget[i].pointer) then
                if _realDistance(mainTarget[i].pointer) <= 8 and _LoS(mainTarget[i].pointer) then
                    _Cast(8122);
                end
            end
        end
    end

    needDeath=false;
    --Stop Casting for premonition CC
    for i=1,#mainTarget do if _shouldDeath(mainTarget[i].pointer)=="pending" and (UnitCastingInfo("player") or UnitChannelInfo("player")) and IsPlayerSpell(209780) and _spellCooldown(209780)<=1.5 then
        SpellStopCasting();
        needDeath=true;
    end end

    --death cc
    for i=1,#mainTarget do if _shouldDeath(mainTarget[i].pointer) then
        if IsPlayerSpell(209780) and _spellCooldown(209780)<=1.5 then
            SpellStopCasting();
        end
        for i=1,#mainTarget do
            _Cast(32379,mainTarget[i].pointer,_,_,"Magic");
        end
    end end

    --death trap
    if groundTrap and GetTime()-groundTrap <= 2.5 and (_pvpDpsOnUnit("player") == 0 or _hpWithShield("player") > 90) then
        if ObjectExists(groundTrapSource) then
            local traveltime=1.5
            if GetTime()-groundTrap <= traveltime then
                for i=1,#mainTarget do
                    _Cast(32379,mainTarget[i].pointer,_,_,"Magic");
                end
            end
        end
    end

    if needDeath then return true; end

    --MD teammates
    for i=1,#players do if _priestMD(players[i].Unit) and _spellCooldown(32375)<=gcd then
        mdTarget=players[i].Unit;
        mdAura=_priestMD(players[i].Unit);
        mdType="debuff";
        mdNeeded=true;
        _AeCast(32375,players[i].Unit,30);
    end end

    --mdclone
    --for i=1,#roster do if UnitIsPlayer(roster[i].Unit) and _debuffRemains(roster[i].Unit,209753)>=3.5 and _spellCooldown(32375)<=gcd then
    --    mdTarget=roster[i].Unit;
    --    mdAura=209753;
    --    mdType="debuff";
    --    mdNeeded=true;
    --    _AeCast(32375,roster[i].Unit,30);
    --end end

    --mdclone
    for i=1,#roster do if UnitIsPlayer(roster[i].Unit) and _debuffRemains(roster[i].Unit,33786)>=3.5 and _spellCooldown(32375)<=gcd then
        mdTarget=roster[i].Unit;
        mdAura=33786;
        mdType="debuff";
        mdNeeded=true;
        _AeCast(32375,roster[i].Unit,30);
    end end

    --MD block bubble
    for i=1,#mainTarget do if _mdEnemy(mainTarget[i].pointer) and _spellCooldown(32375)<=gcd then
        mdTarget=mainTarget[i].pointer;
        mdAura=_mdEnemy(mainTarget[i].pointer);
        mdType="buff";
        mdNeeded=true;
        _AeCast(32375,mainTarget[i].pointer,30);
    end end

    if needFade and GetTime()-needFade<=1.5 then
        _Cast(213602);
    end

    if UnitBuffID("player",213602) and UnitCastingInfo("player")~="Mass Dispel" then SpellStopCasting(); return true; end
    if UnitBuffID("player",213602) then return true; end

    thoughtHarvester=nil;
    if UnitBuffID("player",288343) then
        thoughtHarvester=true;
    end

    --Lifegrip trap
    if groundTrap and GetTime()-groundTrap<=2.5 and ourHealer then
        _Cast(73325,ourHealer);
    end

    --lifegrip rift
    if riftTime and GetTime()-riftTime<2.5 and ourHealer and riftDestination and _unitIsUnit(ourHealer,riftDestination) and _CCcheck(ourHealer)>0 then
        _Cast(73325,riftDestination);
    end

    if not UnitBuffID("player",194249) and not UnitBuffID("player",232698) then
        _Cast(232698);
    end

    --vt delay
    if UnitCastingInfo("player") == "Vampiric Touch" then
        vtTarget = UnitSpellTarget("player")
        vtDelay = GetTime();
    end

    --MC key
    if mcKey then
        _Cast(605,ccTar,true,true,_,_,_,true);
    end

    --pause mc
    if UnitChannelInfo("player") == "Mind Control" and mcKey then return false; end
    
    if UnitChannelInfo("player") == "Mind Sear" then return false; end

    --pause mc
    if UnitChannelInfo("player") == "Mind Control" and not mcKey then SpellStopCasting(); end

        if bursting then

            _Cast(10060,"PLAYER")

            for i=1,#mainTarget do
                _Cast(263346,mainTarget[i].pointer,_,_,"Magic");
            end

            for i=1,#mainTarget do
                if UnitIsPlayer(mainTarget[i].pointer) then
                    --Psyfiend
                    _Cast(211522,mainTarget[i].pointer,true,true,"Magic");
                    --Mindbender
                    _Cast(200174,mainTarget[i].pointer,true,true);
                    --Shadowfiend
                    _Cast(34433,mainTarget[i].pointer,true,true);
                end
            end

    end

    --shadowmend
    if shadowmendKey then
        for i=1,#players do
            if _actualHp(players[i].Unit)<=90 then
                _Cast(2061,players[i].Unit);
            end
        end
        for i=1,#players do
            if not UnitBuffID(players[i].Unit,atonementID) then
                _Cast(2061,players[i].Unit);
            end
        end  
        for i=1,#players do
            _Cast(2061,players[i].Unit);
        end
    end

    --fearKey
    if priestFearKey then
        --if _CCcheck(ccTar)<=0.5 and _distance(ccTar) <= 7 and _LoS(ccTar) then
            _Cast(8122);
        --end
    end

    --disperse key
    if disperseKey then
        rCastSpellByName(L["Dispersion"],"");
    end

    if mindbombKey then
        --mindbomb target
        _Cast(205369,ccTar,_,_,"Magic");
        _Cast(64044,ccTar,_,_,"Magic",_,_,true);
        -- --blanket a healer
        -- for i=1,#mainTarget do if _isHealer(mainTarget[i].pointer) and not _CCcheck(mainTarget[i].pointer) then
        --     _Cast(15487,mainTarget[i].pointer,true,true);
        -- end end
    end

    --critical purging
    if spamPurge then
        for i=1,#mainTarget do if _ragePurge(mainTarget[i].pointer) then
            _Cast(528,mainTarget[i].pointer,true,true,"Magic");
        end end
    end

    for i=1,#mainTarget do if _hpWithShield(mainTarget[i].pointer)<=40 and _smartPurgeCheck(mainTarget[i].pointer) then
        _Cast(528,mainTarget[i].pointer,true,true,"Magic");
    end end

    --totem stomp
    local ptotemList = {
    "Spirit Link Totem",
    -- "Ancestral Protection Totem",
    -- "Counterstrike Totem",
    "Skyfury Totem",
    --"Lightning Surge Totem",
    "Grounding Totem",
    "Psyfiend",
    "Capacitor Totem",
    --"Voodoo Totem",
    --"War Banner",
    --"Healing Stream Totem",
    --"Earthen Wall Totem",
    "Tremor Totem",
    --"Earthbind Totem",
    --"Earthgrab Totem",
    }
    for i=1,#enemiesCache do
        for n=1,#ptotemList do
            if UnitCanAttack("player",enemiesCache[i]) and ObjectName(enemiesCache[i]) == ptotemList[n] and not UnitIsPlayer(enemiesCache[i]) and not _isPet(enemiesCache[i]) and _LoS(enemiesCache[i]) then
                --Voidbolt
                if UnitBuffID("player",194249) then
                    _Cast(205448,enemiesCache[i]);
                end
                --SW:P
                _Cast(589,enemiesCache[i],true,true)
            end
        end
    end

    --PurgeMC
    for i=1,#roster do
        if (UnitDebuffID(roster[i].Unit,605) or UnitBuffID(roster[i].Unit,605)) and UnitIsCharmed(roster[i].Unit) then
            _Cast(528,roster[i].Unit,true,true);
        end
    end

    --go into form
    if bursting then
        if not UnitBuffID("player",194249) then
            for i=1,#mainTarget do
                _Cast(228260,mainTarget[i].pointer,_,_,"Magic");
            end
        end
    end

    --hoj dps when healer trinkets
    for i=1,#enemiesCache do if _isHealer(enemiesCache[i]) then
        theirHealer=enemiesCache[i];
    end end

    if kc.autogames then
        if bursting and not theirHealer then
            for i=1,#mainTarget do
                _Cast(323673,mainTarget[i].pointer);
            end
        end
        if theirHealer and _dispelled(theirHealer) then
            _Cast(323673,theirHealer);
        end
    end

    if kc.autopi then
        for i=1,#players do if _piCheck(players[i].Unit) then
            _Cast(10060,players[i].Unit);
        end end
    end


    vtCount=0;
    if instanceType~="pvp" then
        for i=1,#mainTarget do if _debuffRemains(mainTarget[i].pointer,34914,"PLAYER")>=2.5+gcd then
            vtCount=vtCount+1;
        end end
    end

    --death swd deaf
    if IsPlayerSpell(32379) then
        for i=1,#mainTarget do
            if _actualHp(mainTarget[i].pointer) <= 20 then
                _Cast(32379,mainTarget[i].pointer,_,_,"Magic");
            end
        end
    end

    --vb proc
    if UnitBuffID("player",343144) then
        if UnitChannelInfo("player") then
            SpellStopCasting()
        end
        for i=1,#mainTarget do
            _Cast(343355,mainTarget[i].pointer,_,_,"Magic")
        end
    end


    --voidform damage
    if UnitBuffID("player",194249) then

        --6 replace all
        if instanceType~="pvp" then
            for i=1,#players do if _numberAround(players[i].Unit,10)>=6 and not _unitIsUnit("player",players[i].Unit) then
                _Cast(48045,players[i].Unit);
            end end
            
            for i=1,#mainTarget do if _numberAround(mainTarget[i].pointer,10)>=6 then
                _Cast(48045,mainTarget[i].pointer,_,_,"Magic");
            end end
        end

        --Mindbender
        if UnitPower("player") <= 60 and UnitPower("player") >= 40 then
            if IsPlayerSpell(200174) then
                for i=1,#mainTarget do if UnitIsPlayer(mainTarget[i].pointer) or instanceType ~= "pvp" then
                    _Cast(200174,mainTarget[i].pointer,true,true);
                end end
            end
        end


        --damnation DP
        if _spellCooldown(228260)>gcd then
            --DP keepup players
            for i=1,#lowDP do
                if _debuffRemains(lowDP[i].pointer,335467,"PLAYER") <= _castTime(335467)+gcd and UnitIsPlayer(lowDP[i].pointer) then
                    if _canDot(lowDP[i].pointer) then
                        _Cast(341374,lowDP[i].pointer,_,_,"Magic");
                    end
                end
            end

            --DP keepup all
            for i=1,#lowDP do
                if _debuffRemains(lowDP[i].pointer,335467,"PLAYER") <= _castTime(335467)+gcd then
                    if _canDot(lowDP[i].pointer) then
                        _Cast(341374,lowDP[i].pointer,_,_,"Magic");
                    end
                end
            end
        end


        --vt keepup players
        for i=1,#lowVt do
            if _debuffRemains(lowVt[i].pointer,34914,"PLAYER") <= _castTime(34914)+gcd and UnitIsPlayer(lowVt[i].pointer) then
                if not vtDelay or GetTime()-vtDelay >= 3 or vtTarget ~= lowVt[i].pointer then
                    if _canDot(lowVt[i].pointer) then
                        _Cast(34914,lowVt[i].pointer,true,true,"Magic");
                    end
                end
            end
        end

        --vt keepup all
        for i=1,#lowVt do
            if _debuffRemains(lowVt[i].pointer,34914,"PLAYER") <= _castTime(34914)+gcd then
                if not vtDelay or GetTime()-vtDelay >= 3 or vtTarget ~= lowVt[i].pointer then
                    if _canDot(lowVt[i].pointer) then
                        _Cast(34914,lowVt[i].pointer,true,true,"Magic");
                    end
                end
            end
        end

        --vt Maximize players
        for i=1,#lowVt do if UnitIsPlayer(lowVt[i].pointer) then
            if _debuffRemains(lowVt[i].pointer,34914,"PLAYER") <= (27.3*0.3)+_castTime(34914) then
                if not vtDelay or GetTime()-vtDelay >= 3 or vtTarget ~= lowVt[i].pointer then
                    if _canDot(lowVt[i].pointer) then
                        _Cast(34914,lowVt[i].pointer,true,true,"Magic");
                    end
                end
            end
        end end

        --vt maximize all
        for i=1,#lowVt do
            if _debuffRemains(lowVt[i].pointer,34914,"PLAYER") <= (27.3*0.3)+_castTime(34914) then
                if not vtDelay or GetTime()-vtDelay >= 3 or vtTarget ~= lowVt[i].pointer then
                    if _canDot(lowVt[i].pointer) then
                        _Cast(34914,lowVt[i].pointer,true,true,"Magic");
                    end
                end
            end
        end

        --regular DP
        if _spellCooldown(228260)>gcd then
            --DP keepup players
            for i=1,#lowDP do
                if _debuffRemains(lowDP[i].pointer,335467,"PLAYER") <= _castTime(335467)+gcd and UnitIsPlayer(lowDP[i].pointer) then
                    if _canDot(lowDP[i].pointer) then
                        _Cast(335467,lowDP[i].pointer,true,true,"Magic");
                    end
                end
            end

            --DP keepup all
            for i=1,#lowDP do
                if _debuffRemains(lowDP[i].pointer,335467,"PLAYER") <= _castTime(335467)+gcd then
                    if _canDot(lowDP[i].pointer) then
                        _Cast(335467,lowDP[i].pointer,true,true,"Magic");
                    end
                end
            end
        end

        if UnitPower("player")<=40 then
            for i=1,#mainTarget do
                _Cast(263165,mainTarget[i].pointer,_,_,"Magic");
            end
        end

        --lowest duration void bolt (if they have dots)
        for i=1,#mainTarget do
            _Cast(205448,mainTarget[i].pointer,_,_,"Magic")
        end

        if IsPlayerSpell(205385) then
            for i=1,#mainTarget do
                _AeCast(205385,mainTarget[i].pointer,40);
            end
        end

        --pvp
        --Regular blast
        if UnitPower("player") <= 88 then
            for i=1,#mainTarget do if UnitIsPlayer(mainTarget[i].pointer) or instanceType ~= "pvp" then
                _Cast(8092,mainTarget[i].pointer,_,_,"Magic");
            end end
        end

        --swp keepup players
        for i=1,#lowSwp do
            if _debuffRemains(lowSwp[i].pointer,589,"PLAYER") <= gcd*2 and UnitIsPlayer(lowSwp[i].pointeer) then
                if not vtDelay or GetTime()-vtDelay >= 3 or vtTarget ~= lowSwp[i].pointer then
                    if _canDot(lowSwp[i].pointer) then
                        _Cast(589,lowSwp[i].pointer,true,true,"Magic");
                    end
                end
            end
        end

        -------------------------------------------

        --swp keepup all
        for i=1,#lowSwp do
            if _debuffRemains(lowSwp[i].pointer,589,"PLAYER") <= gcd*2 then
                if not vtDelay or GetTime()-vtDelay >= 3 or vtTarget ~= lowSwp[i].pointer then
                    if _canDot(lowSwp[i].pointer) then
                        _Cast(589,lowSwp[i].pointer,true,true,"Magic");
                    end
                end
            end
        end

        --swp maximize players
        for i=1,#lowSwp do if UnitIsPlayer(lowSwp[i].pointer) then
            if _debuffRemains(lowSwp[i].pointer,589,"PLAYER") <= (20.8*0.3) then
                if not vtDelay or GetTime()-vtDelay >= 3 or vtTarget ~= lowSwp[i].pointer then
                    if _canDot(lowSwp[i].pointer) then
                        _Cast(589,lowSwp[i].pointer,true,true,"Magic");
                    end
                end
            end
        end end

        --swp maximize all
        for i=1,#lowSwp do
            if _debuffRemains(lowSwp[i].pointer,589,"PLAYER") <= (20.8*0.3) then
                if not vtDelay or GetTime()-vtDelay >= 3 or vtTarget ~= lowSwp[i].pointer then
                    if _canDot(lowSwp[i].pointer) then
                        _Cast(589,lowSwp[i].pointer,true,true,"Magic");
                    end
                end
            end
        end

        --pws
        for i=1,#players do
            if not UnitDebuffID(players[i].Unit,6788) and players[i].HP >= GetSpellEffect(17)*2 then
                _Cast(17,players[i].Unit,true);
            end
        end

        --spam purge
        for i=1,#mainTarget do if _ragePurge(mainTarget[i].pointer) then
            _Cast(528,mainTarget[i].pointer,true,true,"Magic");
        end end

        --Mind Flay fill
        if not _isMoving("player") then
            for i=1,#mainTarget do
                _Cast(15407,mainTarget[i].pointer,_,_,"Magic")
            end
        end


    end


    --non voidform damage
    if UnitBuffID("player",232698) then

        if _spellCooldown(228260)>gcd then
            --DP keepup players
            for i=1,#lowDP do
                if _debuffRemains(lowDP[i].pointer,335467,"PLAYER") <= _castTime(335467)+gcd and UnitIsPlayer(lowDP[i].pointer) then
                    if _canDot(lowDP[i].pointer) then
                        _Cast(335467,lowDP[i].pointer,true,true,"Magic");
                    end
                end
            end

            --DP keepup all
            for i=1,#lowDP do
                if _debuffRemains(lowDP[i].pointer,335467,"PLAYER") <= _castTime(335467)+gcd then
                    if _canDot(lowDP[i].pointer) then
                        _Cast(335467,lowDP[i].pointer,true,true,"Magic");
                    end
                end
            end
        end


        --vt keepup players
        for i=1,#lowVt do
            if _debuffRemains(lowVt[i].pointer,34914,"PLAYER") <= _castTime(34914)+gcd and UnitIsPlayer(lowVt[i].pointer) then
                if not vtDelay or GetTime()-vtDelay >= 3 or vtTarget ~= lowVt[i].pointer then
                    if _canDot(lowVt[i].pointer) then
                        _Cast(34914,lowVt[i].pointer,true,true,"Magic");
                    end
                end
            end
        end

        --vt keepup all
        for i=1,#lowVt do
            if _debuffRemains(lowVt[i].pointer,34914,"PLAYER") <= _castTime(34914)+gcd then
                if not vtDelay or GetTime()-vtDelay >= 3 or vtTarget ~= lowVt[i].pointer then
                    if _canDot(lowVt[i].pointer) then
                        _Cast(34914,lowVt[i].pointer,true,true,"Magic");
                    end
                end
            end
        end

        --vt Maximize players
        for i=1,#lowVt do if UnitIsPlayer(lowVt[i].pointer) then
            if _debuffRemains(lowVt[i].pointer,34914,"PLAYER") <= (27.3*0.3)+_castTime(34914) then
                if not vtDelay or GetTime()-vtDelay >= 3 or vtTarget ~= lowVt[i].pointer then
                    if _canDot(lowVt[i].pointer) then
                        _Cast(34914,lowVt[i].pointer,true,true,"Magic");
                    end
                end
            end
        end end

        --vt maximize all
        for i=1,#lowVt do
            if _debuffRemains(lowVt[i].pointer,34914,"PLAYER") <= (27.3*0.3)+_castTime(34914) then
                if not vtDelay or GetTime()-vtDelay >= 3 or vtTarget ~= lowVt[i].pointer then
                    if _canDot(lowVt[i].pointer) then
                        _Cast(34914,lowVt[i].pointer,true,true,"Magic");
                    end
                end
            end
        end

        if IsPlayerSpell(205385) then
            for i=1,#mainTarget do
                _AeCast(205385,mainTarget[i].pointer,40);
            end
        end

        --pvp
        --Regular blast
        if UnitPower("player") <= 88 then
            for i=1,#mainTarget do if UnitIsPlayer(mainTarget[i].pointer) or instanceType ~= "pvp" then
                _Cast(8092,mainTarget[i].pointer,_,_,"Magic");
            end end
        end


        --swp keepup players
        for i=1,#lowSwp do
            if _debuffRemains(lowSwp[i].pointer,589,"PLAYER") <= gcd*2 and UnitIsPlayer(lowSwp[i].pointeer) then
                if not vtDelay or GetTime()-vtDelay >= 3 or vtTarget ~= lowSwp[i].pointer then
                    if _canDot(lowSwp[i].pointer) then
                        _Cast(589,lowSwp[i].pointer,true,true,"Magic");
                    end
                end
            end
        end

        --swp maximize players
        for i=1,#lowSwp do if UnitIsPlayer(lowSwp[i].pointer) then
            if _debuffRemains(lowSwp[i].pointer,589,"PLAYER") <= (20.8*0.3) then
                if not vtDelay or GetTime()-vtDelay >= 3 or vtTarget ~= lowSwp[i].pointer then
                    if _canDot(lowSwp[i].pointer) then
                        _Cast(589,lowSwp[i].pointer,true,true,"Magic");
                    end
                end
            end
        end end

        -------------------------------------------

        --swp keepup all
        for i=1,#lowSwp do
            if _debuffRemains(lowSwp[i].pointer,589,"PLAYER") <= gcd*2 then
                if not vtDelay or GetTime()-vtDelay >= 3 or vtTarget ~= lowSwp[i].pointer then
                    if _canDot(lowSwp[i].pointer) then
                        _Cast(589,lowSwp[i].pointer,true,true,"Magic");
                    end
                end
            end
        end

        --swp maximize all
        for i=1,#lowSwp do
            if _debuffRemains(lowSwp[i].pointer,589,"PLAYER") <= (20.8*0.3) then
                if not vtDelay or GetTime()-vtDelay >= 3 or vtTarget ~= lowSwp[i].pointer then
                    if _canDot(lowSwp[i].pointer) then
                        _Cast(589,lowSwp[i].pointer,true,true,"Magic");
                    end
                end
            end
        end

        --spam purge
        for i=1,#mainTarget do if _ragePurge(mainTarget[i].pointer) then
            _Cast(528,mainTarget[i].pointer,true,true,"Magic");
        end end


        --pws
        --if arena then
        --    for i=1,#players do
        --        if not UnitDebuffID(players[i].Unit,6788,"PLAYER") and _hpWithShield(players[i].Unit) <= 60 and (_meleeDpsOnUnit("player") >= 1 or _hasDot(players[i].Unit)) then
        --            _Cast(17,players[i].Unit,true,true);
        --        end
        --    end
        --end

        -- if instanceType~="pvp" then
        --     --1 replace flay (if buff)
        --     if thoughtHarvester then
        --         for i=1,#mainTarget do
        --             _Cast(48045,mainTarget[i].pointer);
        --         end
        --     end
        --     --2 replace flay
        --     for i=1,#players do if _numberAround(players[i].Unit,10)>=2 and not _unitIsUnit("player",players[i].Unit) then
        --         _Cast(48045,players[i].Unit);
        --     end end
        --     for i=1,#mainTarget do if _numberAround(mainTarget[i].pointer,10)>=2 then
        --         _Cast(48045,mainTarget[i].pointer);
        --     end end
        -- end

        if UnitPower("player")<=40 then
            for i=1,#mainTarget do
                _Cast(263165,mainTarget[i].pointer,_,_,"Magic");
            end
        end

        --Mind Flay fill
        if not _isMoving("player") then
            for i=1,#mainTarget do
                _Cast(15407,mainTarget[i].pointer,_,_,"Magic");
            end
        end

    end        

    --   --Void Shield PWS
    --if IsPlayerSpell(280749) then
    --    if not UnitDebuffID(players[i].Unit,6788,"PLAYER") and (_meleeDpsOnUnit("player") >= 1 or _hasDot("player")) and _hpWithShield("player") <= 95 then
    --        _Cast(17,"PLAYER",true,true);
    --    end
    --end

    --Bubble your teammates
    if arena then
        for i=1,#players do
            if not UnitDebuffID(players[i].Unit,6788,"PLAYER") and _hpWithShield(players[i].Unit) <= 60 then
                _Cast(17,players[i].Unit,true,true);
            end
        end
    end

    --normal purging
    for i=1,#mainTarget do if _smartPurgeCheck(mainTarget[i].pointer) then
        _Cast(528,mainTarget[i].pointer,true,true,"Magic");
    end end

    --body and soul team
    if IsPlayerSpell(64129) then
        for i=1,#players do if _LoS(players[i].Unit) then

            --melees
            if not UnitDebuffID(players[i].Unit,6788,"PLAYER") and _isMeleeDps(players[i].Unit) and _CDcheck(players[i].Unit) and _isMoving(players[i].Unit) then
                _Cast(17,players[i].Unit,true)
            end

            --healer
            if not UnitDebuffID(players[i].Unit,6788,"PLAYER") and _isHealer(players[i].Unit) and _pvpDpsOnUnit(players[i].Unit) >= 2 then
                _Cast(17,players[i].Unit,true)
            end

        end end
    end

    --fort
    if UnitBuffID("player",44521) or not kc.bgbot then
        for i=1,#players do if not UnitBuffID(players[i].Unit,21562) and UnitIsPlayer(players[i].Unit) then
            _Cast(21562,players[i].Unit);
        end end
    end


end

function _eleS()

    _createMainTarget()

    lowFS={}
    for i=1,#mainTarget do if not _unitIsUnit(mainTarget[i].pointer,"focus") then
        table.insert(lowFS,{pointer=mainTarget[i].pointer,dur=_debuffRemains(mainTarget[i].pointer,188389,"PLAYER")});
    end end

    table.sort(lowFS, function(x,y) return x.dur < y.dur end);

    if UnitCastingInfo("player") and UnitExists(UnitSpellTarget("player")) and _im(UnitSpellTarget("player")) then
        SpellStopCasting();
    end

    if UnitCastingInfo("player")==GetSpellInfo(51505) then
        lbDelay=GetTime();
    end

    if UnitChannelInfo("player") then return false; end

    esPriority={}
    for i=1,#roster do
        if UnitIsPlayer(roster[i].Unit) then
            if _unitIsUnit("player",roster[i].Unit) then
                heal=1;
            else
                heal=0;
            end
            table.insert(esPriority,{Unit=roster[i].Unit,isSelf=heal,meleeOn=_meleeDpsOnUnit(roster[i].Unit),hp=_actualHp(roster[i].Unit)});
        end
    end

    table.sort(esPriority, function(x,y) return x.meleeOn>y.meleeOn or (x.meleeOn==y.meleeOn and x.hp<y.hp) or (x.meleeOn==y.meleeOn and x.hp==y.hp and x.isSelf>y.isSelf) end);

    --Healing Surge
    if healingSurgeKey then
        for i=1,#players do _Cast(8004,players[i].Unit,true,true); end
    end

    --Hex Keys
     if hexKey then
        if ObjectExists(ccTar) then
            _Cast(51514,ccTar,true,true,"Magic");
        end
    end

    if lassoKey then
        _Cast(305483,ccTar,_,_,"Magic");
    end

    --lasso fist
    for i=1,#mainTarget do if UnitChannelInfo(mainTarget[i].pointer)=="Fists of Fury" then
        _Cast(305483,mainTarget[i].pointer,_,_,"Magic");
    end end

    if tstormKey then
        _Cast(51490);
    end

    if capKey and ObjectExists(ccTar) then
        _AeCast(192058,ccTar,35);
    end

    if capKey and _spellCooldown(192058)<=gcd then return true; end

    --Wind Shear
    for i=1,#mainTarget do if _shouldCS(mainTarget[i].pointer) then
        _Cast(57994,mainTarget[i].pointer)
    end end

    --pve keks
    if not arena and instanceType~="pvp" then
        for i=1,#mainTarget do if _interruptAll(mainTarget[i].pointer) then
            _Cast(57994,mainTarget[i].pointer);
        end end
    end

    --Tremor
    tCount=0;
    for i=1,#players do
        if _canTremor(players[i].Unit) and _isHealer(players[i].Unit) then
            tCount=tCount+3;
        end
        if _canTremor(players[i].Unit) and not _isHealer(players[i].Unit) then
            tCount=tCount+1;
        end
    end
    if tCount>=2 or ((not ourHealer or not UnitExists(ourHealer)) and tCount>=1) then
        _Cast(8143);
    end

    --ground trap
    if groundTrap and GetTime()-groundTrap <= 2.5 then
        _Cast(204336)
    end

    --ground casts
    for i=1,#mainTarget do if _shouldGround(mainTarget[i].pointer) then
        _Cast(204336);
    end end

    --Decurse havoc,hex,wyvern,
    local dDispel = {80240,51514,19386};
    for i=1,#players do for n=1,#dDispel do
        if UnitDebuffID(players[i].Unit,dDispel[n]) then
             _Cast(51886,players[i].Unit,true,true)
        end
    end end
    for i=1,#players do if _debuffStacks(players[i].Unit,980)>=10 then
        _Cast(51886,players[i].Unit,true,true)
    end end

    --earthbind
    for i=1,#mainTarget do if UnitIsPlayer(mainTarget[i].pointer) and not _its(mainTarget[i].pointer) and not _slowCheck(mainTarget[i].pointer) then
        _AeCast(2484,mainTarget[i].pointer,40);
    end end

    --Ghost Wolf Key
    if wolfKey and not UnitBuffID("player",2645) then
        _Cast(2645)
    end

    if wolfKey then return; end

    --totem stomp
    local ptotemList = {
    "Spirit Link Totem",
    -- "Ancestral Protection Totem",
    -- "Counterstrike Totem",
    "Skyfury Totem",
    --"Lightning Surge Totem",
    "Grounding Totem",
    "Psyfiend",
    "Capacitor Totem",
    "Earthbind Totem",
    --"Voodoo Totem",
    "Earthgrab Totem",
    "War Banner",
    "Healing Stream Totem",
    --"Earthen Wall Totem",
    "Tremor Totem",
    }
    for i=1,#enemiesCache do
        for n=1,#ptotemList do
            if UnitCanAttack("player",enemiesCache[i]) and ObjectName(enemiesCache[i]) == ptotemList[n] and not UnitIsPlayer(enemiesCache[i]) and not _isPet(enemiesCache[i]) then
                --_Cast(51505,enemiesCache[i]);
                --LIGHTNING BOLT TOTEMS
                if UnitBuffID("player",191634) then
                    _Cast(188196,enemiesCache[i])
                end
                _Cast(196840,enemiesCache[i]);
            end
        end
    end

    --Purge
    for i=1,#mainTarget do if _smartPurgeCheck(mainTarget[i].pointer) then
        _Cast(370,mainTarget[i].pointer,true,true,"Magic");
    end end

    --PurgeMC
    for i=1,#roster do
        if (UnitDebuffID(roster[i].Unit,605) or UnitBuffID(roster[i].Unit,605)) and UnitIsCharmed(roster[i].Unit) then
            _Cast(370,roster[i].Unit,true,true,"Magic");
        end
    end

    if (bursting or forceBurst==1) then

        --stormkeeper
        _Cast(191634);

        --FireEle
        if not UnitExists("pet") then
            _Cast(198067);
            _Cast(192249);
            --earthele
            _Cast(198103);
        end

        if IsPlayerSpell(192222) then
            for i=1,#mainTarget do
                _AeCast(192222,mainTarget[i].pointer,40);
            end
            if _spellCooldown(192222)<=gcd then return; end
        end

    end

    function _aoe(u)

        --primordial wave if lb proc
        if UnitBuffID("player",77762) then
            for i=1,#lowFS do if _debuffRemains(lowFS[i].pointer,188389,"PLAYER")<=gcd then
                _Cast(326059,lowFS[i].pointer,_,_,"Magic");
            end end
            
            for i=1,#lowFS do if _debuffRemains(lowFS[i].pointer,188389,"PLAYER")<7.02 then
                _Cast(326059,lowFS[i].pointer,_,_,"Magic");
            end end
        end

        if UnitBuffID("player",77762) then
            _Cast(320125,u,_,_,"Magic");
        end

        --lb proc with prim wave
        if UnitBuffID("player",327164) then
            if UnitDebuffID(u,188389,"PLAYER") and not _isPet(u) then
                _Cast(51505,u,_,_,"Magic");
            end
        end

        --finish lb anyway
        if (UnitBuffID("player",327164) or UnitBuffID("player",320125)) and not _isPet(u) then
            _Cast(51505,u,_,_,"Magic");
        end

        --if prim wave or echoing shock stop
        if UnitBuffID("player",327164) or UnitBuffID("player",320125) then return; end

        --liquid magma totem
        if IsPlayerSpell(192222) then
            _AeCast(192222,u,40);
            if _spellCooldown(192222)<=gcd then return; end
        end

        --get master of elements buff (cast on anyone)
        if UnitBuffID("player",77762) and select(10,GetTalentInfo(4,1,1))==true and not UnitBuffID("player",260734) and UnitPower("player",11)>=50 then
            if not lbDelay or GetTime()-lbDelay > 1 then
                if UnitDebuffID(u,188389,"PLAYER") and not _isPet(u) then
                    _Cast(51505,u,_,_,"Magic");
                end
            end
        end

        --Try to game Earthquake with Master of the Elements buff when fighting 3 targets. Don't overcap Maelstrom!
        quakeNeeded=false;
        if UnitPower("player")>=60 and not kc.noquake then
            for i=1,#mainTarget do if _numberAround(mainTarget[i].pointer,8)>=3 then
                quakeNeeded=true;
                _AeCast(61882,mainTarget[i].pointer,40);
            end end
        elseif not quakeNeeded and UnitPower("player")>=60 then
            _Cast(8042,u,_,_,"Magic");
        end

        if quakeNeeded and UnitPower("player")>=60 then return true; end

        if select(10,GetTalentInfo(4,1,1))==true then
            --Spread Flame Shock in <= 4 target fights, but not during SE uptime,unless you're fighting 3 targets and have less than 14 Wind Gust stacks.
            for i=1,#lowFS do if _debuffRemains(lowFS[i].pointer,188389,"PLAYER")<=gcd then
                _Cast(188389,lowFS[i].pointer,_,_,"Magic");
            end end
            
            for i=1,#lowFS do if _debuffRemains(lowFS[i].pointer,188389,"PLAYER")<7.02 then
                _Cast(188389,lowFS[i].pointer,_,_,"Magic");
            end end
        end

        --stormkeeper
        _Cast(191634);

        --Chain 4+ unitsxd
        if _chain(u)>=3 then
            _Cast(188443,u,_,_,"Magic");
        end

        --instant burst
        if UnitBuffID("player",77762) then
            if UnitDebuffID(u,188389,"PLAYER") and not _isPet(u) then
                _Cast(51505,u,_,_,"Magic");
            end
        end

        --icefury
        _Cast(210714,u);

        --frost_shock,if=spell_targets.chain_lightning<4&buff.icefury.up&!buff.ascendance.up
        if UnitBuffID("player",210714) then
            _Cast(196840,u,_,_,"Magic");
        end

    end

    function _st(u)

        --primordial wave if lb proc
        if UnitBuffID("player",77762) then
            for i=1,#lowFS do if _debuffRemains(lowFS[i].pointer,188389,"PLAYER")<=gcd then
                _Cast(326059,lowFS[i].pointer,_,_,"Magic");
            end end
            
            for i=1,#lowFS do if _debuffRemains(lowFS[i].pointer,188389,"PLAYER")<7.02 then
                _Cast(326059,lowFS[i].pointer,_,_,"Magic");
            end end
        end

        if UnitBuffID("player",77762) then
            _Cast(320125,u,_,_,"Magic");
        end

        --lb proc with prim wave
        if UnitBuffID("player",327164) then
            if UnitDebuffID(u,188389,"PLAYER") and not _isPet(u) then
                _Cast(51505,u,_,_,"Magic");
            end
        end

        --finish lb anyway
        if (UnitBuffID("player",327164) or UnitBuffID("player",320125)) and not _isPet(u) then
            _Cast(51505,u,_,_,"Magic");
        end

        --if prim wave or echoing shock stop
        if UnitBuffID("player",327164) or UnitBuffID("player",320125) then return; end

        --get master of elements buff (cast on anyone)
        if select(10,GetTalentInfo(4,1,1))==true and not UnitBuffID("player",260734) then
            if not lbDelay or GetTime()-lbDelay > 1 then
                if UnitDebuffID(u,188389,"PLAYER") and not _isPet(u) then
                    _Cast(51505,u,_,_,"Magic");
                end
            end
        end

        --skyfury
        if UnitPower("player",11)>=60 and mainTarget[1] and UnitExists(mainTarget[1].pointer) and _LoS(mainTarget[1].pointer) and _spellInRange(8042,u) then
            _Cast(204330);
        end

        --earthshock kill target
        if mainTarget[1] and UnitExists(mainTarget[1].pointer) and _unitIsUnit(u,mainTarget[1].pointer) then
            if UnitPower("player")>=60 then
                _Cast(8042,u,_,_,"Magic");
            end
        end

        --Ensure FS is active unless you have 14 or more stacks of Wind Gust from Storm Elemental. (Edge case: upcoming Asc but active SE; don't )
        for i=1,#lowFS do if _debuffRemains(lowFS[i].pointer,188389,"PLAYER")<=gcd then
                _Cast(188389,lowFS[i].pointer,_,_,"Magic");
        end end

        for i=1,#lowFS do if _debuffRemains(lowFS[i].pointer,188389,"PLAYER")<7.02 then
                _Cast(188389,lowFS[i].pointer,_,_,"Magic");
        end end

        --primordial wave if lb proc
        if UnitBuffID("player",77762) then
            for i=1,#lowFS do if _debuffRemains(lowFS[i].pointer,188389,"PLAYER")<=gcd then
                _Cast(326059,lowFS[i].pointer,_,_,"Magic");
            end end
            
            for i=1,#lowFS do if _debuffRemains(lowFS[i].pointer,188389,"PLAYER")<7.02 then
                _Cast(326059,lowFS[i].pointer,_,_,"Magic");
            end end
        end

        --primordial wave proc 
        if UnitBuffID("player",327164) then
            --lavaburst procs
            if UnitDebuffID(u,188389,"PLAYER") and not _isPet(u) then
                _Cast(51505,u,_,_,"Magic");
            end
        end

        --lavaburst procs generate maelstrom (cast on anyone)
        if UnitBuffID("player",77762) and UnitPower("player",11)<(UnitPowerMax("player",11)-10) then
            if UnitDebuffID(u,188389,"PLAYER") and not _isPet(u) then
                _Cast(51505,u,_,_,"Magic");
            end
        end

        --lightning bolt with master+stormkeeper
        if mainTarget[1] and UnitExists(mainTarget[1].pointer) and _unitIsUnit(u,mainTarget[1].pointer) then
            if UnitBuffID("player",191634) and UnitBuffID("player",260734) then
                _Cast(188196,u,_,_,"Magic");
            end
        end

        --frost_shock with icefury+master
        if mainTarget[1] and UnitExists(mainTarget[1].pointer) and _unitIsUnit(u,mainTarget[1].pointer) then
            if UnitBuffID("player",210714) then--and UnitBuffID("player",260734) then
                _Cast(196840,u,_,_,"Magic");
            end
        end

        --lightning bolt with surge
        if mainTarget[1] and UnitExists(mainTarget[1].pointer) and _unitIsUnit(u,mainTarget[1].pointer) then
            if UnitBuffID("player",285514) then
                if not surgeBolt or GetTime()-surgeBolt>=0.5 then
                    if _Cast(188196,u,_,_,"Magic") then surgeBolt=GetTime(); end
                end
            end
        end

        --icefury
        if mainTarget[1] and UnitExists(mainTarget[1].pointer) and _unitIsUnit(u,mainTarget[1].pointer) then
            _Cast(210714,u,_,_,"Magic");
        end

        --Lavaburst
        if mainTarget[1] and UnitExists(mainTarget[1].pointer) and _unitIsUnit(u,mainTarget[1].pointer) then
            if _debuffRemains(u,188389,"PLAYER")>_castTime(51505) and not _isPet(u) then
                _Cast(51505,u,_,_,"Magic");
            end
        end

    end

    quakeNeeded=false;

    --run_action_list,name=aoe,if=active_enemies>2&(spell_targets.chain_lightning>2|spell_targets.lava_beam>2)
    if kc.autoaoe then
        for i=1,#mainTarget do if _chain(mainTarget[i].pointer)>2 then
            _aoe(mainTarget[i].pointer);
            break;
        end end
    end

    if quakeNeeded and UnitPower("player")>=60 then return true; end

    if UnitExists("pet") then
        for i=1,#mainTarget do
            --fireEle cast
            CastSpellByName(L["Meteor"],mainTarget[i].pointer);
        end
    end

    --st
    for i=1,#mainTarget do
        _st(mainTarget[i].pointer);
    end

    --es
    if esPriority[1] and not UnitBuffID(esPriority[1].Unit,974,"PLAYER") then
        _Cast(974,esPriority[1].Unit);
    end

    --enchant
    if not GetWeaponEnchantInfo(1) then
        _Cast(318038);
    end

    csTotemHp=100
    for i=1,#players do
        if _distance(players[i].Unit)<=20 and _actualHp(players[i].Unit)<=csTotemHp then
            csTotemHp=_actualHp(players[i].Unit)
        end
    end
    if csTotemHp<=90 then
        _Cast(204331);
    end

    --purge
    for i=1,#mainTarget do if _ragePurge(mainTarget[i].pointer) then
        _Cast(370,mainTarget[i].pointer,true,true,nil,true);
    end end

    if kc.healingstream then
        for i=1,#players do if _actualHp(players[i].Unit)<=kc.healingstream then
            _Cast(5394);
        end end
    end

    --lb generate
    for i=1,#mainTarget do
        _Cast(188196,mainTarget[i].pointer,_,_,"Magic");
    end

    --frostshock fill 285514, 260734
    if not UnitBuffID("player",285514) and not UnitBuffID("player",260734) then
        for i=1,#mainTarget do
            _Cast(196840,mainTarget[i].pointer,_,_,"Magic");
        end
    end


end

function _enhS()

end

shamDispellable = {
    118, -- Polymorph
    28272, -- Polymorph (pig)
    28271, -- Polymorph (turtle)
    61305, -- Polymorph (black cat)
    61025, -- Polymorph (serpent) -- FIXME: gone ?
    61721, -- Polymorph (rabbit)
    61780, -- Polymorph (turkey)
    161355,    -- Polymorph (Penguin)
    161354,    -- Polymorph (Monkey)
    277792,    -- Polymorph (Bumblebee)
    277787,    -- Polymorph (Baby Direhorn)
    82691, -- Ring of Frost
    3355, -- Freezing Trap                       (hunter, general)
    5782, -- Fear                                (warlock, general)
    6358, -- Seduction                           (warlock pet, succubus)
    20066, -- Repentance                          (paladin, general)
    51514, -- Hex                                 (shaman, general)
    82691, -- Ring of Frost                       (mage, general)
    115268, -- Mesmerize                           (warlock pet, Grimiore of Supremacy version of Succubus)
    198909, -- Song of Chi-ji                      (monk, mistweaver)
    226943, -- Mind Bomb                           (priest, shadow)
    205369, -- Mind Bomb
    853, -- Hammer of Justice                   (paladin, general)
    105421, -- Blinding Light
    20066, -- Repentance
    179057, -- Chaos Nova                          (demon hunter)
    64044, -- Psychic Horror (Horrify effect)
    15487,--Priest silence
    8122, -- Psychic Scream
    5484, -- Howl of Terror
    6789, -- Mortal Coil
    294127, --MALEDICT
}

rootDispels = {
    339, -- Entangling Roots                    (druid, general)
    122, -- Frost Nova                          (mage, general)
    33395, -- Freeze                              (mage, frost)
    102359, -- Mass Entanglement                   (druid, PVE talent, general)
    157997, -- Ice Nova                            (mage, frost)
    198121, -- Frostbite                           (mage, frost)
    228600, -- Glacial Spike                       (mage, frost)
    285515, -- Surge of Power                      (shaman, elemental)
}

function _shamanPurify(unit)

    for i=1,#shamDispellable do
        if ObjectExists(unit) and not UnitCanAttack("player",unit) and _LoS(unit) and UnitDebuffID(unit,shamDispellable[i]) then
            for n=1,#ccProt do
                if not UnitDebuffID(unit,ccProt[n]) and (_debuffRemains(unit,shamDispellable[i]) >= 1.8 or (_CDcheck(unit) and _debuffRemains(unit,shamDispellable[i]) > .8)) then
                    return shamDispellable[i];
                end
            end
        end
    end

    --Dispelling Roots--
    for i=1,#rootDispels do
        if UnitDebuffID(unit,rootDispels[i]) and (_isImmobileDps(unit) or _isHealer(unit)) and select(2,UnitClass(unit)) ~= "DRUID" then
            for n=1,#ccProt do
                if not UnitDebuffID(unit,ccProt[n]) and _debuffRemains(unit,rootDispels[i]) > 2 then
                    return rootDispels[i];
                end
            end
        end
    end
end
    
function _restoS()

    _createMainTarget()

    lowFS={}
    for i=1,#mainTarget do if not _unitIsUnit(mainTarget[i].pointer,"focus") then
        table.insert(lowFS,{pointer=mainTarget[i].pointer,dur=_debuffRemains(mainTarget[i].pointer,188389,"PLAYER")});
    end end

    table.sort(lowFS, function(x,y) return x.dur < y.dur end);

    esPriority={}
    for i=1,#roster do
        if UnitIsPlayer(roster[i].Unit) then
            if _unitIsUnit("player",roster[i].Unit) then
                heal=1;
            else
                heal=0;
            end
            table.insert(esPriority,{Unit=roster[i].Unit,isSelf=heal,meleeOn=_meleeDpsOnUnit(roster[i].Unit),hp=_actualHp(roster[i].Unit)});
        end
    end

    table.sort(esPriority, function(x,y) return x.meleeOn>y.meleeOn or (x.meleeOn==y.meleeOn and x.hp<y.hp) or (x.meleeOn==y.meleeOn and x.hp==y.hp and x.isSelf>y.isSelf) end);

    if UnitCastingInfo("player") and UnitExists(UnitSpellTarget("player")) and _im(UnitSpellTarget("player")) and UnitCanAttack("player",UnitSpellTarget("player")) then
        SpellStopCasting();
    end

    if hexKey then
        _Cast(51514,ccTar);
    end

    if slinkKey then
        if _spellCooldown(98008)<=gcd then
            rCastSpellByID(98008);
            if IsAoEPending() then
                CameraOrSelectOrMoveStart();
                CameraOrSelectOrMoveStop();
            end
            if IsAoEPending() then
                CancelPendingSpell();
            end
        end
    end

    if kc.slink then
        for i=1,#players do if _actualHp(players[i].Unit)<=kc.slink and UnitIsPlayer(players[i].Unit) then
            _AeCast(98008,players[i].Unit,40);
        end end
    end

    if ewallKey then
        if _spellCooldown(198838)<=gcd then
            rCastSpellByID(198838);
            if IsAoEPending() then
                CameraOrSelectOrMoveStart();
                CameraOrSelectOrMoveStop();
            end
            if IsAoEPending() then
                CancelPendingSpell();
            end
        end
    end

    if kc.ewall then
        for i=1,#players do if _actualHp(players[i].Unit)<=kc.ewall and UnitIsPlayer(players[i].Unit) then
            _AeCast(198838,players[i].Unit,40);
        end end
    end

    if capKey then
        if _spellCooldown(192058)<=gcd then
            rCastSpellByID(192058);
            if IsAoEPending() then
                CameraOrSelectOrMoveStart();
                CameraOrSelectOrMoveStop();
            end
            if IsAoEPending() then
                CancelPendingSpell();
            end
        end
    end

    if kc.ashift and _actualHp("player")<=kc.ashift then
        _Cast(108271)
    end

    if kc.mtide and UnitPower("player")/UnitPowerMax("player")<=(kc.mtide/100) then
        _Cast(16191);
    end

    if kc.htide then
        for i=1,#players do if _actualHp(players[i].Unit)<=kc.htide then
            _Cast(108280);
        end end
    end

    --Wind Shear
    for i=1,#mainTarget do if _shouldCS(mainTarget[i].pointer) then
        _Cast(57994,mainTarget[i].pointer)
    end end

    --pve keks
    if not arena and instanceType~="pvp" then
        for i=1,#mainTarget do if _interruptAll(mainTarget[i].pointer) then
            _Cast(57994,mainTarget[i].pointer);
        end end
    end

    --PurgeMC
    for i=1,#roster do
        if (UnitDebuffID(roster[i].Unit,605) or UnitBuffID(roster[i].Unit,605)) and UnitIsCharmed(roster[i].Unit) then
            _Cast(370,roster[i].Unit,true,true,"Magic");
        end
    end

    --importantdispels
    for i=1,#players do if _shamanPurify(players[i].Unit) then
        _Cast(77130,players[i].Unit);
    end end

    --Tremor
    tCount=0;
    for i=1,#players do
        if _canTremor(players[i].Unit) then
            tCount=tCount+1;
        end
    end
    if tCount>=1 then
        _Cast(8143);
    end

    --ground trap
    if groundTrap and GetTime()-groundTrap<=2.5 then
        _Cast(204336)
    end

    --ground casts
    for i=1,#mainTarget do if _shouldGround(mainTarget[i].pointer) then
        _Cast(204336);
    end end
    
    if bursting then
        --ascendance 
        _Cast(114052);
    end


    if kc.autoShock then
        for i=1,#lowFS do
            for i=1,#lowFS do if _debuffRemains(lowFS[i].pointer,188389,"PLAYER")<=gcd then
                _Cast(188389,lowFS[i].pointer,_,_,"Magic");
            end end
            for i=1,#lowFS do if _debuffRemains(lowFS[i].pointer,188389,"PLAYER")<7.02 then
                _Cast(188389,lowFS[i].pointer,_,_,"Magic");
            end end
        end
    end

    if kc.autoProc and UnitBuffID("player",77762) then
        for i=1,#mainTarget do
            if _debuffRemains(mainTarget[i].pointer,188389,"player")>=_castTime(51505) and not _isPet(mainTarget[i].pointer) then
                _Cast(51505,mainTarget[i].pointer);
            end
        end
    end

    if healerDPSKey then
        for i=1,#lowFS do
            for i=1,#lowFS do if _debuffRemains(lowFS[i].pointer,188389,"PLAYER")<=gcd then
                _Cast(188389,lowFS[i].pointer,_,_,"Magic");
            end end
            for i=1,#lowFS do if _debuffRemains(lowFS[i].pointer,188389,"PLAYER")<7.02 then
                _Cast(188389,lowFS[i].pointer,_,_,"Magic");
            end end
        end
        for i=1,#mainTarget do
            if _debuffRemains(mainTarget[i].pointer,188389,"player")>=_castTime(51505) and not _isPet(mainTarget[i].pointer) then
                _Cast(51505,mainTarget[i].pointer);
            end
        end
    end

    --Ghost Wolf Key
    if wolfKey and not UnitBuffID("player",2645) then
        _Cast(2645)
    end
    if wolfKey then return; end

    --chainheal
    if chainHealKey then
        for i=1,#players do
            _Cast(1064,players[i].Unit);
        end
    end

    --riptide to get tidal waves
    if (healingSurgeKey or healingwaveKey or wavetarKey or surgetarKey) and not UnitBuffID("player",53390) then
        for i=1,#players do
            _Cast(61295,players[i].Unit);
        end
    end

    --healing surge
    if healingSurgeKey then
        for i=1,#players do
            _Cast(8004,players[i].Unit);
        end
    end

    --surge tar
    if surgetarKey and UnitExists("target") then
        _Cast(8004,"target");
    end

    --healing wave
    if healingwaveKey then
        for i=1,#players do
            _Cast(77472,players[i].Unit);
        end
    end

    --wave tar
    if wavetarKey and UnitExists("target") then
        _Cast(77472,"target");
    end

    --chain auto
    if chainHealKey then
        for i=1,#players do
            _Cast(1064,players[i].Unit);
        end
    end

    if chaintarKey and UnitExists("target") then
        _Cast(1064,"target");
    end

    --unleashlife
    for i=1,#players do if players[i].HP>=GetSpellEffect(73685)*2 then
        _Cast(73685,players[i].Unit);
    end end

    --riptide
    for i=1,#players do if players[i].HP>=GetSpellEffect(61295) then
        _Cast(61295,players[i].Unit);
        _Cast(326059,players[i].Unit);
    end end

    --healing surge
    if kc.autoSurge then
        for i=1,#players do
            if _actualHp(players[i].Unit)<=kc.autoSurge then
                _Cast(8004,players[i].Unit);
            end
        end
    end

    --healing wave
    if kc.autoWave then
        for i=1,#players do
            if _actualHp(players[i].Unit)<=kc.autoWave then
                _Cast(77472,players[i].Unit);
            end
        end
    end

    --chain auto
    if kc.autoChain then
        for i=1,#players do
            if _actualHp(players[i].Unit)<=kc.autoChain then
                _Cast(1064,players[i].Unit);
            end
        end
    end


    --Purge
    for i=1,#mainTarget do if _smartPurgeCheck(mainTarget[i].pointer) then
        _Cast(370,mainTarget[i].pointer,true,true,nil,true);
    end end

    --healingstream
    if not lastHealingStream or GetTime()-lastHealingStream>=15 then
        for i=1,#players do if players[i].HP>=GetSpellEffect(5394) then
            _Cast(5394);
        end end
    end

    --earth shield
    if esPriority[1] and not UnitBuffID(esPriority[1].Unit,974,"player") then
        _Cast(974,esPriority[1].Unit);
    end

    --water shield
    if esPriority[1] and not _unitIsUnit("player",esPriority[1].Unit) then
        if not UnitBuffID("player",52127) then
            _Cast(52127);
        end
    end

    --earthbind
    for i=1,#mainTarget do if UnitIsPlayer(mainTarget[i].pointer) and not _its(mainTarget[i].pointer) and not _slowCheck(mainTarget[i].pointer) then
        _AeCast(2484,mainTarget[i].pointer,40);
    end end

    --enchant
    if not GetWeaponEnchantInfo(1) then
        _Cast(318038);
    end

    --lowest enemy
    lowestEnemy = 100;
    for i=1,#enemiesList do if UnitIsPlayer(enemiesList[i]) and _hpWithShield(enemiesList[i]) < lowestEnemy then
        lowestEnemy=_hpWithShield(enemiesList[i]);
    end end

    if lowestEnemy<=85 then
        _Cast(204330);
    end

    csTotemHp=100
    for i=1,#players do
        if _distance(players[i].Unit)<=20 and _actualHp(players[i].Unit)<=csTotemHp then
            csTotemHp=_actualHp(players[i].Unit)
        end
    end
    if csTotemHp<=90 then
        _Cast(204331);
    end

end

freezes={
    33395,
    215664,
}
function _isFrozen(u)
    for i=1,#freezes do if UnitDebuffID(u,freezes[i]) then return true; end end
end

function _frostM()

    _createMainTarget();

    --inter
    for i=1,#mainTarget do if _shouldCS(mainTarget[i].pointer) then
        _Cast(2139,mainTarget[i].pointer);
    end end

    if not arena and instanceType~="pvp" then
        for i=1,#mainTarget do if _interruptAll(mainTarget[i].pointer) then
            _Cast(2139,mainTarget[i].pointer);
        end end
    end

    if not UnitExists("pet") then
        _Cast(31687);
    end

    if UnitExists("pet") then
        for i=1,#mainTarget do if not _isFrozen(mainTarget[i].pointer) then
            _AeCast(33395,mainTarget[i].pointer,45);
        end end
    end

    for i=1,#mainTarget do
        --ice lance frozen or fingers
        if lastCast==116 then
            if _isFrozen(mainTarget[i].pointer) or UnitBuffID("player",44544) then
                _Cast(30455,mainTarget[i].pointer,_,_,"Magic");
            end
        end
    end

    --Cast Flurry Icon Flurry if you have Brain Freeze Icon Brain Freeze and you have just cast Frostbolt Icon Frostbolt.
    if UnitBuffID("player",190446) and lastCast and lastCast==116 then
        for i=1,#mainTarget do 
            _Cast(44614,mainTarget[i].pointer);
        end
    end

    for i=1,#mainTarget do
        if _numberAround(mainTarget[i].pointer,15)>=2 then
            _AeCast(190356,mainTarget[i].pointer,40);
        end
    end

    for i=1,#mainTarget do if not _isFrozen(mainTarget[i].pointer) and _distance(mainTarget[i].pointer)<=12 then
        _Cast(122);
    end end

    for i=1,#mainTarget do if not _isFrozen(mainTarget[i].pointer) and _distance(mainTarget[i].pointer)<=12 then
        _Cast(122);
    end end

    for i=1,#mainTarget do if _amIfacing(mainTarget[i].pointer) then
        _Cast(84714);
    end end

    --frost bolt
    for i=1,#mainTarget do _Cast(116,mainTarget[i].pointer,_,_,"Magic"); end 

    _Cast(11426);

    if UnitExists("pet") then
        for i=1,#mainTarget do if (not lastAttack or GetTime()-lastAttack>=0.5) then
            lastAttack=GetTime();
            PetAttack(mainTarget[i].pointer);
        end end
    end

end

function _arcaneM()

end

function _fireM()

end

uaCastCount=0;
function _affW()

    if not UnitChannelInfo("player") or UnitChannelInfo("player")~=GetSpellInfo(198590) then
        dsTick=0;
    end

    _createMainTarget();


    if UnitCastingInfo("player") and UnitExists(UnitSpellTarget("player")) and _im(UnitSpellTarget("player")) then
        SpellStopCasting();
    end

    if IsPlayerSpell(335052) then
        uaOut=0
        for i=1,#enemiesCache do if _debuffRemains(enemiesCache[i],342938,"PLAYER")>5 then
            uaOut=uaOut+1;
        end end
    else
        uaOut=0
        for i=1,#enemiesCache do if _debuffRemains(enemiesCache[i],316099,"PLAYER")>5 then
            uaOut=uaOut+1;
        end end
    end

    if IsPlayerSpell(335052) then
        uaLoS=0
        for i=1,#mainTarget do if _debuffRemains(mainTarget[i].pointer,342938,"PLAYER")>_castTime(324536) and _LoS(mainTarget[i].pointer)  then
            uaLoS=uaLoS+1;
        end end
    else
        uaLoS=0
        for i=1,#mainTarget do if _debuffRemains(mainTarget[i].pointer,316099,"PLAYER")>_castTime(324536) and _LoS(mainTarget[i].pointer)  then
            uaLoS=uaLoS+1;
        end end
    end

    agonyOut=0
    for i=1,#mainTarget do if _debuffRemains(mainTarget[i].pointer,980,"PLAYER")>=_castTime(324536) and _LoS(mainTarget[i].pointer) then
        agonyOut=agonyOut+1;
    end end

    corrOut=0
    for i=1,#mainTarget do if _debuffRemains(mainTarget[i].pointer,146739,"PLAYER")>=_castTime(324536) and _LoS(mainTarget[i].pointer) then
        corrOut=corrOut+1;
    end end

    slOut=0
    for i=1,#mainTarget do if _debuffRemains(mainTarget[i].pointer,63016,"PLAYER")>=_castTime(324536) and _LoS(mainTarget[i].pointer) then
        corrOut=corrOut+1;
    end end

    lowAgony={}
    for i=1,#mainTarget do
        if _debuffRemains(mainTarget[i].pointer,980,"PLAYER")>0 then
            table.insert(lowAgony,{pointer=mainTarget[i].pointer,dur=_debuffRemains(mainTarget[i].pointer,980,"PLAYER")});
        end
    end

    lowCorruption={}
    for i=1,#mainTarget do
        table.insert(lowCorruption,{pointer=mainTarget[i].pointer,dur=_debuffRemains(mainTarget[i].pointer,146739,"PLAYER")});
    end

    lowSL={}
    for i=1,#mainTarget do
        table.insert(lowSL,{pointer=mainTarget[i].pointer,dur=_debuffRemains(mainTarget[i].pointer,63106,"PLAYER")});
    end

    if IsPlayerSpell(335052) then
        lowUA={}
        for i=1,#mainTarget do
            table.insert(lowUA,{pointer=mainTarget[i].pointer,dur=_debuffRemains(mainTarget[i].pointer,342938,"PLAYER")});
        end
    else
        lowUA={}
        for i=1,#mainTarget do
            table.insert(lowUA,{pointer=mainTarget[i].pointer,dur=_debuffRemains(mainTarget[i].pointer,316099,"PLAYER")});
        end
    end

    table.sort(lowAgony, function(x,y) return x.dur < y.dur end);
    table.sort(lowCorruption, function(x,y) return x.dur < y.dur end);
    table.sort(lowSL, function(x,y) return x.dur < y.dur end);
    table.sort(lowUA, function(x,y) return x.dur < y.dur end);

    shards=UnitPower("player",7);

    if IsPlayerSpell(196102) then
        maxAgonyStack=18;
    else
        maxAgonyStack=10;
    end

    --ua delay
    if UnitCastingInfo("player") == GetSpellInfo(342938) then
        uaTarget = UnitSpellTarget("player")
        uaDelay = GetTime();
        if not addedUA then
            uaCastCount=uaCastCount+1;
            addedUA=true;
        end
    end

    if UnitCastingInfo("player") == GetSpellInfo(691) then
        castedPet = GetTime();
    end

    if UnitCastingInfo("player") == GetSpellInfo(27243) then
        seedDelay = GetTime();
    end

    if UnitChannelInfo("player") == GetSpellInfo(234153) then
        lastDrain = GetTime();
    end


    --refreshTimes
    --Creeping Death
    if not agonyRefresh then
        if IsPlayerSpell(264000) then
            agonyRefresh=5.967;
            --absolute corrupt 20.4
            if IsPlayerSpell(196103) then
                corruptionRefresh=7.956
            else
                corruptionRefresh=4.641;
            end
            slRefresh=4.992;
        else
            agonyRefresh=7.02;
            if IsPlayerSpell(196103) then
                corruptionRefresh=9.36;
            else
                corruptionRefresh=5.46;
            end
            slRefresh=5.85;
        end
    end

    if bursting then
        _Cast(113860);
    end

    -- --Keys--
    -- --Teleporting--
    if placeportKey then
        if _spellCooldown(48018)<=gcd and ((UnitCastingInfo("player") and UnitCastingInfo("player")~=GetSpellInfo(48018)) or UnitChannelInfo("player")) then SpellStopCasting(); end
        _Cast(48018);
    end

    if useportKey then
        if _spellCooldown(48020)<=gcd and (UnitCastingInfo("player") or UnitChannelInfo("player")) then SpellStopCasting(); end
        _Cast(48020);
    end

    if sfKey then
        if _spellCooldown(30283)<=gcd then
            rCastSpellByID(30283);
            if IsAoEPending() then
                CameraOrSelectOrMoveStart();
                CameraOrSelectOrMoveStop();
            end
            if IsAoEPending() then
                CancelPendingSpell();
            end
        end
    end

    if sfKey and _spellCooldown(30283)<=gcd then return; end 

    if fearKey and UnitIsVisible(ccTar) then
        _Cast(5782,ccTar,true,true,"Magic",_,_,true);
    end

    --coil
    if coilKey and UnitIsVisible(ccTar) then
        if _spellCooldown(6789)<=gcd and (UnitCastingInfo("player") or UnitChannelInfo("player")) then SpellStopCasting(); end
        _Cast(6789,ccTar,_,_,"Magic",_,_,true);
    end

    if coilKey then
        if _spellCooldown(5484)<=gcd and (UnitCastingInfo("player") or UnitChannelInfo("player")) then SpellStopCasting(); end
        _Cast(5484);
    end

    --all reflects
    for i=1,#mainTarget do
        if _shouldReflect(mainTarget[i].pointer) then
            _Cast(212295)
        end
    end

    if kc.autoaffwall and _actualHp("player")<=kc.autoaffwall then
        _Cast(104773);
    end

    --fear number of units
    if kc.autohowl and kc.autohowl~=0 then
        if #_getEnemyPlayersAroundUnit("player",10)>=kc.autohowl then
            _Cast(5484);
        end
    end

    --fear interrupt
    if kc.howlint then
        for i=1,#mainTarget do
            if _instantKick(mainTarget[i].pointer) then
                if _realDistance(mainTarget[i].pointer) <= 10 and _LoS(mainTarget[i].pointer) then
                    _Cast(5484);
                end
            end
        end
    end

    --howl healer trinket
    if kc.howltrinket then
        for i=1,#mainTarget do
            if _trinketed(mainTarget[i].pointer) and _isHealer(mainTarget[i].pointer) then
                if _realDistance(mainTarget[i].pointer) <= 10 and _LoS(mainTarget[i].pointer) then
                    _Cast(5484);
                end
            end
        end
    end

    --howl all trinket
    if kc.howlalltrinket then
        for i=1,#mainTarget do
            if _trinketed(mainTarget[i].pointer) then
                if _realDistance(mainTarget[i].pointer) <= 10 and _LoS(mainTarget[i].pointer) then
                    _Cast(5484);
                end
            end
        end
    end

    if UnitExists("pet") then
        for i=1,#mainTarget do if _isHealer(mainTarget[i].pointer) and (not lastAttack or GetTime()-lastAttack>=0.5) then
            lastAttack=GetTime();
            PetAttack(mainTarget[i].pointer);
        end end
    end

    --autosack
    if not UnitBuffID("player",196099) then
        if not castedPet or GetTime()-castedPet>=gcd then
            if not UnitExists("pet") and not UnitCastingInfo("player") then
                _Cast(691);
            end
        end

        if UnitExists("pet") and _spellCooldown(19647)>1 then
            _Cast(108503);
        end
    end

    --autosummon pet fel dom / reset kick cd
    if kc.autosummon then
        if UnitBuffID("player",196099) and _spellCooldown(132409)>16 then
            _Cast(333889)
            if _castTime(691)<1 then
                _Cast(691);
            end
        end
    end

    --Interrupt
    --Interrupt
    if UnitBuffID("player",196099) then
        for i=1,#mainTarget do
            local u=mainTarget[i].pointer;
            if _shouldCS(u) then
                rCastSpellByName(L["Spell Lock"],u);
            end
        end

        if not arena and instanceType~="pvp" then
            for i=1,#mainTarget do if _interruptAll(mainTarget[i].pointer) then
                rCastSpellByName(L["Spell Lock"],mainTarget[i].pointer);
            end end
        end
    end

    if HasPetSpells()==11 then
        for i=1,#mainTarget do
            local u=mainTarget[i].pointer;
            if _shouldCS(u) and _LoS("pet",u) and _distance("pet",u)<=40 then
                rCastSpellByName(L["Spell Lock"],u);
            end
        end

        if arena then
            for i=1,3 do
                local u="arena"..i;
                if _shouldCS(u) and _LoS("pet",u) and _distance("pet",u)<=40 then
                    rCastSpellByName(L["Spell Lock"],u);
                end

                if _smartPurgeCheck(u) and _LoS("pet",u) and _distance("pet",u)<=40 then
                    rCastSpellByName(L["Devour Magic"],u);
                end
            end
        end

        if not arena and instanceType~="pvp" then
            for i=1,#mainTarget do
                local u=mainTarget[i].pointer
                if _interruptAll(u) and _LoS("pet",u) and _distance("pet",u)<=40 then
                    rCastSpellByName(L["Spell Lock"],u);
                end
            end
        end

        for i=1,#mainTarget do
            local u=mainTarget[i].pointer
            if _smartPurgeCheck(u) and _LoS("pet",u) and _distance("pet",u)<=40 then
                rCastSpellByName(L["Devour Magic"],u);
            end
        end
    end

    if UnitChannelInfo("player")=="Drain Life" then return; end

    if bursting then
        for i=1,#mainTarget do
            _Cast(205180);
        end
    end

    if UnitLevel("player")>=60 then
        --totem stomp
        local ptotemList = {
        "Spirit Link Totem",
        -- "Ancestral Protection Totem",
        -- "Counterstrike Totem",
        "Skyfury Totem",
        --"Lightning Surge Totem",
        "Grounding Totem",
        "Psyfiend",
        "Capacitor Totem",
        --"Voodoo Totem",
        --"War Banner",
        --"Healing Stream Totem",
        --"Earthen Wall Totem",
        "Tremor Totem",
        --"Earthbind Totem",
        --"Earthgrab Totem",
        }
        for i=1,#enemiesCache do
            for n=1,#ptotemList do
                if ObjectName(enemiesCache[i]) == ptotemList[n] and not UnitIsPlayer(enemiesCache[i]) and not _isPet(enemiesCache[i]) and _LoS(enemiesCache[i]) then
                    if UnitHealth(enemiesCache[i]) <= 18000 then
                        _Cast(172,enemiesCache[i],true,true)
                    end
                end
            end
        end
    end

    --seed of corrupt
    if not seedOut then
        if kc.seed and kc.seed>0 and (not seedDelay or GetTime()-seedDelay>=4) then
            for i=1,#mainTarget do
                if _numberAroundNoCorrupt(mainTarget[i].pointer,10)>=kc.seed+1 then
                    _Cast(27243,mainTarget[i].pointer,_,_,"Magic");
                end
            end
        end
    end

    ---ONLY PLAYERS---
    --nightfall procs
    if UnitBuffID("player",264571) then
        for i=1,#mainTarget do if (UnitIsPlayer(mainTarget[i].pointer) or instanceType ~= "pvp") then
            if UnitIsPlayer(mainTarget[i].pointer) or instanceType~="pvp" then
                _Cast(232670,mainTarget[i].pointer,_,_,"Magic");
            end
        end end
    end

    --phantom
    if not kc.psunits then
        minps=1;
    else
        minps=kc.psunits;
    end
    if _actualHp("player")<=75 or instanceType~="pvp" then
        for n=#mainTarget,1,-1 do
            for i=1,#mainTarget do if _numberAround(mainTarget[i].pointer,15)>=minps then
                if (UnitIsPlayer(mainTarget[i].pointer) or instanceType~="pvp") then
                    _Cast(205179,mainTarget[i].pointer,true,true,"Magic");
                end
            end end
        end
    end

    --taint
    if kc.taint and IsPlayerSpell(278350) then
        for i=1,#mainTarget do if _numberAround(mainTarget[i].pointer,10)>=kc.taint then
            _AeCast(278350,mainTarget[i].pointer,40)
        end end
    end

    --soulshatter
    if corrOut>=5 then
        _Cast(212356);
    end

    --haunt
    for i=1,#mainTarget do
        _Cast(48181,mainTarget[i].pointer,_,_,"Magic");
    end

    if (not uaDelay or GetTime()-uaDelay>3) and uaCount>=3 then
        uaCount=0;
    end

    if IsPlayerSpell(335052) then
        maxUAs=3;
    else
        maxUAs=1;
    end

    if UnitCastingInfo("player")==GetSpellInfo(342938) then uaOut=uaOut+1; end

    if IsPlayerSpell(335052) then
        if uaOut<maxUAs then
            for i=1,#mainTarget do
                if (UnitIsPlayer(mainTarget[i].pointer) or instanceType ~= "pvp" or kc.hitpve) then
                    if _debuffRemains(mainTarget[i].pointer,342938,"PLAYER") <= _castTime(342938) then 
                        if (not uaDelay or GetTime()-uaDelay>3) or (uaTarget~=mainTarget[i].pointer and maxUAs>1) then
                            if _canDot(mainTarget[i].pointer) then
                                _Cast(342938,mainTarget[i].pointer,true,true,"Magic");
                            end
                        end
                    end
                end
            end
        end   
    elseif not IsPlayerSpell(335052) then
        if uaOut<maxUAs then
            for i=1,#mainTarget do
                if (UnitIsPlayer(mainTarget[i].pointer) or instanceType ~= "pvp" or kc.hitpve) then
                    if _debuffRemains(mainTarget[i].pointer,316099,"PLAYER") <= _castTime(316099) then
                        if (not uaDelay or GetTime()-uaDelay>3) then
                            if _canDot(mainTarget[i].pointer) then
                                _Cast(316099,mainTarget[i].pointer,true,true,"Magic");
                            end
                        end
                    end
                end
            end
        end 
    end

    --Keep up Agony Stacks Maximize
    for i=1,#lowAgony do
        if UnitDebuffID(lowAgony[i].pointer,980,"PLAYER") and _debuffRemains(lowAgony[i].pointer,980,"PLAYER") <= agonyRefresh then
            if UnitIsPlayer(lowAgony[i].pointer) then
                _Cast(980,lowAgony[i].pointer,true,true,"Magic");
            end
        end
    end


    --Keep up Agony Stacks 2 gcds
    for i=1,#lowAgony do
        if UnitDebuffID(lowAgony[i].pointer,980,"PLAYER") and _debuffRemains(lowAgony[i].pointer,980,"PLAYER") <= _castTime(324536)+gcd*2 then
            _Cast(980,lowAgony[i].pointer,true,true,"Magic");
        end
    end


    canMalefic=false;
    if arena then malnum=9 else malnum=6; end
    if not IsPlayerSpell(63016) then
        for i=1,#mainTarget do
            if uaLoS+agonyOut+corrOut>=malnum then
                canMalefic=true;
            end
        end
    else
        for i=1,#mainTarget do
            if uaLoS+agonyOut+corrOut+slOut>=malnum+3 then
                canMalefic=true;
            end
        end
    end

    if bursting then
        if _buffStacks("player",334320)>=50 and (not lastDrain or lastDrain>=1.5) then
            for i=1,#mainTarget do
                _Cast(234153,mainTarget[i].pointer,_,_,"Magic");
            end
        end
    end


    if canMalefic then
        for i=1,#mainTarget do
          _Cast(324536,mainTarget[i].pointer,_,_,"Magic");
        end
        _Cast(344566);
    end

    --corruption to keep slow
    if not IsPlayerSpell(196102) then
        for i=1,#mainTarget do
            if UnitIsPlayer(mainTarget[i].pointer) and UnitDebuffID(mainTarget[i].pointer,146739,"PLAYER") and not _slowCheck(mainTarget[i].pointer) then
                if _canDot(mainTarget[i].pointer) then
                   _Cast(172,mainTarget[i].pointer,true,true,"Magic","Slow");
                end
            end
        end
    end

    --Corruption with talent
    if not seedOut then
        if not seedDelay or GetTime()-seedDelay>=4 then
            if not IsPlayerSpell(196102) then
                for i=1,#lowCorruption do
                    if _debuffRemains(lowCorruption[i].pointer,146739,"PLAYER") <= corruptionRefresh then
                        if _canDot(lowCorruption[i].pointer) then
                           _Cast(172,lowCorruption[i].pointer,true,true,"Magic");
                        end
                    end
                end
            end
        end
    end

    --New Agonies
    for i=1,#mainTarget do
        if _debuffRemains(mainTarget[i].pointer,980,"PLAYER") <= gcd*2 then
            if _canDot(mainTarget[i].pointer) then
                _Cast(980,mainTarget[i].pointer,true,true,"Magic");
            end
        end
    end

    --Dont let corruption fall
    for i=1,#lowCorruption do
        if _debuffRemains(lowCorruption[i].pointer,146739,"PLAYER") <= gcd*2 then
            if UnitIsPlayer(lowCorruption[i].pointer) then
                if _canDot(lowCorruption[i].pointer) then
                   _Cast(172,lowCorruption[i].pointer,true,true,"Magic");
                end
            end
        end
    end

    --Dont let sl fall
    for i=1,#lowSL do
        if _debuffRemains(lowSL[i].pointer,63106,"PLAYER") <= gcd*2 then
            if UnitIsPlayer(lowSL[i].pointer) then
                if _canDot(lowSL[i].pointer) then
                    _Cast(63106,lowSL[i].pointer,true,true,"Magic");
                end
            end
        end
    end

    --maxUA
    if IsPlayerSpell(335052) then
        for i=1,#mainTarget do
            if _debuffRemains(mainTarget[i].pointer,342938,"PLAYER")>_castTime(342938) and _debuffRemains(mainTarget[i].pointer,342938,"PLAYER")<_castTime(342938)+6.24 then
                if (not uaDelay or GetTime()-uaDelay>3) or (uaTarget~=mainTarget[i].pointer and maxUAs>1) then
                    if _canDot(mainTarget[i].pointer) then
                        _Cast(342938,mainTarget[i].pointer,true,true,"Magic");
                    end
                end
            end
        end
    else
        for i=1,#mainTarget do
            if _debuffRemains(mainTarget[i].pointer,316099,"PLAYER")>_castTime(316099) and _debuffRemains(mainTarget[i].pointer,316099,"PLAYER")<_castTime(316099)+6.24 then
                if (not uaDelay or GetTime()-uaDelay>3) or (uaTarget~=mainTarget[i].pointer and maxUAs>1) then
                    if _canDot(mainTarget[i].pointer) then
                        _Cast(316099,mainTarget[i].pointer,true,true,"Magic");
                    end
                end
            end
        end
    end

    --Maximize agony
    for i=1,#lowAgony do
        if _debuffRemains(lowAgony[i].pointer,980,"PLAYER") <= agonyRefresh then
            if UnitIsPlayer(lowAgony[i].pointer) then
                if _canDot(lowAgony[i].pointer) then
                    _Cast(980,lowAgony[i].pointer,true,true,"Magic");
                end
            end
        end
    end

    --Maximize corruption
    if not seedOut then
        if not seedDelay or GetTime()-seedDelay>=4 then
            if not IsPlayerSpell(235157) then
                for i=1,#lowCorruption do
                    if _debuffRemains(lowCorruption[i].pointer,146739,"PLAYER") <= corruptionRefresh then
                        if _canDot(lowCorruption[i].pointer) then
                            _Cast(172,lowCorruption[i].pointer,true,true,"Magic");
                        end
                    end
                end
            end
        end
    end

    --Maximize sl
    for i=1,#lowSL do
        if _debuffRemains(lowSL[i].pointer,63106,"PLAYER") <= slRefresh then
            if UnitIsPlayer(lowSL[i].pointer) then
                if UnitIsPlayer(lowCorruption[i].pointer) then
                    if _canDot(lowSL[i].pointer) then
                        _Cast(63106,lowSL[i].pointer,true,true,"Magic");
                    end
                end
            end
        end
    end

    ---END ONLY PLAYERS---

    --Keep up Agony Stacks 2 gcds
    for i=1,#lowAgony do
        if UnitDebuffID(lowAgony[i].pointer,980,"PLAYER") and _debuffRemains(lowAgony[i].pointer,980,"PLAYER") <= gcd*2 then
            if _canDot(lowAgony[i].pointer) then
                _Cast(980,lowAgony[i].pointer,true,true,"Magic");
            end
        end
    end

    --nightfall procs
    if UnitBuffID("player",264571) then
        for i=1,#mainTarget do if (UnitIsPlayer(mainTarget[i].pointer) or instanceType ~= "pvp") then
            _Cast(232670,mainTarget[i].pointer,_,_,"Magic"); 
        end end
    end

    --Keep up Agony Stacks Maximize
    for i=1,#lowAgony do
        if UnitDebuffID(lowAgony[i].pointer,980,"PLAYER") and _debuffRemains(lowAgony[i].pointer,980,"PLAYER") <= agonyRefresh then
            if _canDot(lowAgony[i].pointer) then
                _Cast(980,lowAgony[i].pointer,true,true,"Magic");
            end
        end
    end

    --New Agonies
    for i=1,#lowAgony do
        if _debuffRemains(lowAgony[i].pointer,980,"PLAYER") <= gcd*2 then
            if _canDot(lowAgony[i].pointer) then
                _Cast(980,lowAgony[i].pointer,true,true,"Magic");
            end
        end
    end

    --Dont let corruption fall
    for i=1,#lowCorruption do
        if _debuffRemains(lowCorruption[i].pointer,146739,"PLAYER") <= gcd*2 then
            if _canDot(lowCorruption[i].pointer) then
                _Cast(172,lowCorruption[i].pointer,true,true,"Magic");
            end
        end
    end

    if arena then
        --Dont let sl fall
        for i=1,#lowSL do
            if _debuffRemains(lowSL[i].pointer,63106,"PLAYER") <= gcd*2 then
                if _canDot(lowSL[i].pointer) then
                    _Cast(63106,lowSL[i].pointer,true,true,"Magic");
                end
            end
        end
    end


    --Dont let sl fall
    for i=1,#lowSL do
        if _debuffRemains(lowSL[i].pointer,63106,"PLAYER") <= gcd*2 then
            if _canDot(lowSL[i].pointer) then
                _Cast(63106,lowSL[i].pointer,true,true,"Magic");
            end
        end
    end

    --Maximize agony
    for i=1,#lowAgony do
        if _debuffRemains(lowAgony[i].pointer,980,"PLAYER") <= agonyRefresh then
            if _canDot(lowAgony[i].pointer) then
                _Cast(980,lowAgony[i].pointer,true,true,"Magic");
            end
        end
    end

    --Maximize corruption
    if not IsPlayerSpell(235157) then
        for i=1,#lowCorruption do
            if _debuffRemains(lowCorruption[i].pointer,146739,"PLAYER") <= corruptionRefresh then
                if _canDot(lowCorruption[i].pointer) then
                    _Cast(172,lowCorruption[i].pointer,true,true,"Magic");
                end
            end
        end
    end

    --Maximize sl
    for i=1,#lowSL do
        if _debuffRemains(lowSL[i].pointer,63106,"PLAYER") <= slRefresh then
            if _canDot(lowSL[i].pointer) then
                _Cast(63106,lowSL[i].pointer,true,true,"Magic");
            end
        end
    end

    --soul rot
    for i=1,#mainTarget do
        if _canDot(mainTarget[i].pointer) then
           _Cast(325640,mainTarget[i].pointer,_,_,"Magic");
        end
    end

    canMalefic=false;
    if not IsPlayerSpell(63016) then
        for i=1,#mainTarget do
            if uaLoS+agonyOut+corrOut>=3 then
                canMalefic=true;
            end
        end
    else
        for i=1,#mainTarget do
            if uaLoS+agonyOut+corrOut+slOut>=4 then
                canMalefic=true;
            end
        end
    end

    if bursting and (not lastDrain or lastDrain>=1.5) then
        if _buffStacks("player",334320)>=50 then
            for i=1,#mainTarget do
                _Cast(234153,mainTarget[i].pointer,_,_,"Magic");
            end
        end
    end

    if canMalefic then
        for i=1,#mainTarget do
            _Cast(324536,mainTarget[i].pointer,_,_,"Magic");
        end
        _Cast(344566);
    end

    --soul rot
    if not UnitBuffID("player",285933) then
        _Cast(285933);
    end

    
    --tongues/weak
    for i=1,#mainTarget do
        if UnitIsPlayer(mainTarget[i].pointer) and _isHealer(mainTarget[i].pointer) and not UnitDebuffID(mainTarget[i].pointer,1714) then
            _Cast(1714,mainTarget[i].pointer,_,_,"Magic");
        end
    end
    for i=1,#mainTarget do
        if UnitIsPlayer(mainTarget[i].pointer) and _isCasterDps(mainTarget[i].pointer) and not UnitDebuffID(mainTarget[i].pointer,1714) then
            _Cast(1714,mainTarget[i].pointer,_,_,"Magic");
        end
    end
    for i=1,#mainTarget do
        if UnitIsPlayer(mainTarget[i].pointer) and _isMeleeDps(mainTarget[i].pointer) and not UnitDebuffID(mainTarget[i].pointer,702) then
            _Cast(702,mainTarget[i].pointer,_,_,"Magic");
        end
    end

    --drainlife
    if kc.drainlife and _actualHp("player")<=kc.drainlife then
        for i=1,#mainTarget do
            _Cast(234153,mainTarget[i].pointer,_,_,"Magic");
        end
    end       

    --drain soul
    for i=1,#mainTarget do
        _Cast(198590,mainTarget[i].pointer,_,_,"Magic");
    end

    --sbolt
    if kc.sbolt then
        for i=1,#mainTarget do
            _Cast(686,mainTarget[i].pointer,_,_,"Magic");
        end
    end

    if not UnitAffectingCombat("player") and GetItemCount(5512)<=0 then
        _Cast(29893);
    end

    if not UnitAffectingCombat("player") and GetItemCount(5512)<=0 then
        if not lastHScast or GetTime()-lastHScast>=4 then
            _Cast(6201);
            lastHScast=GetTime();
        end
    end

end

function _demoW()

end

function _destroW()
    _createMainTarget()

    --force face immolate, bolt
    if _castID("player")==348 or _castID("player")==116858 or _castID("player")==297 then
        if not _amIfacing(UnitSpellTarget("player")) then
            FaceDirection(_anglesBetweenObjects("player",UnitSpellTarget("player")),true);
        end
    end

    --immolate delay
    if _castID("player")==348 then
        immolateTarget = UnitSpellTarget("player")
        immolateDelay = GetTime();
    end

    if UnitCastingInfo("player") and UnitExists(UnitSpellTarget("player")) and _im(UnitSpellTarget("player")) then
        SpellStopCasting();
    end


    shards=UnitPower("player",7);

    if cataKey then
        if _spellCooldown(152108)<=gcd then
            rCastSpellByID(152108);
            if IsAoEPending() then
                CameraOrSelectOrMoveStart();
                CameraOrSelectOrMoveStop();
            end
            if IsAoEPending() then
                CancelPendingSpell();
            end
        end
    end

    if cataKey and _spellCooldown(152108)<=gcd then return; end

    if sfKey then
        if _spellCooldown(30283)<=gcd then
            rCastSpellByID(30283);
            if IsAoEPending() then
                CameraOrSelectOrMoveStart();
                CameraOrSelectOrMoveStop();
            end
            if IsAoEPending() then
                CancelPendingSpell();
            end
        end
    end

    if sfKey and _spellCooldown(30283)<=gcd then return; end

    if fearKey and UnitIsVisible(ccTar) then
        _Cast(5782,ccTar,true,true,"Magic",_,_,true);
    end

    --double coil
    if coilKey then

        --healer
        -- for i=1,#mainTarget do if _isHealer(mainTarget[i].pointer) then
        --     _Cast(80240,mainTarget[i].pointer);
        -- end end

        --any
        for i=1,#mainTarget do if not _isHealer(mainTarget[i].pointer) and (UnitIsPlayer(mainTarget[i].pointer) or instanceType~="pvp") then
            _Cast(80240,mainTarget[i].pointer,_,_,"Magic",_,_,true);
        end end

        --finish
        for i=1,#mainTarget do if not UnitDebuffID(mainTarget[i].pointer,80240,"PLAYER") and (UnitIsPlayer(mainTarget[i].pointer) or instanceType~="pvp")  then
            _Cast(6789,mainTarget[i].pointer,_,_,"Magic",_,_,true);
        end end

    end

    --all reflects
    for i=1,#mainTarget do
        if _shouldReflect(mainTarget[i].pointer) then
            _Cast(212295)
        end
    end

    if UnitExists("pet") then
        for i=1,#mainTarget do if _isHealer(mainTarget[i].pointer) and (not lastAttack or GetTime()-lastAttack>=0.5) then
            lastAttack=GetTime();
            PetAttack(mainTarget[i].pointer);
        end end
    end

    
    --Reflect Havoc
    if arena then
        for i=1,#roster do if UnitDebuffID(roster[i].Unit,80240) then
            _Cast(212295)
        end end
    end

    --Interrupt
    if HasPetSpells()==11 or UnitBuffID("player",196099) then
        for i=1,#mainTarget do
        local u=mainTarget[i].pointer;
            if _shouldCS(u) then
                rCastSpellByName(L["Spell Lock"],u);
            end
        end

        if not arena and instanceType~="pvp" then
            for i=1,#mainTarget do if _interruptAll(mainTarget[i].pointer) then
                rCastSpellByName(L["Spell Lock"],mainTarget[i].pointer);
            end end
        end
    end

    for i=1,#mainTarget do if _ragePurge(mainTarget[i].pointer) then
        rCastSpellByName(L["Devour Magic"],mainTarget[i].pointer);
    end end

    --(bursting or kc.burst==true)
    if bursting then

        if _spellCooldown(1122)<=gcd then
            if _spellCooldown(1122)<=gcd then
                rCastSpellByID(1122);
                if IsAoEPending() then
                    CameraOrSelectOrMoveStart();
                    CameraOrSelectOrMoveStop();
                end
                if IsAoEPending() then
                    CancelPendingSpell();
                end
            end
        end

        _Cast(113858)

        UseItemByName("Ignition Mage's Fuse")

    end

    --conflag
    if not UnitBuffID("player",117828) then
        if boltSmart then
            for i=1,#mainTarget do if _amIfacing(mainTarget[i].pointer) then
                _Cast(17962,mainTarget[i].pointer,_,_,"Magic");
            end end
        end
        if boltTarget then
            for i=1,#mainTarget do if _unitIsUnit(mainTarget[i].pointer,"target") then
                _Cast(17962,mainTarget[i].pointer,_,_,"Magic");
            end end
        end
    end

    --boltkey(any)
    if boltSmart then
        for i=1,#mainTarget do
            if arena and UnitIsPlayer(mainTarget[i].pointer) then
                _AeCast(200546,mainTarget[i].pointer,40);
                _Cast(116858,mainTarget[i].pointer,_,_,"Magic");
            end
            if not arena then
                _AeCast(200546,mainTarget[i].pointer,40);
                _Cast(116858,mainTarget[i].pointer,_,_,"Magic");
            end
        end
    end

    --boltTarget-
    if boltTarget then
        for i=1,#mainTarget do if _unitIsUnit(mainTarget[i].pointer,"target") then
            if arena and UnitIsPlayer(mainTarget[i].pointer) then
                _AeCast(200546,mainTarget[i].pointer,40);
                _Cast(116858,mainTarget[i].pointer,_,_,"Magic");
            end
            if not arena then
                _AeCast(200546,mainTarget[i].pointer,40);
                _Cast(116858,mainTarget[i].pointer,_,_,"Magic");
            end
        end end
    end

    shamanExists=nil
    for i=1,#mainTarget do if select(2,UnitClass(mainTarget[i].pointer))=="SHAMAN" then
        shamanExists=true;
    end end

    --totem stomp
    local ptotemList = {
    "Spirit Link Totem",
    -- "Ancestral Protection Totem",
    -- "Counterstrike Totem",
    "Skyfury Totem",
    --"Lightning Surge Totem",
    "Grounding Totem",
    "Psyfiend",
    "Capacitor Totem",
    "Earthbind Totem",
    --"Voodoo Totem",
    "Earthgrab Totem",
    "War Banner",
    "Healing Stream Totem",
    --"Earthen Wall Totem",
    "Tremor Totem",
    }
    for i=1,#enemiesCache do
        for n=1,#ptotemList do
            if UnitCanAttack("player",enemiesCache[i]) and ObjectName(enemiesCache[i]) == ptotemList[n] and not UnitIsPlayer(enemiesCache[i]) and not _isPet(enemiesCache[i]) then
                _Cast(17877,enemiesCache[i]);
            end
        end
    end

    for i=1,#mainTarget do
        if UnitCastingInfo(mainTarget[i].pointer)=="Greater Pyroblast" or UnitCastingInfo(mainTarget[i].pointer)=="Chaos Bolt" then
            if _castTimeLeft(mainTarget[i].pointer)>_castTime(5782) then
                if UnitCastingInfo("player")=="Immolate" and _spellCooldown(5782)<=gcd and _LoS(mainTarget[i].pointer) and _spellInRange(5782,mainTarget[i].pointer) then
                    SpellStopCasting();
                end
                _Cast(5782,mainTarget[i].pointer,_,_,"Magic");
            end
        end
    end
                

    if select(2,GetTotemInfo(1))=="Infernal" and shards>=5 then
        --if not UnitBuffID("player",266091) then
            for i=1,#mainTarget do _AeCast(5740,mainTarget[i].pointer,40); end
        --end
    end

    --if IsPlayerSpell(196408) then
    --    for i=1,#mainTarget do _AeCast(5740,mainTarget[i].pointer,40); end
    --end

    --immolatekeepup
    for i=1,#mainTarget do if _debuffRemains(mainTarget[i].pointer,157736,"PLAYER")<=gcd+_castTime(348) then
        if not immolateDelay or GetTime()-immolateDelay >= 3 or immolateTarget ~= mainTarget[i].pointer then
            _Cast(348,mainTarget[i].pointer,_,_,"Magic");
        end
    end end

    --immolateMax
    for i=1,#mainTarget do if _debuffRemains(mainTarget[i].pointer,157736,"PLAYER")<=7.02+_castTime(348) then
        if not immolateDelay or GetTime()-immolateDelay >= 3 or immolateTarget ~= mainTarget[i].pointer then
            _Cast(348,mainTarget[i].pointer,_,_,"Magic");
        end
    end end

    for i=1,#mainTarget do _Cast(196447,mainTarget[i].pointer,_,_,"Magic"); end

    if not UnitBuffID("player",117828) then
        for i=1,#mainTarget do _Cast(17962,mainTarget[i].pointer,_,_,"Magic"); end
    end


    if boltTarget or boltSmart or IsPlayerSpell(196408) then

        --incinerate
        for i=1,#mainTarget do

            if not shamanExists then
                _Cast(17877,mainTarget[i].pointer,_,_,"Magic");
            end

            _Cast(29722,mainTarget[i].pointer,_,_,"Magic");
        end
        
    end

    if not UnitBuffID("player",285933) then
        _Cast(285933);
    end

    if kc.fillwithincinerate then
        
        for i=1,#mainTarget do
            _Cast(29722,mainTarget[i].pointer,_,_,"Magic");
        end

    end

end

function _balanceD()

    _createMainTarget();

    if UnitBuffID("player",5215) then return; end

    if UnitChannelInfo("player") then return; end

    if UnitCastingInfo("player")==190984 then
        wrathDelay=GetTime();
    end
    if UnitCastingInfo("player")==194153 then
        starfireDelay=GetTime();
    end

    lowSunfire={}
    for i=1,#mainTarget do
        table.insert(lowSunfire,{pointer=mainTarget[i].pointer,dur=_debuffRemains(mainTarget[i].pointer,164815,"PLAYER")});
    end

    lowMoonfire={}
    for i=1,#mainTarget do
        table.insert(lowMoonfire,{pointer=mainTarget[i].pointer,dur=_debuffRemains(mainTarget[i].pointer,164812,"PLAYER")});
    end

    table.sort(lowSunfire, function(x,y) return x.dur < y.dur end);
    table.sort(lowMoonfire, function(x,y) return x.dur < y.dur end);

    if UnitCastingInfo("player") then
        LastSpellCast=select(9,UnitCastingInfo("player"));
    end

    if UnitCastingInfo("player")==194153 then
        projectedPower=UnitPower("player")+12;
    end

    if UnitCastingInfo("player")==190984 then
        projectedPower=UnitPower("player")+8;
    end

    if not UnitCastingInfo("player") then
        projectedPower=UnitPower("player");
    end

    if UnitChannelInfo("player") then return false; end

    if UnitBuffID("player",194223) then
        CelestialUp=true;
    else
        CelestialUp=false;
    end

    activeEnemies=_numberAround("player",8);

    if UnitBuffID("player",1850) or UnitBuffID("player",783) or UnitBuffID("player",106898) then return; end

    --kicks
    for i=1,#mainTarget do
    local u=mainTarget[i].pointer;
        if _instantKickUnint(u) and _distance(u)<=15 and kc.incapInterrupt then
            --incap
            _Cast(99);
        end
        if _instantKickUnint(u) and kc.bashint then
            --mbash
            _Cast(5211,u);
        end
    end

    if bursting then
        _Cast(323764);
        --_useDPStrinket();
        --rCastSpellByName(L["Incarnation: Chosen of Elune"]);
        _Cast(102560)
        --if not CelestialUp then
        --    _Cast(194223);
        --end
        _Cast(205636);
        --_Cast(202425);
    end

    --RootBeam
    if rootKey and ccTar then
        if UnitDebuffID(ccTar,102359) or UnitDebuffID(ccTar,339) then
            _Cast(78675,ccTar,_,_,"Magic",_,_,true);
        end
        if not UnitDebuffID(ccTar,102359) and not UnitDebuffID(ccTar,339) then
            _Cast(102359,ccTar,_,_,"Magic",_,_,true);
            _Cast(339,ccTar,_,_,"Magic",_,_,true);
        end
    end

    if kc.autobeam then
        for i=1,#mainTarget do if _shouldCS(mainTarget[i].pointer) then
            _Cast(78675,mainTarget[i].pointer);
        end end

        if not arena and instanceType~="pvp" then
            for i=1,#mainTarget do if _interruptAll(mainTarget[i].pointer) then
                _Cast(78675,mainTarget[i].pointer);
            end end
        end
    end

    if kc.autobark and _actualHp("player")<=kc.autobark then
        _Cast(22812);
    end

    if kc.autoregrow and _actualHp("player")<=kc.autoregrow then
        _Cast(8936,"player");
    end

    
    local dDispel = {80240,51514,19386};
    for i=1,#players do for n=1,#dDispel do
        if UnitDebuffID(players[i].Unit,dDispel[n]) then
             _Cast(2782,players[i].Unit,true,true)
        end
    end end

    function _bearST(u)
        
        StartAttack()

        --Bear
        if not UnitBuffID("player",5487) then
            RunMacroText("/cast "..bearform)
        end

        if not UnitBuffID("player",5487) then return; end

        if activeEnemies>2 and not UnitDebuffID(u,106830,"PLAYER") and _debuffRemains(u,192090,"PLAYER")<=5.85 then
            if _spellCooldown(77758)<=gcd then
                rCastSpellByName(L["Thrash"]);
            end
        end

        _Cast(33917,u);

        --moon
        if _debuffRemains(u,164812,"PLAYER")<=5.46 and _canDot(u) then
            _Cast(8921,u);
        end

        --Moonfires
        for i=1,#mainTarget do
            --moon
            if _debuffRemains(mainTarget[i].pointer,164812,"PLAYER")<=5.46 and _canDot(mainTarget[i].pointer) then
                _Cast(8921,mainTarget[i].pointer,_,_,"Magic");
            end
        end

        if activeEnemies>2 then
            if _spellCooldown(213771)<=gcd then
                rCastSpellByName(L["Swipe"]);
            end
        end
    end


    if bearKey then
        if _actualHp("player")<=70 then
            _Cast(22842);
        end
        if _meleeDpsOnUnit("player")>=1 then
            _Cast(192081);
        end
        for i=1,#mainTarget do
            if _unitIsUnit("target",mainTarget[i].pointer) then
                _bearST(mainTarget[i].pointer);
            end
        end
    end

    if bearKey then return; end

    apDeficit=UnitPowerMax("player")-UnitPower("player")

    if UnitCastingInfo("player")==GetSpellInfo(194153) then
        lunardelay=GetTime();
    end
    if UnitCastingInfo("player")==GetSpellInfo(190984) then
        solardelay=GetTime();
    end
    if UnitCastingInfo("player")==GetSpellInfo(202347) then
        stellarDelay=GetTime();
        stellarTarget=UnitSpellTarget("player")
    end

    if regrowKey then

        for i=1,#players do
            _Cast(18562,players[i].Unit);
        end

        for i=1,#players do if not UnitBuffID(players[i].Unit,774,"PLAYER") then
            _Cast(774,players[i].Unit);
        end end

        _Cast(8936,players[1].Unit);
    end

    if regrowKey then return; end

    --boomy form
    if not UnitBuffID("player",24858) and not UnitBuffID("player",5215) then
        RunMacroText("/cast "..moonkinform)
    end

    if rootKey then
        _Cast(339,ccTar,_,_,"Magic",_,_,true);
    end

    if cloneKey then
        _Cast(209753,ccTar,_,_,"Magic",_,_,true);
    end

    if bashKey then
        _Cast(5211,ccTar,_,_,_,_,_,true);
        _Cast(102359,ccTar,_,_,"Magic",_,_,true);
        _Cast(132469);
    end

    aoeAvailable=false;
    if not arena then
        aoeAvailable=false;
        if (UnitBuffID("player",279709) and _buffStacks("player",279709)<3) or UnitPower("Player")>=90 or not IsPlayerSpell(202345) then
            --aoe bulshit 3+ enemy
            if not UnitBuffID("player",191034) then
                if _numberAround("player",45)>=3 then
                    aoeAvailable=true;
                    _Cast(191034)
                end
            end
        end
    end

    if aoeAvailable and UnitPower("player")>=50 and not CelestialUp then return; end

    --Flame essence
    -- if (bursting or kc.burst==true) then
    --     for i=1,#mainTarget do _Cast(295373,mainTarget[i].pointer); end
    -- end

    --Thorn
    for i=1,#players do if _meleeDpsOnUnit(players[i].Unit)>=1 and _actualHp(players[i].Unit)<=90 then
        _Cast(236696,players[i].Unit);
    end end

   --Owlkin Frenzy
    if UnitBuffID("player",157228) or UnitBuffID("player",202425) then
        for i=1,#mainTarget do
            _Cast(194153,mainTarget[i].pointer,_,_,"Magic");
        end
    end

    --Starsurge
    if (_buffStacks("player",279709)<3 or _buffRemains("player",279709)>=5) then
        --if not arena and instanceType~="pvp" then
            if ((_buffStacks("player",279709)>=1 and _buffStacks("player",279709)<3) or UnitPower("Player")>=90 or not IsPlayerSpell(202345)) and UnitPower("player")>=40 then
                for i=1,#mainTarget do
                    _Cast(78674,mainTarget[i].pointer,_,_,"Magic");
                end
            end
        --.
    end

    --sooth
    for i=1,#mainTarget do if _canSooth(mainTarget[i].pointer) then
        _Cast(2908,mainTarget[i].pointer,_,_,"Magic");
    end end
    --send

    -- if _buffStacks("player",279709)<3 then
    --     if arena or instanceType=="pvp" then
    --         if ((UnitBuffID("player",279709) and _buffStacks("player",279709)<3) or UnitPower("Player")>=90 or not IsPlayerSpell(202345)) and UnitPower("player")>40 then
    --             if UnitName("player")~="Jrdnhoustond" then
    --                 for i=1,#mainTarget do
    --                     _Cast(78674,mainTarget[i].pointer);
    --                 end
    --             end
    --             if UnitName("player")=="Jrdnhoustond" then
    --                 if _valid("target") then
    --                     _Cast(78674,"target");
    --                 end
    --             end       
    --         end
    --     end
    -- end

    --Maintain SunfirePlayers
    for i=1,#lowSunfire do if UnitIsPlayer(lowSunfire[i].pointer) and _debuffRemains(lowSunfire[i].pointer,164815,"PLAYER")<=gcd*2 then
        if _canDot(lowSunfire[i].pointer) then
            _Cast(93402,lowSunfire[i].pointer,_,_,"Magic");
        end
    end end

    --maintain MoonfirePlayers
    for i=1,#lowMoonfire do if UnitIsPlayer(lowMoonfire[i].pointer) and _debuffRemains(lowMoonfire[i].pointer,164812,"PLAYER")<=gcd*2 then
        if _canDot(lowMoonfire[i].pointer) then
            _Cast(8921,lowMoonfire[i].pointer,_,_,"Magic");
        end
    end end

    --Maintain Sunfire All
    for i=1,#lowSunfire do if _debuffRemains(lowSunfire[i].pointer,164815,"PLAYER")<=gcd*2 then
        if _canDot(lowSunfire[i].pointer) then
            _Cast(93402,lowSunfire[i].pointer,_,_,"Magic");
        end
    end end

    --maintain Moonfire All
    for i=1,#lowMoonfire do if _debuffRemains(lowMoonfire[i].pointer,164812,"PLAYER")<=gcd*2 then
        if _canDot(lowMoonfire[i].pointer) then
            _Cast(8921,lowMoonfire[i].pointer,_,_,"Magic");
        end
    end end

    --Sunfire 7.02
    --Moonfire 8.58

    --Max SunfirePlayers
    for i=1,#lowSunfire do if UnitIsPlayer(lowSunfire[i].pointer) and _debuffRemains(lowSunfire[i].pointer,164815,"PLAYER")<=7.02 then
        if _canDot(lowSunfire[i].pointer) then
            _Cast(93402,lowSunfire[i].pointer,_,_,"Magic");
        end
    end end

    --max MoonfirePlayers
    for i=1,#lowMoonfire do if UnitIsPlayer(lowMoonfire[i].pointer) and _debuffRemains(lowMoonfire[i].pointer,164812,"PLAYER")<=8.58 then
        if _canDot(lowMoonfire[i].pointer) then
            _Cast(8921,lowMoonfire[i].pointer,_,_,"Magic");
        end
    end end

    --Max Sunfire All
    for i=1,#lowSunfire do if _debuffRemains(lowSunfire[i].pointer,164815,"PLAYER")<=7.02 then
        if _canDot(lowSunfire[i].pointer) then
            _Cast(93402,lowSunfire[i].pointer,_,_,"Magic");
        end
    end end

    --max Moonfire All
    for i=1,#lowMoonfire do if _debuffRemains(lowMoonfire[i].pointer,164812,"PLAYER")<=8.58 then
        if _canDot(lowMoonfire[i].pointer) then
            _Cast(8921,lowMoonfire[i].pointer,_,_,"Magic");
        end
    end end

    --propercast

    for i=1,#mainTarget do
        _Cast(274281,mainTarget[i].pointer,_,_,"Magic");
    end

    for i=1,#mainTarget do
        _Cast(202768,mainTarget[i].pointer,_,_,"Magic");
    end

    for i=1,#mainTarget do
        _Cast(202771,mainTarget[i].pointer,_,_,"Magic");
    end

    --Lunar
    if (_buffStacks("player",279709)<3 and projectedPower<=40) or _buffStacks("player",279709)>=3 or LastSpellCast==78674 or LastSpellCast==191034 then

        --stellar flare
        for i=1,#mainTarget do if _debuffRemains(mainTarget[i].pointer,202347,"PLAYER")<=9.36 then
            if not CelestialUp or (LastSpellCast and LastSpellCast~=202347) then
                 if not stellarDelay or GetTime()-stellarDelay >= 3 or stellarTarget ~= mainTarget[i].pointer then
                    if _canDot(mainTarget[i].pointer) then
                        _Cast(202347,mainTarget[i].pointer,_,_,"Magic");
                    end
                end
            end
        end end

        wrathCharges=GetSpellCount(190984)
        sfCharges=GetSpellCount(194153)

        if _buffRemains("player",48518)>_castTime(194153) then

            for i=1,#mainTarget do 
                _Cast(194153,mainTarget[i].pointer);
            end

        end

        if _buffRemains("player",48517)>_castTime(190984) then
            
            for i=1,#mainTarget do 
                _Cast(190984,mainTarget[i].pointer);
            end
        
        end

        
        if wrathCharges==2 and sfCharges==2 then

            for i=1,#mainTarget do 
                _Cast(190984,mainTarget[i].pointer);
            end

        end

        if wrathCharges<sfCharges and wrathCharges>=1 then

            for i=1,#mainTarget do 
                _Cast(190984,mainTarget[i].pointer);
            end

        end

        if sfCharges<wrathCharges and sfCharges>=1 then

            for i=1,#mainTarget do 
                _Cast(194153,mainTarget[i].pointer);
            end

        end

        if sfCharges==0 then

            for i=1,#mainTarget do 
                _Cast(190984,mainTarget[i].pointer);
            end

        end

        if wrathCharges==0 then

            for i=1,#mainTarget do 
                _Cast(194153,mainTarget[i].pointer);
            end

        end




    end

end

function _feralD()

    _createMainTarget();


    if not IsPlayerSpell(197488) then
        activeEnemies=_numberAround("player",8);
    end

    if IsPlayerSpell(197488) then
        activeEnemies=_numberAround("player",11);
    end

    wasStealth=false;
    if UnitBuffID("player",5215) then
        lastStealth=GetTime();
    end
    if lastStealth and GetTime()-lastStealth<=0.1 then
        wasStealth=true;
    end

    if regrowKey then
        for i=1,#players do
            _Cast(18562,players[i].Unit);
        end

        for i=1,#players do if not UnitBuffID(players[i].Unit,774,"PLAYER") then
            _Cast(774,players[i].Unit);
        end end

        _Cast(8936,players[1].Unit);
        
    end

    
    if cloneKey then
        _Cast(209753,ccTar,_,_,"Magic",_,_,true);
    end

    --Auto Stealth
    if not UnitAffectingCombat("player") then
        _Cast(5215);
    end

    _Cast(5215);

    for i=1,#mainTarget do
        if _unitIsUnit("target",mainTarget[i].pointer) then u=mainTarget[i].pointer; end
        -- rake,if=buff.prowl.up|buff.shadowmeld.up
        if UnitBuffID("player",5215) or UnitBuffID("player",58984) then
            _Cast(1822,u);
        end
    end

    if UnitBuffID("player",5215) or UnitBuffID("player",58984) then return; end
    if not UnitAffectingCombat("player") then return; end


    --Interrupt
    for i=1,#mainTarget do
    local u=mainTarget[i].pointer;
        if _shouldCS(u) then
            _Cast(106839,u);
        end
    end

    --kicks
    for i=1,#mainTarget do
    local u=mainTarget[i].pointer;
        if _instantKick(u) then
            if kc.maimint then
                if kc.maimcp and GetComboPoints("player","target")>=kc.maimcp then
                    --maim
                    _Cast(22570,u,_,_,_,_,_,true);
                end
            end
            if kc.bashint then
                --bash
                _Cast(5211,u,_,_,_,_,_,true);
            end
        end
    end

    if not arena and instanceType~="pvp" then
        for i=1,#mainTarget do if _interruptAll(mainTarget[i].pointer) then
            _Cast(5211,mainTarget[i].pointer);
        end end
    end

    if bursting then
        _Cast(106951);
        _Cast(102543);
    end

    -- if (bursting or kc.burst==true) and _spellCooldown(102543)>16 and not UnitBuffID("player",5215) and _spellCooldown(5215)<=gcd then
    --  _Cast(58984);
    -- end


    if bashKey then
        if _CCcheck(ccTar)<=1 then
            _Cast(5211,ccTar,_,_,_,_,_,true);
        end
        _Cast(102359,ccTar,_,_,"Magic",_,_,true);
        _Cast(132469);
        if GetComboPoints("player",ccTar)>=5 and _CCcheck(ccTar)<=1 then
            _Cast(22570,ccTar,_,_,_,_,_,true);
        end
    end

    if bashFocus then
        _Cast(5211,"focus");
        if GetComboPoints("player","focus")>=5 then
            _Cast(22570,"focus",_,_,_,_,_,true);
        end
    end

    if rootKey then
        if UnitBuffID("player",69369) then
            _Cast(339,ccTar,_,_,"Magic",_,_,true);
        end
    end

    local dDispel = {80240,51514,19386};
    for i=1,#players do for n=1,#dDispel do
        if UnitDebuffID(players[i].Unit,dDispel[n]) then
             _Cast(2782,players[i].Unit,true,true)
        end
    end end


    --totem stomp
    local ptotemList = {
    "Spirit Link Totem",
    -- "Ancestral Protection Totem",
    -- "Counterstrike Totem",
    "Skyfury Totem",
    --"Lightning Surge Totem",
    "Grounding Totem",
    "Psyfiend",
    "Capacitor Totem",
    "Earthbind Totem",
    --"Voodoo Totem",
    "Earthgrab Totem",
    "War Banner",
    "Healing Stream Totem",
    --"Earthen Wall Totem",
    "Tremor Totem",
    }
    for i=1,#enemiesCache do
        for n=1,#ptotemList do
            if UnitCanAttack("player",enemiesCache[i]) and ObjectName(enemiesCache[i]) == ptotemList[n] and not UnitIsPlayer(enemiesCache[i]) and not _isPet(enemiesCache[i]) and _LoS(enemiesCache[i]) then
                --shred
                _Cast(1822,enemiesCache[i]);
            end
        end
    end

    function _feralST(u)

        StartAttack()

        if GetComboPoints("player",u)>=5 then
            rCastSpellByName(L["Lone Empowerment"])
        end

        --feralfrenzy
        if GetComboPoints("player",u)<=0 then
            _Cast(274837,u);
        end

        --Tigerfury
        if UnitPowerMax("player")-UnitPower("player")>=50 and GetComboPoints("player",u)>=5 then
            _Cast(5217);
        end
        --savage_roar,if=buff.savage_roar.down
        if not UnitBuffID("player",52610) then
            _Cast(52610);
        end
        -- cat_form,if=!buff.cat_form.up
        if not UnitBuffID("player",768) then
            RunMacroText("/cast "..catform)
        end

        if not UnitBuffID("player",768) then return; end

        -- call_action_list,name=cooldowns
        if bursting then
            _feralCds(u);
        end
        -- ferocious_bite,target_if=dot.rip.ticking&dot.rip.remains<3&target.time_to_die>10&(target.health.pct<25|talent.sabertooth.enabled)
        if UnitDebuffID(u,1079,"PLAYER") and _debuffRemains(u,1079,"PLAYER")<3 and (_actualHp(u)<25 or IsPlayerSpell(202031)) then
            _Cast(22568,u);
        end

        -- regrowth, non-Blood talons
        if UnitBuffID("player",69369) and not IsPlayerSpell(155672) then
            --Melee
            for i=1,#players do 
                if _meleeTargetingUnit(players[i].Unit) and _actualHp(players[i].Unit)<=85 then
                    _Cast(339,players[i].Unit);
                end
            end
            --Healers
            for i=1,#mainTarget do if _realDistance(mainTarget[i].pointer)>=10 and _isHealer(mainTarget[i].pointer) then
                _Cast(339,mainTarget[i].pointer,_,_,"Magic",_,_,true);
            end end
            --Regrow
            if players and players[1] and _actualHp(players[1].Unit)<=85 then
                _Cast(8936,players[1].Unit);
            end
        end

        -- regrowth,if=combo_points=5&buff.predatory_swiftness.up&talent.bloodtalons.enabled&buff.bloodtalons.down&(!buff.incarnation.up|dot.rip.remains<8)
        if GetComboPoints("player",u)>=4 and UnitBuffID("player",69369) and IsPlayerSpell(155672) and not UnitBuffID("player",145152) and (not UnitBuffID("player",102543) or _debuffRemains(u,1079,"PLAYER")<8) then
            --Melee
            for i=1,#players do 
                if _meleeTargetingUnit(players[i].Unit) and _actualHp(players[i].Unit)<=85 then
                    _Cast(339,players[i].Unit);
                end
            end
            --Healers
            for i=1,#mainTarget do if _realDistance(mainTarget[i].pointer)>=10 and _isHealer(mainTarget[i].pointer) then
                _Cast(339,mainTarget[i].pointer,_,_,"Magic",_,_,true);
            end end
            --Regrow
            _Cast(8936,players[1].Unit);
        end
        -- run_action_list,name=st_finishers,if=combo_points>4
        if GetComboPoints("player",u)>4 then
            _feralFinisher(u);
        end
        if GetComboPoints("player",u)<=4 then
            -- run_action_list,name=st_generators
            _feralGenerator(u);
        end
    end

    function _feralFinisher(u)
        StartAttack()
        --Maim with iron jaw
        if UnitBuffID("player",276026) and _spellCooldown(22570)<=gcd then
            _Cast(22570,u);
        end
        --wait for maim w iron jaw
        if UnitBuffID("player",276026) and _spellCooldown(22570)<=gcd then
            return true;
        end
        --ferocious_bite,max_energy=1
        if _actualHp(u)<=10 then
            _Cast(22568,u);
        end
        --pool_resource,for_next=1
        --savage_roar,if=buff.savage_roar.down
        if not UnitBuffID("player",52610) then
            _Cast(52610);
        end

        if activeEnemies<=1 or not IsPlayerSpell(285381) then
            --pool_resource,for_next=1
            --rip,target_if=!ticking|(remains<=duration*0.3)&(target.health.pct>25&!talent.sabertooth.enabled)|(remains<=duration*0.8&persistent_multiplier>dot.rip.pmultiplier)&target.time_to_die>8
            if not UnitDebuffID(u,1079,"PLAYER") or (_debuffRemains(u,1079,"PLAYER")<=9.36 and _actualHp(u)>25 and not IsPlayerSpell(202031)) or (_debuffRemains(u,1079,"PLAYER")<24.96 and _druidDotModifier(1079)>_ripPower(u) and not IsPlayerSpell(202031)) then
                _Cast(1079,u);
            end
        end

        --primal Wrath
        if activeEnemies>1 and IsPlayerSpell(285381) then
            if not UnitDebuffID(u,1079,"PLAYER") or (_debuffRemains(u,1079,"PLAYER")<=4.68 and _actualHp(u)>25 and not IsPlayerSpell(202031)) or (_debuffRemains(u,1079,"PLAYER")<24.96 and _druidDotModifier(1079)>_ripPower(u) and not IsPlayerSpell(202031)) then
                _Cast(285381,u);
            end
        end

        --pool_resource,for_next=1
        --savage_roar,if=buff.savage_roar.remains<12
        if _buffRemains("player",52610)<12 then
            _Cast(52610);
        end
        --ferocious_bite,max_energy=1
        if UnitPower("player")>=50 then
            _Cast(22568,u);
        end
    end

    function _feralGenerator(u)
    StartAttack()      
    -- regrowth,if=talent.bloodtalons.enabled&buff.predatory_swiftness.up&buff.bloodtalons.down&combo_points=4&dot.rake.remains<4
        if UnitBuffID("player",69369) and IsPlayerSpell(155672) and not UnitBuffID("player",145152) and GetComboPoints("player",u)==4 and _debuffRemains(u,155722,"PLAYER")<4 then
            _Cast(8936,players[1].Unit);
        end
    -- brutal_slash,if=spell_targets.brutal_slash>desired_targets
        if activeEnemies>=3 then
            _Cast(202028);
        end
    -- pool_resource,for_next=1
    -- thrash_cat,if=refreshable&(spell_targets.thrash_cat>2)
        if activeEnemies>2 and _debuffRemains(u,106830,"PLAYER")<=5.85 then
            if _spellCooldown(106830)<=gcd then
                rCastSpellByName(L["Thrash"]);
            end
        end
    -- pool_resource,for_next=1
    -- rake,target_if=!ticking|(!talent.bloodtalons.enabled&remains<duration*0.3)&target.time_to_die>4
        if not UnitDebuffID(u,155722,"PLAYER") or (not IsPlayerSpell(155672) and _debuffRemains(u,155722,"PLAYER")<=5.85) then
            _Cast(1822,u);
        end
    -- pool_resource,for_next=1
    -- rake,target_if=talent.bloodtalons.enabled&buff.bloodtalons.up&((remains<=7)&persistent_multiplier>dot.rake.pmultiplier*0.85)&target.time_to_die>4
        if IsPlayerSpell(155672) and UnitBuffID("player",145152) and ((_debuffRemains(u,155722,"PLAYER")<=7) and _druidDotModifier(1822)>_rakePower(u)*0.85) then
            _Cast(1822,u);
        end
    -- moonfire_cat,target_if=refreshable
        if IsPlayerSpell(155580) and UnitPower("player")>=35 then
            if _debuffRemains(u,155625,"PLAYER")<=5.46 then
                _Cast(8921,u);
            end
        end
    -- pool_resource,for_next=1
    -- thrash_cat,if=refreshable&(variable.use_thrash=2|spell_targets.thrash_cat>1)
        if activeEnemies>2 and _debuffRemains(u,106830,"PLAYER")<=5.85 then
            if _spellCooldown(106830)<=gcd then
                rCastSpellByName(L["Thrash"]);
            end
        end
    -- thrash_cat,if=refreshable&variable.use_thrash=1&buff.clearcasting.react
        if UnitBuffID("player",135700) and _debuffRemains(u,106830,"PLAYER")<=5.85 then
            if _spellCooldown(106830)<=gcd then
                rCastSpellByName(L["Thrash"]);
            end
        end
    end

    function _feralCds(u)

    end

    function _feralCleave(u)


    end

    function _bearST(u)
        StartAttack()

        --Bear
        if not UnitBuffID("player",5487) then
            _Cast(5487);
        end

        if not UnitBuffID("player",5487) then return; end

        if activeEnemies>2 and not UnitDebuffID(u,106830,"PLAYER") and _debuffRemains(u,192090,"PLAYER")<=5.85 then
            if _spellCooldown(77758)<=gcd then
                rCastSpellByName(L["Thrash"]);
            end
        end

        _Cast(33917,u);

        --moon
        if _debuffRemains(u,164812,"PLAYER")<=5.46 then
            _Cast(8921,u);
        end

        --Moonfires
        for i=1,#mainTarget do
            --moon
            if _debuffRemains(mainTarget[i].pointer,164812,"PLAYER")<=5.46 then
                _Cast(8921,mainTarget[i].pointer);
            end
        end

        if activeEnemies>2 then
            if _spellCooldown(213771)<=gcd then
                rCastSpellByName(L["Swipe"]);
            end
        end


    end

    if bearKey then
        if _actualHp("player")<=70 then
            _Cast(22842);
        end
        if _meleeDpsOnUnit("player")>=1 then
            _Cast(192081);
        end
        for i=1,#mainTarget do
            if _unitIsUnit("target",mainTarget[i].pointer) then
                _bearST(mainTarget[i].pointer);
            end
        end
    end


    --FERAL DAMAGE
    if not bearKey then

        for i=1,#mainTarget do
            if _unitIsUnit("target",mainTarget[i].pointer) then
                _feralST(mainTarget[i].pointer);
            end
        end

        if GetComboPoints("player","target")<=4 or bashKey or bashFocus then
            for i=1,#mainTarget do
                --rakes all
                if not UnitDebuffID(mainTarget[i].pointer,155722,"PLAYER") or (not IsPlayerSpell(155672) and _debuffRemains(mainTarget[i].pointer,155722,"PLAYER")<=5.85) then
                    _Cast(1822,mainTarget[i].pointer);
                end

                if IsPlayerSpell(155672) and UnitBuffID("player",145152) and ((_debuffRemains(mainTarget[i].pointer,155722,"PLAYER")<=7) and _druidDotModifier(1822)>_rakePower(mainTarget[i].pointer)*0.85) then
                    _Cast(1822,mainTarget[i].pointer);
                end
            end

            -- shred,if=dot.rake.remains>(action.shred.cost+action.rake.cost-energy)%energy.regen|buff.clearcasting.react
            --shred
            for i=1,#mainTarget do if _unitIsUnit("target",mainTarget[i].pointer) then
                if _debuffRemains(mainTarget[i].pointer,155722,"PLAYER")>((40+35-UnitPower("player"))%GetPowerRegen()) or UnitBuffID("player",135700) then
                    if _meleeRange(mainTarget[i].pointer) then
                        if UnitBuffID("player",5217) or _spellChargeFrac(202028)>=3 then
                            _Cast(202028)
                        end
                        _Cast(5221,mainTarget[i].pointer);
                    end
                end
            end end

            --Cleave rakes / moonfires

            canMoonfireCleave=true;
            for i=1,#mainTarget do if _unitIsUnit("target",mainTarget[i].pointer) then
                if _debuffRemains(mainTarget[i].pointer,155722,"PLAYER")<((40+35-UnitPower("player"))%GetPowerRegen()) or not UnitBuffID("player",135700) and _spellInRange(5221,mainTarget[i].pointer) then
                    canMoonfireCleave=false;
                end
            end end

            if canMoonfireCleave then
                if UnitPower("player")>=40 then
                    for i=1,#mainTarget do
                        --moon all
                        if IsPlayerSpell(155580) and UnitPower("player")>=40 then
                            if _debuffRemains(mainTarget[i].pointer,155625,"PLAYER")<=5.46 then
                                _Cast(8921,mainTarget[i].pointer,_,_,"Magic");
                            end
                        end
                    end
                end
            end

        end

    end

    --Thorn
    for i=1,#players do if _meleeDpsOnUnit(players[i].Unit)>=1 and _actualHp(players[i].Unit)<=90 then
        _Cast(236696,players[i].Unit);
    end end

    --politely shift roots
    if UnitExists("target") and _realDistance("target") > 7 then
        if _slowCheck("player") or _rootCheck("player") then
            if UnitBuffID("player",768) then
                _Cast(5487);
            end
            if UnitBuffID("player",5487) then
                _Cast(768);
            end
        end
    end

end

function _guardianD()

end

function _restoD()

end

function _wwM()

    if ccTar and _distance(ccTar)<=5 and fskTime and GetTime()-fskTime<=4 then
        CastSpellByName(GetSpellInfo(101545))
    end

    if UnitChannelInfo("player")=="Fists of Fury" and UnitBuffID("player",137639) and UnitBuffID("player",310454) then
        SpellStopCasting()
        lastCancelFOF=GetTime();
    end

    _createMainTarget();

    burstCD=0;
    if IsPlayerSpell(152173) then
        burstCD=_spellCooldown(152173);
    else
        if UnitBuffID("player",137639) then
            burstCD=90;
        else
            burstCD=_spellCooldown(137639);
        end
    end

    touchCD=_spellCooldown(115080);

    chi=UnitPower("player",12);
    chimax=UnitPowerMax("player",12);
    egyTimeToMax=(UnitPowerMax("player")-UnitPower("player"))/select(2,GetPowerRegen());
    activeEnemies=_numberAround("player",10);
    eplayersaround=#_getEnemyPlayersAroundUnit("player",5);
    hitcombo=IsPlayerSpell(196740);
    serenity=IsPlayerSpell(152173);

    myTar=nil;
    for i=1,#mainTarget do if _unitIsUnit(mainTarget[i].pointer,"target") then
        myTar=mainTarget[i].pointer;
    end end

    --dampening
    if kc.autodampen and _actualHp("player")<=kc.autodampen then
        _Cast(122278)
    end

    --fortbrew
    if kc.autofortbrew and _actualHp("player")<=kc.autofortbrew then
        _Cast(243435);
    end

    --karma
    if kc.autokarma and _actualHp("player")<=kc.autokarma then
        for i=1,#mainTarget do
            _Cast(122470,mainTarget[i].pointer);
        end
    end

    --diffusemagic
    if kc.autodiffuse and _actualHp("player")<=kc.autodiffuse then
        _Cast(122783);
    end

    --parafist
    for i=1,#mainTarget do if UnitChannelInfo(mainTarget[i].pointer)=="Fists of Fury" then
        _Cast(115078,mainTarget[i].pointer);
    end end

    if paraKey then
        _Cast(115078,ccTar,_,_,_,_,_,true);
    end

    healeraround=nil
    for i=1,#mainTarget do if _isHealer(mainTarget[i].pointer) and _distance(mainTarget[i].pointer)<=10 then
        healeraround=true;
    end end

    if eplayersaround>=3 or (healeraround and eplayersaround>=2) then
        _Cast(119381);
    end

    if sweepKey then
        _Cast(119381);
    end

    if fskKey and ccTar then
        if not fskTime or GetTime()-fskTime>=24 then
            FaceDirection(_anglesBetweenObjects("player",ccTar),true);
            if _spellCooldown(101545)<=gcd then
                rCastSpellByID(101545);
            end
        end
    end

    if setPort then
        _Cast(101643);
    end

    if usePort then
        _Cast(119996);
    end

    if UnitDebuffID("player",294127) then
        _Cast(122783);
    end

    --fear number of units
    if kc.autosweep and kc.autosweep~=0 then
        if #_getEnemyPlayersAroundUnit("player",6)>=kc.autosweep then
            _Cast(119381);
        end
    end
    
    --reverseharm
    for i=1,#players do if _actualHp(players[i].Unit)<=90 then
        _Cast(287771,players[i].Unit);
    end end

    --freedomself
    if kc.freedomself then
        if (_slowCheck("player") or _rootCheck("player")) and validTar and _distance(validTar)>=10 then
            _Cast(116841,"PLAYER");
        end
    end

    --freedom friendly team
    if kc.freedomteam then
        for i=1,#players do if not _unitIsUnit("player",players[i].Unit) and _isMeleeDps(players[i].Unit) then
            for n=1,#mainTarget do if _unitIsUnit(mainTarget[n].pointer,UnitTarget(players[i].Unit)) then
                if _distance(mainTarget[n].pointer,UnitTarget(players[i].Unit))>=10 and (_slowCheck(players[i].Unit) or _rootCheck(players[i].Unit)) then
                    _Cast(116841,players[i].Unit);
                end
            end end
        end end
    end

    -- --rop stuns < 85
     --for i=1,#players do if _isStunned(players[i].Unit) and _actualHp(players[i].Unit)<=85 then
     --    _AeCast(116844,players[i].Unit,40);
     --end end

    -- --rop earthn wall
     --for i=1,#enemiesList do if ObjectName(enemiesList[i])=="Earthen Wall Totem" and not UnitIsPlayer(enemiesList[i]) and not _isPet(enemiesList[i]) then
     --    _AeCast(116844,enemiesList[i],40);
     --end end

    -- --rop touch
    for i=1,#players do if UnitDebuffID(players[i].Unit,115080) and _actualHp(players[i].Unit)<=90 then
        _AeCast(116844,players[i].Unit,40);
    end end

    --ropke
    if ropKey then
        if _spellCooldown(116844)<=gcd then
            rCastSpellByID(116844);
            if IsAoEPending() then
                CameraOrSelectOrMoveStart();
                CameraOrSelectOrMoveStop();
            end
            if IsAoEPending() then
                CancelPendingSpell();
            end
        end
    end
    
    --lust
    -- for i=1,#players do if _actualHp(players[i].Unit)<=85 then
    --     _Cast(116841,players[i].Unit);
    -- end end

    --Totem
    local ptotemList = {
    "Spirit Link Totem",
    -- "Ancestral Protection Totem",
    -- "Counterstrike Totem",
    "Skyfury Totem",
    --"Lightning Surge Totem",
    "Grounding Totem",
    "Psyfiend",
    "Capacitor Totem",
    "Earthbind Totem",
    --"Voodoo Totem",
    "Earthgrab Totem",
    "War Banner",
    "Healing Stream Totem",
    --"Earthen Wall Totem",
    "Tremor Totem",
    }
    for i=1,#enemiesCache do
        for n=1,#ptotemList do
            if UnitCanAttack("player",enemiesCache[i]) and ObjectName(enemiesCache[i]) == ptotemList[n] and not UnitIsPlayer(enemiesCache[i]) and not _isPet(enemiesCache[i]) then
                _st(enemiesCache[i]);
            end
        end
    end

    validTar=nil;
    for i=1,#mainTarget do
        if _unitIsUnit(mainTarget[i].pointer,"target") then
            validTar=mainTarget[i].pointer;
        end
    end

    --autodisarm
    for i=1,#mainTarget do if _shouldDisarm(mainTarget[i].pointer) then
        _Cast(233759,mainTarget[i].pointer);
    end end

    ----Interrupts
    for i=1,#mainTarget do
    local u=mainTarget[i].pointer;
        if _shouldCS(u) then
            _Cast(116705,u);
        end
    end

    --kicks
    for i=1,#mainTarget do
    local u=mainTarget[i].pointer;
        if _instantKickUnint(u) and kc.paraint then
            --para
            _Cast(115078,u);
        end
        if _instantKickUnint(u) and kc.ropint and (not UnitChannelInfo(u) or UnitChannelInfo(u)~="323764") then
            --rop
            _AeCast(116844,u,40);
        end
    end

    if not arena and instanceType~="pvp" then
        for i=1,#mainTarget do if _interruptAll(mainTarget[i].pointer) then
            _Cast(116705,mainTarget[i].pointer);
        end end
    end

    -- Action List - Single Target
    function _st()

        --expel harm
        if chi<5 and egyTimeToMax<=gcd then
            if validTar and _meleeRange(validTar) then
                _Cast(322101)
            end
        end

        --tiger
        if chi<4 and egyTimeToMax<=gcd then
            if lastCast~=100780 then
              _Cast(100780,validTar);
            end
        end

        --wdp
        if validTar and _meleeRange(validTar) then
            _Cast(152175)
        end

        --rsk
        if not bursting then
            _Cast(107428,validTar);

            --fist
            if validTar and _meleeRange(validTar) then
                _Cast(247483)
                _Cast(113656)
            end
        end

        if burstingMonk and GetTime()-burstingMonk<=20 then
            _Cast(107428,validTar);

            --fist
            if validTar and _meleeRange(validTar) then
                _Cast(247483)
                _Cast(113656)
            end
        end

        if chi<3 then
            _Cast(261947,validTar);
        end

        --sck
        if not lastCancelFOF or GetTime()-lastCancelFOF>=3.5 then
            if UnitBuffID("player",325202) then
                if validTar and _meleeRange(validTar) then
                    _Cast(101546)
                end
            end
        end

        if not bursting or (burstingMonk and GetTime()-burstingMonk<=20) then
            if lastCast~=100784 then
                if _spellCooldown(113656)>gcd then
                    --blackout
                    _Cast(100784,validTar);
                end
            end
        end

        --chi wave
        if validTar and _meleeRange(validTar) then
            _Cast(115098)
        end

        --expel harm
        if validTar and _meleeRange(validTar) then
            _Cast(322101)
        end

        --tiger 
        if lastCast~=100780 then
            _Cast(100780,validTar);
        end

    end -- End Action List - Single Target

    function _aoe()

        --wdp
        if validTar and _meleeRange(validTar) then
            _Cast(152175)
        end

        --fist
        if validTar and _meleeRange(validTar) then
            _Cast(247483)
            _Cast(113656)
        end

        --rsk
        if _spellCooldown(152175)<=gcd then
            _Cast(107428,validTar);
        end

        --sck
        if not lastCancelFOF or GetTime()-lastCancelFOF>=3.5 then
            if validTar and _meleeRange(validTar) then
                _Cast(101546)
            end
        end

        if _spellCooldown(113656)>gcd then
            if lastCast~=100784 then
                --blackout
                _Cast(100784,validTar);
            end
        end

        if chi<3 then
            _Cast(261947,validTar);
        end

        --chi wave
        if validTar and _meleeRange(validTar) then
            _Cast(115098)
        end

        --expel harm
        if validTar and _meleeRange(validTar) then
            _Cast(322101)
        end

        --tiger 
        if lastCast~=100780 then
          _Cast(100780,validTar);
        end

    end


    ------------------------
    ----- Start Rotation ---
    ------------------------

    if bursting and (chi>=5 or UnitLevel("player")<60) then
        burstingMonk=GetTime();
        if not UnitBuffID("player",137639) and _spellCooldown(137639)<=gcd then
            rCastSpellByName(GetSpellInfo(137639))
        end
    end

    if bursting and (chi>=5 or UnitLevel("player")<60) then
        _Cast(310454);
    end

    if bursting then
        if _spellCooldown(123904)<=gcd then
            rCastSpellByName(GetSpellInfo(123904));
        end
    end


    for i=1,#mainTarget do if _actualHp(mainTarget[i].pointer)<=15 then
        _Cast(322109,mainTarget[i].pointer);
    end end

    if validTar and _meleeRange(validTar) then
        StartAttack();
    end

    ---- Call Action List - Single Target
    ---- call_action_list,name=st,if=active_enemies<3
    if validTar then
        if activeEnemies<3 then
            _st()
        end
        if activeEnemies>=3 then
            _aoe()
        end
    end

    --detox
    for i=1,#players do if _canRetClean(players[i].Unit) then
        _Cast(218164,players[i].Unit);
    end end

    if kc.slowtarget and validTar then
        if not _its(validTar) and not _slowCheck(validTar) then
            _Cast(116095,validTar)
        end
    end

    if kc.slowall then
        for i=1,#mainTarget do if UnitIsPlayer(mainTarget[i].pointer) and not _slowCheck(mainTarget[i].pointer) then
            _Cast(116095,mainTarget[i].pointer);
        end end
    end



end

function _bmM()

end

function _mwM()

end

function _unhDK()

end

function _bloodDK()

end

function _frostDK()

    _createMainTarget();

    validTar=nil;
    for i=1,#mainTarget do
        if _unitIsUnit(mainTarget[i].pointer,"target") then
            validTar=mainTarget[i].pointer;
        end
    end

    activeEnemies=#_getEnemiesInFront(8)
    runes=_runeCount()

    --frostwyrm fury
    --279302
    if fwKey then
        _Cast(279302);
    end
    --asphyx
    if asphyxKey and ccTar then
        _Cast(108194,ccTar);
    end
    --blind
    if asphyxKey then
        _Cast(207167);
    end
    --grip
    if gripKey and ccTar then
        _Cast(49576,ccTar);
    end
    --heal
    if dstrikeKey then
        for i=1,#mainTarget do
            _Cast(49998,mainTarget[i].pointer);
        end 
    end
    if kc.dkHeal and _actualHp("player")<=kc.dkHeal then
        for i=1,#mainTarget do
            _Cast(49998,mainTarget[i].pointer);
        end 
    end

    for i=1,#mainTarget do
    local u=mainTarget[i].pointer;
        if _instantKickUnint(u) and kc.gripint then
            --grip
            _Cast(49576,u);
        end
        if _instantKickUnint(u) and kc.blindint and _distance(u)<=8 and _amIfacing(u) then
            --blind
            _Cast(207167)
        end
        if _instantKickUnint(u) and kc.fwint and _distance(u)<=15 and _amIfacing(u) then
            --fw
            _Cast(279302);
        end
        if _instantKickUnint(u) and kc.blindint then
            --asphyx
            _Cast(108194,u)
        end
    end

    --inter
    for i=1,#mainTarget do if _shouldCS(mainTarget[i].pointer) then
        _Cast(47528,mainTarget[i].pointer);
    end end

    if not arena and instanceType~="pvp" then
        for i=1,#mainTarget do if _interruptAll(mainTarget[i].pointer) then
            _Cast(47528,mainTarget[i].pointer);
        end end
    end

    if limbKey then
        _Cast(315443);
    end

    if bursting then
        _Cast(47568);
        _Cast(51271);
        if kc.autolimb then
            _Cast(315443);
        end
    end 

    --all reflects
    for i=1,#mainTarget do
        if _shouldReflect(mainTarget[i].pointer) then
            _Cast(48707)
        end
    end

    if kc.ams and _actualHp("player")<=kc.ams then
        _Cast(48707);
    end

    if kc.ibf and _actualHp("player")<=kc.ibf then
        _Cast(48792);
    end

    if validTar and _meleeRange(validTar) then
        StartAttack()
    end

    function _st(u)
        --Use Chains of Ice Icon Chains of Ice, if you have 20 stacks (try to use at the end of Pillar of Frost Icon Pillar of Frost when the strength bonus is at the highest).
        if _buffStacks("player",281209)>=20 then
            _Cast(45524,u,_,_,"Magic");
        end
        --Use Remorseless Winter Icon Remorseless Winter, if using Gathering Storm Icon Gathering Storm.
        if IsPlayerSpell(194912) and _distance(u)<=8 then
            _Cast(196770);
        end
        --Use Howling Blast Icon Howling Blast, only if you have a Rime Icon Rime proc.
        if UnitBuffID("player",59052) then
            _Cast(49184,u,_,_,"Magic");
        end
        --Use Obliterate Icon Obliterate, if you have 4 or more Runes.
        if runes>=4 then
            _Cast(49020,u);
        end
        --Use Frost Strike Icon Frost Strike, if you have 90+ Runic Power.
        if UnitPower("player")>=90 then
            _Cast(49143,u,_,_,"Magic");
        end
        --Use Obliterate Icon Obliterate, if you have a Killing Machine Icon Killing Machine proc.
        if UnitBuffID("player",51124) then
            _Cast(49020,u);
        end
        --Use Frost Strike Icon Frost Strike, if you have 70+ Runic Power.
        if UnitPower("player")>=70 then
            _Cast(49143,u,_,_,"Magic");
        end
        --Use Obliterate Icon Obliterate.
        _Cast(49020,u);
        --Use Frost Strike Icon Frost Strike.
        _Cast(49143,u,_,_,"Magic");
    end

    function _aoe(u)
        --Use Howling Blast Icon Howling Blast, only if you have a Rime Icon Rime proc.
        if UnitBuffID("player",59052) then
            _Cast(49184,u,_,_,"Magic");
        end
        --Use Frost Strike Icon Frost Strike, if you have 90+ Runic Power.
        if UnitPower("player")>=90 then
            _Cast(207230,u,_,_,"Magic");
        end
        --Use Frostscythe Icon Frostscythe, if you have a Killing Machine Icon Killing Machine proc.
        if UnitBuffID("player",51124) then
            _Cast(207230,u,_,_,"Magic");
        end
        --Use Remorseless Winter Icon Remorseless Winter on cooldown.
        if _distance(u)<=8 then
            _Cast(196770);
        end
        --Use Frostscythe Icon Frostscythe.
        _Cast(207230,u,_,_,"Magic");
        --Use Frost Strike Icon Frost Strike, if you have 70+ Runic Power.
        if UnitPower("player")>=70 then
            _Cast(207230,u,_,_,"Magic");
        end
    end

    if validTar then
        if activeEnemies>=2 then
            _aoe(validTar);
        end
        _st(validTar)
    end

    if kc.slowtarget and validTar then
        if not _its(validTar) and not _slowCheck(validTar) then
            _Cast(305392,validTar,_,_,"Magic","Slow");
            _Cast(45524,validTar,_,_,"Magic","Slow");
        end
    end

    if kc.slowall then
        for i=1,#mainTarget do if UnitIsPlayer(mainTarget[i].pointer) and not _slowCheck(mainTarget[i].pointer) then
            _Cast(305392,mainTarget[i].pointer,_,_,"Magic","Slow");
            _Cast(45524,mainTarget[i].pointer,_,_,"Magic","Slow");
        end end
    end


end

function _vengefulForward()
    Rotation=ObjectFacing("player");
    if Rotation>=math.pi then
        correctDirection=Rotation-math.pi;
    end
    if Rotation<math.pi or Rotation==0 then
        correctDirection=Rotation+math.pi;
    end
    if _spellCooldown(198793)<=0 then
        FaceDirection(correctDirection,true);
        CastSpellByName("Vengeful Retreat");
        FaceDirection(Rotation,true);
    end
end

function _havocDH()

    _createMainTarget()

    validTar=nil;
    for i=1,#mainTarget do
        if _unitIsUnit(mainTarget[i].pointer,"target") then
            validTar=mainTarget[i].pointer;
        end
    end

    activeEnemies=_numberAround("player",8);

    for i=1,#mainTarget do
    local u=mainTarget[i].pointer;
        if _instantKickUnint(u) and kc.eruptint then
            --erupt
            _Cast(211881,u)
        end
        if _instantKickUnint(u) and kc.novaint and _distance(u)<=10 then
            _Cast(179057);
        end
        if _instantKickUnint(u) and kc.prisonint then
            --prison
            _Cast(221527,u,_,_,"Magic");
            _Cast(217832,u,_,_,"Magic");
        end
    end

    if kc.autoblur and _actualHp("player")<=kc.autoblur then
        _Cast(198589);
    end

    if kc.autodark then
        for i=1,#players do
            if _actualHp(players[i].Unit)<=kc.autodark and _distance(players[i].Unit)<=8 then
                _Cast(196718);
            end
        end
    end

    if kc.autowalk and _actualHp("player")<=kc.autowalk then
        _Cast(196555);
    end

    if novaKey then
        _Cast(179057);
    end

    if eruptKey and ccTar then
        _Cast(211881,ccTar);
    end

    --rift
    for i=1,#mainTarget do if UnitDebuffID(mainTarget[i].pointer,211881,"player") then
        _Cast(235903,mainTarget[i].pointer);
    end end

    if kc.autoreverse and _actualHp("player")<=kc.autoreverse then
        _Cast(205604);
    end

    if imprisonKey and ccTar then
        _Cast(221527,ccTar,_,_,"Magic");
        _Cast(217832,ccTar,_,_,"Magic");
    end

    --inter
    for i=1,#mainTarget do if _shouldCS(mainTarget[i].pointer) then
        _Cast(183752,mainTarget[i].pointer);
    end end

    if not arena and instanceType~="pvp" then
        for i=1,#mainTarget do if _interruptAll(mainTarget[i].pointer) then
            _Cast(183752,mainTarget[i].pointer);
        end end
    end

    if bursting then
        --Cast Metamorphosis Icon Metamorphosis if available and not active, make sure Eye Beam Icon Eye Beam is on cooldown before this.
        _AeCast(191427,u,40)
    end

    --purge
    for i=1,#mainTarget do if _purgeCheck(mainTarget[i].pointer) then
        _Cast(278326,mainTarget[i].pointer);
    end end

    if validTar and _meleeRange(validTar) then
        StartAttack()
    end

    function _st(u)
        --Cast Glaive Tempest Icon Glaive Tempest on cooldown.
        if _meleeRange(u) then
            _Cast(342817);
        end
        --Cast Immolation Aura Icon Immolation Aura.
        if _meleeRange(u) then
            _Cast(258920);
        end
        --Cast Blade Dance Icon Blade Dance / Death Sweep Icon Death Sweep on cooldown.
        if IsPlayerSpell(206416) and _meleeRange(u) then
            _Cast(188499);
        end
        --Cast Felblade Icon Felblade if under 80 Fury.
        if UnitPower("player")<80 then
            _Cast(232893,u);
        end
        --Cast Eye Beam Icon Eye Beam.
        if _meleeRange(u) and _amIfacing(u) and not _im(u) then
            _Cast(198013);
        end
        --Cast Chaos Strike Icon Chaos Strike / Annihilation Icon Annihilation if at 50 Fury or above.
        if UnitPower("player")>50 then
            _Cast(162794,u);
        end
        --Cast Fel Rush Icon Fel Rush with nothing else available.
        --Cast Throw Glaive Icon Throw Glaive with nothing else available.
        if IsPlayerSpell(203555) then
             _Cast(185123,u);
        end
        --bite
        _Cast(162243,u)
    end

    function _aoe(u)
        --Pre-cast Immolation Aura Icon Immolation Aura if taken.
        _Cast(258920);
        --Cast Fel Rush Icon Fel Rush to engage.
        --Cast Eye Beam Icon Eye Beam to trigger Metamorphosis Icon Metamorphosis via Demonic Icon Demonic.
       if _meleeRange(u) and _amIfacing(u) and not _im(u) then
            _Cast(198013);
        end     
        --Cast Death Sweep Icon Death Sweep if playing First Blood Icon First Blood.
        if IsPlayerSpell(206416) and _meleeRange(u) then
            _Cast(188499);
        end
        --Cast Metamorphosis Icon Metamorphosis.
        --Cast Death Sweep Icon Death Sweep if playing First Blood Icon First Blood.
        if IsPlayerSpell(206416) and _meleeRange(u) then
            _Cast(188499);
        end
        --Cast Eye Beam Icon Eye Beam.
       if _meleeRange(u) and _amIfacing(u) and not _im(u) then
            _Cast(198013);
        end     
    end

    if validTar then
        if activeEnemies>1 then
            _aoe(validTar);
        end
        _st(validTar);
    end

    --purge
    for i=1,#mainTarget do if _ragePurge(mainTarget[i].pointer) then
        _Cast(278326,mainTarget[i].pointer);
    end end

end

function _vengDH()

end

kc_OnLoad();

--IDTIP
local hooksecurefunc, select, UnitBuff, UnitDebuff, UnitAura, UnitGUID,
      GetGlyphSocketInfo, tonumber, strfind
    = hooksecurefunc, select, UnitBuff, UnitDebuff, UnitAura, UnitGUID,
      GetGlyphSocketInfo, tonumber, strfind

local kinds = {
  spell = "SpellID",
  item = "ItemID",
  unit = "NPC ID",
  quest = "QuestID",
  talent = "TalentID",
  achievement = "AchievementID",
  criteria = "CriteriaID",
  ability = "AbilityID",
  currency = "CurrencyID",
  artifactpower = "ArtifactPowerID",
  enchant = "EnchantID",
  bonus = "BonusID",
  gem = "GemID",
  mount = "MountID",
  companion = "CompanionID",
  macro = "MacroID",
  equipmentset = "EquipmentSetID",
  visual = "VisualID",
  source = "SourceID",
}

local function contains(table, element)
  for _, value in pairs(table) do
    if value == element then return true end
  end
  return false
end

local function addLine(tooltip, id, kind)
  if not id or id == "" then return end
  if type(id) == "table" and #id == 1 then id = id[1] end

  -- Check if we already added to this tooltip. Happens on the talent frame
  local frame, text
  for i = 1,15 do
    frame = _G[tooltip:GetName() .. "TextLeft" .. i]
    if frame then text = frame:GetText() end
    if text and string.find(text, kind .. ":") then return end
  end

  local left, right
  if type(id) == "table" then
    left = NORMAL_FONT_COLOR_CODE .. kind .. "s:" .. FONT_COLOR_CODE_CLOSE
    right = HIGHLIGHT_FONT_COLOR_CODE .. table.concat(id, ", ") .. FONT_COLOR_CODE_CLOSE
  else
    left = NORMAL_FONT_COLOR_CODE .. kind .. ":" .. FONT_COLOR_CODE_CLOSE
    right = HIGHLIGHT_FONT_COLOR_CODE .. id .. FONT_COLOR_CODE_CLOSE
  end

  tooltip:AddDoubleLine(left, right)
  tooltip:Show()
end

local function addLineByKind(self, id, kind)
  if not kind or not id then return end
  if kind == "spell" or kind == "enchant" or kind == "trade" then
    addLine(self, id, kinds.spell)
  elseif kind == "talent" then
    addLine(self, id, kinds.talent)
  elseif kind == "quest" then
    addLine(self, id, kinds.quest)
  elseif kind == "achievement" then
    addLine(self, id, kinds.achievement)
  elseif kind == "item" then
    addLine(self, id, kinds.item)
  elseif kind == "currency" then
    addLine(self, id, kinds.currency)
  elseif kind == "summonmount" then
    addLine(self, id, kinds.mount)
  elseif kind == "companion" then
    addLine(self, id, kinds.companion)
  elseif kind == "macro" then
    addLine(self, id, kinds.macro)
  elseif kind == "equipmentset" then
    addLine(self, id, kinds.equipmentset)
  elseif kind == "visual" then
    addLine(self, id, kinds.visual)
  end
end

-- All kinds
local function onSetHyperlink(self, link)
  local kind, id = string.match(link,"^(%a+):(%d+)")
  addLineByKind(self, id, kind)
end

hooksecurefunc(GameTooltip, "SetAction", function(self, slot)
  local kind, id = GetActionInfo(slot)
  addLineByKind(self, id, kind)
end)

hooksecurefunc(ItemRefTooltip, "SetHyperlink", onSetHyperlink)
hooksecurefunc(GameTooltip, "SetHyperlink", onSetHyperlink)

-- Spells
hooksecurefunc(GameTooltip, "SetUnitBuff", function(self, ...)
  local id = select(10, UnitBuff(...))
  addLine(self, id, kinds.spell)
end)

hooksecurefunc(GameTooltip, "SetUnitDebuff", function(self, ...)
  local id = select(10, UnitDebuff(...))
  addLine(self, id, kinds.spell)
end)

hooksecurefunc(GameTooltip, "SetUnitAura", function(self, ...)
  local id = select(10, UnitAura(...))
  addLine(self, id, kinds.spell)
end)

hooksecurefunc(GameTooltip, "SetSpellByID", function(self, id)
  addLineByKind(self, id, kinds.spell)
end)

hooksecurefunc("SetItemRef", function(link, ...)
  local id = tonumber(link:match("spell:(%d+)"))
  addLine(ItemRefTooltip, id, kinds.spell)
end)

GameTooltip:HookScript("OnTooltipSetSpell", function(self)
  local id = select(2, self:GetSpell())
  addLine(self, id, kinds.spell)
end)

hooksecurefunc("SpellButton_OnEnter", function(self)
  local slot = SpellBook_GetSpellBookSlot(self)
  local spellID = select(2, GetSpellBookItemInfo(slot, SpellBookFrame.bookType))
  addLine(GameTooltip, spellID, kinds.spell)
end)

if not isClassicWow then
  hooksecurefunc(GameTooltip, "SetRecipeResultItem", function(self, id)
    addLine(self, id, kinds.spell)
  end)

  hooksecurefunc(GameTooltip, "SetRecipeRankInfo", function(self, id)
    addLine(self, id, kinds.spell)
  end)

  -- Artifact Powers
  hooksecurefunc(GameTooltip, "SetArtifactPowerByID", function(self, powerID)
    local powerInfo = C_ArtifactUI.GetPowerInfo(powerID)
    addLine(self, powerID, kinds.artifactpower)
    addLine(self, powerInfo.spellID, kinds.spell)
  end)

  -- Talents
  hooksecurefunc(GameTooltip, "SetTalent", function(self, id)
    local spellID = select(6, GetTalentInfoByID(id))
    addLine(self, id, kinds.talent)
    addLine(self, spellID, kinds.spell)
  end)
  hooksecurefunc(GameTooltip, "SetPvpTalent", function(self, id)
    local spellID = select(6, GetPvpTalentInfoByID(id))
    addLine(self, id, kinds.talent)
    addLine(self, spellID, kinds.spell)
  end)
end
-- NPCs
GameTooltip:HookScript("OnTooltipSetUnit", function(self)
  if not isClassicWow then
    if C_PetBattles.IsInBattle() then return end
  end
  local unit = select(2, self:GetUnit())
  if unit then
    local guid = UnitGUID(unit) or ""
    local id = tonumber(guid:match("-(%d+)-%x+$"), 10)
    if id and guid:match("%a+") ~= "Player" then addLine(GameTooltip, id, kinds.unit) end
  end
end)

-- Items

if not isClassicWow then
  hooksecurefunc(GameTooltip, "SetToyByItemID", function(self, id)
    addLine(self, id, kinds.item)
  end)

  hooksecurefunc(GameTooltip, "SetRecipeReagentItem", function(self, id)
    addLine(self, id, kinds.item)
  end)
end

local function attachItemTooltip(self)
  local link = select(2, self:GetItem())
  if not link then return end

  local itemString = string.match(link, "item:([%-?%d:]+)")
  if not itemString then return end

  local enchantid = ""
  local bonusid = ""
  local gemid = ""
  local bonuses = {}
  local itemSplit = {}

  for v in string.gmatch(itemString, "(%d*:?)") do
    if v == ":" then
      itemSplit[#itemSplit + 1] = 0
    else
      itemSplit[#itemSplit + 1] = string.gsub(v, ":", "")
    end
  end

  for index = 1, tonumber(itemSplit[13]) do
    bonuses[#bonuses + 1] = itemSplit[13 + index]
  end

  local gems = {}
  if not isClassicWow then
      for i=1, 4 do
      local _,gemLink = GetItemGem(link, i)
      if gemLink then
        local gemDetail = string.match(gemLink, "item[%-?%d:]+")
        gems[#gems + 1] = string.match(gemDetail, "item:(%d+):")
      elseif flags == 256 then
        gems[#gems + 1] = "0"
      end
    end
  end
  local id = string.match(link, "item:(%d*)")
  if (id == "" or id == "0") and TradeSkillFrame ~= nil and TradeSkillFrame:IsVisible() and GetMouseFocus().reagentIndex then
    local selectedRecipe = TradeSkillFrame.RecipeList:GetSelectedRecipeID()
    for i = 1, 8 do
      if GetMouseFocus().reagentIndex == i then
        id = C_TradeSkillUI.GetRecipeReagentItemLink(selectedRecipe, i):match("item:(%d*)") or nil
        break
      end
    end
  end

  if id then
    addLine(self, id, kinds.item)
    if itemSplit[2] ~= 0 then
      enchantid = itemSplit[2]
      addLine(self, enchantid, kinds.enchant)
    end
    if #bonuses ~= 0 then addLine(self, bonuses, kinds.bonus) end
    if #gems ~= 0 then addLine(self, gems, kinds.gem) end
  end
end

GameTooltip:HookScript("OnTooltipSetItem", attachItemTooltip)
ItemRefTooltip:HookScript("OnTooltipSetItem", attachItemTooltip)
ItemRefShoppingTooltip1:HookScript("OnTooltipSetItem", attachItemTooltip)
ItemRefShoppingTooltip2:HookScript("OnTooltipSetItem", attachItemTooltip)
ShoppingTooltip1:HookScript("OnTooltipSetItem", attachItemTooltip)
ShoppingTooltip2:HookScript("OnTooltipSetItem", attachItemTooltip)

-- Achievement Frame Tooltips
local f = CreateFrame("frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(_, _, what)
  if what == "Blizzard_AchievementUI" then
    for i,button in ipairs(AchievementFrameAchievementsContainer.buttons) do
      button:HookScript("OnEnter", function()
        GameTooltip:SetOwner(button, "ANCHOR_NONE")
        GameTooltip:SetPoint("TOPLEFT", button, "TOPRIGHT", 0, 0)
        addLine(GameTooltip, button.id, kinds.achievement)
        GameTooltip:Show()
      end)
      button:HookScript("OnLeave", function()
        GameTooltip:Hide()
      end)

      local hooked = {}
      hooksecurefunc("AchievementButton_GetCriteria", function(index, renderOffScreen)
        local frame = _G["AchievementFrameCriteria" .. (renderOffScreen and "OffScreen" or "") .. index]
        if frame and not hooked[frame] then
          frame:HookScript("OnEnter", function(self)
            local button = self:GetParent() and self:GetParent():GetParent()
            if not button or not button.id then return end
            local criteriaid = select(10, GetAchievementCriteriaInfo(button.id, index))
            if criteriaid then
              GameTooltip:SetOwner(button:GetParent(), "ANCHOR_NONE")
              GameTooltip:SetPoint("TOPLEFT", button, "TOPRIGHT", 0, 0)
              addLine(GameTooltip, button.id, kinds.achievement)
              addLine(GameTooltip, criteriaid, kinds.criteria)
              GameTooltip:Show()
            end
          end)
          frame:HookScript("OnLeave", function()
            GameTooltip:Hide()
          end)
          hooked[frame] = true
        end
      end)
    end
  elseif what == "Blizzard_Collections" then
    hooksecurefunc("WardrobeCollectionFrame_SetAppearanceTooltip", function(self, sources)
      local visualIDs = {}
      local sourceIDs = {}
      local itemIDs = {}

      for i = 1, #sources do
        if sources[i].visualID and not contains(visualIDs, sources[i].visualID) then table.insert(visualIDs, sources[i].visualID) end
        if sources[i].sourceID and not contains(visualIDs, sources[i].sourceID) then table.insert(sourceIDs, sources[i].sourceID) end
        if sources[i].itemID and not contains(visualIDs, sources[i].itemID) then table.insert(itemIDs, sources[i].itemID) end
      end

      if #visualIDs ~= 0 then addLine(GameTooltip, visualIDs, kinds.visual) end
      if #sourceIDs ~= 0 then addLine(GameTooltip, sourceIDs, kinds.source) end
      if #itemIDs ~= 0 then addLine(GameTooltip, itemIDs, kinds.item) end
    end)
  end
end)

if not isClassicWow then
  -- Pet battle buttons
  hooksecurefunc("PetBattleAbilityButton_OnEnter", function(self)
    local petIndex = C_PetBattles.GetActivePet(LE_BATTLE_PET_ALLY)
    if self:GetEffectiveAlpha() > 0 then
      local id = select(1, C_PetBattles.GetAbilityInfo(LE_BATTLE_PET_ALLY, petIndex, self:GetID()))
      if id then
        local oldText = PetBattlePrimaryAbilityTooltip.Description:GetText(id)
        PetBattlePrimaryAbilityTooltip.Description:SetText(oldText .. "\r\r" .. kinds.ability .. "|cffffffff " .. id .. "|r")
      end
    end
  end)

  -- Pet battle auras
  hooksecurefunc("PetBattleAura_OnEnter", function(self)
    local parent = self:GetParent()
    local id = select(1, C_PetBattles.GetAuraInfo(parent.petOwner, parent.petIndex, self.auraIndex))
    if id then
      local oldText = PetBattlePrimaryAbilityTooltip.Description:GetText(id)
      PetBattlePrimaryAbilityTooltip.Description:SetText(oldText .. "\r\r" .. kinds.ability .. "|cffffffff " .. id .. "|r")
    end
  end)

  ---- Currencies
  --hooksecurefunc(GameTooltip, "SetCurrencyToken", function(self, index)
  --  local id = tonumber(string.match(GetCurrencyListLink(index),"currency:(%d+)"))
  --  addLine(self, id, kinds.currency)
  --end)

  hooksecurefunc(GameTooltip, "SetCurrencyByID", function(self, id)
     addLine(self, id, kinds.currency)
  end)

  hooksecurefunc(GameTooltip, "SetCurrencyTokenByID", function(self, id)
     addLine(self, id, kinds.currency)
  end)

  -- Quests
  --hooksecurefunc("QuestMapLogTitleButton_OnEnter", function(self)
    --local id = select(8, GetQuestLogTitle(self.questLogIndex))
    --addLine(GameTooltip, id, kinds.quest)
  --end)

  hooksecurefunc("TaskPOI_OnEnter", function(self)
    if self and self.questID then addLine(GameTooltip, self.questID, kinds.quest) end
  end)
end

function Squid_Alert(message1,message2,sound,fadetime,texture,refresh_old)

    local time = GetTime()
    local framerate = GetFramerate()
    local stop_func

    --no duplicates
    if message2 then
        for i=1,#AlertFrames do
            if AlertFrames[i].Text:GetText() == message1 .. " |cff00ccff" .. message2 then
                AlertFrames[i].Alpha = 1
                AlertFrames[i]:SetAlpha(1)
                AlertFrames[i].newupdate = time + (fadetime or 1)
                return false;
            end
        end
    else
        -- if message1 ~= "|cFFdecbebRotation Enabled" 
        -- and message1 ~= "|cFFca2aa5Rotation Disabled" 
        -- and message1 ~= "|cFFdecbebAuto Combustion Enabled" 
        -- and message1 ~= "|cFFca2aa5Auto Combustion Disabled" then
        local enabled_match = strmatch(message1,"Enabled")
        local disabled_match = strmatch(message1,"Disabled")
        
        if not enabled_match and not disabled_match then
            for i=1,#AlertFrames do
                if AlertFrames[i].Text:GetText() == message1 then
                    AlertFrames[i].Alpha = 1
                    AlertFrames[i]:SetAlpha(1)
                    AlertFrames[i].newupdate = time + (fadetime or 1)
                    return false;
                end
            end
        else
            if enabled_match then
                for i=1,#AlertFrames do
                    if AlertFrames[i] then
                        if strmatch(AlertFrames[i].Text:GetText(),"Disabled") then
                            AlertFrames[i]:Hide()
                            tremove(AlertFrames,i)
                        elseif strmatch(AlertFrames[i].Text:GetText(),message1) then
                            AlertFrames[i].Alpha = 1
                            AlertFrames[i]:SetAlpha(1)
                            AlertFrames[i].newupdate = time + 1
                            stop_func = true
                        end
                    end
                end
            end
            if disabled_match then
                for i=1,#AlertFrames do
                    if AlertFrames[i] then
                        if strmatch(AlertFrames[i].Text:GetText(),"Enabled") then
                            AlertFrames[i]:Hide()
                            tremove(AlertFrames,i)
                        elseif strmatch(AlertFrames[i].Text:GetText(),message1) then
                            AlertFrames[i].Alpha = 1
                            AlertFrames[i]:SetAlpha(1)
                            AlertFrames[i].newupdate = time + 1
                            stop_func = true
                        end
                    end
                end
            end
        end
    end

    if stop_func then return false end

    local alert = CreateFrame("Frame")
    local anchor,_,anchor2,x,y = AlertFrames_Anchor:GetPoint()
    alert:SetPoint("CENTER",AlertFrames_Anchor,"CENTER",0,20)
    alert:SetHeight(125)
    alert:SetWidth(400)

    local font = "Fonts\\FRIZQT__.TTF"
    alert:SetClampedToScreen(true)
    alert.Text = alert:CreateFontString(nil, "HIGH", nil)
    --scale this
    alert.Text:SetFont(font,45,'THICKOUTLINE')

    alert:SetScript("OnMouseUp",nil);
    alert:SetScript("OnMouseDown",nil);

    if message2 then
        alert.Text:SetText(message1 .. " |cff00ccff" .. message2)
    else
        alert.Text:SetText(message1)
    end

    alert.Start = time
    alert.End = time + 2
    alert.Time = 2
    alert.Alpha = 1

    alert.Text:SetPoint("CENTER",alert,"CENTER",0,0) -- +200

    local t = GetSpellTexture(texture)
    if t then
        alert.Texture = alert:CreateTexture(nil,"OVERLAY",nil)
        alert.Texture:SetTexture(t)
        alert.Texture:ClearAllPoints()
        -- alert.Texture:SetParent(alert)
        --scale this
        alert.Texture:SetWidth(30)
        alert.Texture:SetHeight(30)
        if AlertFrames[1] and AlertFrames[1].Texture then
            local pos,parent,pos2,offset = AlertFrames[1].Texture:GetPoint()
            -- no more alternating icon position
            -- if pos == "LEFT" then
            --  alert.Texture:SetPoint("RIGHT",alert.Text,"RIGHT",25,0)---(20+(alert.Text:GetWidth()/2)),0)
            -- else
                alert.Texture:SetPoint("LEFT",alert.Text,"LEFT",-35,0)---(20+(alert.Text:GetWidth()/2)),0)
            -- end
        else
            alert.Texture:SetPoint("LEFT",alert.Text,"LEFT",-35,0)
        end

    end

    --initial alert animation
    alert:SetScript("OnUpdate",function(self)
        if self then
            local duration = .08*framerate
            local step = 4/duration
            --scale this
            local desired_size = 25 --desired size of text after the animation is complete
            local size = select(2,self.Text:GetFont())
            if size <= desired_size+2 and not self.switch then
                self.Text:SetFont(font,size+step,"OUTLINE");
            elseif size > desired_size then
                self.Text:SetFont(font,size-step,"OUTLINE");
                self.switch = true
            end
        end
    end)

    --begin fade animation after designated time ( 2.5s default )
    C_Timer.After(fadetime or 2.5,function()
        alert:SetScript("OnUpdate",function(self)
            if not self.newupdate or self.newupdate < GetTime() then
                if self then
                    local duration = .7*framerate
                    local step = 1/duration
                    self:SetAlpha(self.Alpha);
                    self.Alpha = self.Alpha - step
                end
            end
        end)
    end)

    alert.index = #AlertFrames+1

    table.insert(AlertFrames,alert)

    --play soundfile
    if not kc.sounds_disabled and sound and (not soundplayed[sound] or time - soundplayed[sound] > .3) then

        cork = "Interface\\AddOns\\binds\\media\\cork.mp3"
        danger = "Interface\\AddOns\\binds\\media\\danger1.mp3"
        positive = "Interface\\AddOns\\binds\\media\\positive1.mp3"
        cork2 = "Interface\\AddOns\\binds\\media\\cork2.mp3"
        alert1 = "Interface\\AddOns\\binds\\media\\alert1.mp3"
        alert2 = "Interface\\AddOns\\binds\\media\\alert2.wav"
        alert3 = "Interface\\AddOns\\binds\\media\\alert3.mp3"

        --cork sound
        if sound == 1 then
            PlaySoundFile(cork,"Master")
        end
        --danger sound
        if sound == 2 then
            PlaySoundFile(danger,"Master")
        end
        --positive sound
        if sound == 3 then
            PlaySoundFile(positive,"Master")
        end
        --second cork sound
        if sound == 4 then
            PlaySoundFile(cork2,"Master")
        end
        --alert sound
        if sound == 5 then
            PlaySoundFile(alert1,"Master")
        end
        --alert sound 2
        if sound == 6 then
            PlaySoundFile(alert2,"Master")
        end
        --alert sound 3
        if sound == 7 then
            PlaySoundFile(alert3,"Master")
        end

        soundplayed[sound]=time

    end

    return true

end

function Squid_Alert_Big(message1,message2,sound,fadetime,texture)

    local time=GetTime()
    local framerate = GetFramerate()

    --no duplicates
    if message2 then
        for i=1,#BigAlertFrames do
            if BigAlertFrames[i].Text:GetText() == message1 .. " |cff00ccff" .. message2 then
                BigAlertFrames[i].Alpha = 1
                BigAlertFrames[i]:SetAlpha(1)
                BigAlertFrames[i].newupdate = time + (fadetime or 1)
                return false;
            end
        end
    else
        for i=1,#BigAlertFrames do
            if BigAlertFrames[i].Text:GetText() == message1 then
                BigAlertFrames[i].Alpha = 1
                BigAlertFrames[i]:SetAlpha(1)
                BigAlertFrames[i].newupdate = time + (fadetime or 1)
                return false;
            end
        end
    end

    --75 , 115 (+ y axis)

    local alert = CreateFrame("Frame")
    local anchor,_,anchor2,x,y = BigAlertFrames_Anchor:GetPoint()
    alert:SetPoint("CENTER",BigAlertFrames_Anchor,"CENTER",0,-25)
    -- alert:SetPoint("CENTER",15,75)
    alert:SetHeight(125)
    alert:SetWidth(400)

    local font = "Fonts\\FRIZQT__.TTF"
    alert:SetClampedToScreen(true)
    alert.Text = alert:CreateFontString(nil, "HIGH", nil)
    alert.Text:SetFont(font,18,'OUTLINE')

    alert:SetScript("OnMouseUp",nil);
    alert:SetScript("OnMouseDown",nil);

    if message2 then
        alert.Text:SetText(message1 .. " |cff00ccff" .. message2)
    else
        alert.Text:SetText(message1)
    end

    alert.Start = time
    alert.End = time + 2
    alert.Time = 2
    alert.Alpha = 1

    alert.Text:SetPoint("CENTER",alert,"CENTER",0,0)

    if texture then
        local t=GetSpellTexture(texture)
        alert.Texture = alert:CreateTexture(nil,"OVERLAY",nil)
        alert.Texture:SetTexture(t)
        alert.Texture:ClearAllPoints()
        -- alert.Texture:SetParent(alert)
        alert.Texture:SetWidth(22)
        alert.Texture:SetHeight(22)
        alert.Texture:SetPoint("LEFT",alert.Text,"LEFT",-32,0)
    end

    --initial alert animation
    alert:SetScript("OnUpdate",function(self)
        if self then
            local duration = .08*framerate
            local step = 4/duration
            local desired_size = 18 --desired size of text after the animation is complete
            local size = select(2,self.Text:GetFont())
            if size <= desired_size+2 and not self.switch then
                self.Text:SetFont(font,size+step,"OUTLINE");
            elseif size > desired_size then
                self.Text:SetFont(font,size-step,"OUTLINE");
                self.switch = true
            end
        end
    end)

    --begin fade animation after designated time ( 2.5s default )
    C_Timer.After(fadetime or 2.5,function()
        alert:SetScript("OnUpdate",function(self)
            if not self.newupdate or self.newupdate < GetTime() then
                if self then
                    local duration = .7*framerate
                    local step = 1/duration
                    self:SetAlpha(self.Alpha);
                    self.Alpha = self.Alpha - step
                end
            end
        end)
    end)

    alert.index = #BigAlertFrames+1

    table.insert(BigAlertFrames,alert)

    --play soundfile
    if not SQUID.sounds_disabled and sound and (not soundplayed[sound] or time - soundplayed[sound] > .3) then

        local cork = Squid_Directory() .. "/media/cork.mp3"
        local danger = Squid_Directory() .. "/media/danger1.mp3"
        local positive = Squid_Directory() .. "/media/positive1.mp3"
        local cork2 = Squid_Directory() .. "/media/cork2.mp3"
        local alert1 = Squid_Directory() .. "/media/alert1.mp3"
        local alert2 = Squid_Directory() .. "/media/alert2.wav"
        local alert3 = Squid_Directory() .. "/media/alert3.mp3"
        local happy_alert = Squid_Directory() .. "/media/happy_alert.mp3"

        --cork sound
        if sound == 1 then
            PlaySoundFile(cork,"Master")
        end
        --danger sound
        if sound == 2 then
            PlaySoundFile(danger,"Master")
        end
        --positive sound
        if sound == 3 then
            PlaySoundFile(positive,"Master")
        end
        --second cork sound
        if sound == 4 then
            PlaySoundFile(cork2,"Master")
        end
        --alert sound
        if sound == 5 then
            PlaySoundFile(alert1,"Master")
        end
        --alert sound 2
        if sound == 6 then
            PlaySoundFile(alert2,"Master")
        end
        --alert sound 3
        if sound == 7 then
            PlaySoundFile(alert3,"Master")
        end
        --happy smiley alert :)
        if sound == 8 then
            PlaySoundFile(happy_alert,"Master")
        end

        soundplayed[sound]=time

    end

    return true

end

function Squid_Aura_Alert(unit,aura)
    if UnitBuffID(unit,aura) then
        Squid_Alert(GetSpellInfo(aura).." on "..UnitName(unit),math.floor(_buffRemains(unit,aura)).."s remains.",_,_,aura)
    end
    if UnitDebuffID(unit,aura) then
        Squid_Alert(GetSpellInfo(aura).." on "..UnitName(unit),math.floor(_debuffRemains(unit,aura)).."s remains.",_,_,aura)
    end
end

DISABLE_ASTAR_RENDER = true



local _nilf = function() end -- empty 

    local _classes = setmetatable({}, {__mode = "kv"})   -- weak table storing references to all declared classes
    
    local _metamethods = { -- all metamethods except __index
      '__add', '__call', '__concat', '__div', '__le', '__lt', '__mod', '__mul', '__pow', '__sub', '__tostring', '__unm' 
    }
    
    Object = { name = "Object", __modules = {} }
    
    Object.__classDict = {
      initialize = _nilf, destroy = _nilf, subclassed = _nilf,
      __tostring = function(instance) return ("instance of ".. instance.class.name) end -- root of __tostring method
    }
    Object.__classDict.__index = Object.__classDict -- instances of Object need this
    
    setmetatable(Object, { 
      __index = Object.__classDict,    -- look up methods in the classDict
      __newindex = Object.__classDict, -- any new object methods will be defined in classDict
      __call = Object.new,             -- allows instantiation via Object()
      __tostring = function() return "class Object" end -- allows tostring(obj)
    })
    
    _classes[Object] = Object -- register Object on the list of classes.
    
    -- creates a new instance
    Object.new = function(theClass, ...)
      assert(_classes[theClass]~=nil, "Use class:new instead of class.new")
    
      local instance = setmetatable({ class = theClass }, theClass.__classDict)
      instance:initialize(...)
      return instance
    end
    
    -- creates a subclass
    Object.subclass = function(theClass, name)
      assert(_classes[theClass]~=nil, "Use class:subclass instead of class.subclass")
      assert( type(name)=="string", "You must provide a name(string) for your class")
    
      local theSubClass = { name = name, superclass = theClass, __classDict = {}, __modules={} }
      
      local dict = theSubClass.__classDict   -- classDict contains all the [meta]methods of the class
      dict.__index = dict                    -- It "points to itself" so instances can use it as a metatable.
      local superDict = theClass.__classDict -- The superclass' classDict
    
      setmetatable(dict, superDict) -- when a method isn't found on classDict, 'escalate upwards'.
    
      for _,mmName in ipairs(_metamethods) do -- Creates the initial metamethods
        dict[mmName]= function(...)           -- by default, they just 'look up' for an implememtation
          local method = superDict[mmName]    -- and if none found, they throw an error
          assert( type(method)=='function', tostring(theSubClass) .. " doesn't implement metamethod '" .. mmName .. "'" )
          return method(...)
        end
      end
    
      setmetatable(theSubClass, {
        __index = dict,                              -- look for stuff on the dict
        __newindex = function(_, methodName, method) -- add 'super' to methods
            assert(methodName ~= '__index', "Can't modify __index. Include middleclass-extras.Indexable and use 'index' instead")
            if type(method) == 'function' then
              local fenv = getfenv(method)
              local newenv = setmetatable( {super = superDict},  {__index = fenv, __newindex = fenv} )
              setfenv( method, newenv )
            end
            rawset(dict, methodName , method)
          end,
        __tostring = function() return ("class ".. name) end,      -- allows tostring(MyClass)
        __call = function(_, ...) return theSubClass:new(...) end  -- allows MyClass(...) instead of MyClass:new(...)
      })
    
      theSubClass.initialize = function(instance,...) super.initialize(instance) end -- default initialize method
      _classes[theSubClass]= theSubClass -- registers the new class on the list of _classes
      theClass:subclassed(theSubClass)   -- hook method. By default it does nothing
    
      return theSubClass
    end
    
    -- Mixin extension function - simulates very basically ruby's include. Receives a table table, probably with functions.
    -- Its contents are copied to theClass, with one exception: the included() method will be called instead of copied
    Object.include = function(theClass, module, ... )
      assert(_classes[theClass]~=nil, "Use class:includes instead of class.includes")
      assert(type(module=='table'), "module must be a table")
      for methodName,method in pairs(module) do
        if methodName ~="included" then theClass[methodName] = method end
      end
      if type(module.included)=="function" then module:included(theClass, ... ) end
      theClass.__modules[module] = module
      return theClass
    end
    
    -- Returns true if aClass is a subclass of other, false otherwise
    function subclassOf(other, aClass)
      if _classes[aClass]==nil or _classes[other]==nil then return false end
      if aClass.superclass==nil then return false end -- aClass is Object, or a non-class
      return aClass.superclass == other or subclassOf(other, aClass.superclass)
    end
    
    -- Returns true if obj is an instance of aClass (or one of its subclasses) false otherwise
    function instanceOf(aClass, obj)
      if _classes[aClass]==nil or type(obj)~='table' or _classes[obj.class]==nil then return false end
      if obj.class==aClass then return true end
      return subclassOf(aClass, obj.class)
    end
    
    -- Returns true if the a module has already been included on a class (or a superclass of that class)
    function includes(module, aClass)
      if _classes[aClass]==nil then return false end
      if aClass.__modules[module]==module then return true end
      return includes(module, aClass.superclass)
    end
    
    -- Creates a new class named 'name'. Uses Object if no baseClass is specified. Additional parameters for compatibility
    function class(name, baseClass, ...)
      baseClass = baseClass or Object
      return baseClass:subclass(name, ...)
    end


    local Path = class('Path')

    function Path:initialize(nodes, totalCost)
      self.nodes = nodes
      self.totalCost = totalCost
    end
    
    function Path:getNodes()
      return self.nodes
    end
    
    function Path:getTotalMoveCost()
      return self.totalCost
    end
    
    local Node = class('Node')
    
    function Node:initialize(location, move_cost, id, parent)
      self.location = location
      self.move_cost = move_cost
      self.parent = parent
      self.score = 0
      self.id = id
    end
    
    function Node.__eq(a, b)
      return a.id == b.id
    end
    
    local AStar = class('AStar')
    
    function AStar:initialize(maphandler)
      self.handler = maphandler
    end
    
    function AStar:_getBestOpenNode()
      local bestNode = nil
    
      for id, n in pairs(self.open) do
        if bestNode == nil then
          bestNode = n
        else
          if n.score <= bestNode.score then
            bestNode = n
          end
        end
      end
    
      return bestNode
    end
    
    function AStar:_tracePath(n)
      local nodes = {}
      local totalCost = n.move_cost
      local p = n.parent
    
      table.insert(nodes, 1, n)
    
      while true do
        if p.parent == nil then
          break
        end
        table.insert(nodes, 1, p)
        p = p.parent
      end
      NavDebug.DRAWTHIS = nodes
      return Path(nodes, totalCost)
    end
    
    function AStar:_handleNode(node, goal)
      --if node == nil then
      --  return nil
      --end

      self.open[node.id] = nil
      self.closed[node.id] = node.id
    
      local nodes = self.handler:getAdjacentNodes(node, goal)
      for id, n in pairs(nodes) do repeat
        if self.handler:locationsAreEqual(n.location, goal) then
          return n
        elseif self.closed[n.id] ~= nil then -- Alread in close, skip this
          break
        elseif self.open[n.id] ~= nil then -- Already in open, check if better score
          local on = self.open[n.id]
          if n.move_cost < on.move_cost then
            self.open[n.id] = n
          end
        else -- New node, append to open list
          self.open[n.id] =  n
        end
      until true end
    
      return nil
    end
    
    function AStar:findNextNode(fromlocation, tolocation)
      self.max_node_checks = 100
      self.nodes_checked = 0
      self.open = {}
      self.closed = {}
    
      local goal = tolocation
      local fnode = self.handler:getNode(fromlocation)
    
      local nextNode = nil
    
      if fnode ~= nil then
        self.open[fnode.id] = fnode
        nextNode = fnode
      end
    
      local finish
      while not finish do
        self.nodes_checked  = self.nodes_checked + 1
        if self.nodes_checked > self.max_node_checks then
            return nil
        end
        finish = self:_handleNode(nextNode, goal)
        if not finish then
          nextNode = self:_getBestOpenNode()
        end
      end
      print("found path in nodes: " .. tostring(self.nodes_checked))
      return self:_tracePath(finish)
    end
    
    function AStar:findPath(fromlocation, tolocation, callback)
    
      --[[local co = coroutine.create(self.findNextNode)
      local done = false
      local ticker
      LibDraw.Sync(function()
        --ticker = C_Timer.NewTicker(0.001, function()
        for i=1,10 do
          if done then return end
          local res, value = coroutine.resume(co, self, fromlocation, tolocation)
          if res and value then
            done = true
            callback(value)
          elseif not res and value then
            done = true
            print("Res: " .. tostring(res) ..  "val " ..  tostring(value))
          end
        end
        end)]]--
    
      return self:findNextNode(fromlocation, tolocation)
    end

    
function AStar:findNextNodeAsync(fromlocation, tolocation)
  self.open = {}
  self.closed = {}  
  self.max_node_checks = 75
  self.nodes_checked = 0

  local goal = tolocation
  local fnode = self.handler:getNode(fromlocation)
  local nextNode = nil
  if fnode ~= nil then
    self.open[fnode.id] = fnode
    nextNode = fnode
  end

  local finish
  while not finish do
    self.nodes_checked  = self.nodes_checked + 1
    if self.nodes_checked > self.max_node_checks then
          return nil
    end
    finish = self:_handleNode(nextNode, goal)
    if not finish then
      nextNode = self:_getBestOpenNode()
      coroutine.yield()
    end
  end
  return self:_tracePath(finish)
end

local local_nav_max_run_time_ms = .75

function AStar:findPathAsync(fromlocation, tolocation, callback)
  local start_time = GetTime()
  local co = coroutine.create(self.findNextNodeAsync)
  local done = false
  local ticker

  --LibDraw.Sync(function()
  ticker = C_Timer.NewTicker(0.001, function()
    for i=1,10 do
      local now_time = GetTime()
      if now_time - start_time > local_nav_max_run_time_ms then
         ticker:Cancel()
         --print("nav request cancelled due to max time")
         callback(nil)
      end
      if done then return end
      local res, value = coroutine.resume(co, self, fromlocation, tolocation)
      if res and value then
        done = true
        ticker:Cancel()
        --print("local nav took: " .. tostring(now_time - start_time) .. " ms to run: success")
        callback(value)
      elseif not res and value then
        done = true
        ticker:Cancel()        
        --print("local nav took: " .. tostring(now_time - start_time) .. " ms to run: fail")
        callback(nil)
      end
    end
  end)
  return nil
end

HitFlags = {
    M2Collision = 0x1,
    M2Render = 0x2,
    WMOCollision = 0x10,
    WMORender = 0x20,
    Terrain = 0x100,
    WaterWalkableLiquid = 0x10000,
    Liquid = 0x20000,
    EntityCollision = 0x100000,
};


flags = bit.bor(
  HitFlags.M2Collision,
  HitFlags.WMOCollision,
  HitFlags.EntityCollision,
  HitFlags.M2Render,
  HitFlags.WMORender
)

allFlags = bit.bor(
  HitFlags.M2Collision,
  HitFlags.WMOCollision,
  HitFlags.EntityCollision,
  HitFlags.M2Render,
  HitFlags.WMORender,
  HitFlags.Terrain,
  HitFlags.WaterWalkableLiquid,
  HitFlags.Liquid
)


function round(num, numDecimalPlaces)
  local mult = 10^(numDecimalPlaces or 0)
  return math.floor(num * mult + 0.5) / mult
end

function _G.calculateHillAngle(x1, y1, z1, x2, y2, z2)
    local dot = x1 * x2 + y1 * y2 + z1 * z2
    local a = math.sqrt(x1 * x1 + y1 * y1 + z1 * z1)
    local b = math.sqrt(x2 * x2 + y2 * y2 + z2 * z2)
    local t = math.acos(dot / (a * b))

    -- local magnitude1, magnitude2
    --
    -- magnitude1 = math.sqrt(math.pow(x1, 2) + math.pow(y1, 2) + math.pow(z1, 2))
    -- magnitude1 = math.abs(magnitude1)
    -- magnitude2 = math.sqrt(math.pow(x2, 2) + math.pow(y2, 2) + math.pow(z2, 2))
    -- magnitude2 = math.abs(magnitude2)
    --
    -- local radi
    -- radi = math.acos((dotProduct/(magnitude1*magnitude2)))
    -- radi = radi * (180/math.pi)
    return t
end

function _G.ca()
  local x1, y1, z1 = ObjectPosition('player')
  local x2, y2, z2 = ObjectPosition('target')
  return GetAnglesBetweenPositions(x1, y1, z1, x2, y2, z2)
end

local function distance(x, y, z, px, py, pz)
  return math.floor(math.sqrt((x-px)*(x-px) + (y-py)*(y-py) + (z-pz)*(z-pz)))
end

local Handler = class('Handler')

function Handler:initialize()
  self.node_attempts = 0
  self.hit_fails = 0
  self.angle_fails = 0
  self.non_parent = 0
  self.ok_nodes = 0
  self.max_attempts = 5000000
end

local hl = 0

local Handler = class('Handler')

function Handler:initialize()
  self.node_attempts = 0
  self.hit_fails = 0
  self.angle_fails = 0
  self.non_parent = 0
  self.ok_nodes = 0
  self.max_attempts = 5000000
end

local hl = 0
function Handler:getNodeLid(location)
   return tonumber((location.x * 50000 * 50000) + (location.y * 50000) + location.z)
end


function Handler:IsSpotOnNavMesh(location)
  local _error, distance_to_polygon, poly_flags, closest_nav_x, closest_nav_y, closest_nav_z, is_on_nav_mesh = GetMeshPointInfo(location.x, location.y, location.z, GetMapId())
   if _error == 0 then
    --print("is on nav: " .. tostring(is_on_nav_mesh) .. " x: " .. tostring(location.x) .. "/" .. tostring(location.y) .. "/" .. tostring(location.z))
    return is_on_nav_mesh
  else
  end
end

function _isOnMesh(x,y,z)
    local _error, distance_to_polygon, poly_flags, closest_nav_x, closest_nav_y, closest_nav_z, is_on_nav_mesh = GetMeshPointInfo(x,y,z,GetMapId())
    if _error == 0 then
        return is_on_nav_mesh;
    end
end

local LOCALNAVVERBOSERENDER = false
function Handler:getNode(location)
  self.node_attempts = self.node_attempts + 1
  if self.node_attempts > self.max_attempts then
    return ni
  end
  if location.px and location.x then
    local reach = 0.25
    local ground_reach = 0.5
    local high_ground_reach = 2.2
    local x, y, z = location.x, location.y, location.z
    local px, py, pz = location.px, location.py, location.pz
    local reach_x, reach_y = location.reach_x, location.reach_y
    local surrounding_hit = false
    local is_on_nav_mesh = self:IsSpotOnNavMesh(location)

    if not is_on_nav_mesh then
      surrounding_hit = true
    else
      for sx=-2,2 do
        for sy=-2,2 do
          if TraceLine(x + (sx * reach), y + (sy * reach), z + ground_reach, px, py, pz + ground_reach, flags)
           or TraceLine(x + (sx * reach), y + (sy * reach), z + high_ground_reach, px, py, pz + high_ground_reach, flags) then
            --gravel.draw.SetColor(255, 0, 0)
            --gravel.draw.Line(x + (sx * reach), y + (sy * reach), z + ground_reach, px, py, pz + ground_reach)
            surrounding_hit = true
            break
          end
        end
        if surrounding_hit then break end
      end
    end
    if not surrounding_hit then
       if TraceLine(x, y, z + 0.1, x, y, z + 3) then
          surrounding_hit = true
          print("height test fuckup")
       end
    end

    if surrounding_hit then
      if DISABLE_ASTAR_RENDER == false then
        table.insert(LOCALNAV.bad_nodes, location)
     end
      return nil
    elseif (math.max(z, pz) - math.min(z, pz)) > 0.5 then
      if DISABLE_ASTAR_RENDER == false then
        table.insert(LOCALNAV.bad_nodes, location)
     end
      return nil
    else
      if DISABLE_ASTAR_RENDER == false then
         table.insert(LOCALNAV.good_nodes, location)
      end

      local lid = self:getNodeLid(location)
      return Node(location, 1, lid)
    end
  else
    if DISABLE_ASTAR_RENDER == false then
      table.insert(LOCALNAV.good_nodes, location)
   end

    local lid =  self:getNodeLid(location)
    return Node(location, 1, lid)
  end
  if DISABLE_ASTAR_RENDER == false then
    table.insert(LOCALNAV.bad_nodes, location)
 end
  return nil
end

function Handler:locationsAreEqual(a, b)
  local distance = 1
  return math.abs(a.x - b.x) < distance and math.abs(a.y - b.y) < distance and math.abs(a.z - b.z) < distance
end

function Handler:isValidNode(location)
  print("checking: " .. location.x .. "  / " .. location.z)
  local offset_high
  local fixed_z = false
  if IsIndoors() then
    offset_high = 1
  else
    offset_high = 8
  end

  local nodex, nodey, nodez = unpack(location)
  local losx,losy,losz = TraceLine(nodex, nodez, nodez + offset_high, nodex, nodez, -10000, 0x100111) -- Basic LOS
  local terx,tery,terz = TraceLine(nodex, nodez, nodez + offset_high, nodex, nodez, -10000, 0x100) -- Terrain

  -- Only hit terrain?
  --NAV_DEBUG("Trace Res: " .. tostring(result) .. " x: " .. c_x  ..  " y: " .. c_y .. " _x: " .. _x .. " _y:")
  if losz ~= nil and terz ~= nil then
      if math.abs(losz - terz) < 1 then -- We hit soemthing that was higher than the terrain, presume collidable, buildings will fuck this?!
        return false
      end
  end

  return true;
end



function Handler:getAdjacentNodes(curnode, dest)
  local result = {}
  local cl = curnode.location
  local dl = dest
  local n = false


  for x = -1, 1 do
    for y = -1, 1 do
      n = self:_handleNode(cl.x + x, cl.y + y, cl.z, curnode, dl.x, dl.y, dl.z, x, y)   
      if n then
        table.insert(result, n)
      end
     -- n = self:_handleNode(cl.x + (x / 2), cl.y + (y / 2), cl.z, curnode, dl.x, dl.y, dl.z, (x / 2), (y / 2))   
      --if n then
      --  table.insert(result, n)
      --end
      --n = self:_handleNode(cl.x + (x / 4), cl.y + (y / 4), cl.z, curnode, dl.x, dl.y, dl.z, (x / 4), (y / 4))    
      --if n then
      --  table.insert(result, n)
      --end
    end
  end

  return result
end




function Handler:_handleNode(x, y, z, fromnode, destx, desty, destz, reach_x, reach_y)
  local offset_high
  local fixed_z = false
  if IsIndoors() then
    offset_high = 1.5
  else
    offset_high = 8
  end
  
  local rx, ry, rz = TraceLine(x, y, z + offset_high, x, y, z - 500, allFlags)
  if rz then
    fixed_z = z
    z = rz
  end
  
  -- Fetch a Node for the given location and set its parameters
  local n = self:getNode({
    x = x, y = y, z = z,
    px = fromnode.x, py = fromnode.y, pz = fromnode.z,
    reach_x = reach_x, reach_y = reach_y,
    fixed_z = fixed_z,
    move_cost = 1
  })

  if n ~= nil then
    
    local dx = math.max(x, destx) - math.min(x, destx)
    local dy = math.max(y, desty) - math.min(y, desty)
    local dz = math.max(z, destz) - math.min(z, destz)
    local move_cost = ((dx + dy) * LOCALNAV.horizontalcost) + ( dz * LOCALNAV.verticalcost )

    n.move_cost = n.move_cost + fromnode.move_cost
    n.score = n.move_cost + move_cost
    n.parent = fromnode
    n.x, n.y, n.z = x, y, z
    return n
  end

  return nil
end

if LOCALNAV == nil then
  LOCALNAV = {}  
  LOCALNAV.horizontalcost = 20
  LOCALNAV.verticalcost = 5
  LOCALNAV.maphandler = Handler()
  LOCALNAV.last_jump = GetTime() * 1000
  LOCALNAV.jump_time = 10000
  LOCALNAV.astar = AStar(LOCALNAV.maphandler)
  LOCALNAV.good_nodes = {}
  LOCALNAV.bad_nodes = {}
end

function FIND_ASTAR_PATH(fx,fy,fz, tox, toy, toz) 
    --if not LOCALNAV.maphandler:isValidNode({fx, fy, fz}) or not LOCALNAV.maphandler:isValidNode({tox, toy,toz}) then
    --  print("[Hybrid] either start or end node where off the hybrid map")
    --  return nil;
    --end
    
    
    return get_astar_path({fx,fy,fz}, {tox, toy, toz})
    --return LOCALNAV.astar:findPath({x= fx, y= fy, z= fz, px=fx, py=fy, pz=fz}, {x= tox, y= toy, z= toz, px=fx, py=fy, pz=fz})
end

function FIND_ASTAR_ALONG_PATH_ASYNC(px, py, pz, path, cb)
end

function FIND_ASTAR_PATH_ASYNC(fx,fy,fz, tox, toy, toz, callback)
    get_astar_path_async({fx,fy,fz}, {tox, toy, toz}, callback)
end


function TEST_PATH_TO_TARGET() 
    local tx,ty,tz = ObjectPosition("target")
    local px,py,pz = ObjectPosition("player")

    local player_x, player_y, player_z = ObjectPosition("player")                               
    local player_face_deg, _ = ObjectFacing("player");
    local pos_x_behind_of_player = player_x - math.cos(player_face_deg) * 3 -- we calculate a path from 1 step behind the player to counter the fact he is already in the bad spot.  
    local pos_y_behind_of_player = player_y - math.sin(player_face_deg) * 3 

    FIND_ASTAR_PATH_ASYNC(pos_x_behind_of_player, pos_y_behind_of_player, pz, tx, ty, tz, function(path)
       
       NavDebug.DrawThis = path
      
       if path then
      for i=1,#path do
          local node = nodes[i]
          local x,y,z = unpack(node)
          --print("[Hybrid] Path: " .. i .. " x:" ..x .. " y:" .. y .. " z: ".. z)
      end
    end
  end)
end


local function shallowcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
      copy = {}
      for orig_key, orig_value in pairs(orig) do
        copy[orig_key] = orig_value
      end
    else -- number, string, boolean, etc
      copy = orig
    end
    return copy
  end
  
  local function mid_point(ax, ay, az, bx, by, bz)
    return (ax + bx) / 2, (ay + by) / 2, (az + bz) / 2
  end
  

function simplify_path(nodes)
    local s_nodes = shallowcopy(nodes)
    local total_nodes = #nodes
    for index, node in ipairs(nodes) do
      local x, y, z = node.location.x, node.location.y, node.location.z
      if index + 2 <= total_nodes then
        local far_node = nodes[index + 2]
        local middle_node = nodes[index + 1]
        local mx, my, mz = middle_node.location.x, middle_node.location.y, middle_node.location.z
        local fx, fy, fz = far_node.location.x, far_node.location.y, far_node.location.z
        local px, py, pz = mid_point(x, y, z, fx, fy, fz)
        if math.abs(mx - px) < 0.1 and math.abs(my - py) < 0.1 and math.abs(mz - pz) < 0.1 then
          table.remove(s_nodes, index)
        end
      end
    end
    return s_nodes
  end
  
  function get_astar_path(from, to)
    
    LOCALNAV.good_nodes = {}
    LOCALNAV.bad_nodes = {}
        local sx, sy, sz = unpack(from)
        local ex, ey, ez = unpack(to)
        local start = { x = sx, y = sy, z = sz }
        local goal = { x = ex, y = ey, z = ez }

        --print("generating path: start: " .. sx .. "/" .. sy .. "/" .. sz  .. " dest: " .. ex .. "/" .. ey .. "/" .. ez)
        local path = LOCALNAV.astar:findPath(start, goal)
        
            if type(path) == 'table' then
              local waypoints = { }
              nodes = path:getNodes()

              s_nodes = simplify_path(nodes)

              for i=1, #nodes do
                 s_nodes = simplify_path(s_nodes)
              end

              for _, node in ipairs(s_nodes) do -- ipairs(s_nodes)
                local x, y, z = node.location.x, node.location.y, node.location.z
                table.insert(waypoints, { x, y, z })
              end

              NavDebug.DrawThis = waypoints
              return waypoints
            else
               return nil
            end
  end

  
  function get_astar_path_async(from, to, cb)
    LOCALNAV.good_nodes = {}
    LOCALNAV.bad_nodes = {}
    local sx, sy, sz = unpack(from)
    local ex, ey, ez = unpack(to)
    local start = { x = sx, y = sy, z = sz }
    local goal = { x = ex, y = ey, z = ez }

    --print("generating path: start: " .. sx .. "/" .. sy .. "/" .. sz  .. " dest: " .. ex .. "/" .. ey .. "/" .. ez)
    LOCALNAV.astar:findPathAsync(start, goal, function(path)     
          if type(path) == 'table' then
            local waypoints = { }
            nodes = path:getNodes()
            s_nodes = simplify_path(nodes)
            for i=1, #nodes do
               s_nodes = simplify_path(s_nodes)
            end
            for _, node in ipairs(s_nodes) do -- ipairs(s_nodes)
              local x, y, z = node.location.x, node.location.y, node.location.z
              table.insert(waypoints, { x, y, z })
            end
            NavDebug.DrawThis = waypoints
            cb(waypoints)
          else
            cb(nil)
          end
    end)
end


  NavDebug = {}
  C_Timer.After(1, function()
    if LibDraw then
    LibDraw.Sync(function() 

        if DISABLE_ASTAR_RENDER then
          return;
        end

          if NavDebug.DRAWTHIS then
              for i=2 , #NavDebug.DRAWTHIS do
                  local last_node =  NavDebug.DRAWTHIS[i - 1]
                  local node = NavDebug.DRAWTHIS[i]
                  LibDraw.Line(last_node.x, last_node.y, last_node.z, node.x, node.y, node.z)
              end
          end

          LibDraw.SetColorRaw(1,0,0,1)
          for k,v in ipairs(LOCALNAV.bad_nodes) do
              local location = v
              LibDraw.Box(location.x, location.y, location.z, 1, 2, 0, 0, 0)
          end
          LibDraw.SetColorRaw(0,1,0,1)
          for k,v in ipairs(LOCALNAV.good_nodes) do
            local location = v
            LibDraw.Box(location.x, location.y, location.z, 1, 2, 0, 0, 0)
          end
          
        end)
    end
end)


function IsPlayerOnNavMesh()
  local x,y,z = ObjectPosition("player")
  local _error, distance_to_polygon, poly_flags, closest_nav_x, closest_nav_y, closest_nav_z, is_on_nav_mesh = GetMeshPointInfo(x,y,z, GetMapId())
  if distance_to_polygon == 0 then
   print("is on nav: " .. tostring(is_on_nav_mesh) .. " x: " .. tostring(x) .. "/" .. tostring(y) .. "/" .. tostring(z))
   return is_on_nav_mesh
 else
   print("possible NavMesh Error: " .. _error)
   return false
 end
end

QuestHelper={}

function GetStartNPC(questid)
    local questid = tonumber(questid)
    local q = DB.questData[questid]
    local npcid = q[2][1][1]
    local npc = DB.npcData[npcid]
    local WX, WY, WZ=nil,nil,nil
    for k, v in pairs (npc[7]) do
        if DB.zoneDataClassicBetaHack[DB.zoneDataClassic[k]] then
            k = DB.zoneDataClassicBetaHack[DB.zoneDataClassic[k]][1]
        end
        local vec = CreateVector2D(v[1][1]/100,v[1][2]/100)
        local continentID, worldPosition = C_Map.GetWorldPosFromMapPos(k, vec)
        for i=1,#allObjects do
            if ObjectName(allObjects[i])==npc[1] then
                WX,WY,WZ=ObjectPosition(allObjects[i]);
            end
        end
        if not WX then
            WX, WY = worldPosition:GetXY()
            WorldPreload(WX,WY,pz);
            _,_,WZ = GetCaveZ(WX,WY)
        end
    end
    return npc,q[1],npc[1],WX,WY,WZ
end

function GetEndNPC(questid)
    local questid = tonumber(questid)
    local q = DB.questData[questid]
    local npcid = q[3][1][1]
    local npc = DB.npcData[npcid]
    local WX, WY, WZ=nil,nil,nil
    for k, v in pairs (npc[7]) do
        if DB.zoneDataClassicBetaHack[DB.zoneDataClassic[k]] then
            k = DB.zoneDataClassicBetaHack[DB.zoneDataClassic[k]][1]
        end
        local vec = CreateVector2D(v[1][1]/100,v[1][2]/100)
        local continentID, worldPosition = C_Map.GetWorldPosFromMapPos(k, vec)
        for i=1,#allObjects do
            if ObjectName(allObjects[i])==npc[1] then
                WX,WY,WZ=ObjectPosition(allObjects[i]);
            end
        end
        if not WX then
            WX, WY = worldPosition:GetXY()
            WorldPreload(WX,WY,pz);
            _,_,WZ = GetCaveZ(WX,WY)
        end
    end
    return npc,q[1],npc[1],WX,WY,WZ
end

function GetLeaderBoardDetails(boardIndex,questIndex)
    local qlink = GetQuestLogIndexByID(questIndex)
    local description, objectiveType, isCompleted = GetQuestLogLeaderBoard (boardIndex,qlink);
    local itemName, numItems, numNeeded = description:match("(.*):%s*([%d]+)%s*/%s*([%d]+)");
    w = " slain"
    itemName = itemName:gsub(w,"")
    w = " destroyed"
    itemName = itemName:gsub(w,"")
    return objectiveType, itemName, numItems, numNeeded, isCompleted;
  end

function GetObjectiveCount(questid) 
    local qlink = GetQuestLogIndexByID(questID)
    return GetNumQuestLeaderBoards(qlink)
end

function GetItemByName(itemname)
    for k,v in pairs (self.itemData) do
        if (v[1] == itemname) then
            return v, k
        end
    end
    return nil
end

function GetNPCByName(itemname)
    for k,v in pairs (self.npcData) do
        if (v[1] == itemname) then
            return v, k
        end
    end
    return nil
end

function GetObjectByName(itemname)
    for k,v in pairs (self.objectData) do
        if (v[1] == itemname) then
            return v, k
        end
    end
    return nil
end

function GetHotSpotsByItem(itemid)
    local item = DB.itemData[itemid]
    local hotspots = {}
    if item[3] then
        for k,v in pairs (item[3]) do
            local npc = DB.npcData[v]
            for zoneid, waypoints in pairs (npc[7]) do
                if DB.zoneDataClassicBetaHack[DB.zoneDataClassic[zoneid]] then
                    zoneid = DB.zoneDataClassicBetaHack[DB.zoneDataClassic[zoneid]][1]
                end
                for _, way in pairs (waypoints) do
                    local continentID, worldPosition = C_Map.GetWorldPosFromMapPos(zoneid, CreateVector2D(way[1]/100,way[2]/100))
                    local WX, WY = worldPosition:GetXY()
                    WorldPreload(WX,WY,pz)
                    local _,_,WZ = GroundZ(WX,WY)
                    if WZ then
                        table.insert(hotspots,{WX,WY,WZ})
                    end
                end
            end
        end
    end
    if item[4] then
        for k,v in pairs (item[4]) do
            local object = DB.objectData[v]
            for zoneid, waypoints in pairs (object[4]) do
                if DB.zoneDataClassicBetaHack[DB.zoneDataClassic[zoneid]] then
                    zoneid = DB.zoneDataClassicBetaHack[DB.zoneDataClassic[zoneid]][1]
                end
                for _, way in pairs (waypoints) do
                    local continentID, worldPosition = C_Map.GetWorldPosFromMapPos(zoneid, CreateVector2D(way[1]/100,way[2]/100))
                    local WX, WY = worldPosition:GetXY()
                    WorldPreload(WX,WY,pz)
                    local _,_,WZ = GroundZ(WX,WY)
                    if WZ then
                        table.insert(hotspots,{WX,WY,WZ})
                    end
                end
            end
        end
    end
    return hotspots
end

function GetHotSpotsByNPC(npcid)
    local npc = DB.npcData[npcid]
    local hotspots = {}
    if npc[7] then
        for zoneid, waypoints in pairs (npc[7]) do
            if DB.zoneDataClassicBetaHack[DB.zoneDataClassic[zoneid]] then
                zoneid = DB.zoneDataClassicBetaHack[DB.zoneDataClassic[zoneid]][1]
            end
            for _, way in pairs (waypoints) do
                local continentID, worldPosition = C_Map.GetWorldPosFromMapPos(zoneid, CreateVector2D(way[1]/100,way[2]/100))
                local WX, WY = worldPosition:GetXY()
                WorldPreload(WX,WY,pz)
                local _,_,WZ = GroundZ(WX,WY)
                if WZ then
                    table.insert(hotspots,{WX,WY,WZ})
                end
            end
        end
    end
    return hotspots
end

function GetHotSpotsByObject(npcid)
    local npc = DB.objectData[npcid]
    local hotspots = {}
    if npc[4] then
        for zoneid, waypoints in pairs (npc[4]) do
            if DB.zoneDataClassicBetaHack[DB.zoneDataClassic[zoneid]] then
                zoneid = DB.zoneDataClassicBetaHack[DB.zoneDataClassic[zoneid]][1]
            end
            for _, way in pairs (waypoints) do
                local continentID, worldPosition = C_Map.GetWorldPosFromMapPos(zoneid, CreateVector2D(way[1]/100,way[2]/100))
                local WX, WY = worldPosition:GetXY()
                WorldPreload(WX,WY,pz)
                local _,_,WZ = GroundZ(WX,WY)
                if WZ then
                    table.insert(hotspots,{WX,WY,WZ})
                end
            end
        end
    end
    return hotspots
end

function ShouldPickupQuest(questID)
    local qlink = GetQuestLogIndexByID(questID)
    local finished = IsQuestFlaggedCompleted(questID)
    if qlink <= 0 and not finished then
        return true
    else
        return false
    end
end

function ShouldDoQuest(questid)
    return IsOnQuest(questid) and not ShouldTurnIn(questid) and not ShouldPickupQuest(questid)
end

function GetQuestObjects(questid)
    local questid = tonumber(questid)
    local killmobs = {}
    local gatheritems = {}
    local collectitems = {}
    spots = {}
    local q = DB.questData[questid]
    if q[DB.questKeys.objectives][1] then
        for k,v in pairs (q[DB.questKeys.objectives][1]) do
            table.insert(killmobs, v[1])
        end
    end
    if q[DB.questKeys.objectives][2] then
    end
    if q[DB.questKeys.objectives][3] then
        for k,v in pairs (q[DB.questKeys.objectives][3]) do
            local item=DB.itemData[v[1]]
            for i=1,#item[3] do
                table.insert(killmobs,item[3][i]);
            end
            table.insert(collectitems,v[1])
        end
    end
    return killmobs,collectitems
end

function GetCaveZ(StartX,StartY)
    return TraceLine(StartX, StartY, -10000, StartX, StartY, 10000)
end

function GetObjectsToCollect(questid)
    local questid = tonumber(questid)
    local killmobs = {}
    local gatheritems = {}
    local collectitems = {}
    ObjectsToCollect={};
    spots = {}
    local q = DB.questData[questid]
    if q[DB.questKeys.objectives][3] then
        for k,v in pairs (q[DB.questKeys.objectives][3]) do
            table.insert(collectitems, v[1])
        end
        for key, val in pairs (collectitems) do
            local item = DB.itemData[val]
            if item[4] then
             for k, v in pairs (item[4]) do
                if DB.objectData[v][4] then
                    for zid, sid in pairs (DB.objectData[v][4]) do 
                        if DB.zoneDataClassicBetaHack[DB.zoneDataClassic[zid]] then
                            zid = DB.zoneDataClassicBetaHack[DB.zoneDataClassic[zid]][1]
                        end
                        for _, spawn in pairs (sid) do
                            local continentID, worldPosition = C_Map.GetWorldPosFromMapPos(zid, CreateVector2D(spawn[1]/100,spawn[2]/100))
                            local WX, WY = worldPosition:GetXY()
                            WZ=select(6,GetMeshPointInfo(WX,WY,pz-100))
                            if WZ then
                                table.insert(spots,{x=WX,y=WY,z=WZ,step=0})
                            end
                        end
                    end
                end
                for i=1,#item[4] do
                    table.insert(ObjectsToCollect,item[4][i]);
                end
            end
        end
        end
    end
end

function GetHotSpots(questid)
    local questid = tonumber(questid)
    local killmobs = {}
    local gatheritems = {}
    local collectitems = {}
    ObjectsToCollect={};
    spots = {}
    local q = DB.questData[questid]
    if q[DB.questKeys.objectives][1] then
        for k,v in pairs (q[DB.questKeys.objectives][1]) do
            table.insert(killmobs, v[1])
        end
        for k,v in pairs (killmobs) do
            local mob = DB.npcData[v]
            local spawns = mob[7]
            for zid, points in pairs(spawns) do
                if DB.zoneDataClassicBetaHack[DB.zoneDataClassic[zid]] then
                    zid = DB.zoneDataClassicBetaHack[DB.zoneDataClassic[zid]][1]
                end
                for _, point in pairs(points) do
                    local continentID, worldPosition = C_Map.GetWorldPosFromMapPos(zid, CreateVector2D(point[1]/100,point[2]/100))
                    local WX, WY = worldPosition:GetXY()
                    WZ=select(6,GetMeshPointInfo(WX,WY,pz-100))
                    if WZ then
                        table.insert(spots,{x=WX,y=WY,z=WZ,step=0})
                    end
                end
            end
        end
    end
    if q[DB.questKeys.objectives][2] then
    end
    if q[DB.questKeys.objectives][3] then
        for k,v in pairs (q[DB.questKeys.objectives][3]) do
            table.insert(collectitems, v[1])
        end
        for key, val in pairs (collectitems) do
            local item = DB.itemData[val]
            if (item[3]) then
                for k, v in pairs (item[3]) do
                    for zid, sid in pairs (DB.npcData[v][7]) do 
                        if DB.zoneDataClassicBetaHack[DB.zoneDataClassic[zid]] then
                            zid = DB.zoneDataClassicBetaHack[DB.zoneDataClassic[zid]][1]
                        end
                        for _, spawn in pairs (sid) do
                            local continentID, worldPosition = C_Map.GetWorldPosFromMapPos(zid, CreateVector2D(spawn[1]/100,spawn[2]/100))
                            local WX, WY = worldPosition:GetXY()
                            WZ=select(6,GetMeshPointInfo(WX,WY,pz-100))
                            if WZ then
                                table.insert(spots,{x=WX,y=WY,z=WZ,step=0})
                            end
                        end
                    end
                end
            end
            if item[4] then
             for k, v in pairs (item[4]) do
                if DB.objectData[v][4] then
                    for zid, sid in pairs (DB.objectData[v][4]) do 
                        if DB.zoneDataClassicBetaHack[DB.zoneDataClassic[zid]] then
                            zid = DB.zoneDataClassicBetaHack[DB.zoneDataClassic[zid]][1]
                        end
                        for _, spawn in pairs (sid) do
                            local continentID, worldPosition = C_Map.GetWorldPosFromMapPos(zid, CreateVector2D(spawn[1]/100,spawn[2]/100))
                            local WX, WY = worldPosition:GetXY()
                            WZ=select(6,GetMeshPointInfo(WX,WY,pz-100))
                            if WZ then
                                table.insert(spots,{x=WX,y=WY,z=WZ,step=0})
                            end
                        end
                    end
                end
                for i=1,#item[4] do
                    table.insert(ObjectsToCollect,item[4][i]);
                end
            end
        end
        end
    end
    table.sort(spots,function(x,y) return GetDistanceBetweenPositions(px,py,pz,x.x,x.y,x.z)<GetDistanceBetweenPositions(px,py,pz,y.x,y.y,y.z) end);
    return spots
end

function Finished(questId)
    return IsQuestFlaggedCompleted(questId)
end

function IsOnQuest(questId)
    local qlink = GetQuestLogIndexByID(questId)
    return qlink > 0
end

function ShouldTurnIn(questId)
    return IsQuestComplete(questId)
end

function GetQuestName(questId)
    local qlink = GetQuestLogIndexByID(questId)
    local title = GetQuestLogTitle(qlink)
    return title
end

function getNPC(npcid)
    local npc = self.npcData[npcid]
    local spawnx = npc[7][215][1][1]
    local spawny = npc[7][215][1][2]
    local vec = CreateVector2D(spawnx/100,spawny/100)
    local continentID, worldPosition = C_Map.GetWorldPosFromMapPos(1412, vec)
    local WX, WY = worldPosition:GetXY()
    WorldPreload(WX,WY,pz)
    local _,_,WZ = GetCaveZ(WX,WY)
    return npc, npc[1],WX,WY,WZ
end

function GetNPCName(name)
    for _, Unit in pairs(allObjects) do
        if ObjectName(Unit) == name then
            return Unit
        end
    end
end

--/dump ParseQuest(ClassicElwynn0112)
function ParseQuest(profile)
    questlist = {}
    local lines = { ("\n"):split(profile) }
    for _, line in pairs(lines) do
        local tags = { ("|"):split(line) }
        local parsed = parseQuestLine(tags, line)
        if parsed then
            table.insert(questlist, parseQuestLine(tags, line))
        end
    end
    return questlist
end

-- WoWPro.actionlabels = {
--     A = "Accept",
--     ["A ELITE"] = "Accept elite quest",
--     C = "Complete",
--     T = "Turn in",
--     t = "Turn in when complete",
--     K = "Kill",
--     R = "Run to",
--     H = "Hearth to",
--     h = "Set hearth to",
--     F = "Fly to",
--     f = "Get flight path for",
--     M = "Make",
--     N = "Note",
--     B = "Buy",
--     b = "Take Boat or Zeppelin",
--     U = "Use",
--     L = "Level",
--     l = "Loot",
--     r = "Repair/Restock",
--     D = "Done",
--     J = "Jump",
--     P = "Take portal",
--     ["!"] = "Declare",
--     ["$"] = "Treasure",
--     ["="] = "Train",
--     [";"] = "Comment",
--     ["*"] = "Trash",
--     d = "Die",
--     s = "Take Spirit Healer",
--      E = SET REPLENISHMENT VENDOR
--      G = Grind to level
-- }

function parseQuestLine(tags, line)
    local questid
    local action = tags[1]:sub(1,1)
    for i = 1, #tags do
        if tags[i]=="QID" then
            questid = tags[i+1]
        end
    end
    local act = nil
    local class = nil
    if (action == "A") then
        act = "Pickup"
    end
    if (action == "C") then
        act = "DoQuest"
    end
    if (action == "T" or action == "t") then
        act = "Turnin"
    end
    if (action == "r") then
        act = "Vendor"
    end
    if (action == "E") then
        act = "Replenish"
    end
    if (action == "G") then
        act = "Grind"
    end
    if (action == "Z") then
        act = "EnsureMap"
    end
    if (action == "=") then
        act = "Train";
    end
    if (action == "I") then
        act = "Fly";
    end

    if act and act=="Fly" then
        local vendposexact=line:match("|fromexact|([^|]*)|?")
        local vendpos=line:match("|from|([^|]*)|?")
        local toname=line:match("|to|([^|]*)|?")
        if vendposexact then
            local x,y,z=string.split(",",vendposexact)
            local x,y,z=tonumber(x),tonumber(y),tonumber(z);
            return {act,C_Map.GetBestMapForUnit("player"),x,y,z,toname}
        end
        if vendpos then
            vendx,vendy=string.split(",",vendpos)
            local x,y=_actualXY(vendx,vendy)
            local z=select(6,GetMeshPointInfo(x,y,pz-100))
            return {act,C_Map.GetBestMapForUnit("player"),x,y,z,toname}
        end
    end

    if act and act=="Grind" then
        local levelneeded=line:match("|LVL|([^|]*)|?")
        gpscript=line:match("|grindpath|([^|]*)|?")
        return {act,levelneeded,gpscript}
    end

    if act and act=="EnsureMap" then
        local loc=line:match("|xyz|([^|]*)|?")
        local x,y,z=string.split(",",loc)
        local mapid=line:match("|mapid|([^|]*)|?")
        return {act,mapid,x,y,z};
    end

    if act and act=="Train" then
        local class = line:match("|C|([^|]*)|?")
        local vendxpos=line:match("|X|([^|]*)|?")
        local vendpos=line:match("|M|([^|]*)|?")
        local spellcheck=line:match("|spell|([^|]*)|?")
        if not class or (class and class==UnitClass("player")) then
            if vendxpos then
                vendx,vendy,vendz=string.split(",",vendxpos)
                return {act,levelneeded,class,tonumber(vendx),tonumber(vendy),tonumber(vendz),spellcheck}
            end
            if vendpos then
                vendx,vendy=string.split(",",vendpos)
                local x,y=_actualXY(vendx,vendy)
                local z=select(6,GetMeshPointInfo(x,y,pz-100))
                return {act,levelneeded,class,x,y,z,spellcheck}
            end
        end
    end

    if act and act~="Vendor" and act~="Replenish" then
        local class, race  = line:match("|C|([^|]*)|?"), line:match("|R|([^|]*)|?")
        local customgp = line:match("|customgp|([^|]*)|?");
        if not class or (class and class==UnitClass("player")) then
            return {act,questid,class,race,customgp}
        end
    end

    if act and act=="Vendor" or act=="Replenish" then

        vendx,vendy,vendz=nil,nil,nil

        local vendxpos=line:match("|X|([^|]*)|?")

        if vendxpos then
            vendx,vendy,vendz=string.split(",",vendxpos)
            return {act,vendx,vendy,vendz}
        end

        local vendpos=line:match("|M|([^|]*)|?")
        if vendpos then
            vendx,vendy=string.split(",",vendpos)
            local x,y=_actualXY(vendx,vendy)
            local z=select(6,GetMeshPointInfo(x,y,pz-100))
            return {act,x,y,z}
        end
    end
    return nil
end

local Handler = class('Handler')

function Handler:initialize()
  self.node_attempts = 0
  self.hit_fails = 0
  self.angle_fails = 0
  self.non_parent = 0
  self.ok_nodes = 0
  self.max_attempts = 5000000
end

local hl = 0

local Handler = class('Handler')

function Handler:initialize()
  self.node_attempts = 0
  self.hit_fails = 0
  self.angle_fails = 0
  self.non_parent = 0
  self.ok_nodes = 0
  self.max_attempts = 5000000
end

local hl = 0
function Handler:getNodeLid(location)
   return tonumber((location.x * 50000 * 50000) + (location.y * 50000) + location.z)
end


function Handler:IsSpotOnNavMesh(location)
  local _error, distance_to_polygon, poly_flags, closest_nav_x, closest_nav_y, closest_nav_z, is_on_nav_mesh = GetMeshPointInfo(location.x, location.y, location.z, GetMapId())
   if _error == 0 then
    --print("is on nav: " .. tostring(is_on_nav_mesh) .. " x: " .. tostring(location.x) .. "/" .. tostring(location.y) .. "/" .. tostring(location.z))
    return is_on_nav_mesh
  else
  end
end

function _isOnMesh(x,y,z)
    local _error, distance_to_polygon, poly_flags, closest_nav_x, closest_nav_y, closest_nav_z, is_on_nav_mesh = GetMeshPointInfo(x,y,z,GetMapId())
    if _error == 0 then
        return is_on_nav_mesh;
    end
end

local LOCALNAVVERBOSERENDER = false
function Handler:getNode(location)
  self.node_attempts = self.node_attempts + 1
  if self.node_attempts > self.max_attempts then
    return ni
  end
  if location.px and location.x then
    local reach = 0.25
    local ground_reach = 0.5
    local high_ground_reach = 2.2
    local x, y, z = location.x, location.y, location.z
    local px, py, pz = location.px, location.py, location.pz
    local reach_x, reach_y = location.reach_x, location.reach_y
    local surrounding_hit = false
    local is_on_nav_mesh = self:IsSpotOnNavMesh(location)

    if not is_on_nav_mesh then
      surrounding_hit = true
    else
      for sx=-2,2 do
        for sy=-2,2 do
          if TraceLine(x + (sx * reach), y + (sy * reach), z + ground_reach, px, py, pz + ground_reach, flags)
           or TraceLine(x + (sx * reach), y + (sy * reach), z + high_ground_reach, px, py, pz + high_ground_reach, flags) then
            --gravel.draw.SetColor(255, 0, 0)
            --gravel.draw.Line(x + (sx * reach), y + (sy * reach), z + ground_reach, px, py, pz + ground_reach)
            surrounding_hit = true
            break
          end
        end
        if surrounding_hit then break end
      end
    end
    if not surrounding_hit then
       if TraceLine(x, y, z + 0.1, x, y, z + 3) then
          surrounding_hit = true
          print("height test fuckup")
       end
    end

    if surrounding_hit then
      if DISABLE_ASTAR_RENDER == false then
        table.insert(LOCALNAV.bad_nodes, location)
     end
      return nil
    elseif (math.max(z, pz) - math.min(z, pz)) > 0.5 then
      if DISABLE_ASTAR_RENDER == false then
        table.insert(LOCALNAV.bad_nodes, location)
     end
      return nil
    else
      if DISABLE_ASTAR_RENDER == false then
         table.insert(LOCALNAV.good_nodes, location)
      end

      local lid = self:getNodeLid(location)
      return Node(location, 1, lid)
    end
  else
    if DISABLE_ASTAR_RENDER == false then
      table.insert(LOCALNAV.good_nodes, location)
   end

    local lid =  self:getNodeLid(location)
    return Node(location, 1, lid)
  end
  if DISABLE_ASTAR_RENDER == false then
    table.insert(LOCALNAV.bad_nodes, location)
 end
  return nil
end

function Handler:locationsAreEqual(a, b)
  local distance = 1
  return math.abs(a.x - b.x) < distance and math.abs(a.y - b.y) < distance and math.abs(a.z - b.z) < distance
end

function Handler:isValidNode(location)
  print("checking: " .. location.x .. "  / " .. location.z)
  local offset_high
  local fixed_z = false
  if IsIndoors() then
    offset_high = 1
  else
    offset_high = 8
  end

  local nodex, nodey, nodez = unpack(location)
  local losx,losy,losz = TraceLine(nodex, nodez, nodez + offset_high, nodex, nodez, -10000, 0x100111) -- Basic LOS
  local terx,tery,terz = TraceLine(nodex, nodez, nodez + offset_high, nodex, nodez, -10000, 0x100) -- Terrain

  -- Only hit terrain?
  --NAV_DEBUG("Trace Res: " .. tostring(result) .. " x: " .. c_x  ..  " y: " .. c_y .. " _x: " .. _x .. " _y:")
  if losz ~= nil and terz ~= nil then
      if math.abs(losz - terz) < 1 then -- We hit soemthing that was higher than the terrain, presume collidable, buildings will fuck this?!
        return false
      end
  end

  return true;
end



function Handler:getAdjacentNodes(curnode, dest)
  local result = {}
  local cl = curnode.location
  local dl = dest
  local n = false


  for x = -1, 1 do
    for y = -1, 1 do
      n = self:_handleNode(cl.x + x, cl.y + y, cl.z, curnode, dl.x, dl.y, dl.z, x, y)   
      if n then
        table.insert(result, n)
      end
     -- n = self:_handleNode(cl.x + (x / 2), cl.y + (y / 2), cl.z, curnode, dl.x, dl.y, dl.z, (x / 2), (y / 2))   
      --if n then
      --  table.insert(result, n)
      --end
      --n = self:_handleNode(cl.x + (x / 4), cl.y + (y / 4), cl.z, curnode, dl.x, dl.y, dl.z, (x / 4), (y / 4))    
      --if n then
      --  table.insert(result, n)
      --end
    end
  end

  return result
end




function Handler:_handleNode(x, y, z, fromnode, destx, desty, destz, reach_x, reach_y)
  local offset_high
  local fixed_z = false
  if IsIndoors() then
    offset_high = 1.5
  else
    offset_high = 8
  end
  
  local rx, ry, rz = TraceLine(x, y, z + offset_high, x, y, z - 500, allFlags)
  if rz then
    fixed_z = z
    z = rz
  end
  
  -- Fetch a Node for the given location and set its parameters
  local n = self:getNode({
    x = x, y = y, z = z,
    px = fromnode.x, py = fromnode.y, pz = fromnode.z,
    reach_x = reach_x, reach_y = reach_y,
    fixed_z = fixed_z,
    move_cost = 1
  })

  if n ~= nil then
    
    local dx = math.max(x, destx) - math.min(x, destx)
    local dy = math.max(y, desty) - math.min(y, desty)
    local dz = math.max(z, destz) - math.min(z, destz)
    local move_cost = ((dx + dy) * LOCALNAV.horizontalcost) + ( dz * LOCALNAV.verticalcost )

    n.move_cost = n.move_cost + fromnode.move_cost
    n.score = n.move_cost + move_cost
    n.parent = fromnode
    n.x, n.y, n.z = x, y, z
    return n
  end

  return nil
end

if LOCALNAV == nil then
  LOCALNAV = {}  
  LOCALNAV.horizontalcost = 20
  LOCALNAV.verticalcost = 5
  LOCALNAV.maphandler = Handler()
  LOCALNAV.last_jump = GetTime() * 1000
  LOCALNAV.jump_time = 10000
  LOCALNAV.astar = AStar(LOCALNAV.maphandler)
  LOCALNAV.good_nodes = {}
  LOCALNAV.bad_nodes = {}
end

function FIND_ASTAR_PATH(fx,fy,fz, tox, toy, toz) 
    --if not LOCALNAV.maphandler:isValidNode({fx, fy, fz}) or not LOCALNAV.maphandler:isValidNode({tox, toy,toz}) then
    --  print("[Hybrid] either start or end node where off the hybrid map")
    --  return nil;
    --end
    
    
    return get_astar_path({fx,fy,fz}, {tox, toy, toz})
    --return LOCALNAV.astar:findPath({x= fx, y= fy, z= fz, px=fx, py=fy, pz=fz}, {x= tox, y= toy, z= toz, px=fx, py=fy, pz=fz})
end

function FIND_ASTAR_ALONG_PATH_ASYNC(px, py, pz, path, cb)
end

function FIND_ASTAR_PATH_ASYNC(fx,fy,fz, tox, toy, toz, callback)
    get_astar_path_async({fx,fy,fz}, {tox, toy, toz}, callback)
end



function TEST_PATH_TO_TARGET() 
    local tx,ty,tz = ObjectPosition("target")
    local px,py,pz = ObjectPosition("player")

    local player_x, player_y, player_z = ObjectPosition("player")                               
    local player_face_deg, _ = ObjectFacing("player");
    local pos_x_behind_of_player = player_x - math.cos(player_face_deg) * 3 -- we calculate a path from 1 step behind the player to counter the fact he is already in the bad spot.  
    local pos_y_behind_of_player = player_y - math.sin(player_face_deg) * 3 

    FIND_ASTAR_PATH_ASYNC(pos_x_behind_of_player, pos_y_behind_of_player, pz, tx, ty, tz, function(path)
       
       NavDebug.DrawThis = path
      
       if path then
      for i=1,#path do
          local node = nodes[i]
          local x,y,z = unpack(node)
          --print("[Hybrid] Path: " .. i .. " x:" ..x .. " y:" .. y .. " z: ".. z)
      end
    end
  end)
end


local function shallowcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
      copy = {}
      for orig_key, orig_value in pairs(orig) do
        copy[orig_key] = orig_value
      end
    else -- number, string, boolean, etc
      copy = orig
    end
    return copy
  end
  
  local function mid_point(ax, ay, az, bx, by, bz)
    return (ax + bx) / 2, (ay + by) / 2, (az + bz) / 2
  end
  

function simplify_path(nodes)
    local s_nodes = shallowcopy(nodes)
    local total_nodes = #nodes
    for index, node in ipairs(nodes) do
      local x, y, z = node.location.x, node.location.y, node.location.z
      if index + 2 <= total_nodes then
        local far_node = nodes[index + 2]
        local middle_node = nodes[index + 1]
        local mx, my, mz = middle_node.location.x, middle_node.location.y, middle_node.location.z
        local fx, fy, fz = far_node.location.x, far_node.location.y, far_node.location.z
        local px, py, pz = mid_point(x, y, z, fx, fy, fz)
        if math.abs(mx - px) < 0.1 and math.abs(my - py) < 0.1 and math.abs(mz - pz) < 0.1 then
          table.remove(s_nodes, index)
        end
      end
    end
    return s_nodes
  end
  
  function get_astar_path(from, to)
    
    LOCALNAV.good_nodes = {}
    LOCALNAV.bad_nodes = {}
        local sx, sy, sz = unpack(from)
        local ex, ey, ez = unpack(to)
        local start = { x = sx, y = sy, z = sz }
        local goal = { x = ex, y = ey, z = ez }

        --print("generating path: start: " .. sx .. "/" .. sy .. "/" .. sz  .. " dest: " .. ex .. "/" .. ey .. "/" .. ez)
        local path = LOCALNAV.astar:findPath(start, goal)
        
            if type(path) == 'table' then
              local waypoints = { }
              nodes = path:getNodes()

              s_nodes = simplify_path(nodes)

              for i=1, #nodes do
                 s_nodes = simplify_path(s_nodes)
              end

              for _, node in ipairs(s_nodes) do -- ipairs(s_nodes)
                local x, y, z = node.location.x, node.location.y, node.location.z
                table.insert(waypoints, { x, y, z })
              end

              NavDebug.DrawThis = waypoints
              return waypoints
            else
               return nil
            end
  end

  
  function get_astar_path_async(from, to, cb)
    LOCALNAV.good_nodes = {}
    LOCALNAV.bad_nodes = {}
    local sx, sy, sz = unpack(from)
    local ex, ey, ez = unpack(to)
    local start = { x = sx, y = sy, z = sz }
    local goal = { x = ex, y = ey, z = ez }

    --print("generating path: start: " .. sx .. "/" .. sy .. "/" .. sz  .. " dest: " .. ex .. "/" .. ey .. "/" .. ez)
    LOCALNAV.astar:findPathAsync(start, goal, function(path)     
          if type(path) == 'table' then
            local waypoints = { }
            nodes = path:getNodes()
            s_nodes = simplify_path(nodes)
            for i=1, #nodes do
               s_nodes = simplify_path(s_nodes)
            end
            for _, node in ipairs(s_nodes) do -- ipairs(s_nodes)
              local x, y, z = node.location.x, node.location.y, node.location.z
              table.insert(waypoints, { x, y, z })
            end
            NavDebug.DrawThis = waypoints
            cb(waypoints)
          else
            cb(nil)
          end
    end)
end


  NavDebug = {}
  C_Timer.After(1, function()
    if LibDraw then
    LibDraw.Sync(function() 

        if DISABLE_ASTAR_RENDER then
          return;
        end

          if NavDebug.DRAWTHIS then
              for i=2 , #NavDebug.DRAWTHIS do
                  local last_node =  NavDebug.DRAWTHIS[i - 1]
                  local node = NavDebug.DRAWTHIS[i]
                  LibDraw.Line(last_node.x, last_node.y, last_node.z, node.x, node.y, node.z)
              end
          end

          LibDraw.SetColorRaw(1,0,0,1)
          for k,v in ipairs(LOCALNAV.bad_nodes) do
              local location = v
              LibDraw.Box(location.x, location.y, location.z, 1, 2, 0, 0, 0)
          end
          LibDraw.SetColorRaw(0,1,0,1)
          for k,v in ipairs(LOCALNAV.good_nodes) do
            local location = v
            LibDraw.Box(location.x, location.y, location.z, 1, 2, 0, 0, 0)
          end
          
        end)
    end
end)


function IsPlayerOnNavMesh()
  local x,y,z = ObjectPosition("player")
  local _error, distance_to_polygon, poly_flags, closest_nav_x, closest_nav_y, closest_nav_z, is_on_nav_mesh = GetMeshPointInfo(x,y,z, GetMapId())
  if distance_to_polygon == 0 then
   print("is on nav: " .. tostring(is_on_nav_mesh) .. " x: " .. tostring(x) .. "/" .. tostring(y) .. "/" .. tostring(z))
   return is_on_nav_mesh
 else
   print("possible NavMesh Error: " .. _error)
   return false
 end
end

QuestHelper={}

function GetStartNPC(questid)
    local questid = tonumber(questid)
    local q = DB.questData[questid]
    local npcid = q[2][1][1]
    local npc = DB.npcData[npcid]
    local WX, WY, WZ=nil,nil,nil
    for k, v in pairs (npc[7]) do
        if DB.zoneDataClassicBetaHack[DB.zoneDataClassic[k]] then
            k = DB.zoneDataClassicBetaHack[DB.zoneDataClassic[k]][1]
        end
        local vec = CreateVector2D(v[1][1]/100,v[1][2]/100)
        local continentID, worldPosition = C_Map.GetWorldPosFromMapPos(k, vec)
        for i=1,#allObjects do
            if ObjectName(allObjects[i])==npc[1] then
                WX,WY,WZ=ObjectPosition(allObjects[i]);
            end
        end
        if not WX then
            WX, WY = worldPosition:GetXY()
            WorldPreload(WX,WY,pz);
            _,_,WZ = GetCaveZ(WX,WY)
        end
    end
    return npc,q[1],npc[1],WX,WY,WZ
end

function GetEndNPC(questid)
    local questid = tonumber(questid)
    local q = DB.questData[questid]
    local npcid = q[3][1][1]
    local npc = DB.npcData[npcid]
    local WX, WY, WZ=nil,nil,nil
    for k, v in pairs (npc[7]) do
        if DB.zoneDataClassicBetaHack[DB.zoneDataClassic[k]] then
            k = DB.zoneDataClassicBetaHack[DB.zoneDataClassic[k]][1]
        end
        local vec = CreateVector2D(v[1][1]/100,v[1][2]/100)
        local continentID, worldPosition = C_Map.GetWorldPosFromMapPos(k, vec)
        for i=1,#allObjects do
            if ObjectName(allObjects[i])==npc[1] then
                WX,WY,WZ=ObjectPosition(allObjects[i]);
            end
        end
        if not WX then
            WX, WY = worldPosition:GetXY()
            WorldPreload(WX,WY,pz);
            _,_,WZ = GetCaveZ(WX,WY)
        end
    end
    return npc,q[1],npc[1],WX,WY,WZ
end

function GetLeaderBoardDetails(boardIndex,questIndex)
    local qlink = GetQuestLogIndexByID(questIndex)
    local description, objectiveType, isCompleted = GetQuestLogLeaderBoard (boardIndex,qlink);
    local itemName, numItems, numNeeded = description:match("(.*):%s*([%d]+)%s*/%s*([%d]+)");
    w = " slain"
    itemName = itemName:gsub(w,"")
    w = " destroyed"
    itemName = itemName:gsub(w,"")
    return objectiveType, itemName, numItems, numNeeded, isCompleted;
  end

function GetObjectiveCount(questid) 
    local qlink = GetQuestLogIndexByID(questID)
    return GetNumQuestLeaderBoards(qlink)
end

function GetItemByName(itemname)
    for k,v in pairs (self.itemData) do
        if (v[1] == itemname) then
            return v, k
        end
    end
    return nil
end

function GetNPCByName(itemname)
    for k,v in pairs (self.npcData) do
        if (v[1] == itemname) then
            return v, k
        end
    end
    return nil
end

function GetObjectByName(itemname)
    for k,v in pairs (self.objectData) do
        if (v[1] == itemname) then
            return v, k
        end
    end
    return nil
end

function GetHotSpotsByItem(itemid)
    local item = DB.itemData[itemid]
    local hotspots = {}
    if item[3] then
        for k,v in pairs (item[3]) do
            local npc = DB.npcData[v]
            for zoneid, waypoints in pairs (npc[7]) do
                if DB.zoneDataClassicBetaHack[DB.zoneDataClassic[zoneid]] then
                    zoneid = DB.zoneDataClassicBetaHack[DB.zoneDataClassic[zoneid]][1]
                end
                for _, way in pairs (waypoints) do
                    local continentID, worldPosition = C_Map.GetWorldPosFromMapPos(zoneid, CreateVector2D(way[1]/100,way[2]/100))
                    local WX, WY = worldPosition:GetXY()
                    WorldPreload(WX,WY,pz)
                    local _,_,WZ = GroundZ(WX,WY)
                    if WZ then
                        table.insert(hotspots,{WX,WY,WZ})
                    end
                end
            end
        end
    end
    if item[4] then
        for k,v in pairs (item[4]) do
            local object = DB.objectData[v]
            for zoneid, waypoints in pairs (object[4]) do
                if DB.zoneDataClassicBetaHack[DB.zoneDataClassic[zoneid]] then
                    zoneid = DB.zoneDataClassicBetaHack[DB.zoneDataClassic[zoneid]][1]
                end
                for _, way in pairs (waypoints) do
                    local continentID, worldPosition = C_Map.GetWorldPosFromMapPos(zoneid, CreateVector2D(way[1]/100,way[2]/100))
                    local WX, WY = worldPosition:GetXY()
                    WorldPreload(WX,WY,pz)
                    local _,_,WZ = GroundZ(WX,WY)
                    if WZ then
                        table.insert(hotspots,{WX,WY,WZ})
                    end
                end
            end
        end
    end
    return hotspots
end

function GetHotSpotsByNPC(npcid)
    local npc = DB.npcData[npcid]
    local hotspots = {}
    if npc[7] then
        for zoneid, waypoints in pairs (npc[7]) do
            if DB.zoneDataClassicBetaHack[DB.zoneDataClassic[zoneid]] then
                zoneid = DB.zoneDataClassicBetaHack[DB.zoneDataClassic[zoneid]][1]
            end
            for _, way in pairs (waypoints) do
                local continentID, worldPosition = C_Map.GetWorldPosFromMapPos(zoneid, CreateVector2D(way[1]/100,way[2]/100))
                local WX, WY = worldPosition:GetXY()
                WorldPreload(WX,WY,pz)
                local _,_,WZ = GroundZ(WX,WY)
                if WZ then
                    table.insert(hotspots,{WX,WY,WZ})
                end
            end
        end
    end
    return hotspots
end

function GetHotSpotsByObject(npcid)
    local npc = DB.objectData[npcid]
    local hotspots = {}
    if npc[4] then
        for zoneid, waypoints in pairs (npc[4]) do
            if DB.zoneDataClassicBetaHack[DB.zoneDataClassic[zoneid]] then
                zoneid = DB.zoneDataClassicBetaHack[DB.zoneDataClassic[zoneid]][1]
            end
            for _, way in pairs (waypoints) do
                local continentID, worldPosition = C_Map.GetWorldPosFromMapPos(zoneid, CreateVector2D(way[1]/100,way[2]/100))
                local WX, WY = worldPosition:GetXY()
                WorldPreload(WX,WY,pz)
                local _,_,WZ = GroundZ(WX,WY)
                if WZ then
                    table.insert(hotspots,{WX,WY,WZ})
                end
            end
        end
    end
    return hotspots
end

function ShouldPickupQuest(questID)
    local qlink = GetQuestLogIndexByID(questID)
    local finished = IsQuestFlaggedCompleted(questID)
    if qlink <= 0 and not finished then
        return true
    else
        return false
    end
end

function ShouldDoQuest(questid)
    return IsOnQuest(questid) and not ShouldTurnIn(questid) and not ShouldPickupQuest(questid)
end

function GetQuestObjects(questid)
    local questid = tonumber(questid)
    local killmobs = {}
    local gatheritems = {}
    local collectitems = {}
    spots = {}
    local q = DB.questData[questid]
    if q[DB.questKeys.objectives][1] then
        for k,v in pairs (q[DB.questKeys.objectives][1]) do
            table.insert(killmobs, v[1])
        end
    end
    if q[DB.questKeys.objectives][2] then
    end
    if q[DB.questKeys.objectives][3] then
        for k,v in pairs (q[DB.questKeys.objectives][3]) do
            local item=DB.itemData[v[1]]
            for i=1,#item[3] do
                table.insert(killmobs,item[3][i]);
            end
            table.insert(collectitems,v[1])
        end
    end
    return killmobs,collectitems
end

function GetCaveZ(StartX,StartY)
    return TraceLine(StartX, StartY, -10000, StartX, StartY, 10000)
end

function GetObjectsToCollect(questid)
    local questid = tonumber(questid)
    local killmobs = {}
    local gatheritems = {}
    local collectitems = {}
    ObjectsToCollect={};
    spots = {}
    local q = DB.questData[questid]
    if q[DB.questKeys.objectives][3] then
        for k,v in pairs (q[DB.questKeys.objectives][3]) do
            table.insert(collectitems, v[1])
        end
        for key, val in pairs (collectitems) do
            local item = DB.itemData[val]
            if item[4] then
             for k, v in pairs (item[4]) do
                if DB.objectData[v][4] then
                    for zid, sid in pairs (DB.objectData[v][4]) do 
                        if DB.zoneDataClassicBetaHack[DB.zoneDataClassic[zid]] then
                            zid = DB.zoneDataClassicBetaHack[DB.zoneDataClassic[zid]][1]
                        end
                        for _, spawn in pairs (sid) do
                            local continentID, worldPosition = C_Map.GetWorldPosFromMapPos(zid, CreateVector2D(spawn[1]/100,spawn[2]/100))
                            local WX, WY = worldPosition:GetXY()
                            WZ=select(6,GetMeshPointInfo(WX,WY,pz-100))
                            if WZ then
                                table.insert(spots,{x=WX,y=WY,z=WZ,step=0})
                            end
                        end
                    end
                end
                for i=1,#item[4] do
                    table.insert(ObjectsToCollect,item[4][i]);
                end
            end
        end
        end
    end
end

function GetHotSpots(questid)
    local questid = tonumber(questid)
    local killmobs = {}
    local gatheritems = {}
    local collectitems = {}
    ObjectsToCollect={};
    spots = {}
    local q = DB.questData[questid]
    if q[DB.questKeys.objectives][1] then
        for k,v in pairs (q[DB.questKeys.objectives][1]) do
            table.insert(killmobs, v[1])
        end
        for k,v in pairs (killmobs) do
            local mob = DB.npcData[v]
            local spawns = mob[7]
            for zid, points in pairs(spawns) do
                if DB.zoneDataClassicBetaHack[DB.zoneDataClassic[zid]] then
                    zid = DB.zoneDataClassicBetaHack[DB.zoneDataClassic[zid]][1]
                end
                for _, point in pairs(points) do
                    local continentID, worldPosition = C_Map.GetWorldPosFromMapPos(zid, CreateVector2D(point[1]/100,point[2]/100))
                    local WX, WY = worldPosition:GetXY()
                    WZ=select(6,GetMeshPointInfo(WX,WY,pz-100))
                    if WZ then
                        table.insert(spots,{x=WX,y=WY,z=WZ,step=0})
                    end
                end
            end
        end
    end
    if q[DB.questKeys.objectives][2] then
    end
    if q[DB.questKeys.objectives][3] then
        for k,v in pairs (q[DB.questKeys.objectives][3]) do
            table.insert(collectitems, v[1])
        end
        for key, val in pairs (collectitems) do
            local item = DB.itemData[val]
            if (item[3]) then
                for k, v in pairs (item[3]) do
                    for zid, sid in pairs (DB.npcData[v][7]) do 
                        if DB.zoneDataClassicBetaHack[DB.zoneDataClassic[zid]] then
                            zid = DB.zoneDataClassicBetaHack[DB.zoneDataClassic[zid]][1]
                        end
                        for _, spawn in pairs (sid) do
                            local continentID, worldPosition = C_Map.GetWorldPosFromMapPos(zid, CreateVector2D(spawn[1]/100,spawn[2]/100))
                            local WX, WY = worldPosition:GetXY()
                            WZ=select(6,GetMeshPointInfo(WX,WY,pz-100))
                            if WZ then
                                table.insert(spots,{x=WX,y=WY,z=WZ,step=0})
                            end
                        end
                    end
                end
            end
            if item[4] then
             for k, v in pairs (item[4]) do
                if DB.objectData[v][4] then
                    for zid, sid in pairs (DB.objectData[v][4]) do 
                        if DB.zoneDataClassicBetaHack[DB.zoneDataClassic[zid]] then
                            zid = DB.zoneDataClassicBetaHack[DB.zoneDataClassic[zid]][1]
                        end
                        for _, spawn in pairs (sid) do
                            local continentID, worldPosition = C_Map.GetWorldPosFromMapPos(zid, CreateVector2D(spawn[1]/100,spawn[2]/100))
                            local WX, WY = worldPosition:GetXY()
                            WZ=select(6,GetMeshPointInfo(WX,WY,pz-100))
                            if WZ then
                                table.insert(spots,{x=WX,y=WY,z=WZ,step=0})
                            end
                        end
                    end
                end
                for i=1,#item[4] do
                    table.insert(ObjectsToCollect,item[4][i]);
                end
            end
        end
        end
    end
    table.sort(spots,function(x,y) return GetDistanceBetweenPositions(px,py,pz,x.x,x.y,x.z)<GetDistanceBetweenPositions(px,py,pz,y.x,y.y,y.z) end);
    return spots
end

allLoaded=true;