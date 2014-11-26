$ ->
  checkin = $('.checkin button')
  checkout = $('.checkout button')
  checkin.click ->
    console.log 'checkin!'
    $.ajax
     url: "/checkins"
     dataType: "html"
     type: 'POST'
     error: (jqXHR, textStatus, errorThrown) ->
       $('.status').html "AJAX Error: #{textStatus}"
     success: (data, textStatus, jqXHR) ->
       $('.status').html("Successful AJAX call").fadeOut 2000, -> $(this).html('').show()
       week = $(data).closest('.work').data('week')
       console.log "Append to => #works .week-#{week}"
       $("#works .week-#{week}").append(data)

  checkout.click ->
    console.log 'checkout!'
    $.ajax 
      url: '/checkins/0'
      dataType: 'json'
      type: 'PUT'
      error: (jqXHR, textStatus, errorThrown) ->
       $('.status').html "AJAX Error: #{textStatus}"
      success: (data, textStatus, jqXHR) ->
       $('.status').html("Successful AJAX call").fadeOut 2000, -> $(this).html('').show()

       work = data['work']

       row = $('#works div[data-id='+work["id"]+']')
       console.log('#works div[data-id='+work["id"]+']')

       row.find('.id').html(work['id'])
       row.find('.job').html(work['job'])
       row.find('.checkin').html(work['checkin'])
       row.find('.checkout').html(work['checkout'])
       row.find('.hours').html(work['hours'])

  $(document).ajaxSuccess (e, data, status, xhr) ->
    $("div[data-id=#{xhr.deleted}]").slideUp()
    console.log "delete!"
  