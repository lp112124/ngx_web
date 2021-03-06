--[[
在“ngx_lua”模块的“init_by_lua_file”命令中执行;
只在启动nginx时初始化一次。
--]]

--全局变量
PANSHI_G = _G

--全局配置table
PANSHI_C = {}

--常用库
Class = require("core.class")
Object = require("core.object")
cjson = require("cjson")
cjson.encode_empty_table_as_object(false)
_ = require("moses")

--缓存模块
panshi_cache = require("core.cache")

--配置模块
panshi_config = require("core.config")

--消息模块
panshi_msg = require("core.message")

--上下文模块
panshi_context = require("core.context")

--Controller模块
panshi_controller = require("controller.controller")

--Service模块
panshi_service = require("service.service")

--Module模块
panshi_module = require("module.module")

--ValiDate模块
panshi_validate = require("validate.validate")

--日志模块(只是辅助)
logger = require("util.logger")



