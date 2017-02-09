document.addEventListener("turbolinks:load", function() {

    $(".orderLink").on ("click",function(){
        console.log("clickLink");
        $("#order").toggle();

    })

})

