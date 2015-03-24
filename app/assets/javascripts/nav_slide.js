// On general nav bar, contact button must slide a sub menu 

function slide_menu(){
  var contactBtn = document.getElementsByClassName("contact_button")[0];
  var subMenu = document.getElementsByClassName("sub_nav")[0];
  
  function ShowSubMenu () {
  	subMenu.classList.remove("display_none");
  };
  
  function HideSubMenu () {
  	subMenu.classList.add("display_none");
  };
  
  contactBtn.addEventListener('mouseover', ShowSubMenu, false);
  contactBtn.addEventListener('mouseout', HideSubMenu, false);
};

window.addEventListener("load", slide_menu, false);




