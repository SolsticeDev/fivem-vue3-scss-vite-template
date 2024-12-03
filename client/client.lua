local display = false

RegisterCommand('showui', function()
    SetDisplay(not display)
end)

RegisterNUICallback('closeUI', function(data, cb)
    SetDisplay(false)
    cb('ok')
end)

RegisterNUICallback('exitGame', function(data, cb)
    SetDisplay(false)
    cb('ok')
end)

function SetDisplay(bool)
    display = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "ui",
        status = bool
    })
end
