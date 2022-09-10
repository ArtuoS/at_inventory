local logger = {}

function logger.LogInfo(message)
    if (string.len(message) > 0) then
        MsgC(Color(255, 255, 255), "[INFO] " .. message .. "\n")
    end
end

function logger.LogWarning(message)
    if (string.len(message) > 0) then
        MsgC(Color(255, 123, 0), "[WARNING] " .. message .. "\n")
    end
end

function logger.LogError(message)
    if (string.len(message) > 0) then
        MsgC(Color(255, 0, 0), "[ERROR] " .. message .. "\n")
    end
end

return logger