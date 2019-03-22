// 风格切换

$('.tpl-skiner-toggle').click(function() {
    $('.tpl-skiner').toggleClass('active');
    $('.tpl-skiner-toggle').toggleClass('am-icon-chevron-right');
    $('.tpl-skiner-toggle').toggleClass('am-icon-cog');
});

$('.tpl-skiner-content-bar').find('span').on('click', function() {
    $('body').attr('class', $(this).attr('data-color'))
    saveSelectColor.Color = $(this).attr('data-color');
    // 保存选择项
    storageSave(saveSelectColor);
});

var saveSelectColor = {
    'Name': 'SelcetColor',
    'Color': 'theme-black'
}



// 判断用户是否已有自己选择的模板风格
if (storageLoad('SelcetColor')) {
    $('body').attr('class', storageLoad('SelcetColor').Color)
} else {
    storageSave(saveSelectColor);
    $('body').attr('class', 'theme-black')
}


// 本地缓存
function storageSave(objectData) {
    localStorage.setItem(objectData.Name, JSON.stringify(objectData));
}

function storageLoad(objectName) {
    if (localStorage.getItem(objectName)) {
        return JSON.parse(localStorage.getItem(objectName))
    } else {
        return false
    }
}