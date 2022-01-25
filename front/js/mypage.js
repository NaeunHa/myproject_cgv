/**
 *  my page
 */

const modify_btn = document.querySelector('.modify_btn');
const modal = document.querySelector('#modal');
const close_btn = document.querySelector('.close_btn');

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

close_btn.onclick = () => {
    modal.classList.remove('show');
    modal.style.opacity = 0;
    modal.style.zIndex = -1;
}