/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var checkConfirmPassword = function () {
    if (document.getElementById('password').value ==
            document.getElementById('confirm_password').value) {
        document.getElementById('message').innerHTML = '';
        document.getElementById('signup').disabled = false;
    } else {
        document.getElementById('message').innerHTML = 'The password confirmation does not match';
        document.getElementById('signup').disabled = true;
    }
}

var goBack = function () {
    window.history.back();
}

var descriptionControl = function () {
    var myBtn = document.getElementById("myBtn");
    var des = document.getElementById("des");

    if (myBtn.innerHTML == "Read less") {
        myBtn.innerHTML = "Read more";
        des.className = "text-truncate";
    } else {
        myBtn.innerHTML = "Read less"
        des.className = "";
    }
}

var authorControl = function () {
    var myBtn = document.getElementById("myBtn");
    var auAva = document.getElementById("auAva");
    var auOther = document.getElementById("auOther");

    if (myBtn.value == "Add Other") {
        myBtn.value = "Get Available";
        auAva.className = "form-group my-2 d-none"
        auOther.className = "form-group my-2";
    } else {
        myBtn.value = "Add Other";
        auAva.className = "form-group my-2";
        auOther.className = "form-group my-2 d-none";
    }
}