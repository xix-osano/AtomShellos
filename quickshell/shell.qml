//@ pragma Env QSG_RENDER_LOOP=threaded
//@ pragma Env QT_MEDIA_BACKEND=ffmpeg
//@ pragma Env QT_FFMPEG_DECODING_HW_DEVICE_TYPES=vaapi
//@ pragma Env QT_FFMPEG_ENCODING_HW_DEVICE_TYPES=vaapi
//@ pragma UseQApplication

import QtQuick
import Quickshell

ShellRoot {
    id: entrypoint

    readonly property bool disableHotReload: Quickshell.env("DMS_DISABLE_HOT_RELOAD") === "1" || Quickshell.env("DMS_DISABLE_HOT_RELOAD") === "true"

    Component.onCompleted: {
        Quickshell.watchFiles = !disableHotReload;
    }

    Loader {
        id: ashShellLoader
        asynchronous: false
        sourceComponent: ASHShell {}
    }
}
