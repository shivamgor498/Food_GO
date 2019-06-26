function Update()
{
    document.Form1.action = "UpdateCart"
    document.Form1.submit();             // Submit the page
    return true;
}

function Delete()
{
    document.Form1.action = "deleteFromCart"
    document.Form1.submit();             // Submit the page
    return true;
}

