'use strict';
var scmSelect = scmSelect || {};

scmSelect = (function(){
  var _selects_value = [];

  function _INIT_(obj){
    $(document).on('click',function(e){
      //console.log('document click!');
      //e.preventDefault();
      $('.select-list.select-open').trigger('click');
  
      $('select', obj).each(function(key, val){
        var tmp_val = _box_search($(this), _selects_value[key]);
        if(tmp_val !== null){
          _box_func($(this));
          _selects_value[key] = tmp_val;
        }
      });
    });
  
    _selects_value = _box_init($('select', obj), _selects_value);
    _box_func($('select', obj));
  }

  function _box_init(selects, data) {
    $(selects).each(function(key, val){
      var disabled = ($(this).attr('disabled') !== undefined)? 'disabled':'';
      var values = { selected: $(this).val(), disabled: disabled, options: [] };
      $(this).hide();
      var html = '';
      html += '<div class="select-list select-closed '+disabled+'">';
      html += '<div class="select-list-selected"></div>';
      html += '<div class="select-list-options">';
      $("option", this).each(function(){
        if(!($(this).is(':disabled') || $(this).css('display') === 'none')){
          values.options.push({ value: $(this).attr('value'), text: $.trim($(this).text()) });
          var select_val = $(this).closest('select').val();
          if(select_val == $(this).attr('value')){
            html += '<div class="select-list-items select-list-items-selected" data=""></div>';
          }else{
            html += '<div class="select-list-items" data=""></div>';
          }
        }
      });
      html += '</div>';
      html += '</div>';
      $(this).after(html);
      $(this).next().find('.select-list-selected').text($('option[value="'+$(this).val()+'"]', $(this)).text());
      $(this).next().find('.select-list-items').each(function(k, v){
        $(this).attr('data', values.options[k].value);
        $(this).text(values.options[k].text);
      });
      data.push(values);
    });
    return data;
  }
  
  function _box_search(select, data) {
    var disabled = ($(select).attr('disabled') !== undefined)? 'disabled':'';
    var values = { selected: $(select).val(), disabled: disabled, options: [] };
    $(select).hide();
    var html = '';
    html += '<div class="select-list select-closed '+disabled+'">';
    html += '<div class="select-list-selected"></div>';
    html += '<div class="select-list-options">';
    $("option", select).each(function(){
      if(!($(this).is(':disabled') || $(this).css('display') === 'none')){
        values.options.push({ value: $(this).attr('value'), text: $.trim($(this).text()) });
        var select_val = $(this).closest('select').val();
        if(select_val == $(this).attr('value')){
          html += '<div class="select-list-items select-list-items-selected" data=""></div>';
        }else{
          html += '<div class="select-list-items" data=""></div>';
        }
      }
    });
    html += '</div>';
    html += '</div>';
    if(!_box_search_data_issame(data, values) && values.selected !== null) {
      $(select).next().remove();
      $(select).after(html);
      $(select).next().find('.select-list-selected').text($('option[value="'+$(select).val()+'"]', $(select)).text());
      $(select).next().find('.select-list-items').each(function(k, v){
        $(this).attr('data', values.options[k].value);
        $(this).text(values.options[k].text);
      });
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
    if(oldData.options.length === newData.options.length){
      for(var key in oldData.options){
        if(oldData.options[key].value !== newData.options[key].value){
          ret_val = false;
        }
        if(oldData.options[key].text !== newData.options[key].text){
          ret_val = false;
        }
      }
    }else{
      ret_val = false;
    }
  
    return ret_val;
  }
  
  function _box_func(selects) {
    $(selects).each(function(key, val){
      $('.select-list', $(this).parent()).on('click',function(e){
        //console.log('.select-list click!');
        e.preventDefault();
        if($(this).hasClass('disabled')){ return false; }
        var obj = $(this);
        obj.addClass('disabled');
        setTimeout(function(){ obj.removeClass('disabled'); }, 100);
        obj.toggleClass('select-closed select-open');
      });
      $('.select-list .select-list-items', $(this).parent()).on('click',function(){
        //console.log('.select-list .select-list-items click!');
        //e.preventDefault();
        $(this).closest('.select-list').find('.select-list-selected').text($(this).text());
        $(this).closest('.select-list').find('.select-list-items-selected').removeClass('select-list-items-selected');
        $(this).addClass('select-list-items-selected');
        var indata = $(this).attr('data');
        $(this).closest('.select-list').prev().val(indata).trigger('change');
      });
    });
  }

  return {
    init: _INIT_
  }
}())

