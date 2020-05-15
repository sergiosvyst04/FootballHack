import QtQuick 2.12

pragma Singleton

QtObject {

    readonly property string __nunitoSans: "Nunito Sans"

    function nunitoSans(size, letterSpacing){
        var font = Qt.font( {family: __nunitoSans, pixelSize: size} )
        font.weight = Font.Normal
        if(letterSpacing === undefined)
            font.letterSpacing = 3
        else
            font.letterSpacing = letterSpacing

        return font
    }

    function nunitoSansDemiBold(size, letterSpacing){
        var font = Qt.font( {family: __nunitoSans, pixelSize: size} )
        font.weight = Font.DemiBold
        font.letterSpacing = 3
        if(letterSpacing === undefined)
            font.letterSpacing = 3
        else
            font.letterSpacing = letterSpacing


        return font
    }

    function nunitoSansBold(size, letterSpacing) {
        var font = Qt.font( {family: __nunitoSans, pixelSize: size})
        font.weight = Font.Bold
        font.letterSpacing = 3
        if(letterSpacing === undefined)
            font.letterSpacing = 3
        else
            font.letterSpacing = letterSpacing

        return font
    }


}
