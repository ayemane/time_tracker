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
       $('.status').html "Successful AJAX call"
       $('#works').append(data)

  checkout.click ->
    console.log 'checkout!'
    $.ajax 
      url: '/checkins/0'
      dataType: 'json'
      type: 'PUT'
      error: (jqXHR, textStatus, errorThrown) ->
       $('.status').html "AJAX Error: #{textStatus}"
      success: (data, textStatus, jqXHR) ->
       $('.status').html "Successful AJAX call"
       work = data['work']
       row = $('#works div[data-id='+work["id"]+']')
       row.find('.id').html(work['id'])
       row.find('.checkin').html(work['checkin'])
       row.find('.checkout').html(work['checkout'])
       row.find('.hours').html(work['hours'])