window.addEventListener('load', function(){
 const titleElement = document.getElementById('title')
 const clickButtons = document.querySelectorAll('#top-btn')

  
    titleElement.addEventListener('mouseover', function(){
      titleElement.setAttribute("style", "text-decoration:underline;text-decoration-thickness: 1px")
    })


    clickButtons.forEach(function(clickButton) {
      clickButton.addEventListener('mouseover', function(){
      clickButton.setAttribute("style", "text-decoration:underline;text-decoration-thickness: 1px")
    })

    clickButton.addEventListener('mouseout', function(){
      clickButton.removeAttribute("style")
    })
  })

})