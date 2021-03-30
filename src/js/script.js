$(document).ready(function(){
    $(window).scroll(function(){
        // sticky navbarr on scroll script
        if(this.scrollY > 20){
            $('.navbarr').addClass("sticky");
        }else{
            $('.navbarr').removeClass("sticky");
        }
        
     
    });

 
    
});