function select_not_forced_subtitle()
    local last_sub = nil
    for i, sub in ipairs(mp.get_property_native("track-list")) do
        if sub.type == "sub" and not sub.forced and (sub.title == nil or not sub.title:find("SDH")) then
            last_sub = sub
        end
    end
    if last_sub then
        mp.set_property("sid", tostring(last_sub.id))
    end
end
mp.register_event("file-loaded", select_not_forced_subtitle)
