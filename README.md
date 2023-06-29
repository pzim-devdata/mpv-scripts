# mpv-sub_not_forced_not_sdh
This is a LUA script for MPV that automatically prevents the selection of FORCED and SDH subtitles at the start.
- Forced subtitles are subtitles that are displayed only for sections of the video that contain non-dialogue elements such as signs, captions, or foreign language translations.
- SDH means Subtitles for the Deaf or Hard of Hearing.


[![GitHub license](https://img.shields.io/github/license/pzim-devdata/mpv-scripts?style=plastic)](https://github.com/pzim-devdata/mpv-scripts/blob/main/LICENSE)    ![GitHub issues](https://img.shields.io/github/issues/pzim-devdata/mpv-scripts?style=plastic)    [](https://github.com/pzim-devdata/mpv-scripts/issues)    ![GitHub repo size](https://img.shields.io/github/repo-size/pzim-devdata/mpv-scripts?style=plastic)    [![Visits Badge](https://badges.strrl.dev/visits/pzim-devdata/mpv-scripts)](https://badges.strrl.dev)    ![GitHub release (latest by date)](https://img.shields.io/github/v/release/pzim-devdata/mpv-scripts?style=plastic)    [![GitHub commits](https://img.shields.io/github/commits-since/pzim-devdata/mpv-scripts/v0.0.1.svg?style=plastic)](https://GitHub.com/pzim-devata/mpv-scripts/commit/) 


## Installation
To use this script, follow these steps:

1. Locate the script directory for your operating system:

| **OS** | **Location** |
| --- | --- |
| GNU/Linux or macOS | **`~/.config/mpv/scripts/`** |
| Windows | **`C:/Users/Username/AppData/Roaming/mpv/scripts/`** |

2. Download the `mpv-sub_not_forced_not_sdh.lua` file from this repository.

[Download :inbox_tray:](https://github.com/pzim-devdata/mpv-scripts/releases/latest/download/mpv-scripts.zip)

4. Extract the zip file and place the LUA script in the script directory mentioned in step 1.

5. Make it executable (for Linux users): `chmod +x ~/.config/mpv/scripts/mpv-sub_not_forced_not_sdh.lua`

6. Restart MPV or reload the scripts by pressing Shift + R while the player is running.

7. You can modify the script to play a specific langage:

- For example, if you want the script to play English subtitles but exclude the FORCED and SDH ones, you can make the following modification to line #4:

`if sub.type == "sub" and not sub.forced and (sub.title == nil or not sub.title:find("SDH")) then`

Replace it with:

`if sub.type == "sub" and sub.lang:find("en") and not sub.forced and (sub.title == nil or not sub.title:find("SDH")) then`

By adding the additional condition sub.lang:find("en"), you are checking if the subtitle language matches "en" (for English). This modification ensures that only English subtitles that are not FORCED and do not contain "SDH" in their title will be selected.

8. You can also modify the script to not play any subtitile if a specific audio langage is already selected:

- For example, if you want the LUA script to not play English subtitles when selected audio is set to English :

Add at the end of the LUA script:

```
function disableSubtitles()
    mp.set_property("sub-visibility", "no")
end

function checkTitleChange(name, value)
    local audioLanguage = mp.get_property("audio-language")
    if value ~= nil then
        local audioLanguage = mp.get_property("audio-language")
        if audioLanguage:lower():find("en")) then
            mp.register_event("playback-restart", disableSubtitles)
        end
    end
end

mp.observe_property("media-title", "string", checkTitleChange)
```

Please make sure to understand the consequences of this modification and adjust it according to your specific needs.

## Usage
Once the script is installed, it will automatically prevent the selection of FORCED and SDH subtitles when you start playing a video with MPV. Forced subtitles are subtitles that are displayed only for sections of the video that contain non-dialogue elements such as signs, captions, or foreign language translations.
SDH means Subtitles for the Deaf or Hard of Hearing.

With this script, you no longer have to manually disable forced subtitles every time you start playing a video.

## Contributing
If you have any suggestions, bug reports, or would like to contribute to this project, feel free to open an issue or submit a pull request on the GitHub repository.

## License
This script is licensed under the [MIT License](https://github.com/pzim-devdata/mpv-scripts/blob/main/LICENSE).

## Acknowledgments
Special thanks to the MPV community for their support and the development of this script.

## Disclaimer
This script is provided as-is without any warranty. Use it at your own risk.
