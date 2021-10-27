document.addEventListener("turbolinks:load", function(){
  $('.sample').hover(function() {

      let lists=[
          '私は神だ',
          'おまえだったのか',
          '私はいつもお前達のことを見ている',
          'Hello Human',
          'わたしだ',
          '暇を持て余した、神々の、遊び',
          '今日も良い一日になるといいな',
          '趣味は沐浴だ',
          '休日は基本二度寝する',
          '私と共にあれ',
          'ちゃんと暖かくして寝るんだぞ',
          '私はお前のことを知っているぞ',
          'そういうときもあるさ',
          'いやなことがあったらエレカシを聞くといい',
          '季節の変わり目は体調に気をつけるんだぞ',
          'そんなこともあるさ',
          '虫はそれほど得意ではない',
          '実は猫派だ',
          '頭が高いぞ'
          ];
      let rNo = Math.floor(Math.random() * lists.length);
      let rSt = lists[rNo]
      this.lastChild.innerHTML = rSt
  
});
});