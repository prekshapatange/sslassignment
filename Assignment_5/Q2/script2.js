const pswdInput = document.getElementById('password');
const strengthBar = document.getElementById('strength-bar');
const strengthText = document.getElementById('strength-text');
const submitButton = document.getElementById('submit-btn');

pswdInput.addEventListener('input', () => {
    const password = pswdInput.value;
    const strength = calculatePasswordStrength(password);
    updateMeter(strength);
    
    submitButton.disabled = (strength !== 'Strong');
    
});

function calculatePasswordStrength(password) {
    const Lower = /[a-z]/.test(password);
    const Upper = /[A-Z]/.test(password);
    const Number = /\d/.test(password);
    const Special = /[!@#$%^&*(),.?":{}|<>]/.test(password);


    if (password.length >= 8 && Lower && Upper && Number && Special) {
        return 'Strong';
    } else if (password.length >= 6 && Lower && Upper && Number) {
        return 'Medium';
    } else if (password.length >= 6 && Lower) {
        return 'Weak';
    } else {
        return 'Very Weak';
    }

}


function updateMeter(strength){
    if(strength == 'Strong'){
        strengthBar.style.width = '100%';
            strengthBar.style.backgroundColor = 'green';
            strengthText.textContent = 'Strength'
    }
    else if(strength == 'Medium'){
        strengthBar.style.width = '66%';
                    strengthBar.style.backgroundColor = 'orange';
                    strengthText.textContent = ' Medium';

    }
    else if(strength=='Weak'){
        strengthBar.style.width = '33%';
            strengthBar.style.backgroundColor = 'red';
            strengthText.textContent = 'Weak';
    }
    else{
        strengthBar.style.width = '0';
                    strengthText.textContent = 'Password Strength';
                    strengthBar.style.backgroundColor = '#ddd';
    }

    }

