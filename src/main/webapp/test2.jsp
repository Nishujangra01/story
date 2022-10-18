
<html>

<head>
    <style>

 .like-content {
          display: block;
       
        height: 30px;
       
        margin-bottom: 13px;
        clear: both;
        margin-left: 45%;
    width: 80%;
    font-size: 15px;
    text-align: center;
}

.like-content span {
	color: #04AA6D;
	font-family: monospace;
}
.like-content .btn-secondary {
    float: left;
	  display: block;
    text-align: center;
    background: #ed2553;
    border-radius: 3px;
    box-shadow: 0 10px 20px -8px rgb(240, 75, 113);
    padding: 10px 17px;
    font-size: 18px;
    cursor: pointer;
    border: none;
    outline: none;
    color: #ffffff;
    text-decoration: none;
    -webkit-transition: 0.3s ease;
    transition: 0.3s ease;
}
.like-content .btn-secondary:hover {
	  transform: translateY(-3px);
}
.like-content .btn-secondary .fa {
	  margin-right: 5px;
}
.animate-like {
	animation-name: likeAnimation;
	animation-iteration-count: 1;
	animation-fill-mode: forwards;
	animation-duration: 0.65s;
}
@keyframes likeAnimation {
  0%   { transform: scale(30); }
  100% { transform: scale(1); }
}
   
</style>
</head>

<body>
   
   
    <div class="like-content"> 
                                           <span id="spanid" class="label warning">Amit ajva rvafvmkaf</span>
                                            
                                            <button class="btn-secondary like-review">
                                           Like
                                          </button>
                                       </div>
                                        
                                      

<script>
                                             $(function(){
	$(document).one('click', '.like-review', function(e) {
		$(this).html('<i class="fa fa-heart" aria-hidden="true"></i> You liked this');
		$(this).children('.fa-heart').addClass('animate-like');
	});
});
                                        </script>
</body>

</html>
