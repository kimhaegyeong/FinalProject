/**
 * 	게시판
 */

var msg_writererror = "작성자를 입력하세요";
var msg_subjecterror = "글제목을 입력하세요";
var msg_contenterror = "글내용을 입력하세요";
var msg_passwderror = "비밀번호를 입력하세요";

var writeerror = "글쓰기에 실패했습니다\n잠시 후 다시 시도하세요";
var passwderror = "입력하신 비밀번호가 다릅니다\n다시 확인하세요";
var modifyerror = "글수정에 실패했습니다\n잠시 후 다시 시도하세요";
var deleteerror = "글삭제에 실패했습니다\n잠시 후 다시 시도하세요";
var replyerror = "답글이 있는 글은 삭제할 수 없습니다";

function erroralert( msg ) {
	alert( msg );
	history.back();
}

// 검색
function searchcheck() {
	if( ! listform.search.value ) {
		alert( "검색할 내용을 입력하세요" );
		listform.search.focus();
		return false;
	} 
	if(listform.search.value.length < 2) {
		alert("두 글자 이상 입력하세요.");
	}	
}

// 글수정
function modifyfocus() {
	modifyform.subject.focus();
}
function modifycheck() {
	if( ! modifyform.subject.value ) {
		alert( msg_subjecterror );
		modifyform.subject.focus();
		return false;
	} else if( ! modifyform.content.value ) {
		alert( msg_contenterror );
		modifyform.content.focus();
		return false;
	} else if( ! modifyform.passwd.value ) {
		alert( msg_passwderror );
		modifyform.passwd.focus();
		return false;
	}
}

function passwdfocus() {
	passwdform.passwd.focus();
}
function passwdcheck() {
	if( ! passwdform.passwd.value ) {
		alert( msg_passwderror );
		passwdform.passwd.focus();
		return false;
	}
}


// 글쓰기
function writefocus() {
	writeform.writer.focus();
}
function writecheck() {
	if( ! writeform.writer.value ) {
		alert( msg_writererror );
		writeform.writer.focus();
		return false;
	} else if( ! writeform.subject.value ) {
		alert( msg_subjecterror );
		writeform.subject.focus();
		return false;
	} else if( ! writeform.content.value ) {
		alert( msg_contenterror );
		writeform.content.focus();
		return false;
	} else if( ! writeform.passwd.value ) {
		alert( msg_passwderror );
		writeform.passwd.focus();
		return false;
	}	
}








