###  Javascript for activating Bootsrap  ###
if gonPrefix isnt ''
  prefix_num = 1
  prefix = "/#{gonPrefix}"
else
  prefix_num = 0
  prefix = ''
 
$(document).ready ->
  $(".dropdown-toggle").dropdown() #DropdownMenu
  $(".nav-tabs").button() #Navigation buttons
  $("table").addClass "table table-bordered" #Table Markup Formatting
  $("tr").addClass "info" #Table Markup Formatting
  $("img").addClass "img-rounded" #Rounded Images
  $("[data-spy=\"scroll\"]").each ->
    $spy = $(this).scrollspy("refresh") #Scroll spy
  $(".carousel").carousel() #Slideshow
  $("body").addClass("mainpage") if pathname[prefix_num + 2] is "home" #adds css rule for bg image
  
###  Javascript for language switching  ###
pathname = window.location.pathname
pathname = pathname.split('/')
languages = ['en', 'es', 'pirate']
unless pathname[prefix_num + 1] in languages
  window.location.pathname = "#{prefix}/es#{pathname.join('/')}"
  
  
$(document).ready ->
  $("button#english").on "click", ->
    if pathname[prefix_num + 1] is "en"
      console.log pathname[prefix_num + 1]
    else
      pathname[prefix_num + 1] = "en"
      window.location.pathname = pathname.join("/")

  $("button#spanish").click ->
    if pathname[prefix_num + 1] is "es"
      console.log pathname[prefix_num + 1]
    else
      pathname[prefix_num + 1] = "es"
      window.location.pathname = pathname.join("/")
      
###  Javascript for pdf iframes  ###
$(document).ready ->
  if pathname[prefix_num + 2] is "dias" or "permits"
    if pathname[prefix_num + 3] is "all"
      pdf_year_or_area = ""
    else
      pdf_year_or_area = pathname[prefix_num + 3]
    # console.log(pdf_year_or_area);
    $("#pdfs_reports").find("iframe").attr "src", ("#{prefix}/pdfs/" + pathname[prefix_num + 2] + "/" + pdf_year_or_area)
    $("#pdfs_reports").find("iframe").attr "style", "background:white; min-width:300px; min-height:300px"
  if pathname[prefix_num + 2] is "env_reports"
    $("#pdfs_reports").find("iframe").attr "src", "#{prefix}/pdfs/communications/environmental_reports"
    $("#pdfs_reports").find("iframe").attr "style", "background:white; min-width:300px; min-height:300px"

###  Javascript for Calendar  ###
$(document).ready ->
  if pathname[prefix_num + 2] is "home"
    $(window).load ->
      return if $('#googlecalendar').length <= 0
      $("#googlecalendar").attr "src", "//www.google.com/calendar/embed?title=Calendario%20de%20Vistas%20Publicas&amp;amp;showTitle=0&amp;amp;showNav=0&amp;amp;showPrint=0&amp;amp;showTz=0&amp;amp;height=300&amp;amp;wkst=2&amp;amp;bgcolor=%23ffffff&amp;amp;src=juntacalidadambientalcalendar%40gmail.com&amp;amp;color=%23125A12&amp;amp;ctz=America%2FPuerto_Rico"
    
    
    # $('#googlecalendar').attr 'src', "https://www.google.com/calendar/embed?title=Calendario+de+Vistas+Publicas"
    
    # cbSuccess = false
    $(window).load ->
      return if $('#googlecalendar').length <= 0
    #   $.ajax(
    #     url: "//www.google.com/calendar/embed?title=Calendario%20de%20Vistas%20Publicas&amp;amp;showTitle=0&amp;amp;showNav=0&amp;amp;showPrint=0&amp;amp;showTz=0&amp;amp;height=300&amp;amp;wkst=2&amp;amp;bgcolor=%23ffffff&amp;amp;src=juntacalidadambientalcalendar%40gmail.com&amp;amp;color=%23125A12&amp;amp;ctz=America%2FPuerto_Rico"
    #     type: 'get'
    #     error: -> console.log('fail ajax')
    #     success: -> cbSuccess = true 
    #     )
    #   $("#googlecalendar").attr "src", "//www.google.com/calendar/embed?title=Calendario%20de%20Vistas%20Publicas&amp;amp;showTitle=0&amp;amp;showNav=0&amp;amp;showPrint=0&amp;amp;showTz=0&amp;amp;height=300&amp;amp;wkst=2&amp;amp;bgcolor=%23ffffff&amp;amp;src=juntacalidadambientalcalendar%40gmail.com&amp;amp;color=%23125A12&amp;amp;ctz=America%2FPuerto_Rico"
    # setTimeout (-> 
    #   if not cbSuccess
    #     $("#googlecalendar").attr "src", ("/" + pathname[prefix_num + 1] + "/googleloginrequired") 
    #   ), 2000
    #   
    # $('.carousel').carousel(); //Moved to top
    #Wrap next line in an ajax request for the bg image file.
    # Moved to top $("body").addClass "mainpage" #adds css rule for bg image
    # $(window).load ->
    #   console.log $("iframe").contents().find(".windows8").length
    #   return if $("#googlecalendar").length <= 0 # to avoid errors in case the element doesn't exist on the page or removed.
    #   $("#googlecalendar").attr "src", "//www.google.com/calendar/embed?title=Calendario%20de%20Vistas%20Publicas&amp;amp;showTitle=0&amp;amp;showNav=0&amp;amp;showPrint=0&amp;amp;showTz=0&amp;amp;height=300&amp;amp;wkst=2&amp;amp;bgcolor=%23ffffff&amp;amp;src=juntacalidadambientalcalendar%40gmail.com&amp;amp;color=%23125A12&amp;amp;ctz=America%2FPuerto_Rico"
    #   try
    #     $("iframe").contents().text()
    #   catch error
    #     console.log "failed access"
    # 
    # setTimeout (->
    #   try
    #     if $("iframe").contents().find(".windows8").length is 1
    #       $("#googlecalendar").attr "src", ("/" + pathname[1] + "/googleloginrequired")
    #     else
    #       console.log "If access to iframe blocked, Calendar likely loaded."
    #   catch error
    #     console.log error
    # ), 5000
