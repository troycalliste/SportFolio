$(document).on "ready page:load", ->
  # navbar change color on scroll
  $(document).scroll ->
    scroll_start = 0
    scroll_start = $(this).scrollTop()
    if scroll_start > 575
      $(".main").addClass("change")
    else
      $(".main").removeClass("change")



   CompanyPoller =
     poll: ->
       setTimeout @request, 3000

     request: ->
       $.get($('.spanner').data('url'))

   jQuery ->
     if $('.spanner').length > 0
       CompanyPoller.poll()





  # $(".searchy input").focus ->
  #   $(".space").addClass("spacefocus") && $(".fa").addClass("iconfocus")
  #
  # $(".searchy input").focusout ->
  #   $(".space").removeClass("spacefocus") && $(".fa").removeClass("iconfocus")
$(".searchy input").hover((->
  alert "yayaya"
  $(".fa").toggleClass "iconhover", !$(this).is(":focus")
  return
  ), ->
  $(".fa").removeClass "iconhover"
  return
  ).focus ->
  $(".fa").removeClass "iconhover"
  return

# if $(".searchy input")is(":hover") && !$(".searchy input")is("focus")
#   $(".fa").addClass("iconhover")

  $(".searchy input").mouseover ->
    if !$(".searchy input")is(":focus")
      $(".fa").addClass("iconhover")








  # $(".searchy input").mouseout ->
  #   $(".fa").removeClass("iconhover")
  #
  # if $(".searchy input").is(":focus") && $(".searchy input").is(":hover")
  #   $(".iconhover").addClass("fa")
