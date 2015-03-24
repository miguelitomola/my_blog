function dates_tree(){
  var years = document.getElementsByClassName('year');
  //When doing click on a year, show months
  for (var i=0; i<years.length; i+=1){
    //Function needs event as parameter to work
    years[i].onclick = function(event){
      var selectedYear = event.target;
      var month_list = selectedYear.nextSibling.nextSibling;
      //Showing months
      if (month_list.classList.contains('hide_months')){
        month_list.classList.remove('hide_months');
      //Hiding months
      }else{
        month_list.classList.add('hide_months');
      }
    };
  };
};

window.addEventListener("load", dates_tree, false);



