window.addEventListener('load', function(){

  // --------メニュー遷移-------
  document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
      e.preventDefault();
      document.querySelector(this.getAttribute('href')).scrollIntoView({
            behavior: 'smooth'
      });
    });
  });

  // -----トップに戻るボタン-------
  // bodyタグを取得
  const documentBody = document.querySelector('body');
  // aタグをbodyタグ直下に追加
  var newElement = document.createElement("a");
  newElement.setAttribute("class","backToTop");
  documentBody.prepend(newElement);
  newElement.href = "#";

  // ウィンドウサイズを取得
  const windowBottom = window.innerHeight;
      console.log(windowBottom);
  const topBtn = document.querySelector('.backToTop');
  // スクロールで表示
  window.addEventListener('scroll', ()=> {
      const scrollTop = window.pageYOffset || document.documentElement.scrollTop;
      if (scrollTop >= windowBottom) {
      topBtn.style.opacity = 0.6;
      topBtn.style.pointerEvents = "auto";
      }
      else {
      topBtn.style.opacity = 0;
      topBtn.style.pointerEvents = "none";
      }
  });

})