'use strict';
var scmCheckbox = scmCheckbox || {};

scmCheckbox = (function(){
  var _selects_value = [];

  function _INIT_(obj){
    $(document).on('click',function(e){
      //console.log('document click!');
      //e.preventDefault();
      $('input[type="checkbox"]', obj).each(function(key, val){
        var tmp_val = _box_search($(this), _selects_value[key]);
        if(tmp_val !== null){
          _box_func($(this));
          _selects_value[key] = tmp_val;
        }
      });
    });

    _selects_value = _box_init($('input[type="checkbox"]', obj), _selects_value);
    _box_func($('input[type="checkbox"]', obj));
  }

  function _box_init(selects, data) {
    $(selects).each(function(key, val){
      var checked = $(this).prop('checked');
      var disabled = ($(this).attr('disabled') !== undefined)? 'disabled':'';
      var classes = $(this).attr('class');
      var values = { selected: checked, disabled: disabled };
      if(checked){
        $(this).after('<div class="input-checkbox checkbox-on '+classes+' '+disabled+'"></div>');
      }else{
        $(this).after('<div class="input-checkbox checkbox-off '+classes+' '+disabled+'"></div>');
      }
      data.push(values);
    });
    return data;
  }
  
  function _box_search(select, data) {
    var checked = $(select).prop('checked');
    var disabled = ($(select).attr('disabled') !== undefined)? 'disabled':'';
    var classes = $(select).attr('class');
    var values = { selected: checked, disabled: disabled };
    var html = '';
    if(checked){
      html += '<div class="input-checkbox checkbox-on '+classes+' '+disabled+'"></div>';
    }else{
      html += '<div class="input-checkbox checkbox-off '+classes+' '+disabled+'"></div>';
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
        //console.log('.input-checkbox click!');
        e.preventDefault();
        if($(this).hasClass('disabled')){ return false; }
        var obj = $(this);
        obj.addClass('disabled');
        setTimeout(function(){ obj.removeClass('disabled'); }, 100);
        var checked = $(this).prev().prop('checked');
        $(this).toggleClass('checkbox-off checkbox-on');
        if(checked){
          $(this).prev().prop('checked', !checked).removeAttr('checked');
        }else{
          $(this).prev().prop('checked', !checked).attr('checked', 'checked');
        }
        //eval($(this).prev().attr('onclick'));
        if($(this).prev().attr('onclick') !== undefined){
          $(this).prev().trigger('onclick');
        }
      });
    });
  }

  return {
    init: _INIT_
  }
}())

