var years = document.getElementsByClassName('year');

//When doing click on a year, show months
function showMonths(){
  // for (var i=0; i<years.length; i++) {
  // 	years[i].onclick = function(target){
        var selectedYear = event.target;
        var month_list = selectedYear.nextSibling.nextSibling;
        //Showing months
        if (month_list.classList.contains('hide_months')){
      	month_list.classList.remove('hide_months');
        //Hiding months
        }else{
          month_list.classList.add('hide_months');
        };
  	};
 // };
//};

years.addEventListener('click', showMonths);