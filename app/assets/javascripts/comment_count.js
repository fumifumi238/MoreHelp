/*global $*/

$(function (){
  // 処理（ページが読み込まれた時、フォームに残り何文字入力できるかを数えて表示する）

  //フォームに入力されている文字数を数える
  //\nは"改行"に変換して2文字にする。オプションフラグgで文字列の最後まで\nを探し変換する
  var count = $(".js-text").text().replace(/\n/g, "改行").length;
  //残りの入力できる文字数を計算
  var now_count = 300 - count;
  //文字数がオーバーしていたら文字色を赤にする
  if (count > 300) {
    $(".comment-count").css("color","red");
  }
  //残りの入力できる文字数を表示
  $(".js-comment-count").text( "あと" + now_count + "文字");

  $(".js-comment").on("keyup", function() {
    // 処理（キーボードを押した時、フォームに残り何文字入力できるかを数えて表示する）
    //フォームのvalueの文字数を数える
    var count = $(this).val().replace(/\n/g, "改行").length;
    var now_count = 300 - count;

    if (count > 300) {
      $(".js-comment-count").css("color","red");
    } else {
      $(".js-comment-count").css("color","green");
    }
    $(".js-comment-count").text( "あと" + now_count + "文字");
  });
});