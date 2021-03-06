
--[[
	云风实现的lua OO的一种方案
	实现可继承的方式的Object基类
	core中的Class基类用于无继承的类
--]]

local _class = {}
local class = function (super)
	local class_type = {}
	class_type.init = false
	class_type.super = super
	class_type.new = function(...)
		local obj={}
		do
			local create
			create = function(c,...)
				if c.super then
					create(c.super,...)
				end
				if c.init then
					c.init(obj,...)
				end
			end

			create(class_type,...)
		end
		setmetatable(obj,{ __index=_class[class_type] })
		return obj
	end
	
	local vtbl = {}
	_class[class_type]=vtbl
 
	setmetatable(class_type,{__newindex=
		function(t,k,v)
			vtbl[k]=v
		end
	})
 
	if super then
		setmetatable(vtbl,{__index=
			function(t,k)
				local ret=_class[super][k]
				vtbl[k]=ret
				return ret
			end
		})
	end
	return class_type
end

return setmetatable({}, { __call = function(self, ...) return class(...) end })

