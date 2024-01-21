console.log("hi")
let emailCheck = false;
let passwordCheck = false;

document.getElementById("button-addon2").addEventListener("click",()=>{
    console.log("hi222")
    let email = document.getElementById("e");
    if(email.value == null || email.value == ''){
        alert('이메일을 입력해주세요');
        email.focus();
        return false;
      }else{
        checkEmailFromServer(email.value).then(result=>{
            if(result=='1'){
                alert("사용할 수 있는 아이디입니다.")
                emailCheck=true;
                validation();
            }else{
                alert("사용할 수 없는 아이디 입니다.")
                emailCheck=false;
            }
        })
        
      }
})


async function checkEmailFromServer(email){
    try{
        const resp = await fetch("/member/check/"+email);
        const result = await resp.text(); 
        return result;
    }catch(error){
        console.log(error);
    }
}
document.getElementById("e").addEventListener("keyup", ()=>{
    emailCheck = false;
    validation();
 })


document.getElementById("pc").addEventListener("keyup", ()=>{
   pcheck();
   validation();
})


document.getElementById("p").addEventListener("keyup", ()=>{
    pcheck();
    validation();
 })

function pcheck(){
    let p = document.getElementById("p").value;
    let pc = document.getElementById("pc").value;
    let checkpass = document.getElementById("checkpass");
    if (p === pc) {
        checkpass.textContent = "비밀번호가 일치합니다."; 
        checkpass.style.color = "green";
        passwordCheck = true;
    } else {
        checkpass.textContent = "비밀번호가 일치하지 않습니다."; 
        checkpass.style.color = "red";
        passwordCheck = false;
    }
}

function validation(){
    document.getElementById("regBtn").disabled = !(emailCheck && passwordCheck);
}
