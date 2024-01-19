abstract interface class IForgetPasswordFunction
{
    String? validateEmail(String? email);
    String? validatePassword(String? email);
    String? validateRetypePassword(String? email);
    void setShowPassword();
    void setShowRetypePassword();
    void confirm();
}