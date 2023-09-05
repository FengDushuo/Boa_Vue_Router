'use strict';
var scmRadio = scmRadio || {};

scmRadio = (function(){
  var _selects_value = [];

  function _INIT_(obj){
    $(document).on('click',function(e){
      //console.log('document click!');
      //e.preventDefault();
      $('input[type="radio"]', obj).each(function(key, val){
        var tmp_val = _box_search($(this), _selects_value[key]);
        if(tmp_val !== null){
          _box_func($(this));
          _selects_value[key] = tmp_val;
        }
      });
    });

    _selects_value = _box_init($('input[type="radio"]', obj), _selects_value);
    _box_func($('input[type="radio"]', obj));
  }

  function _box_init(selects, data) {
    $(selects).each(function(key, val){
      var checked = $(this).prop('checked');
      var disabled = ($(this).attr('disabled') !== undefined)? 'disabled':'';
      var values = { selected: checked, disabled: disabled };
      if(checked){
        $(this).after('<div class="input-radio radio-on '+disabled+'"></div>');
      }else{
        $(this).after('<div class="input-radio radio-off '+disabled+'"></div>');
      }
      data.push(values);
    });
    return data;
  }
  
  function _box_search(select, data) {
    var checked = $(select).prop('checked');
    var disabled = ($(select).attr('disabled') !== undefined)? 'disabled':'';
    var values = { selected: checked, disabled: disabled };
    var html = '';
    if(checked){
      html += '<div class="input-radio radio-on '+disabled+'"></div>';
    }else{
      html += '<div class="input-radio radio-off '+disabled+'"></div>';
    }
    if(!_box_search_data_issame(data, values)) {
      $(select).next().remove();
      $(select).after(html);
      return values;
    }else{
      return null;
    }
  }
  
  function _box_search_data_issame(oldData, newData){
    var ret_val = true;
    if(oldData.selected !== newData.selected){
      ret_val = false;
    }
    if(oldData.disabled !== newData.disabled){
      ret_val = false;
    }
    return ret_val;
  }
  
  function _box_func(selects) {
    $(selects).each(function(key, val){
      $($(this).next()).on('click',function(e){
        //console.log('.input-radio click!');
        e.preventDefault();
        if($(this).hasClass('disabled')){ return false; }
        var obj = $(this);
        obj.addClass('disabled');
        setTimeout(function(){ obj.removeClass('disabled'); }, 100);
        var names = $(this).prev().attr('name');
        $('input[type="radio"][name="'+names+'"]').next().removeClass('radio-on').addClass('radio-off');
        $(this).removeClass('radio-off').addClass('radio-on');
        $(this).prev().attr('checked', true).trigger('click');
      });
    });
  }

  return {
    init: _INIT_
  }
}())

