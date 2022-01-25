const modify_btn = document.querySelector('.modify_btn');
const modal = document.querySelector('#modal');
const close_btn = document.querySelector('.close_btn');
const goodbad_box = document.querySelectorAll('.goodbad_box');
const text_length = document.querySelector('.text_length');
const review_txt  = document.querySelector('.review_txt');
const length_wrap = document.querySelector('.length_wrap');
const ok_btn = document.querySelector('.ok_btn');

let feeling_flag = 0;
// 0: good, 1: bad

modify_btn.onclick = () => {
    console.log(modal.classList.contains('show'));
    if(modal.classList.contains('show')){
        modal.classList.remove('show');
        modal.style.opacity = 0;
        modal.style.zIndex = -1;
    }else{
        modal.classList.add('show');
        modal.style.opacity = 1;
        modal.style.zIndex = 1000;
    }
}

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


close_btn.onclick = () => {
    modal.classList.remove('show');
    modal.style.opacity = 0;
    modal.style.zIndex = -1;
}


ok_btn.onclick = () => {

}	
