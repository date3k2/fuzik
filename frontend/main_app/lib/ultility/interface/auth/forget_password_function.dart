abstract interface class IForgetPasswordFunction
{
    String? validateEmail(String? email);
    void confirm();
}