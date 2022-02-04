const goodbad_box = document.querySelectorAll('.goodbad_box');
const text_length = document.querySelector('.text_length');
const review_txt  = document.querySelector('.review_txt');
const length_wrap = document.querySelector('.length_wrap');
const ok_btn = document.querySelector('.ok_btn');

let feeling_flag = 0;
// 0: good, 1: bad


for(let i = 0; i < goodbad_box.length; i++){
	goodbad_box[i].onclick = () => {
		for(let j = 0; j < goodbad_box.length; j++){
			goodbad_box[j].classList.remove('on');	
		}
		goodbad_box[i].classList.add('on');
		
		feeling_flag = i;
	}
}

review_txt.onkeyup = () => { 
	if(review_txt.value.length < 280){
		length_wrap.style.color = '#666';
		text_length.style.color = '#666';
	}else{
		length_wrap.style.color = '#fb4357';
		text_length.style.color = '#fb4357';
	}
	
	text_length.innerText = review_txt.value.length;
}


ok_btn.onclick = () => {

}	
