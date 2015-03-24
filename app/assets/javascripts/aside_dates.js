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


function aside_height_calc(aside_height){
  var aside = document.getElementsByClassName("dates_aside")[0];
  aside.style.height = ((aside_height) .toString())+"px";
}

function aside_height_index(){
  var art_container = document.getElementsByClassName("articles_container")[0];
  var height_ac = art_container.offsetHeight;

  var subt_container = document.getElementsByClassName("subtitle_container")[0];
  var height_sc = subt_container.offsetHeight;
  var margin_sc = parseInt(window.getComputedStyle(subt_container,null).getPropertyValue("margin-bottom"));
  var size_y_sc = height_sc + margin_sc;

  var one_article = document.getElementsByClassName("article")[0];
  var margin_oa = parseInt(window.getComputedStyle(one_article, null).getPropertyValue("margin-bottom"));

  var aside_height = height_ac + size_y_sc - (margin_oa*0.34);  
  aside_height_calc(aside_height);
}

window.addEventListener("load", aside_height_index, false);



