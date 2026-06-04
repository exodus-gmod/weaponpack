if not ATTACHMENT then
    ATTACHMENT = {}
end

ATTACHMENT.TFADataVersion = 1
ATTACHMENT.Name = "RE9 Style Aiming"
ATTACHMENT.ShortName = "RE9SA"
ATTACHMENT.Description = {
    TFA.Attachments.Colors["+"], 
    TFA.Attachments.Colors["+"], 
    TFA.Attachments.Colors["+"], 
    TFA.Attachments.Colors["-"], 
}

ATTACHMENT.Icon = nil

ATTACHMENT.WeaponTable = {
    ["Secondary"] = {
        ["IronFOV"] = 88
    },
    ["IronSightsPos"] = Vector(-3.05, 8, -1.5),
    ["IronSightsAng"] = Vector(-1.2, 0, -3),
    ["DrawCrosshairIronSights"] = true
}

if not TFA_ATTACHMENT_ISUPDATING then
    TFAUpdateAttachments()
end

ATTACHMENT.Icon = "vgui/tfa/att/re9_overtheshoulder_aim"