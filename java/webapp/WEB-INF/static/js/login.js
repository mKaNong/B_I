$(function(){
    var btn = $('.btn-login'),
        user = $('.text-user'),
        pwd = $('.text-pwd'),
        code = $('.text-code'),
        tips = $('.tips'),
        uTips = tips.eq(0),
        pTips = tips.eq(1),
        cTips = tips.eq(2),

        trim = trim || function(s){
    	    if(s!=undefined){
    	    	return s.replace(/\s/, '');
    	    }
        };

    btn.on('click', function(){
        if(trim(user.val())==''){
            uTips.html('用户名不能为空');
            return false;
        }else{
            uTips.html('');
        }

        user.val(trim(user.val()));

        if(pwd.val().length==0){
            pTips.html('密码不能为空');
            return false;
        }else{
            pTips.html('');
        }

        if(trim(code.val())==''){
            cTips.html('验证码不能为空');
            return false;
        }else{
            cTips.html('');
        }

        code.val(trim(code.val()));
        $("#loginform").submit();
    });
    if(!placeholderSupport()){
        $('[placeholder]').focus(function() {
            var input = $(this);
            if (input.val() == input.attr('placeholder')) {
                input.val('');
                input.removeClass('placeholder');
            }
        }).blur(function() {
            var input = $(this);
            if (input.val() == '' || input.val() == input.attr('placeholder')) {
                input.addClass('placeholder');
                input.val(input.attr('placeholder'));
            }
        }).blur();
    };

    function placeholderSupport() {
        return 'placeholder' in document.createElement('input');
    }
});