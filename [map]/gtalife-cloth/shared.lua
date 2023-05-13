local componentData = json.decode(LoadResourceFile(GetCurrentResourceName(), "files/component_labels.json"))
local propData = json.decode(LoadResourceFile(GetCurrentResourceName(), "files/prop_labels.json"))

local function fixComponentTable(tbl)
	local result = {}

	for sexId, u in pairs(tbl) do	
		result[tonumber(sexId)] = {}

		for componentId, v in pairs(u) do	
			result[tonumber(sexId)][tonumber(componentId)] = {}
			
			for drawableId, l in pairs(v) do
				result[tonumber(sexId)][tonumber(componentId)][tonumber(drawableId)] = {}

				for textureId, m in pairs(l) do
					result[tonumber(sexId)][tonumber(componentId)][tonumber(drawableId)][tonumber(textureId)] = m
				end
			end
		end
	end

	return result
end

componentData = fixComponentTable(componentData)
propData = fixComponentTable(propData)

local function getComponentDataProperly(sexId, componentId, drawableId, textureId)
	if not componentData[sexId] or not componentData[sexId][componentId] or not componentData[sexId][componentId][drawableId] or not componentData[sexId][componentId][drawableId][textureId] then return end
	return componentData[sexId][componentId][drawableId][textureId]
end

local function getPropDataProperly(sexId, propId, drawableId, textureId)
	if not propData[sexId] or not propData[sexId][propId] or not propData[sexId][propId][drawableId] or not propData[sexId][propId][drawableId][textureId] then return end
	return propData[sexId][propId][drawableId][textureId]
end

function GetComponentLabelFromId(sexId, componentId, drawableId, textureId)
	local data = getComponentDataProperly(sexId + 1, componentId, drawableId, textureId)
	if not data then return end

	return data.label
end

function GetPropLabelFromId(sexId, propId, drawableId, textureId)
	local data = getPropDataProperly(sexId + 1, propId, drawableId, textureId)
	if not data then return end

	return data.label
end

function GetComponentIconFromId(sexId, componentId, drawableId, textureId)
	local data = getComponentDataProperly(sexId + 1, componentId, drawableId, textureId)
	if not data then return end

	return data.cn
end

function GetPropIconFromId(sexId, propId, drawableId, textureId)
	local data = getPropDataProperly(sexId + 1, propId, drawableId, textureId)
	if not data then return end

	return data.cn
end