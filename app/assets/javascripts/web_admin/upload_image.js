(function() {
  $('#new_image').fileupload({
    add: function(e, data) {
      var file, types;
      console.log("AAAAAA");
      types = /(\.|\/)(jpeg|jpg|png|gif)$/i;
      file = data.files[0];
      if (types.test(file.type) || types.test(file.name)) {
        data.context = $(tmpl("template-upload", file));
        $('#new_image').append(data.context);
        return data.submit();
      } else {
        $('.error_upload').show();
        return $('.error_upload').append('Formato de arquivo inválido!<br>Formatos permitidos: .jpg, .jpeg, .png, .gif');
      }
    },
    progress: function(e, data) {
      var progress;

      if (data.context) {
        progress = parseInt(data.loaded / data.total * 100, 10);
        return data.context.find('.bar').css('width', progress + '%').css('background-color: green');
      }
    }
  });
  return $('#image_file').attr("name", "image[file]");
})();

(function(){
  $("input[type='checkbox']").on('click', function(){
    $.ajax({
      url: '/web_admin/images/'+$(this).val(),
      type: "PUT",
      data: { cover: $(this).is(':checked')}
    }).done(function(html){
      $('.msg'+$(this).val()).show();
    });
  });
})();
