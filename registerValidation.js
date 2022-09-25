function formValidation()
{
var ufname=document.form1.fname;
var ulname=document.form1.lname;
var ucontact=document.form1.contact;
var uaddress=document.form1.address;
var ustate=document.form1.state;
var ucity=document.form1.city;
var uemail=document.form1.emailid;
var upassword=document.form1.password;
var upassword1=document.form1.cpassword;
if(fname_validation(ufname))
	{
	if(lname_validation(ulname))
		{
		
		if(allnumeric(ucontact))
			{
			if(address_validation(uaddress))
				{
				if(state_validation(ustate))
					{
					if(city_validation(ucity))
						{
						if(email_validation(uemail))
							{
							if(password_validation(upassword,7,15))
								{
								if(password1_validation(upassword1,7,15))
									{
									return true;
										
									
								}
									
								}
							}
						}
					}
				
				}
			
			
			}
		}
	
	}
return false;

}

function fname_validation(ufname)
{
var letter=/^[a-zA-Z]+$/;
if(ufname.value.match(letter))
	{
	return true;
	}
else
	{
	alert("First Name must be Alphabetic character only");
	ufname.focus();
	return false;
	}
}
function lname_validation(ulname)
{
	var letter=/^[a-zA-Z]+$/;
	if(ulname.value.match(letter))
		{
		return true;
		}
	else
		{
		alert("Last Name must be Alphabetic character only");
		ulname.focus();
		return false;
		}
}

function allnumeric(ucontact)
{
	var contact_len=ucontact.value.length;
	if(contact_len==10)
		{
		var number=/^[0-9]+$/;
		if(ucontact.value.match(number))
			{
			return true;
			}
		else
			{
			alert("contact must have numeric digit only");
			ucontact.focus();
			return false;
			}
		}
	else
		{
		alert("contact length must be 10 digit");
		ucontact.focus();
		return false;
		}
	}

function address_validation(uaddress)
{
var letter=/^[a-zA-Z0-9_\.\-]+$/;
if(uaddress.value.match(letter))
	{
	return true;
	}
else
	{
	alert("please enter valid address");
	uaddress.focus();
	return false;
	
	}
}

function state_validation(ustate)
{
if(ustate.value=="Default")
	{
	alert("select a state from the list");
	ustate.focus();
	return false;
	}
else
	{
	return true;
	}
}
function city_validation(ucity)
{
	if(ucity.value=="default")
	{
	alert("select a city from the list");
	ucity.focus();
	return false;
	}
else
	{
	return true;
	}
	}

function email_validation(uemail)
{
	var letter=/^[a-zA-Z0-9_\-\.]+\@[gmail\reddif\hotmail]+\.[com]+$/;
	if(uemail.value.match(letter))
		{
		return true;
		}
	else
		{
		alert("please enter valid emailid");
		uemail.focus();
		return false;
		}
	}
function password_validation(upassword,mx,my)
{
password_len=upassword.value.length;
if(password_len==0||password_len<mx||password_len>my)
	{
	alert("please enter password between "+mx+"to"+my);
	upassword.focus();
	return false;
	}
else
	{
	return true;
	}
}
function password1_validation(upassword1,mx,my)
{
password_len=upassword1.value.length;
if(password_len==0||password_len<mx||password_len>my)
	{
	alert("please enter  confirm password between "+mx+"to"+my);
	upassword1.focus();
	return false;
	}
else
	{
	return true;
	}
}






