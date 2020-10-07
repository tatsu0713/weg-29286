function pullDown() {

  const pullDownButton = document.getElementById("set-lists")
  const pullDownParents = document.getElementById("set-down")
  const pullDownChild = document.querySelectorAll(".set-down-list")

  pullDownButton.addEventListener('click', function(){
    if (pullDownParents.getAttribute("style") == "display:block;") {
      pullDownParents.removeAttribute("style", "display:block;")
    } else {
      pullDownParents.setAttribute("style", "display:block;")
    }
  })

  pullDownChild.forEach(function(list){
    list.addEventListener('mouseover', function(){
      list.setAttribute("style", "color:gold;")
    })
    list.addEventListener('mouseout', function(){
      list.removeAttribute("style", "color:gold;")
    })
      // list.addEventListener('click', function(){
    // })
  })
}

window.addEventListener('load', pullDown)